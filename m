Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D321606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z9bhz+RC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192D710E739;
	Tue,  3 Nov 2026 04:16:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54910E1A1;
 Tue,  3 Nov 2026 04:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793679377; x=1825215377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ajsVW+mx2T1xvjx/fJYa5FM1lGXuBmvBuQ8RyhUb1E=;
 b=Z9bhz+RCO8RD6iwL3jXOE83zoF0NuRhM2XP0ckFp9wlmVRhfiU1XQJAq
 Z3X/Ahpy4J3UQFG4IJJml6jY4mpQSrHVftMloeAzUBg+Y52XJL7MDoecA
 upZ6ar1a7stwyQL1GpyS+5Us7PPuymIn1lAbx0yZaiOD9hQh/ypTCZ85v
 jQkod8U4z0+ndmFvtehgjKWFCO+/HO7MY6MYWumBYsEOFsiHEjDA21FHF
 tAPPmWB8tplYdrp5I0B3rVm0PVFOJLetHP9Iy5BJ2cnEKZm3t6LNXKktH
 G2yfj8qcWJN+9IigVeyE5+LRUf0CSm/zQU7ztXsbM1kxCbCdy8rBD3wxV g==;
X-CSE-ConnectionGUID: 7Jt9k/UESoCpsNuYrTpAmg==
X-CSE-MsgGUID: FzK5QIYuQ2Kyzz8iM5/S1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2294759"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2294759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:16:16 -0800
X-CSE-ConnectionGUID: o3LBNv6GSoGckEeHN5ka6w==
X-CSE-MsgGUID: XTjHFceLSmmu6gJ675occA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6642056"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:16:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:16:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 20:16:16 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:16:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7F+VIABsb6OPHJKbrzWyuRJ/ueWdGHQeJmFAijA5gvtBIj7r/m+8r3HhZ3ktHw4xiaj56ri2qSqog/4WGgz4Kx7BiJJiWGeCItj6/8nHm0lh/mkkwnuwOvzaM4GyRNXVoW6ZT2qg6lq9i2c0PAIPdXBnHiMrfcxU5aXSUEJwbbZJ0T+tERLQr5AF5BEYybC2TjIiiw8B56aFenwwiNLv/dnuVJgL4joAQM5g2vV3xKt6vH5QCT8RwnRCKCiHFUF1dW/yoBlDSiKtQVwmDEuFu6VKn++Q0hgLTirn74H+KlkTvWyN2JVWe/in7lSltjUEeqE9fTq6xj0ONGAMHmwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ajsVW+mx2T1xvjx/fJYa5FM1lGXuBmvBuQ8RyhUb1E=;
 b=PH5sbp5iVSkTBN7Xu2rO8PqkhfnDfe2DcuTydrQig5+W8N3kjf4btUmWEdMY62h94S/instQ0GfXub+zzNSEQeA9u4kMunqA63tX5EjzlRHVG9Msh+TIHK6iKYVIeu9YCkCPBaeeGShXE+pWUTdmigC3f3DLj8GpifUmyCOaqKX1vG3RooguUiBZs6EGZ8m5eXXUsVDBKWAC8M9ePlFP2CJV5xpv7Gkf+jJc8SwcpNdRyuOw3wdyDGoTEAvyD/dATwmDER99P2rQm1kT+IKlHtvh5j1AvMfEc5zW3huoXaOZt1nVPjFtMGhxDDE082G5Vpr3P3LoauGXkXDtQFZLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:16:12 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 04:16:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 05/10] drm/i915: Fix intel_crtc_vblank_on() with port sync
