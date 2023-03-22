Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC1C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 20:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9610E14D;
	Wed, 22 Mar 2023 20:55:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2410E14D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679518533; x=1711054533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xo3gNuLIQXeULvfaGsBHgzTfGyLqpAb2jsVYa+PxFhw=;
 b=DAOE5zN2QRZWf7bxvC6pMh5ZBvuvbxtg5gRcIAdNdRCJ4KkGxyV6KByJ
 Jv2U+M4pr46laqh8voEMCisETLn/oXt0ROb5IFq1brgfMDfcfm85LuC0R
 NGAEd2h8Nq0Gqgp8xaZeADw9Pa+wJn2iOdE5l7zhQgRx0VykVvZYBTcYA
 PVLdXfI/EsRIflWUxfQ8qfkpBI3maO8FfvxmTVSnsdIjR4s6yzdvlXczN
 51L0QRJ5wruD8Oau50J10BwcBUtj+iOGtzOhEp59afUjRuJHtrb3BUZL8
 jrCgrAcHTA1IN2PSxQ8PGJ+VT4DNQhRbsqEMrPa/dJurpR79O3jfpD6Ny Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340868691"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="340868691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 13:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805997625"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="805997625"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 13:55:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 13:55:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 13:55:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 13:55:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 13:55:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grMq4Uj0WEhj+/b+Xww3NxqsJ0VaFIr456jnmwlgqgZyVoAJtipiDdvcEASv7sKUehh2Q/HOLaaJl9XPpix2KRzQZWH8qVl3D5adtUzaGQFOMMszVHzXOJlJPk5JfpIZeWmGuzul5Tj73RJrskiNMLAhYzaQ5BdcDnVGF9VQWlSXDAsiVR5JdZzvPSghy8aOadlr0KinqaY9wkd9BoKnFU7TJtVdIAPGIqze98UiSduxA00UjC1It2qYXNHie18jL7XGjMN3YtAzkWHEaWlQJjucWO8N/2+6Rz39GlsA49U5UaseyxFA3QSNmDxeqhhCgVNFs3gZTocs/1z0XLW1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo3gNuLIQXeULvfaGsBHgzTfGyLqpAb2jsVYa+PxFhw=;
 b=JF/qlnsZGITgQFf1YhHxj4ABCdgeJgzHuRx+RFQ6PvBHF34L0dUudNP4Y9SlhfldHzWbQUsnYjwaINa2OjnhlboC69nWpnUIhbcmNFq/x97enpUkA+C/swsCLOr5Jvu0Fgxn2nvC5mPZerDkLW5xxJ83Dtzyt+czQmws2ZZdnlKibtay0BX7W8/++eRlaSlvPowdnYk4ExAHOH6X1C1I6KNnAGu7k2c/lMVOnjNEII3azvlwZJt5PkTcmTYm1mYinKebx/Rip+BEH9a2asVu3ucDZI9W0lO12Zx9uxmmGqJpI6H2D/43T1hshRhk86hKDfnIamhYiJz8mD6BpsLPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by BL1PR11MB5509.namprd11.prod.outlook.com (2603:10b6:208:31f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 20:55:23 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.037; Wed, 22 Mar
 2023 20:55:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
Thread-Index: AQHZXGbsAjQA9H08+0qQM9pldiqpl68G+xMAgAA3j4CAABXJgA==
Date: Wed, 22 Mar 2023 20:55:22 +0000
Message-ID: <45226fbbc940eafc218bc2cc4a3798b41bad90d3.camel@intel.com>
References: <20230322023450.797598-1-matthew.brost@intel.com>
 <20230322023450.797598-2-matthew.brost@intel.com>
 <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
 <ZBtY8d6H8khAdPZR@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZBtY8d6H8khAdPZR@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|BL1PR11MB5509:EE_
x-ms-office365-filtering-correlation-id: 79940a0f-0807-4522-ce72-08db2b17c0cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eHpBVWWjmB3+maR+DkIjE1ZDDBnU5feaShP8bJ8KMJiMOJbEF+aWhVzppvdiA0ga+z9Oovjf9I9ELKOFp/zz2OVjM5gu0WGQyjbTGzHv5p6mCtxbd1AupFdbb1AgkkoGzd+49R/hpr5sWvBBM2EiQgjcdgRC4Sgj3Z0g0PEy/WuRb6FiBBt91aCscDqTyUIAhXbnaBm9cTVb3C4yFUXOtpa8yK63nKPJ90FeliyCHOczQBb5fJflPfJH+3PscJ7lcchYzVPTxV/ZbcLrzCYqhpxwz9gxfkWpI7xzjJwI8p0xbLqfuG+NPxMpBxAjYKwThJPBbCgLM97HbGLfQKTYw6dulsuqEWL5l4s5zWGZcoIsOaGXAHpvCz6fyaoiXMx9BO6GYkktLE5wSwY/r2KtuNLz/zQX7oqrstawntlWwdK0E//v+UWGmHDiA+d9N92kKWe/BMSjkHvYe2eMUmve4Gk6jF81fUUae7W7yDgYPMB5/rIBNJEwU+OaH2PDMAGjVawBbWlvb5DOhncxEPiGOypXR/OOEdsttmhrP9r5V9h94hXM3msqSuojo03JSP/PVkzHB0BpB8gjACXjnufcHkXxgiQgHa4Nzns+FcluQHYoIF3gJVVHUdUnhxKUrSCvx/UaWqOKt+5mXtOD7NVZ9SKuYm4ABMIQjukZK8AUdtHIT+Eez+ExnilyMt5qV5IlAvSp4Ivpr22nMHZAYOQrzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(4326008)(66556008)(76116006)(91956017)(8676002)(316002)(37006003)(66476007)(66946007)(64756008)(66446008)(186003)(122000001)(6506007)(38100700002)(38070700005)(86362001)(478600001)(71200400001)(6636002)(82960400001)(36756003)(6486002)(26005)(83380400001)(6512007)(2616005)(5660300002)(6862004)(41300700001)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmtONHlDU2RNUXkvNGZHNERoc0NsYXlaZ1k4eVRicWY0dzgvOWFjOHlmbFpE?=
 =?utf-8?B?UEZtQWlkc004SWQzWHlycWR2Q0x2WHlIQzRqQlFyZ0tBVHZ5RTZZblowcUoz?=
 =?utf-8?B?YmhGdmloMmNySGdGMnQ5R2Myb0R4cklYNXZ6VmhKcFduVW9uMGJpOVRLTDZk?=
 =?utf-8?B?cUVBSmNhaUJBVEp3QlhSbVZXUHlsazE2V2lPT3JpSk1UdWN4WEowTGxzMHRv?=
 =?utf-8?B?OW9KOHJwbkRoYmlJTjM3N2tNRWZGc2cwS1oyWjRvRDFYRjdKSklEdWJJV295?=
 =?utf-8?B?RFR0QWRnMGxacDJyTGo1QVRkVDhMWDFNMk00dWFNTW9yWVpvU3dDRXpyUnJi?=
 =?utf-8?B?MzBFRnJpcW5LLzBPamVYQjlIalpBU3pmZTA2L1lScWNDTlZrV0MzaXpnc0Ft?=
 =?utf-8?B?UXV4TmN6U3l4WEJQdXpEOWhzZi9OSGtZNWUrQ25pajNNZkcrWURSWEZsQ05a?=
 =?utf-8?B?Qngxc2tmTzdJWTlzUWd0YXAwVTBnZi9jZGNuZzlqOU5oZTZnSWt2TEhuTEUr?=
 =?utf-8?B?SkJpUDF2Y3hUYTRjaTRIMDZxYStiNHI2QjVvYkY2Wko3YVZSTnNPSlMyUnlG?=
 =?utf-8?B?enc2enB2a2ZyU2dHd3dSTUhFMjNIUGwxeEo0OTFQR3U5QVZCQ25md1FVemxP?=
 =?utf-8?B?T3g1ZG50Nmo3VnY4ZFV3K1VFcHRtUXYxK0JrY0lVOG1wN0pzYUIvMXJ6a2oz?=
 =?utf-8?B?SjJyZlV6TTlTNGVydzVqSE40cHJOV1ZpakduRlRCZnR2NkQrNk0xMG8vcytY?=
 =?utf-8?B?NDA4LzB4TldnZDY4V0VIZkErcUx4RG5heDBTMWczelFDN3FoTUYybG85MVJ2?=
 =?utf-8?B?YXdBWkwxT0RETkNvbnJSUEhZQ1A5a3UvLy91bURBK2o1d3p6aFNBUEVUNHR2?=
 =?utf-8?B?MEpyZlU5aC9mck1aMGJ1RDJaNmtUL2E1UlF1TU0rTms1UXUxUXdTQldybU5L?=
 =?utf-8?B?V1hISzAzK0Y0TEQ1Tk9vOHRJc1hFSUp0MHg0OEZZRGduNk02bDdPTGloSjZ6?=
 =?utf-8?B?aHdxU1VjTVBPYlVxcFBoeHpsb29jZ0V3OGs3d2ZCT2JrQVJWUTkyTHFMOThL?=
 =?utf-8?B?VzB1bHFySUZIOG1zbEt1NHE3RStpcWhSOXNDTEdDT0N0U2JFa0IzYTdtL3Vy?=
 =?utf-8?B?YnFncCtmTGtUODNlbXY0MlRFTVNEWnZZSmR4QzRRTHpSQU5FVlFDMGJkQXpM?=
 =?utf-8?B?SHVuSVRUWTRhYzFaRDVnZ2c1d3pwSzdxTCtyK0tZMy9NUHlySlVuRnF4ajJM?=
 =?utf-8?B?dWI1YU5rM0JSK3VucXlqTWpUWlFJRXNZKzNQSTE0UjR5bHlCSURTQ0g4NEgv?=
 =?utf-8?B?VkJwRnJpdktyWmY4L25HQ1ZsMVFWWjZ0T0hwV0FTR0k1dElpbC91VHhObGpY?=
 =?utf-8?B?WklaeVRiMXZtdUk3Sy9kTXArYUs4ZDBtVEdVNmsxT0Q3MXl0clFSNlQrYStn?=
 =?utf-8?B?bmgvVVVCSXA4TmdmZW9SSllaOU1hWTFTcGlubDJlYVNvVGtkUmxuWVBPdnRI?=
 =?utf-8?B?ZGxHUEptSTh6WTQrQU9JRGYrbTdnemd4NHV0bmphdHBXM0pqWlgzejFBQWhx?=
 =?utf-8?B?dGRzSlFRaVoxMVdqV2RGZDhYQU44eHdDUStKeTlGTFdJV1Y5cm1WNkhQVjN3?=
 =?utf-8?B?cnFLZ2lDazJpQi8yYThsZjVrMTRjKzlYMWdBaEFiUmhKVDFWTGdwOTFONVo0?=
 =?utf-8?B?QnpYcVlhcGlYUEVQUHUwQVB5enJGZ3lzNFRUc2o0SkFnVHhpTEhyT3dlSXRa?=
 =?utf-8?B?a3R5QkRMai9JR2dSVU44dWFYa1E0YUtuanF0L216MlFQQ280Y3hlRUh6OW53?=
 =?utf-8?B?cEtnUGdKZGsvV0JiQU9nZFYyeWxYaTh0cHhsdjNuRHV4am9RMzErNEZ4bUQy?=
 =?utf-8?B?K2Q4K1BoSlNaNFAzQ0hiTnVBY2RrYzVqMmFzSE8xUkJ2STNMZVMrRDBtNnpp?=
 =?utf-8?B?ckwzdm4rOGVqeFhOM3czM1pVR0I2WlBLZG84VEJQa2xCbU1nYUxOQjJpTTVi?=
 =?utf-8?B?Q3F1cTQxWkxIeWp1M29RVEIxY3d0dVdkaTlMOEFYZ2VrUnJmck1ZNThHdnhw?=
 =?utf-8?B?d2xud0ZkYkQ5TEVFL2ZYQ0dVTmZsanJteG5lU1R6SkFZcVhjakJlcXd1VXA4?=
 =?utf-8?B?eVhxajExaDhKRWdSbS9YUWxFQ2k1cGFxZ0wzU0dTZmhDY1Jhbk4wZlFCbnlv?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B1B6D021A5D6842A8F3A4F36DA90D53@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79940a0f-0807-4522-ce72-08db2b17c0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 20:55:22.1322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lg2JQvolUbhHdvaUTTqja9T49aBjT6eUtF5/X7cZAOdX7R5ZkzXzwSNHR8TfygiqpVgpwg/MNAQ54c0ql8gIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5509
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE5OjM3ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCAxMDoxODozM0FNIC0wNjAwLCBTb3V6YSwgSm9zZSB3
cm90ZToNCj4gPiBPbiBUdWUsIDIwMjMtMDMtMjEgYXQgMTk6MzQgLTA3MDAsIE1hdHRoZXcgQnJv
c3Qgd3JvdGU6DQo+ID4gPiBOb3QgYWxsIGhhcmR3YXJlIGVuZ2luZXMgYXJlIGNyZWF0ZWQgZXF1
YWxseSwgY2VydGFpbiBpbnN0YW5jZSBoYXZlDQo+ID4gPiB1bmlxdWUgY2FwYWJpbGl0aWVzIG9y
IHByb3BlcnRpZXMuIEludHJvZHVjZSBhIHVBUEkgdG8gcXVlcnkgZm9yIGJvdGgNCj4gPiA+IGNh
cGFiaWxpdGllcyBhbmQgcHJvcGVydGllcy4gVGhlIGNhcGFiaWxpdGllcyBhcmUgcmVwcmVzZW50
ZWQgYnkgYSBiaXQNCj4gPiA+IG1hc2sgd2hpY2ggaXMgdW5pcXVlIHRvIGVhY2ggY2xhc3MuIFRo
ZSBwcm9wZXJ0aWVzIGFyZSByZXByZXNlbnRlZCBieSBhDQo+ID4gPiBuYW1lIGFuZCB2YWx1ZSBy
ZXR1cm4gaW4gYW4gYXJyYXkgdG8gdGhlIHVzZXIuDQo+ID4gDQo+ID4gV2hlbiByZS1zZW5kaW5n
IHRoZSBzYW1lIHBhdGNoIHNlcmllcyB3aXRoIGZpeGVzLCBwbGVhc2UgaW5jbHVkZSAidlgiIGlu
IHRoZSBzdWJqZWN0IHdlIGtub3cgd2hhdCBpcyB0aGUgbGF0ZXN0IHZlcnNpb24gdG8gcmV2aWV3
Lg0KPiA+IA0KPiANCj4gV2lsbCBkby4NCj4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCsp
DQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gaW5kZXggNjYxZDc5MjkyMTBjLi41NTdj
OWFlNmYzNjQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBAQCAtMTE5LDYgKzEx
OSw3IEBAIHN0cnVjdCB4ZV91c2VyX2V4dGVuc2lvbiB7DQo+ID4gPiAgI2RlZmluZSBEUk1fWEVf
V0FJVF9VU0VSX0ZFTkNFCQkweDBiDQo+ID4gPiAgI2RlZmluZSBEUk1fWEVfVk1fTUFEVklTRQkJ
MHgwYw0KPiA+ID4gICNkZWZpbmUgRFJNX1hFX0VOR0lORV9HRVRfUFJPUEVSVFkJMHgwZA0KPiA+
ID4gKyNkZWZpbmUgRFJNX1hFX0VOR0lORV9RVUVSWQkJMHgwZg0KPiA+IA0KPiA+IHMvMHgwZi8w
eDBlDQo+ID4gDQo+IA0KPiBZZXAuDQo+IA0KPiA+IFRvIGF2b2lkIGNvbmZ1c2lvbiB3aXRoIERS
TV9YRV9FTkdJTkVfR0VUX1BST1BFUlRZLCB3b3VsZCBiZSBiZXR0ZXIgdG8gbmFtZSB0aGlzIGFu
ZCByZWxhdGVkIHN0dWZmIGFzIERSTV9YRV9FTkdJTkVfQ0xBU1NfUVVFUlkuDQo+ID4gDQo+IA0K
PiBJIGRvbid0IGxvdmUgRFJNX1hFX0VOR0lORV9DTEFTU19RVUVSWSBhcyB0aGUgcXVlcnkgaXMg
Zm9yIHRoZSBjbGFzcywNCj4gaWQsIGd0IHR1cGxlLg0KPiANCj4gV2UgZGVmaW5pdGVseSBuZWVk
IHRvIGRvIHdvcmsgaW4gZ2VuZXJhbCBvbiB0aGUgbmFtaW5nIHRvIGF2b2lkDQo+IGNvbmZ1c2lv
biBiZXR3ZWVuIGEgaGFyZHdhcmUgZW5naW5lIGFuZCBhIHVzZXIgZW5naW5lLiBQZXJoYXBzIGp1
c3QgZG8gYQ0KPiBsYXJnZSBmaW5kIHJlcGxhY2UgYWNyb3NzIFhlIHdoZXJlIGEgdXNlciBlbmdp
bmUgLT4gY29udGV4dD8NCj4gDQo+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRoZSB1QVBJIHdp
dGggSFcgZW5naW5lIG5hbWluZyBhcyBuZWVkZWQuIGUuZy4NCj4gDQo+IHMvRFJNX1hFX0VOR0lO
RV9DTEFTU19RVUVSWS9EUk1fWEVfSFdfRU5HSU5FX0NMQVNTX1FVRVJZDQo+IHMvZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZS9kcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3RhbmNlDQo+IHMv
RFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVTL0RSTV9YRV9ERVZJQ0VfUVVFUllfSFdfRU5HSU5F
Uw0KDQpJIGxpa2VkIG9wdGlvbiAyIHRvby4NCg0KQWJvdXQgdGhlIG5ldyBVQVBJLCB3aGF0IHVz
YWdlIGRvIHlvdSBoYXZlIGluIG1pbmQ/DQpJIGNhbid0IHRoaW5rIGFueSBpbmZvcm1hdGlvbiB0
aGF0IE1lc2Egd291bGQgbmVlZCBmcm9tIGh3X2VuZ2luZSBhdCB0aGlzIG1vbWVudC4NCk1heWJl
IGFkZCBzb21lIGNvbW1lbnRzIGFib3V0IHRoaXMgaW4geGVfZHJtLmguDQoNCj4gDQo+IEknZCBs
ZWFuIHRvd2FyZHMgb3B0aW9uICMyIGJ1dCBvcGVuIHRvIGVpdGhlci4NCj4gDQo+IE1hdHQNCj4g
DQo+ID4gPiAgDQo+ID4gPiAgLyogTXVzdCBiZSBrZXB0IGNvbXBhY3QgLS0gbm8gaG9sZXMgKi8N
Cj4gPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlkJCURSTV9JT1dSKERSTV9D
T01NQU5EX0JBU0UgKyBEUk1fWEVfREVWSUNFX1FVRVJZLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9x
dWVyeSkNCj4gPiA+IEBAIC0xMzUsNiArMTM2LDcgQEAgc3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9u
IHsNCj4gPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9FTkdJTkVfU0VUX1BST1BFUlRZCURSTV9J
T1coIERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRU5HSU5FX1NFVF9QUk9QRVJUWSwgc3RydWN0
IGRybV94ZV9lbmdpbmVfc2V0X3Byb3BlcnR5KQ0KPiA+ID4gICNkZWZpbmUgRFJNX0lPQ1RMX1hF
X1dBSVRfVVNFUl9GRU5DRQkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9XQUlU
X1VTRVJfRkVOQ0UsIHN0cnVjdCBkcm1feGVfd2FpdF91c2VyX2ZlbmNlKQ0KPiA+ID4gICNkZWZp
bmUgRFJNX0lPQ1RMX1hFX1ZNX01BRFZJU0UJCQlEUk1fSU9XKCBEUk1fQ09NTUFORF9CQVNFICsg
RFJNX1hFX1ZNX01BRFZJU0UsIHN0cnVjdCBkcm1feGVfdm1fbWFkdmlzZSkNCj4gPiA+ICsjZGVm
aW5lIERSTV9JT0NUTF9YRV9FTkdJTkVfUVVFUlkJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0Ug
KyBEUk1fWEVfRU5HSU5FX1FVRVJZLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9xdWVyeSkNCj4gPiAN
Cj4gPiANCj4gPiANCj4gPiA+ICANCj4gPiA+ICBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSB7DQo+ID4gPiAgCV9fdTE2IGVuZ2luZV9jbGFzczsNCj4gPiA+IEBAIC0yNTMsNiAr
MjU1LDQ4IEBAIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHsNCj4gPiA+ICAJX191NjQgcmVz
ZXJ2ZWRbMl07DQo+ID4gPiAgfTsNCj4gPiA+ICANCj4gPiA+ICtzdHJ1Y3QgZHJtX3hlX2VuZ2lu
ZV9xdWVyeV9wcm9wZXJ0eSB7DQo+ID4gPiArCS8qKiBAcHJvcGVydHk6IHBvaW50ZXIgdG8gdGhl
IGZpcnN0IHByb3BlcnR5IHN0cnVjdCwgaWYgYW55ICovDQo+ID4gPiArCV9fdTY0IHByb3BlcnR5
Ow0KPiA+ID4gKw0KPiA+ID4gKwkvKiogQG5hbWU6IG5hbWUgb2YgdGhlIHByb3BlcnR5ICovDQo+
ID4gPiArCV9fdTY0IG5hbWU7DQo+ID4gPiArDQo+ID4gPiArCS8qKiBAdmFsdWU6IHZhbHVlIHBy
b3BlcnR5ICovDQo+ID4gPiArCV9fdTY0IHZhbHVlOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiogQHJl
c2VydmVkOiByZXNlcnZlZCAqLw0KPiA+ID4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gPiA+ICt9
Ow0KPiA+ID4gKw0KPiA+ID4gK3N0cnVjdCBkcm1feGVfZW5naW5lX3F1ZXJ5IHsNCj4gPiA+ICsJ
LyoqIEBleHRlbnNpb25zOiBwb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBp
ZiBhbnkgKi8NCj4gPiA+ICsJX191NjQgZXh0ZW5zaW9uczsNCj4gPiA+ICsNCj4gPiA+ICsJLyoq
IEBlY2k6IGVuZ2luZSBjbGFzcyBpbnN0YW5jZSB0byBxdWVyeSAqLw0KPiA+ID4gKwlzdHJ1Y3Qg
ZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBlY2k7DQo+ID4gPiArDQo+ID4gPiArCS8qKiBA
Y2FwYWJpbGl0aWVzOiBiaXQgbWFzayBvZiBjYXBhYmlsaXRpZXMsIHNwZWNpZmljIHRvIGVhY2gg
Y2xhc3MgKi8NCj4gPiA+ICsJX191NjQgY2FwYWJpbGl0aWVzOw0KPiA+ID4gKw0KPiA+ID4gKwkv
KioNCj4gPiA+ICsJICogQHNpemU6IFNpemUgb2YgdGhlIHF1ZXJpZWQgcHJvcGVydGllcywgaWYg
dXNlciBwYXNzZXMgaW4gemVybyB0aGUgS01EDQo+ID4gPiArCSAqIHJldHVybnMgdGhlIHNpemUg
b2YgdGhlIHByb3BlcnRpZXMgYXJyYXksIGlmIHVzZXIgcGFzc2VzIGluIHRoZSBzaXplDQo+ID4g
PiArCSAqIG9mIHRoZSBwcm9wZXJ0aWVzIGFycmF5IHRoZSBLTUQgY29waWVzIHRoZSBwcm9wZXJ0
aWVzIHRvIHRoZSB1c2VyDQo+ID4gPiArCSAqIHBvaW50ZXIuDQo+ID4gPiArCSAqLw0KPiA+ID4g
KwlfX3UzMiBzaXplOw0KPiA+ID4gKw0KPiA+ID4gKwkvKioNCj4gPiA+ICsJICogQHByb3BlcnRp
ZXM6IHVzZXIgcG9pbnRlciB0byB3aGljaCBhbiBhcnJheSBvZiAgc3RydWN0DQo+ID4gPiArCSAq
IGRybV94ZV9lbmdpbmVfcXVlcnlfcHJvcGVydHkgYXJlIGNvcGllZCB0byBpZiBzaXplIGlzIG5v
bi16ZXJvDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlfX3U2NCBwcm9wZXJ0aWVzOw0KPiA+ID4gKw0K
PiA+ID4gKwkvKiogQHJlc2VydmVkOiByZXNlcnZlZCAqLw0KPiA+ID4gKwlfX3U2NCByZXNlcnZl
ZFsyXTsNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0
ZSB7DQo+ID4gPiAgCS8qKiBAZXh0ZW5zaW9uczogUG9pbnRlciB0byB0aGUgZmlyc3QgZXh0ZW5z
aW9uIHN0cnVjdCwgaWYgYW55ICovDQo+ID4gPiAgCV9fdTY0IGV4dGVuc2lvbnM7DQo+ID4gDQoN
Cg==
