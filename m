Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B94C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 03:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF96010E120;
	Tue,  7 Nov 2023 03:41:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5BF10E120
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 03:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699328479; x=1730864479;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gAufS08tbep2ikSme82oVqwNkNj2j9p32A4qFZxcSMQ=;
 b=RmqguAi4gh2DwMkQ3AE0VgVeis50cauEhJOpzmvrqd3EzyRVdG1+ZqnQ
 2pqwjj2zr/ozgLOpekeiN9Cw+N0VTPNH42v43+z1agEBd0KuDz+vNpMa7
 QmmEcEZSfuu9sGSLzUjiAQYC/MSuHzHxY1ieCTeHls0FGK7PLwiN++vkj
 TVhq88/zy3N4zb0+gmgHoOtrj6/J/kG6Ip6O3iRUj0hOm+YClzEJ6fX0+
 Ido9w/8vw5KxpAFn01hMJQ53bnQPVN1YaFl9g9SOP6HAJRcl+sxOrZiUV
 Bl2UuvLmoGH5s8DCrohj+C0faqxldLx0l/1d7yRYtHfpTnbDnVkKhbufp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2345719"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2345719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 19:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1094012239"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="1094012239"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 19:41:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 19:41:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 19:41:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 19:41:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 19:41:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWk8y/tJqwf1oDVk89nMjrATew720cnOYHgULE3XJICTafjh7oS/p79DaBP+GSBo3kWqoJ6BVR1cqlSGcJ9VtfzdXB6xpryoZT18o/TI1UCfw4Q/YUmwRdVqBJ8jweUVJSjaIPUS3q52bC0oS4S6tR0CgbgcYrs6G3jdDtCwyZjnuxP5YqQ1dDXz4ekk56TEh5/R1rZagRiOp9ZlH9UMKNc2ja3IWD6zUSm6F8hj/MXkV7s/lsS7h7lWXkka/yc39uPrtEbLg06eKNkuncEXbFmaLDUcKu16z9i26xVAnTk6L+hnVT2c4S6j5AXoYxV5R6Tw/xfCrMd7dKu2V9gIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAufS08tbep2ikSme82oVqwNkNj2j9p32A4qFZxcSMQ=;
 b=oCjIABfnMDh/QWTPIDekcHpW7JOzJhQo2Dv4BgJ2UmNm2TJPrDEFSKyKoDhnFjoHJfrdYb7nloKhjPXqpDl2Ll9EmfKTNNj+4jRVjfKAg5p+45H7U2ueAWOTuoFAMFQ0WvnDXC0ZiBgROa3cHgAyeWxx+W88pDPaApOVExdY0drzGUuIpkEIBGAZiVlZZX6l4OH76nYhKETQ5vzx0GuSbxVBTklefW0BPEvPxlUZ+b0TKtgrJrLINNIeXbYdIZApi6cJOw8YbwSBxrYRs+ZyP2gYOdlk5uXKqYKYpAAZ8pREWJx8i9h/jaAQutloZaF7T8CQnI9zWYtqCfFfbQRuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 03:41:10 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 03:41:10 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
