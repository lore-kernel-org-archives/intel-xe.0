Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE9CD342F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE0A10E78E;
	Wed, 12 Nov 2025 18:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDUdPBBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B2910E78E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762970935; x=1794506935;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=831W3Q50vY4ihp0Zlni77Ji1aiJSL1sCDbUUDlB2aXI=;
 b=QDUdPBBtWA8ZZ4sMqVWsYqEa4X+pCDn/tSVx+CfHcf8BqSVzmKubNsht
 89d6schlw/hApwkvRLTV+oIgiI++walk1dSB2TW+xE9/PSHW4DJ6eEidt
 PoOzjcrJomlUNwTHwJt8RtN71yRwwSlXPBwiKgjyjGwHRx4PVzp95GVsd
 xPfgwu+oqlgh5TtSlmMO6qvGkaAdatoKwgYTTmZIW5ulYkDJy/riNNuTX
 sFOYkKt8CoXxjkkDtAZ3SEdEUDQlHswruKETuY3MoIQS7IUpK1Cb5Cy1T
 BCNLkFQww6SS2yVZ4jT2koumgW1NOwCoTKDP2EbF645kgdsmrHwmCoAYk A==;
X-CSE-ConnectionGUID: nKNUrGbNS0a28uWh1wSLEQ==
X-CSE-MsgGUID: QzHeHXmpR5q9+I9RFINAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87685366"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="87685366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:55 -0800
X-CSE-ConnectionGUID: A+DBIVosQJaTYJPO58d8Pg==
X-CSE-MsgGUID: kPmVo0/oT2qAPYziffYiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189132703"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:08:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 10:08:54 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJvhKPbuilxr6tp7REJjR92uzGBRxE7fZK7dGiy/YMedXQU/hNXdiLZSjsbvUIiymB/riDLxZE3T0cUbeP+uxpGPbaIbPvXGCVpJkNJFckIentG6sPqk9qJ8o8S5niRyC0AO5SCspb4LF7DngGHn6EymTkqukCxzmTC+bT9CW4z5fudR9MlKWAxdRA9voo/J7/IRaCiHNhcc/g5OEVzl1P4lQGQkQoVRkIilfTgqOqZr0jYbUBDD4m9H0Dxnyw5mpt+uN8s2PA+n747ygEggtqt7leSA4b0zRpqISj5njyyNhuGNtBgQA4A8u8+gBmbagyEtF/aKE8LoGQVjL/CzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=831W3Q50vY4ihp0Zlni77Ji1aiJSL1sCDbUUDlB2aXI=;
 b=IjH4liaUlSd2EuVfUKJumX4E8D4ojfOboADVWohSBVA5NwC9jJJPUmo9pRYFvIxlhdn5oR2/LziColzCdZ24lVLKqG6MXC4M1IIqn5A3D2CiBo9cSkv8Cr9fxdDziO43tT0kib+v5KxvIInlvSmmlOiscitzwRmPWpb8VwHrEkk/IAJWX2BeL0IDquC6Qx8topj5C7wnAIYgvEF6hOBEGxc9p8JvthLmIpIWhodmkuCvMqAJew5e8NvCmH60sO404zkUh1H4y4MJdAj67M3f4YTIi4woW8Iz0Iy4KWwUwV5gnFDNtWveiY2FRgeBlHyxhR1GHsPNFFaLe7I8BRU3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB7811.namprd11.prod.outlook.com (2603:10b6:208:3f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 18:08:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 18:08:50 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
Thread-Topic: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
Thread-Index: AQHcU2rnUodUMGxal0K9WDvQ14sw1bTu1iYAgABh6RCAAA1CgIAAAtew
Date: Wed, 12 Nov 2025 18:08:50 +0000
Message-ID: <DM4PR11MB5456D9612127E6DDBB76084FEACCA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251112002331.1897395-2-shuicheng.lin@intel.com>
 <cc8c7cd2-8c92-422d-b6ca-ec892478fc61@intel.com>
 <DM4PR11MB5456E2B0A9E44FE1603FB117EACCA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <09218055-ee5a-45c1-a816-157376b3af39@intel.com>
In-Reply-To: <09218055-ee5a-45c1-a816-157376b3af39@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB7811:EE_
x-ms-office365-filtering-correlation-id: 53eb0025-b1ae-48d2-d75d-08de22168882
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z1BTRWlOTjdqdjhzazZCNHMvUTVyYU9CeVkrSlZJNWc2WSsrdjZpR0hMRGZZ?=
 =?utf-8?B?SmM3b2UwQzgvZy83cm8vWVpSa3h3RHpmWk14YU1Wb2t0RTN5UUZZQmJMd0or?=
 =?utf-8?B?NlNPYktYNlN1NlhXekxZNlpGVmpFQjVYWmluclBYYzgwRUpqMzd3WFhaaGph?=
 =?utf-8?B?Z0dQWkt6ZUx3UzR4V3MzV0k2S1ZHUlBTaDViVnhxV0lSSGZMTjE3YkwzbEQ4?=
 =?utf-8?B?aW03K1J4T1NsWWJZY3U2SzlaaXlUQVptVkx6cU5tOHRlY3M4TWdZK0ZLaC9z?=
 =?utf-8?B?d0d2U05CeFdNODJvQm9ZTGVOaXQ3QzJzcUQrNmFhSmxGRVkxN1Nvb3RkeXMw?=
 =?utf-8?B?eUNJWHBuN214ZEF6ZkdxNTQxSnZybnFDTVJlSlE1QWR1U01GTE5qV3NXNXFQ?=
 =?utf-8?B?VHgxY003bVRYaUhidHRZcFNyWjRRNFE5NjNlWlJQamZoV3VWcENocG1TMUJh?=
 =?utf-8?B?Y3lNK3JVRzZoVjNrYTZTdnJPL0dhTWtVZVJndTg4R0lKa0Y5N3k5czNqaFZS?=
 =?utf-8?B?NE1zVS85cEg1TjIyM2lFSjQ0RXdsYS9EdUcrRjMzbDRjOUZGQlhkUmVaNnRL?=
 =?utf-8?B?bTlKY0V5cjl1blR0clBmbk5qbkl6cEVUbDBwWml1Znc3eW9TWWdtQmx4bTlN?=
 =?utf-8?B?ZmhZRnpwYzN6dzZFQU1WQWd0dTNqMnpwL3d6VzluQWJHUTB5aXlIWVlZYTVt?=
 =?utf-8?B?eG1nVTFuNVdVcEd3Y2YrcnNqcGRxRGRMVG1jeVlUT0c1RHQ5emhmQit4V1R0?=
 =?utf-8?B?a3oyZjlLMTc2SFV1bnN3RzRyZmFnSlk2RS9ldzU0bTA5QXdITUVOQjU3MStm?=
 =?utf-8?B?ck1NcEVaT1V6ZVY1czlDYWdNazZaWFYraEwxOXZhamFhQTFrZVZReXZkR1pj?=
 =?utf-8?B?TDlEODBNS3JZMUdGaVh5ZjFLWWRKbW1IOU5lOXNXWW1TaURUODI1THNKU3U3?=
 =?utf-8?B?dXA4cGdVU2ZVUGNvVVVPOUpKQWxsVWJ2b05BQkNRR2txREJQUGI3Y093Njgx?=
 =?utf-8?B?RUFDT1UwdXlYc1YvR3VKbGJPZ3VVQ1ZQY1BFcCtWS3g1dk9Xd2FETXhyU3h4?=
 =?utf-8?B?Ty9UcU45bXlNVVA4Tm1zZDJoanJPQzZ5WkVQeE8wc3ZIUENuNVA4endtQXVE?=
 =?utf-8?B?SzV0ekEzZlhFelhvK2s4SFBVUEd2eGRwdzFHcENZazIyODhvTGdsck5LVlNX?=
 =?utf-8?B?b3JnSnN3SFM1L0NLQWdWZTNlVkZ2VW9tc1prTnFyajZKUis4Tm43QjZsbXla?=
 =?utf-8?B?Sk9XQWt5QjhwQjBKd2JGVGY0LzZGZDZObkRwTklHbFAveDNaY0pzMHJlOWpB?=
 =?utf-8?B?YWxLQnJtd0NLRitFL2xQbXN4Q2FwU21BZEdOaTNTWGpvRlFsSzZ0bzhHMjBh?=
 =?utf-8?B?S000cVU1SWp4NjUyM3Z1bTFzYndtOUZKRGVvaGpRUGpPQVhvT3MzNkpvREZU?=
 =?utf-8?B?SGVFVC90czdCQkVpQlVOVS9GRGo0SW5lQ25KRnh3b0RnZ3ZjMGxJc2RpQVpo?=
 =?utf-8?B?V28zREROaVZUOGNCSGVoSHBRa3VQeERxeUZhY3U1SzZDdHMrdGJmVmZWTjN1?=
 =?utf-8?B?SDBhYmhQUDZjRmJPN3hRcDNrelRuT3U2c1BNR3hFU0Fpdm90d1MzUWswdHZP?=
 =?utf-8?B?STlyYm42OHdPK3FKdVBZOWtKY0VjbWhVbDBTa3BBRFN3ZHJIVVVCdXVNbXU3?=
 =?utf-8?B?UUVJZHZSa3pKY0pFMWxGYkVVMlNScnRsNTVMc3hBeCt4YWhyazRabGpjMTVl?=
 =?utf-8?B?TGxEd2hiUVpJSVZoU0s3Q3ZwYTFwRStLTG9vYWR2RlNNVzVwRDZOcjFpMEdj?=
 =?utf-8?B?VUcrMk85ZW1zZXdYT1B1eGdTV2hsWGxlSkhHR3YyOW1wc09mekFMOXBjQVc4?=
 =?utf-8?B?UVNZdW1sWDFTYkxzQ0UvYy9SYkM3T1NLK1N1bHFMNms5eWxOVDNsQlFjdDdH?=
 =?utf-8?B?T201MS84Y0h4THZ6aTlwOHJwd3I5eWswVVRkdzZueEpOTDJjeEdlQko4cHZU?=
 =?utf-8?B?SWlVdy9razlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmwvZEZKNlR2emJwdFkzK0Q0VG95aC9mYmdveWpEV1VOQkJyVk9wYVE1N2Jk?=
 =?utf-8?B?bXc0SWowTWl1eFVEd0hIVnFjMFZ2VmpRaUE0STFzVWlBNnB2bUNIdXVCY3Bh?=
 =?utf-8?B?Qi9OSW1pbmlKMi9aRDVCaFAyN3NmMHJNNW5MTFpXT09SSmdyUFA4aG5WUVFZ?=
 =?utf-8?B?b1loOThka1dMVFh5eTRTanp0R1lQWWZvdFRNWlI2UHJhb1JtcURLbUw4Ulk0?=
 =?utf-8?B?VHREeW5uYU9iK0lhRkpFNmNneTY1QXRSVjY2TmdTSjRCTWFta1phSUNjd0Fw?=
 =?utf-8?B?SUJmcHd0Y1B2Y3dzOEJSODlXMklCVlRUSFBsdHFhellZNDZhdThvU0g5U0xz?=
 =?utf-8?B?azVjYjh3OHEzdGdCZWExckROcXZHVEFpa2d1bGhMOE90VVE3U2FiKzFxWTRG?=
 =?utf-8?B?QnRFUWJhdnRxZjRTdjRrTzRqdEZXSFRNaDIwZzVBOG03SGhPSHNxTktMSkpK?=
 =?utf-8?B?c0xKaWw4b004Q3JUL0VvL0FUUUxIdDZONTlTYXlIRDBFVTJycUIydWFGd3dq?=
 =?utf-8?B?Z2krRFB3akYvdTBrM3JrZDV5eU5DZWxBd05PbDlZWnlLM1Q5clFaMjRaeXJO?=
 =?utf-8?B?VlNBRHNMVWg3YVdUM1V5bXA3Z3VZSkgvQjI3aWVjRjZIVUZmcEFpY3JYMjBq?=
 =?utf-8?B?R1BURm5rRS81VmY3QjAzOTZ2VVNoTnlJMFJpa3FwU21wcVlYMllDYktiOEd6?=
 =?utf-8?B?ckJxbXJDRG9BWEE5bVgrTU9TaXBKMUFCazI2bW50N3NjbFgzWm9icFRDdE5w?=
 =?utf-8?B?K1BxdHRkSkFBcW5mcDVqZEtpTzd5bUJ6QTdrT3FuRU1ONVlON0VUejRYenVj?=
 =?utf-8?B?T0pzSk53bEtiakFzT0NYdEQzUkJFTEdZOFNQS3RTaVdjVmVLN2dCTGQzUktw?=
 =?utf-8?B?OGFCaU1adG9sQ1ZPM05uN0k0SlhkNksySEtZSGpWYmo5TTRKOHZhVlU4elFZ?=
 =?utf-8?B?SEJhU3JmSHA4ZlY2ZzdEWFhUdTFvTUxYYjI5QU1NYy9nU0w1dE5oWlNaUGlx?=
 =?utf-8?B?MFRKWXUya2VyQzBhd09mZFRaMW1hdjNhOTFBWlppNVE0QkJhWGZNTmlzTkMy?=
 =?utf-8?B?QVozVlJSVW1oTTQ3WTJNd25SMXM5OVZIbHhwY1l1UXlXNGlnaGRqUWM3QkFT?=
 =?utf-8?B?RkF5MmZ2UW9LVXI0MEJ3aHE5TU9RL0xRMVd0WkxZSFFhTGRVaUZ3aGVEbnpi?=
 =?utf-8?B?bmhjeWgvTEdIekVMMndqazh1SDBpcnNad3Z3MTk1by9rQXZ1eEE4MkdmVUxX?=
 =?utf-8?B?MjZ4ZlBLYzNHRTV0RUVzMmZmSks4UmpFMnhQb2JwUlZXZTVwR0hqSnNMVHVp?=
 =?utf-8?B?a0kreDJRWGNwQTJ1ZG5FcmlHbUhONkVHWlFsYm9zYXhoVWdHYWlTZVVaRHZh?=
 =?utf-8?B?V2dXUVhSZEVBV1lTbmpMVmg5RzBmYmxxQ0gzcHlwRWJiUS9yWjB3WmNCeGxK?=
 =?utf-8?B?QmJiOEpXRmxhMmNtR3RNZExsOEVkUGE2ZTJEdXJHN3VOUlVyZmc2aXlsODNs?=
 =?utf-8?B?MW1XWlBjMG5DR1piMUlVZ2JsdFVSMldzQnZZbnUrT3ZMMUxUOW45dFdqZ1NQ?=
 =?utf-8?B?UFI4TDRQTFJoaXVGZll5NGo5Q1VmRXRtQmRuU2FQeFlaTmNyTlJoUGtoRjdV?=
 =?utf-8?B?NU03WlhQTDhGUEs2SmNiWUJPbE0reUxIVFg1aGVFOUdSVUlpOFAxd0MrQjRw?=
 =?utf-8?B?dWgrcEZ4cXozRzl3cXVzWmYwTFFHaUFpN3AvbFN1bnl6cVpUTHJRUEc4RmVY?=
 =?utf-8?B?azJUZ1o4VGs5L2E0UFpFWjRGdVptRzlNVzRJY2U5ako1MEFoVndSVlpob1lL?=
 =?utf-8?B?V2ZMczg4NXRpUHVNTkZFQjhtcHloRFBmUW9scFM2Wi8zOEdzbHgyQlE2d3p3?=
 =?utf-8?B?SHJjZUdRMmJUNzRPQ0xmaXhZQnp5ZVdWbFNkWEJBTVF0MTZZOFpybllkTkxh?=
 =?utf-8?B?STJyYkMrUmhyb1k0TmdOOU5PUFdUOHpWV0pEaUhyQ0lTaDQ2bkxHd1RqWmNM?=
 =?utf-8?B?aUd1V0ZHM1VwdnpSVnBQVkpoMVFGbTVEVlFKL2M5U09PeWc0UUJjNGpaNWhm?=
 =?utf-8?B?U1JyOTg0bEdBWVVaR1c0S0hEUXlNSHdrSmhOZFJ2VFhoZUUvTlBkMUtIVmd5?=
 =?utf-8?Q?MYXVBzwiumTP/QnxJDXk/IB/A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eb0025-b1ae-48d2-d75d-08de22168882
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 18:08:50.7982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: op1OFCxfAVtnmDWjfy15cOBjrmk2RcRiYTUm1m3CMhWqvEq88bB6BqfdZFzu7TaAFHONTnmozdwFs4GLI7fvfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7811
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgOTowMiBBTSBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+IE9uIDEy
LzExLzIwMjUgMTY6MjYsIExpbiwgU2h1aWNoZW5nIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDEy
LCAyMDI1IDI6MjQgQU0gTWF0dGhldyBBdWxkIHdyb3RlOg0KPiA+PiBPbiAxMi8xMS8yMDI1IDAw
OjIzLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+Pj4gSWYgdXNlciBwcm92aWRlcyBhIGxhcmdl
IHZhbHVlIChzdWNoIGFzIDB4ODApIGZvciBwYXJhbWV0ZXINCj4gPj4+IHByZWZldGNoX21lbV9y
ZWdpb25faW5zdGFuY2UgaW4gdm1fYmluZCBpb2N0bCwgaXQgd2lsbCBjYXVzZQ0KPiA+Pj4gQklU
KHByZWZldGNoX3JlZ2lvbikgb3ZlcmZsb3cgYXMgYmVsb3c6DQo+ID4+PiAiDQo+ID4+PiAgICAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPj4+ICAgIFVCU0FOOiBzaGlm
dC1vdXQtb2YtYm91bmRzIGluIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jOjM0MTQ6Nw0KPiA+
Pj4gICAgc2hpZnQgZXhwb25lbnQgMTI4IGlzIHRvbyBsYXJnZSBmb3IgNjQtYml0IHR5cGUgJ2xv
bmcgdW5zaWduZWQgaW50Jw0KPiA+Pj4gICAgQ1BVOiA4IFVJRDogMCBQSUQ6IDUzMTIwIENvbW06
IHhlX2V4ZWNfc3lzdGVtXyBUYWludGVkOiBHICAgICAgICBXDQo+ID4+IDYuMTguMC1yYzEtbGdj
aS14ZS1rZXJuZWwrICMyMDAgUFJFRU1QVCh2b2x1bnRhcnkpDQo+ID4+PiAgICBUYWludGVkOiBb
V109V0FSTg0KPiA+Pj4gICAgSGFyZHdhcmUgbmFtZTogQVNVUyBTeXN0ZW0gUHJvZHVjdCBOYW1l
L1BSSU1FIFo3OTAtUCBXSUZJLCBCSU9TDQo+ID4+IDA4MTIgMDIvMjQvMjAyMw0KPiA+Pj4gICAg
Q2FsbCBUcmFjZToNCj4gPj4+ICAgICA8VEFTSz4NCj4gPj4+ICAgICBkdW1wX3N0YWNrX2x2bCsw
eGEwLzB4YzANCj4gPj4+ICAgICBkdW1wX3N0YWNrKzB4MTAvMHgyMA0KPiA+Pj4gICAgIHVic2Fu
X2VwaWxvZ3VlKzB4OS8weDQwDQo+ID4+PiAgICAgX191YnNhbl9oYW5kbGVfc2hpZnRfb3V0X29m
X2JvdW5kcysweDEwZS8weDE3MA0KPiA+Pj4gICAgID8gbXV0ZXhfdW5sb2NrKzB4MTIvMHgyMA0K
PiA+Pj4gICAgIHhlX3ZtX2JpbmRfaW9jdGwuY29sZCsweDIwLzB4M2MgW3hlXQ0KPiA+Pj4gICAg
Li4uDQo+ID4+PiAiDQo+ID4+PiBGaXggaXQgYnkgdmFsaWRhdGluZyBwcmVmZXRjaF9yZWdpb24g
YmVmb3JlIHRoZSBCSVQoKSB1c2FnZS4NCj4gPj4+DQo+ID4+PiBGaXhlczogZGQwOGViZjZjMzUy
ICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZlciBmb3IgSW50ZWwNCj4gPj4+IEdQ
VXMiKQ0KPiA+Pg0KPiA+PiBJIHRoaW5rIHNob3VsZCBiZToNCj4gPj4NCj4gPj4gRml4ZXM6IGMx
YmI2OWEyZThlMiAoImRybS94ZS9zdm06IENvbnN1bHQgbWFkdmlzZSBwcmVmZXJyZWQgbG9jYXRp
b24NCj4gPj4gaW4NCj4gPj4gcHJlZmV0Y2giKQ0KPiA+DQo+ID4gVGhlIFVCU0FOIHdhcm5pbmcg
aXMgZm9yIHRoZSBCSVQoKSwgYW5kIHRoaXMgQklUKCkgY2hlY2sgZXhpc3RzIHNpbmNlDQo+IGRk
MDhlYmY2YzM1Mi4NCj4gPiBUaGUgYzFiYjY5YTJlOGUyIGlzIGZvciAicmVnaW9uX3RvX21lbV90
eXBlW3ByZWZldGNoX3JlZ2lvbl0iLCB3aGljaA0KPiA+IGlzIHRydWx5IGFuIGlzc3VlLCBidXQg
bm90IHRoZSBVQlNBTiBjb21wbGFpbiBhYm91dC4gU28gSSBwcmVmZXIgdG8gdXNlDQo+IGRkMDhl
YmY2YzM1Mi4NCj4gPiBXaGF0IGlzIHlvdXIgaWRlYSBhYm91dCBpdD8gVGhhbmtzLg0KPiANCj4g
T2gsIEkgc2VlLiBTb3JyeSBmb3IgbWlzc2luZyB0aGF0LiBUaGF0IGlzIHNsaWdodGx5IGFubm95
aW5nIHNpbmNlIHdlIHdpbGwgbmVlZCB0bw0KPiBiZSBiYWNrcG9ydCB0aGlzIGZpeCB0byBvbGRl
ciBrZXJuZWxzLCBidXQgdGhpcyBwYXRjaCB3b24ndCBhcHBseSBjbGVhbmx5LiBUaGUNCj4gcy9y
ZWdpb24vcHJlZmV0Y2hfcmVnaW9uLyBpcyBmYWlybHkgcmVjZW50Lg0KPiANCj4gSW4gdGhhdCBj
YXNlLCBJIHRoaW5rIHdlIGF0IGxlYXN0IG5lZWQgdG8gYWRkOg0KPiANCj4gRml4ZXM6IGRkMDhl
YmY2YzM1MiAoImRybS94ZTogSW50cm9kdWNlIGEgbmV3IERSTSBkcml2ZXIgZm9yIEludGVsIEdQ
VXMiKQ0KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjYuOCsNCj4gDQo+IFNvIHRo
aXMgZG9lc24ndCBmYWxsIHRocm91Z2ggdGhlIGNyYWNrcy4gT25jZSB0aGlzIGdldHMgcGlja2Vk
IHVwIGZvciBvbGRlciBzdGFibGUNCj4ga2VybmVscyB5b3Ugc2hvdWxkIGdldCBtYWlsKHMpIGZv
ciB3aGljaCBrZXJuZWxzIHRoaXMgcGF0Y2ggZmFpbHMgdG8gY2xlYW5seSBhcHBseQ0KPiBvbiwg
YW5kIHRoZSBtYWlsIGl0c2VsZiB3aWxsIGNvbnRhaW4gaW5zdHJ1Y3Rpb25zIGZvciBob3cgdG8g
c2VuZCBhIHBhdGNoLiBJIHRoaW5rDQo+IHRoYXQgc2hvdWxkIHdvcms/DQoNCkdvdCBpdC4gTGV0
IG1lIGFkZCB0aGUgQ2MgYW5kIHNvbHZlIHRoZSBjb25mbGljdHMgaWYgbmVlZGVkLg0KDQpTaHVp
Y2hlbmcNCg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBBbmQgYWxzbzoNCj4gPj4NCj4gPj4gQ2xvc2Vz
OiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy82
NDc4DQo+ID4NCj4gPiBMZXQgbWUgYWRkIGl0LiBJIGRpZG4ndCBhZGQgaXQgYmVjYXVzZSBJIGNh
bm5vdCBvcGVuIGl0Lg0KPiA+IE1heWJlIGl0IGlzIGR1ZSB0byBzb21lIHBlcm1pc3Npb24uDQo+
ID4NCj4gPj4NCj4gPj4+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+
DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVs
LmNvbT4NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCj4gPj4NCj4gPj4gQW4gSUdUIHRoYXQgdXNlcyBhIHRvbyBsYXJnZSBwcmVm
ZXRjaF9yZWdpb24gd291bGQgYmUgZ29vZCBhbHNvLg0KPiA+DQo+ID4gTGV0IG1lIGltcGxlbWVu
dCBpdCBsYXRlci4NCj4gPg0KPiA+IFNodWljaGVuZw0KPiA+DQo+ID4+DQo+ID4+PiAtLS0NCj4g
Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgNiArKysrLS0NCj4gPj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gPj4+IGluZGV4IDhmYjVjYzZhNjllYy4uN2NhYzY0NmJkZjFjIDEw
MDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4+PiBAQCAtMzQxMSw4ICszNDExLDEwIEBA
IHN0YXRpYyBpbnQgdm1fYmluZF9pb2N0bF9jaGVja19hcmdzKHN0cnVjdA0KPiA+PiB4ZV9kZXZp
Y2UgKnhlLCBzdHJ1Y3QgeGVfdm0gKnZtLA0KPiA+Pj4gICAgCQkJCSBvcCA9PSBEUk1fWEVfVk1f
QklORF9PUF9QUkVGRVRDSCkgfHwNCj4gPj4+ICAgIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgcHJl
ZmV0Y2hfcmVnaW9uICYmDQo+ID4+PiAgICAJCQkJIG9wICE9IERSTV9YRV9WTV9CSU5EX09QX1BS
RUZFVENIKSB8fA0KPiA+Pj4gLQkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgIChwcmVmZXRjaF9yZWdp
b24gIT0NCj4gPj4gRFJNX1hFX0NPTlNVTFRfTUVNX0FEVklTRV9QUkVGX0xPQyAmJg0KPiA+Pj4g
LQkJCQkgICAgICAgIShCSVQocHJlZmV0Y2hfcmVnaW9uKSAmIHhlLQ0KPiA+Pj4gaW5mby5tZW1f
cmVnaW9uX21hc2spKSkgfHwNCj4gPj4+ICsJCSAgICBYRV9JT0NUTF9EQkcoeGUsIChwcmVmZXRj
aF9yZWdpb24gIT0NCj4gPj4gRFJNX1hFX0NPTlNVTFRfTUVNX0FEVklTRV9QUkVGX0xPQyAmJg0K
PiA+Pj4gKwkJCQkgICAgICAvKiBHdWFyZCBhZ2FpbnN0IHVuZGVmaW5lZCBzaGlmdCBpbg0KPiA+
PiBCSVQocHJlZmV0Y2hfcmVnaW9uKSAqLw0KPiA+Pj4gKwkJCQkgICAgICAocHJlZmV0Y2hfcmVn
aW9uID49IChzaXplb2YoeGUtDQo+ID4+PiBpbmZvLm1lbV9yZWdpb25fbWFzaykgKiA4KSB8fA0K
PiA+Pj4gKwkJCQkgICAgICAhKEJJVChwcmVmZXRjaF9yZWdpb24pICYgeGUtDQo+ID4+PiBpbmZv
Lm1lbV9yZWdpb25fbWFzaykpKSkgfHwNCj4gPj4+ICAgIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwg
b2JqICYmDQo+ID4+PiAgICAJCQkJIG9wID09IERSTV9YRV9WTV9CSU5EX09QX1VOTUFQKSB8fA0K
PiA+Pj4gICAgCQkgICAgWEVfSU9DVExfREJHKHhlLCAoZmxhZ3MgJg0KPiA+Pj4gRFJNX1hFX1ZN
X0JJTkRfRkxBR19NQURWSVNFX0FVVE9SRVNFVCkgJiYNCj4gPg0KDQo=