Thread-Topic: [PATCH 05/10] drm/i915: Fix intel_crtc_vblank_on() with port sync
Thread-Index: AQHdaJIeKwASrD9npEWuLHtauUo1+7cbwtVA
Date: Tue, 3 Nov 2026 04:16:12 +0000
Message-ID: <DS4PPFE901A304F480DB6C32958AB503C25E3692@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-6-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MW5PR11MB5881:EE_
x-ms-office365-filtering-correlation-id: ccff871e-4bbd-4f77-a53c-08df396131e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|3023799007|10067099003|18002099003|261102123227099003|22082099003|38070700021|56012099006|4143699003|261022105027099003|11063799006|261026140227099003|261022075727099003|261009223027099003|261028144727099003|261021121427099003|261021123027099003;
x-microsoft-antispam-message-info: dmzAQ/Zu36cygIq0NQdv3IOyxBwKzod3zDiyvd3fK2PpqWErbxmMfAL/LfpbfzA2L5PeP5qC3zRDWV0pH7e0sfURELIfkbYrZJe5W+HA9y/Wv8oPMkQbDLZ+nkCA7WBwzBjjaD9nL41X7gaOa/qo82rq17LXSz1C/OcOjfq0bTVK/YcZXP30W9RxS+oAvz+d/zsEWlkp5gMbyxos1tqRkwVl5f0DqbuJNufD//EWCIkoiLVvmvvzqNNvXr8tFhZ95F6NBIZYouQSbMo2M/nzjW7QoTPluWBtvSnWgVc6Ys0GwJheNrGwCNDoHDclEtwT7IWVNng8q/ZQCb5il2ytJC8gfekWvta7GEi4oBql8UvE12jV3xLojT/zkvS8iqcrw+AXUWb2S/aphfeXoYaVRbrp2jGdof/hVQFQqSYPlZgQTCPi3E9f98M2KVifxNVswXjwT89skJA+2K8ZYp+1TwQYlH5bmPAJjd56jP8V3nl+h9WYbw+XUcIDawyZjBIWa920kWFTL9NC9xmRpcoLkRDvBjfyXvQ318RbqcFk7eOMiSWNKh/hJ6Qt3Ofp/JWfjzKPcGPmtCTkmNoGCK2Ag1FZB53hffVpgDmKN+jfh4+0fn3XdWqSkrQXF5mhxhV/8jZidbUEL6VcXwR7MbUjokvrzFYio2kYdIoGEphW2yTEgxRrzmMoOsP710oDdttoFm8qOJEUcSQzKPHutRr5QmfJs75nOwa9ZxA29CKecPo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(10067099003)(18002099003)(261102123227099003)(22082099003)(38070700021)(56012099006)(4143699003)(261022105027099003)(11063799006)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VksxTUxFd2Qyc1Q0eXc3VXRZREswMGhCMGdNKzR6bE9xOUgrVjE3QXZ1TVMw?=
 =?utf-8?B?eWpJNDQzVHg2elQ4bFdrUGd4bmxTcGl3R1FhY3BJZ0M1QWNPQnpJQ1VKU2Uz?=
 =?utf-8?B?UERzK29JUEtwVXZqUVBGOXozdklwYTh2RllPdXB5SXBSNUdQR2VCbGUxaHcy?=
 =?utf-8?B?ck1JdlhWVzZCbVM5MllidTg2MnExeUV2c1RQVlZqaUYrcStzYUdzbmxOUHV5?=
 =?utf-8?B?VG5LMEZKRGI1RkNJTkdFek9Gb1lhNkJpTnVlTU5LSkZRMHZUOWdSNmU3aThY?=
 =?utf-8?B?UFpqTDAzdWxIUlFmK1pVSHQ0WUtDejlqVE9kNUpRNThIeXY0cUhNRlZqd1py?=
 =?utf-8?B?bmxob3FNd0FzTHlxVXBDVHFKTzFYRDFzRVRvckVuRnZBakRWYklYRG5JSXhx?=
 =?utf-8?B?c3p5MXc2Qml4ditNZ3BHejdNLzBKTldCSFlBb2xXaUJWUy9oYXJOdFMzb3JD?=
 =?utf-8?B?Ny95Uko5U1JEcjBqWkxrREZreUR2MWRzMU5zc2oyTTJmZ3lrNDRzOVBWZ3M0?=
 =?utf-8?B?anpsVDVvL0tpZG0rVXEwNGNmaEpxU1Z5UUxQeEFIWGdzV1gxeHhCdCtYQlpB?=
 =?utf-8?B?b2xuR1dKaGgyVGx0UVZzNG1ybFhkdW1wSUFKNklXQURpeENkSzNKTkV0aFEy?=
 =?utf-8?B?WkZSOWZiQ3VYZ2tmZzJVcFA4THgvNElvVWZWRk8rZlRWS2RtcHgzdmI0d1lQ?=
 =?utf-8?B?TmdhdUtjckZ1WHk5aUVpVVJZOVhOTVFraU5zMlpOcVQrM0UyZmVVdVF0THhl?=
 =?utf-8?B?bkZLcnBienBtNWdXWTlGZjh4UTdXck9UUUUrVVFSUDVmdWFsejZpYS9sUnlQ?=
 =?utf-8?B?QzVQeE1ianNaTVBuZWl0K3pHd3NoT29aaExkaTBJbVJkS0dMb05uOW95WUY0?=
 =?utf-8?B?QVhaUWRPOUFodklwZmhkam5Kc1NEN3RJQkYzR1J3WWNqRnBJK2NQS2xQeTB3?=
 =?utf-8?B?VHoydGpFUFN6eTh2eE9pck1xenZ1NEtJR1JTaXBsb2doak1rdUtyOW54TzRz?=
 =?utf-8?B?R3B4WFFXTXZQNHFYRkpzOUJDN3lZekRKVXozcWJGbDJ0OU8zNzd1bUorSXhz?=
 =?utf-8?B?OU9zWDFkZk1tRFh6UEFYVmptVU1ZWHp1eW1QZVdVaGRIQ1dSUFpJSXIveXFw?=
 =?utf-8?B?ZVp5OFRwVVpsL05sQ3grbTVWcTdvNkhyYml6ck8yRnVpaUpnZWdtbUJZSmVO?=
 =?utf-8?B?YWtPaDJwOGFvd2p5UHRwRmswSDhobWlJbmtrL29DVldKSVdKV3JYWHpQTnZj?=
 =?utf-8?B?QUgwUHV5VG9FS3VBNndxTVpTcnZUeE5OTHowRk1FWnVRRjZVOXVrT09GQVJt?=
 =?utf-8?B?MVNlejU0NEhtcEFLZkx6V3hGc3RvcmdBZkJvTXMxZytOaG9lcUpXZGp5RVp6?=
 =?utf-8?B?TWV5NFF5Q1ZYejQxSFAycXFTVGVBMllRc0xLWkd1K1FXU0xodlUvU2M2RDV2?=
 =?utf-8?B?enEwNnVybEdBd2hjNXpFd0FrcVZXNUtaRFFFU0g0My9mZ3k5R1VmR1M4YWpR?=
 =?utf-8?B?OXdYV3dXU0lxYldDcDliSG5HbmpuekVyQTRiNzg1Zlc2dzd4RUJQUkxUMlk0?=
 =?utf-8?B?bGxJNzYxZGZ4QmZuT1Z2dDM4NXdvV0ZVUnlsSFptQzlQTmRIbVpEMTVUSTk5?=
 =?utf-8?B?MmZQaDZCRGMxR0tOeGYyVldlZGV5ZU9HWjhRUWU1SDlQb2FsOWczWEd0VlBt?=
 =?utf-8?B?TTNUK1BwWlQxQnNiamJrd1YxVCtUbjllcW5LMWFFWHJVRXdpczBpdlZwUkVv?=
 =?utf-8?B?VkFCa3djNTNINFB2V2V4NkN0MGw1amJlM0ZiMUNwZENwS2tSR0hhMmZDZ0VT?=
 =?utf-8?B?bDdvMmlkQ2Q3UGxIK0dQcmk4OGRKNWN3d0Nxa2lnbnNUYWxpQWdQZTZIT3lj?=
 =?utf-8?B?WHFNOFkrNXpuMWp6MGFFVVo3WldJRDRaZStRRTFFNmNBSWFOb0tualJNY3BU?=
 =?utf-8?B?WmVOOWx4THBCNG9PMzFJNnpDQmsxTlpaN0xGS2JodXNwWTlJRzVoUVlqWDJZ?=
 =?utf-8?B?OGRaVGNSenZUMmtmWEgrenlvbjNOYW5RWnZLR3lFcmdicjF6OXd2d3hrdlZu?=
 =?utf-8?B?bWhac0Z4dmxNckllUkRKb1NZMkt2d3Rac2FRNTdGYkRwQUhJem10UkdVNTE1?=
 =?utf-8?B?SjhtYnA2QnQzSks0QkpUVHZyc0xqVjI5WHJjZlhqL2FaQmliNVNiTHBub3R2?=
 =?utf-8?B?dlF0eHJFd29HVWNMeVh3aE1oSk5pNDdNajJzd1FSZWVsb2JCMUNIWkFhRllm?=
 =?utf-8?B?aUI1VHd4cVVUa1czM05XZktKQThsRWVKTmJ1dmdzUjlGb3FRbGhsUWJtTFNi?=
 =?utf-8?B?YmsxNGZIRERYWFRiRk1RTFkyUVoxVXlCamVWWklJb1hTaEtybjFtUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OV5HHyM9Hws2mwx8fJPlDwcZJYLSGycwvnwg2LNIy12dTx5jK1Ynsbz4+NikaF+GtDSexlA/1gaKPi23s3nPZsqT7TYnChZr7CXVJKfOgE0rixpNI/365nej+JJmigxv34YPEffiHYxVxJQ9flGfwaFQ8w5F0j22vqtuOsx4MC6FxXS2vC6lmJUBjbKCuncAWPdw51pbaQ/rP/px4bu1gvkIo+ggQTVJ3juE1IdpRW9YvewEcLQUtTn6vn2g8EoPs/Ikp5uwMK8k34RAOw5ZOqHD7UqgYACqy4nclcNiOZFAXh84P0vPPKXwMXmVNRDejNHCETrlqBSzTeQncBQuMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccff871e-4bbd-4f77-a53c-08df396131e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 04:16:12.1057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUgEKxT+carVYVFuSAspocj6UMlM2bwRxxFvE9wcuEGDFEC4b6p1BaFTbE75ETak0hO2YP/o06gT8fwrgdArRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggMDUvMTBdIGRybS9pOTE1OiBGaXggaW50ZWxfY3J0Y192Ymxhbmtf