Thread-Index: AQHaDppBx+gpPkJdIE6uyU2+b8lfP7BtufkAgAAHEmCAAECQgIAAN/ag
Date: Tue, 7 Nov 2023 03:41:10 +0000
Message-ID: <PH0PR11MB5782D021B078418E0605DD3782A9A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
 <921e39ea-5e8c-4787-9077-a16666af24ed@intel.com>
 <PH0PR11MB5782FE8704BD97023EC56EDB82AAA@PH0PR11MB5782.namprd11.prod.outlook.com>
 <PH7PR11MB652249F8AC935D24D66C089DEFA9A@PH7PR11MB6522.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB652249F8AC935D24D66C089DEFA9A@PH7PR11MB6522.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 8d8fe5f9-c267-4270-08cf-08dbdf4361f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZM7jbHv0lNKX0KOM/BzCEltf75UfC3V4IqauTeOeIP8PsMhPGPssbHt6bl183pSPbcOgNqe2biz7qy1fFn3fF0DRqcSJDfnGT33JiIvfJUZmPmTf9COFRsl18VVtU+GlfGbko6vrcAoPZWzfxzaROofC3ZSJCUYos7vJFe6ny9oFIOpz+TQMLsngGh/ytsshIfkmuozXuzM+YsPQCN6cGqPUQmusrA/6IzdDb0qf+rb7XiQ/ZTn56OXbgKJfX6DMGrYI94vND2VRJoh3ZFljDWiUh2sVsHHTNlXNfIqt0SwPOjdUf+ys30plc9BfscQ2b1DLXSDuw90DLMknGFRFtlu+yF85Ytd5bb10L2Ga+vJKrodDyi6JpGpcPZCINypG+qoxfffPu30Cbn43dnmKE7172v2sG5CVMBFcb7K/djJXyPT4ZQtzCkempWCgUz1jKXoL/zYIV3jCn1nGNFnSuzTsecN6Yo8wZWRVdI4O0QZ6w4lmf4g4KQQ0FyC6k3r37I1tn2Xn263+wQiHqNKkxSj7bACzIpsMl/5Y4UBKRJ/l2ErN8opje94LTDK4lwlKcZy4onb6vVtQNFvHVXzZQlTvh+UW+VW5We1P5QC+8qaFJxX7lcM77sWcEb3x42DK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(9686003)(478600001)(7696005)(71200400001)(6506007)(53546011)(83380400001)(2906002)(110136005)(26005)(66946007)(66446008)(66556008)(5660300002)(66476007)(41300700001)(316002)(76116006)(8676002)(8936002)(52536014)(64756008)(38070700009)(38100700002)(33656002)(82960400001)(122000001)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVYwZUliYTNZckIwUk0zaEtJMUxVYTZFY0JzUUhHdGNiM0N6MzBnYjdZYkhJ?=
 =?utf-8?B?QmpjQnpHeHlVclo4OXlwU1A4MkVxcndSQjhIYklBQlhGWUlZUVNJa2ZqVjk2?=
 =?utf-8?B?ZE1XcDZxek9GeFJvZThOR2ZuUWdkQUFXdkVSdGMwUVFlKzduRkR0SytDaXlR?=
 =?utf-8?B?TmR2bjlmQUVGTXdGSzdyKzZrbXR1RGNhRlVrVFJqUHlBbElEZXJYT1ZaUDVN?=
 =?utf-8?B?empHQURkcGp6SXAreW03ZXFseU54RWlDS1dPeU1Na3hYN3JvbnB5T0RzM3By?=
 =?utf-8?B?SmNVcTJuU0YyWUllRXlUTFJnM0VFYXc5RHFBN3lMakliVmorbmorbmVSUFZC?=
 =?utf-8?B?YjY1cFRrY3Ftc1EyTXo1L0QxM3BVTUNMUjV2TkE5R0hBb0YzbkpJYmdna29X?=
 =?utf-8?B?c3RhUkhRN3gwb3BpWjBjeFlYa1pzbzlnTXNrZWkrK25hcUMwMW8zcnJQeGhJ?=
 =?utf-8?B?STZNSEoreWNqZWpGN1g0YU9FTDdZa3JxYS9KZEkxcjE2Q3pRdU1PT3ptMm9n?=
 =?utf-8?B?UDB4WVladU1xUWJlM2twaTI4NkVJQ3paRjZIVWtRVVY5aE5iSWdLRDI5cWhF?=
 =?utf-8?B?L0hRODdYSEhQalA4cG5zOGdia0ZmSnJodWFpSE1oaUZpZGJXQ01xRXM0Y2Nr?=
 =?utf-8?B?VlJuRUJPRVRYMjgwY1ZDbDRJa0plYkFqZThYTm9ycjZYVzM1bWFLRHk2YjZk?=
 =?utf-8?B?YkZCNTZqZ1ZwQWxxNmZPdS93bUdFZFJzKzdnMWQ0SXZVRTNIUk80ZithMGdu?=
 =?utf-8?B?Tm1wclJKSWlsUndLNGZCYWJQVGx1ZzlzNnI2NXpTbm9iRis3M2t3L0NSVFg3?=
 =?utf-8?B?K0dDZ29GWG1EeFFKWkZjRjlIWURGdUtldXFnV0tDbzQ3ODNhOTR6Q2JMUXdB?=
 =?utf-8?B?RmpPRGZaYXFvckMrUXkvRFc5OTJvK2RUSys5Q1IyY3pWTm1ZWTdiUTBQWEdl?=
 =?utf-8?B?RlF0QnNaR1RKTXJzdVdMMkV4VEJaZ2FMZnQzbUNDSEUvbFVESzl0aWNpN0Y1?=
 =?utf-8?B?d3Rrd3V2eStUbkYwVFFMZklVelNqTU92Y1NQTHI2NVlaMWJpSmZCTm05bHZv?=
 =?utf-8?B?bW1KMHdndkFhZm9IOWdENktRcCtxS05uSjR0eG9uVXh6SmlNU2NWeDNQbWdo?=
 =?utf-8?B?MkVkdGVvUzl3T3J5YUpJRkNYWm03VW5qK1FqZkNGVTJIaEluOW9OUlU2eHdJ?=
 =?utf-8?B?VHp3U2ZFcWx6UjdoNHlId29XRVlXRDJ0TUkwL0FsMDV6YXdhek1GbVlDdi9B?=
 =?utf-8?B?SW0zN05FY3BTbExQYUUweHZpbHQ4UldVRWFGVnM0RlNLbkxXRkJWK3F1WWtS?=
 =?utf-8?B?QnhoQVJjZXRDRk5UenFiTWMrTzBHRmNGSi9yd29NbzBXci9xc3p0UjJzTmxH?=
 =?utf-8?B?TDBwdmpSVSt6bWF2VThOUVFILzljSzhtQUVFeVBWZjNMcDRCTlJaZ2NXLzJv?=
 =?utf-8?B?Q1B5SUtXSHphNFlsOHozRGJpK1Bydk1nNjNwaFRFWUM5Y2Q5eEM2K3NXWnN6?=
 =?utf-8?B?WjRqZFdlK1dobUdmMmN3U01PZDJkRmtMcWRkQXQzK1AxaCs2Q09lSFZrOGhS?=
 =?utf-8?B?bGhTa0Y2eVFxWTM2T0JjRW1tOFBqWk5IcGNmWDV2MHBXZVV0VHdUYVUwNUp4?=
 =?utf-8?B?YW1SMU9zY3A2WEhoYjM5VFdwaHRySDV3TzAvNS8xUTMrd25iMWY1VmRXUlNZ?=
 =?utf-8?B?a1FZTHVVK0tMc051a3BLTVA5T21zamJ1a0F4RE5wN0tSK2VmMG9BS1FObkdO?=
 =?utf-8?B?aHo5WmxxSmYxSVk4OGJkdFhaMWNKbjBQaGtlbDI3aVJ3Q0pTSEJvSnhRWGdD?=
 =?utf-8?B?TnE2OGNpWVkrUUp2Si9NaXB5NzhkR2N0Y0kzN1NUQ0xEY0RHQzdwSWRzUERa?=
 =?utf-8?B?SWFNcmwyNVJFZTIxcGNrZWZJSVJabVZYc29NMmluTHUzTDVZWlhKcytvTTNu?=
 =?utf-8?B?UFluV1crTGpGVmdUMFBNNk5IZ0dvUEk5dHY5T1liT2h5Y1NiRjA4bk5GNzA1?=
 =?utf-8?B?V1duVGNCNCtBZWJOSDRaNjNIckpWT0p3S09RRmpJVVdieUtFU1BpYjFKWUpO?=
 =?utf-8?B?OTJpZlRNcXFLaGV3ZFY0NVAzT0h2WWhlOThDMkx1VGJ4bkgxY3VURTc1YWZD?=
 =?utf-8?Q?rJXk+kYpH9Tp/5SYzZeOl4/wD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8fe5f9-c267-4270-08cf-08dbdf4361f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 03:41:10.2498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6whixMA499gNmm+yjEZKAX/0A+l8WJzU6fS2x5k0TcTXjx/PkPLs2oM9fxGxCPzZrJ5HhwCx/0IUQW1aRhsOFKAufF3gK1nkxh5xB6Mf10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJvc3QsIE1hdHRoZXcg
PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDYsIDIw
MjMgNDoxNSBQTQ0KPiBUbzogTWlzaHJhLCBQYWxsYXZpIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5j
b20+OyBXZWx0eSwgQnJpYW4NCj4gPGJyaWFuLndlbHR5QGludGVsLmNvbT47IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSRTogW0ludGVsLXhlXSBbUEFUQ0hdIGRy
bS94ZTogUHJldmVudCBudWxsIHB0ciBkZXJlZmVyZW5jZQ0KPiANCj4gSSdkIGxlYW4gdG93YXJk
cyBmaXhpbmcgdGhlIHRlc3QgcmF0aGVyIHRoYW4gdGhlIG1pZ3JhdGUgY29kZS4NCg0KWWVzIEkg
aW50ZW5kIHRvIGRvIHRoYXQgbm93LiBCcmlhbiBhbHNvIGhhZCB0aGUgc2FtZSBzdWdnZXN0aW9u
LiANCg0KVGhhbmtzIQ0KPiANCj4gTWF0dA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgTWlzaHJhLA0KPiBQYWxsYXZpDQo+IFNlbnQ6IE1vbmRheSwgTm92
ZW1iZXIgNiwgMjAyMyAxOjMxIFBNDQo+IFRvOiBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTog
W0ludGVsLXhlXSBbUEFUQ0hdIGRybS94ZTogUHJldmVudCBudWxsIHB0ciBkZXJlZmVyZW5jZQ0K
PiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogV2Vs
dHksIEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+ID4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciA2LCAyMDIzIDExOjU4IEFNDQo+ID4gVG86IE1pc2hyYSwgUGFsbGF2aSA8cGFsbGF2aS5t
aXNocmFAaW50ZWwuY29tPjsNCj4gPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0hdIGRybS94ZTogUHJldmVudCBudWxsIHB0
ciBkZXJlZmVyZW5jZQ0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIDExLzMvMjAyMyAyOjE5IFBNLCBQ
YWxsYXZpIE1pc2hyYSB3cm90ZToNCj4gPiA+IEluIHNjZW5hcmlvcyB3aGVyZSB2bSBpcyBub3Qg
aW5pdGlhbGl6ZWQsIHVzZSB4ZV9taWdyYXRlIHRvIGdldCB0aGUNCj4gPiA+IGFkZHJlc3MuDQo+
ID4NCj4gPiBDYW4geW91IGRlc2NyaWJlIHRoaXMgc2NlbmFyaW8/DQo+ID4gSXMgaXQgbGVnYWwg
dG8gY2FsbCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyB3aXRob3V0IGEgdm0/DQo+ID4gV2hh
dCBjb2RlIHBhdGggZG9lcyB0aGF0Pw0KPiANCj4gSSBzZWUgdGhpcyBpbiB4ZV9saXZlX2t0ZXN0
IGluIG1pZ3JhdGUgc3VidGVzdC4gdGVzdF9wdF91cGRhdGUgcGFzc2VzIHZtIGFzDQo+IE5VTEwu
DQo+IA0KPiA+DQo+ID4gSnVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpZiBzaG91bGRuJ3QgYmUg
aW5zdGVhZCByZXR1cm5pbmcgYW4gZXJyb3INCj4gPiBpZiB2bSBpcyBOVUxMLiBPciB0aGF0IGlz
bid0IHNvbWUgb3RoZXIgZHJpdmVyIGJ1Zy4NCj4gPg0KPiA+IC1Ccmlhbg0KPiA+DQo+ID4NCj4g
PiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFA
aW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMgfCA1ICsrKystDQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21pZ3JhdGUuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5j
IGluZGV4IGU2YTMxZjkwZWJkYi4uZjc5ZWM4ZTRhZTRlDQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+IEBAIC0xMjk2LDcgKzEyOTYsMTAgQEAgeGVf
bWlncmF0ZV91cGRhdGVfcGd0YWJsZXMoc3RydWN0IHhlX21pZ3JhdGUNCj4gPiA+ICptLA0KPiA+
ID4NCj4gPiA+ICAgCQkJeGVfdGlsZV9hc3NlcnQodGlsZSwgcHRfYm8tPnNpemUgPT0gU1pfNEsp
Ow0KPiA+ID4NCj4gPiA+IC0JCQlhZGRyID0gdm0tPnB0X29wcy0+cHRlX2VuY29kZV9ibyhwdF9i
bywgMCwNCj4gPiBwYXRfaW5kZXgsIDApOw0KPiA+ID4gKwkJCWlmICh2bSkNCj4gPiA+ICsJCQkJ
YWRkciA9IHZtLT5wdF9vcHMtPnB0ZV9lbmNvZGVfYm8ocHRfYm8sIDAsDQo+ID4gcGF0X2luZGV4
LCAwKTsNCj4gPiA+ICsJCQllbHNlDQo+ID4gPiArCQkJCWFkZHIgPSBtLT5xLT52bS0+cHRfb3Bz
LQ0KPiA+ID5wdGVfZW5jb2RlX2JvKHB0X2JvLCAwLCBwYXRfaW5kZXgsIDApOw0KPiA+ID4gICAJ
CQliYi0+Y3NbYmItPmxlbisrXSA9IGxvd2VyXzMyX2JpdHMoYWRkcik7DQo+ID4gPiAgIAkJCWJi
LT5jc1tiYi0+bGVuKytdID0gdXBwZXJfMzJfYml0cyhhZGRyKTsNCj4gPiA+ICAgCQl9DQo=