b24oKSB3aXRoIHBvcnQgc3luYw0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFdoZW4gcG9ydCBzeW5jIGlzIHVzZWQgd2Ug
Zmlyc3QgaXRlcmF0ZSB0aGUgc2Vjb25kYXJ5IHRyYW5zY29kZXJzIGFuZCBsZWF2ZSB0aGVtDQo+
IHRyYW5zbWl0dGluZyB0aGUgaWRsZSBwYXR0ZXJuIHJhdGhlciB0aGFuIHByb2R1Y2luZyBhY3R1
YWwgcGl4ZWxzLiBPbmx5IGFmdGVyIHRoZQ0KPiBwcmltYXJ5IHRyYW5zY29kZXIgaGFzIGZpbmlz
aGVkIGl0cyBsaW5rIHRyYWluaW5nIHdlIHN3aXRjaCBEUF9UUF9DVEwgb24gYWxsIHRoZQ0KPiB0
cmFuc2NvZGVycyBvdmVyIHRvIG5vcm1hbCBtb2RlLCBhZnRlciB3aGljaCBhbGwgdGhlIHRpbWlu
Z3MgZ2VuZXJhdG9ycyB3aWxsDQo+IHN0YXJ0Lg0KPiANCj4gRGVmZXIgdGhlIGludGVsX2NydGNf
dmJsYW5rX29uKCkgY2FsbHMgZm9yIGFsbCB0aGUgdHJhbnNjb2RlcnMgdW50aWwgdGhlIHRpbWlu
Zw0KPiBnZW5lcmF0b3JzIGhhdmUgc3RhcnRlZCwgdG8gYXZvaWQgdGhlIGZyYW1lL3NjYW5saW5l
IGNvdW50ZXJzIGp1bXBpbmcgZXJyYXRpY2FsbHkNCj4gYWZ0ZXIgdGhlIHZibGFuayBtYWNoaW5l
cnkgaXMgdXAgYW5kIHJ1bm5pbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6
IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDM0ICsrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0K
PiBpbmRleCAxMjIyMmU1MDk2ZDQuLmVkMzlmMWUyNjVhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+IEBAIC0zMjQzLDYgKzMyNDMsMzUgQEAgc3Rh
dGljIHZvaWQgaW50ZWxfZGRpX3Bvc3RfZGlzYWJsZV9oZG1pKHN0cnVjdA0KPiBpbnRlbF9hdG9t
aWNfc3RhdGUgKnN0YXRlLA0KPiAgCWludGVsX2RwX2R1YWxfbW9kZV9zZXRfdG1kc19vdXRwdXQo
aW50ZWxfaGRtaSwgZmFsc2UpOyAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkIHRyYW5zX3BvcnRfc3lu
Y192Ymxhbmtfb24oc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICsJCQkJICAg
ICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpIHsNCj4gKwljb25z
dCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsNCj4gKwlzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubjsNCj4gKwlpbnQgaTsNCj4gKw0KPiArCWlmICghY3J0Y19zdGF0ZS0+
c3luY19tb2RlX3NsYXZlc19tYXNrKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlmb3JfZWFjaF9u
ZXdfY29ubmVjdG9yX2luX3N0YXRlKCZzdGF0ZS0+YmFzZSwgY29ubiwgY29ubl9zdGF0ZSwgaSkg
ew0KPiArCQlzdHJ1Y3QgaW50ZWxfY3J0YyAqc2xhdmVfY3J0YyA9IHRvX2ludGVsX2NydGMoY29u
bl9zdGF0ZS0+Y3J0Yyk7DQo+ICsJCWNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpzbGF2
ZV9jcnRjX3N0YXRlOw0KPiArDQo+ICsJCWlmICghc2xhdmVfY3J0YykNCj4gKwkJCWNvbnRpbnVl
Ow0KPiArDQo+ICsJCXNsYXZlX2NydGNfc3RhdGUgPQ0KPiArCQkJaW50ZWxfYXRvbWljX2dldF9u
ZXdfY3J0Y19zdGF0ZShzdGF0ZSwgc2xhdmVfY3J0Yyk7DQo+ICsNCj4gKwkJaWYgKHNsYXZlX2Ny
dGNfc3RhdGUtPm1hc3Rlcl90cmFuc2NvZGVyICE9IGNydGNfc3RhdGUtDQo+ID5jcHVfdHJhbnNj
b2RlcikNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCWludGVsX2NydGNfdmJsYW5rX29uKHN0
YXRlLCBzbGF2ZV9jcnRjX3N0YXRlKTsNCj4gKwl9DQo+ICsNCj4gKwlpbnRlbF9jcnRjX3ZibGFu
a19vbihzdGF0ZSwgY3J0Y19zdGF0ZSk7IH0NCj4gKw0KPiAgc3RhdGljIHZvaWQgaW50ZWxfZGRp
X3Bvc3RfZGlzYWJsZV9oZG1pX29yX3NzdChzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0
ZSwNCj4gIAkJCQkJICAgICAgIHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLA0KPiAgCQkJ
CQkgICAgICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKm9sZF9jcnRjX3N0YXRl
LCBAQCAtMzU3MSw3ICszNjAwLDEwIEBAIHN0YXRpYyB2b2lkIGludGVsX2RkaV9lbmFibGUoc3Ry
dWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJZWxzZQ0KPiAgCQlpbnRlbF9k
ZGlfZW5hYmxlX2RwKHN0YXRlLCBlbmNvZGVyLCBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsNCj4g
DQo+IC0JaW50ZWxfY3J0Y192Ymxhbmtfb24oc3RhdGUsIGNydGNfc3RhdGUpOw0KPiArCWlmIChp
c190cmFuc19wb3J0X3N5bmNfbW9kZShjcnRjX3N0YXRlKSkNCj4gKwkJdHJhbnNfcG9ydF9zeW5j
X3ZibGFua19vbihzdGF0ZSwgY3J0Y19zdGF0ZSk7DQo+ICsJZWxzZQ0KPiArCQlpbnRlbF9jcnRj
X3ZibGFua19vbihzdGF0ZSwgY3J0Y19zdGF0ZSk7DQo+IA0KPiAgCWludGVsX2hkY3BfZW5hYmxl
KHN0YXRlLCBlbmNvZGVyLCBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsgIH0NCj4gLS0NCj4gMi41
NS4wDQoNCg==
