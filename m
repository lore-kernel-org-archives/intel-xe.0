Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A1FC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B320C10E395;
	Wed,  2 Sep 2026 10:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3z3izP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8D10E29C;
 Wed,  2 Sep 2026 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788344247; x=1819880247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Lb1iDX5tbOEms9kg/QfM7IoNIhHiMf4NkXr0uMXj7nw=;
 b=l3z3izP4620DcnxQNTNKwhGExAWnslm5IraJw1F8d2PFWzFhmixpYrYT
 CcQsdHH0kV0FNoDOeD97tjSPW+12gLx/FLie+i5ujIBCfB1QZlkaEqEDA
 Etb/2eF9uXdVmi6xKueamMLpLPQ3i5fPSHZzmx2nSIfFXwut5QtZcxUtD
 TdGDIrGYVRZm03zKtVXOkchuS5n4SekRYbl8f9evs1f8WVxYc/MIQtY0j
 C8uZ/qUKQHrODCxkd94of4veFvV5o31ZNrxcIoj9hAptc/rlcDkWCqJ/u
 4oUkBLABjUSNQchJBv8xHCXvx5oRPPpVb5LDVPV0bHmsPDFcmc2IvAlm7 g==;
X-CSE-ConnectionGUID: WmZ7PK2FRUuiRfX+ICluQg==
X-CSE-MsgGUID: Y5jmgrk7SGCH3UJx5rfZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88818666"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88818666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:17:26 -0700
X-CSE-ConnectionGUID: 1gf0lxwOQaO9/INq67TDYg==
X-CSE-MsgGUID: GFxX7W5+RWeZfEGSMDm4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="292878953"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:17:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 03:17:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 03:17:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 03:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFcKeoavc1/drwIN6TZKWh/3lI/944vRXy/HnQLy6ZXfzFh8DR90RIukgCqvpJdn2Cc539znnq0i5FhuKdju53uGWUdYVj40lOOb19sE8wLrCU0IFdeyxkpyGrxdHUMGZsA/ppyDeP8hfZYlPdqzK+zrnWkpx2hj/6TNddskqbn5r97yIl6Yo7w2tW/VEKVaRzfVTa01kehYiCBKrQIgqOy9NHGS/bw2jFGi0Wqp8hYmr4bUkh234ODB+cyD1GmKgsqkWxpRd9gMRosh5+6axiMYGS+6GI+jDrABqc+m5DB0zP2owj2ZdXSQEk2WX9MEiax3NX6RmiTvfbhNYKcybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb1iDX5tbOEms9kg/QfM7IoNIhHiMf4NkXr0uMXj7nw=;
 b=KijC3I5vBedSlUIN6C5t05RhmIK+CAtYEjiC+Gcb9166hmy1rtOXZzHNRFDXxw7UxF6BwZRbKcifXpYuFLQkk+xXboNIQT+gsDKP0KsGyCoQlFVHrCgXfdXE8pqxREM37IdM+NPDzTPntoYzB5pmfogkRDkXkhkmzPpjCiE+Xa0qNpTU1iakBLHiUps8OMTcRnunRmMuKamYfXw+xH8bZDMNsq1hgWDrYiX5niVZCtURMrV5AK1hTlb1p0ckUCtTwmV/URDsbPniCEqC4wu7HZM5v1KC2y1vR4jj8C6kPB5b8Ty93o4vPg+B2zt/FKSZTw6uKA/MLj4eRIIghcQ27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB968233.namprd11.prod.outlook.com (2603:10b6:610:360::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 10:17:17 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:17:17 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 15/15] drm/i915/alpm: Program zero-based LFPS half
 cycle duration
Thread-Topic: [PATCH v5 15/15] drm/i915/alpm: Program zero-based LFPS half
 cycle duration
Thread-Index: AQHdNFnCtmKVDsipcUeImw6TI18xMLa7H8EA
Date: Wed, 2 Sep 2026 10:17:17 +0000
Message-ID: <7b7ef4b34d61b7a3e02efba4d5782d9b6fd81d04.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-16-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-16-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB968233:EE_
x-ms-office365-filtering-correlation-id: 176423ad-3b42-4107-173d-08df08db5dd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: wN83CJZ2v9UhOducQigwSCtGg7OfKSnA1ld5DLob06yz9mQ+Q8JM5ZFkYqrIY3DVAzFaIAbjwPoiqZwU3YvPFKPpSQFcJoGV4hkNcnYqJ4XUEvOb196jznip794OBC6U5OGd57cQXqvHg5t9Bn+A0vwn+LDX0fum/AJCinmaNUT+SNHuhdmh4lsxgn9+hWUilZZWk5At680P96rS/IS3KntLL/rMX8Hy0tKPCdXx5o3PfJmZoIPNyuczX3zOIZ0lIdKdt7eYH8RfxeZ4NxR1OY25F+dd7z6sKT/DVC0Eoc7b6KKfC2fmjPQOt6ENK1yfxcpO/H2tzNVHMYBc6ZzXYN6rLK1FZ52eR4yhszk9D2OlwlaGEXIJW9rIhfqoSl0xjVx0L8UcHCPOJo7Xl35HhZs8DaUi0lkPIn8U5+KXFAi91AJkjst6DJLxzU/jEXQNkQ/dhATp0i2JXGxNUaLGrawP2jJDWEGrYaQNBlfdto9poVTYQCfkbCgyE0V+C1yfvzwjU1meQqp2fWRI6+HwMhp7dXkvAhwx10AApjiBJ1BLmfXBY7Lxi/fJg9EoY+dW5zOlTHc0lX+BjHg7b1oo4Rl5Kh/ryxffFFAYj+4vMezgRCTUG22G6XNjepbcyGNCbOXC35sJkk054Do5NO2BCm5EVQQDLp21qiY9GKNA1NT//qq30NDIYyRzcfxQhVXd1vEHh1GhmtC7PnyUIWjNd3iJeJy1fNg2L3r9h+4K4bE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnNIOUNKTlFMOExIUlk1OUlDdEFyNUhBQXpHR3pLbVFpYlJaczFRTFNqQWdy?=
 =?utf-8?B?cnVpUFhIK0pxdU0rZ1YydkJXOHhWazBiWFovV05KMHFQekVrME9ab29aTmpG?=
 =?utf-8?B?djJFUUdGTU9vWUg4Ny81NUsxdHNjM01uQWJocktLYjRkSjdwaWI2TlNpYk9Y?=
 =?utf-8?B?MTA4UEExOHNBaFh3blpjNTlQVDFob0NGZEczV1JPajFnYkE5NW9BaGttYS9F?=
 =?utf-8?B?TFlLc1NGMkQwVGM2QW1CdExSbEk4c2diZ3pIWjBqbVdHSmh3R0ZSamxDalZh?=
 =?utf-8?B?ZE5ZRHJHb0VmN2hRN3huWk9Cd3UyN1lMek94eVNZdDE5bzNZVURHQzl1amRN?=
 =?utf-8?B?YnBsYldHKzBROTRZZnhOaEVuU0J2dzMvdnYwR1ZOSEFkdXZzSE00azRqb1pt?=
 =?utf-8?B?cDFjRUw4VU1qanVGY21XOUYyQWRjWjI1WWxzeEhEeDY3cGdsS1hHdjhrWW1x?=
 =?utf-8?B?MXRZbFNsbTZFNXJadWNMMTA0TCt6WU11QWxERXNtMTJmR1dQdEplY1kvdE9y?=
 =?utf-8?B?OG55UWRwckp6eTRFcHZsUVVZNEdwWHVsYkgrbGJxbC9Va3RkUW9sRnQzc3Vo?=
 =?utf-8?B?dVp6OGsyZmZLbTByaHVXVGUzMkhsL242NEJYaEcrVWt1endnYytON3hSVWNs?=
 =?utf-8?B?aWlTWUEwUHdzMDV5S0VwaDNwZTYzalR5cG04d3BUKzlGREF5MktLYldKWHN5?=
 =?utf-8?B?TmRFbDZRcCsxN2hMWEw2MUpUUG5GSVg2SFRjc21BaU9XR1JZS1V1TG1BUmdE?=
 =?utf-8?B?WHZQaHg1UmhlYWVRQ1RWSnJ3OElHN2ZpZWJ0VUkxT29paGtVUEM1bnIyVXZ2?=
 =?utf-8?B?VzAwZys2bzZlZFpUekQzZmxBTUo4VE0vMDB1b255NmwrKzVDYzcrU1htbW1s?=
 =?utf-8?B?aW44WTU3VGpqTHd2eEN0dWtpclllMndEVm5xd1UwSXM0b1R5aWdoa0JQcSt3?=
 =?utf-8?B?L3JtMS9JWnk0TFRveUxjQUFKcVJMTTVzQ1RTQWZmeThKZ0c2Yno1aUl1MXor?=
 =?utf-8?B?bnkvTVdFWHo3NGUxMkp6TTk2YVJNcXhaOUpibnZUalZEQWxYaXVUVDQ3OVgr?=
 =?utf-8?B?enRDa29jR1NCSjlIbGRBYU9BNXlmRkc1d2dBRmxWclZtM0lwbkU3OEovOUlE?=
 =?utf-8?B?MzBCcG1xZGZYNkdURGRNMVJTVmNHa0VnTnJsNjJLRFdOY0NpbGtrSWRSc0F4?=
 =?utf-8?B?alNpUU43VUFNS240ZkkzSDRCd1B1RWpoZ1VDSFdGYWFObUxiRk1aaFBvSTB5?=
 =?utf-8?B?MnkxVUdOL0ZINHFDMU0vR2JYY1VhMFpNd2dKeWxWR3pOZW1JY1NGU1pDNk85?=
 =?utf-8?B?VC9KcjBLM0F2b3lTTEUvNCtGMmVVbEdtUnRkc05nZHIrZ1oyWkxQR2NrZGlT?=
 =?utf-8?B?bCtKNXR2bFFIcU5SbFo2WTBodytOM0k3QzM0dDRjYkxhL3RmQmJmMHNEeGlJ?=
 =?utf-8?B?UDRaaWsxN09aeWxkTWRGYUZRaGEwN3JhbzNPQStLTkUzM2p3bHZZd1gvOTMy?=
 =?utf-8?B?bHN4N3lxTXc4d3NzaSthdEVQSGFobHNSMzdVelRiT2hwZjRnSTlIOXhPWDYv?=
 =?utf-8?B?QkVpOVlWQmRlWkk4SVFYTmhEeDNWWmxHeXdmOXZvSVNKVkNlUmtyYVQwUys3?=
 =?utf-8?B?cU41NExJOElMOGJkbnRlQzhGT3Q2Y2Fydzk0TG04amVPSkRUa0RtRWE2Y05T?=
 =?utf-8?B?V1JwbmN3MTBhUTU5NHhYZ0pJT3lIMFNxMHNUNFhMc0FiT1Y0RlA2dkx0ejNW?=
 =?utf-8?B?SktkUTJVQzd5Z2xkVi9wTEhsTFNPeTdtMzhtRUdTa2F3MTNkT3UxK3k4UlVi?=
 =?utf-8?B?eU1mSThVTnliTCtDbHJ0TkVxT1N3NVRjOWltSGhXUDJNRHAwR1U1UzdObmFi?=
 =?utf-8?B?Si9DWURnQUJON210aDlnZ05RRW96MDRTSEpUMkNLd0pVbXIrcjFjOHQ5Z3NX?=
 =?utf-8?B?My92R3FtM05ROWM5UHEvMUl4MDROTXp1MWx3ZzV0aXpqSFFFb2NiblNFQTlC?=
 =?utf-8?B?eDgxWHBUbHZGN2h0aGhxU1dVci9qaUhLM1B0Y0ZrWlBzVWN3TXhhbUlHUW5Q?=
 =?utf-8?B?MHZsd2IyeEVkaFhCRmlMZFNpTnpNOEJFUzdBMld6RUVBbStwM2xGOUZMeXFF?=
 =?utf-8?B?Wkx2Zmh1K3JVQ0d4bHViVzhrU3VJWFlERzdVL0tWZFd5eVl6ZjJHMnp0cVBB?=
 =?utf-8?B?SVFuVktTeWtwSElEK0lzWC9aVWxmZlYvWGtjT1pmNEFFRmQxZWZnSTRUWDZp?=
 =?utf-8?B?QU92NTBsOFhSdUlwM25kcHVJUXpkUko5YWlBMDY1Z3haT1JSVTlqemJ3ZWNX?=
 =?utf-8?B?Zi9HbFVqbDNibjNvSmphZWwwNGFRb2tkQ0JmaE41aXVxOGhpNWVHYVEwemcy?=
 =?utf-8?Q?d5k7yxvr/fFBpohE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F7D2876B24AA9499E891905F539B94E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VsXsd5maR4zQ51DbZjadBL3qGQJEYCEQqgXVieh57QqarvT285yzniOwLQQr9T5VQ7+aYTbNzf+n1SoXJqJAf2G2H1A+ow4/2lxiUkqGQ729KmGpjU76rjfNv7H6iDFlaelSkcVNmqab1oUpqxa3jqUjJJ9sy9Krwd6cXADTVhJ/jJ5h5zEc0IZWSPRiWBrgL+j4zDK3/kxz3NTCzd1JZCaDdivR+erPv6FJQiUXwVWr/wzbPlF+mpZDE5/Kp+Sf1j2JoJ0nQhyqvcvEKukTuXUsFq26Cx9ub0Zgk4PxIqyE4TP7py2lJEvQQZ6ScW9qbpq/yxUUL11JbvRkyKEZpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176423ad-3b42-4107-173d-08df08db5dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 10:17:17.4410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deF4LiMHwoQoioskzYOCCXNkB5RkPW+oaIfyK6W+XRMKsdHVxYM5kd8vhiLcoVPLVIPrpncQynVgM8kwCCbqL9bn1SqluJ8eMKF9HRABkIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB968233
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBUaGUgTEZQUyBIYWxmIEN5Y2xlIER1cmF0aW9uIGZpZWxkLCBhcyB3ZWxsIGFzIHRoZSBGaXJz
dCBhbmQgTGFzdA0KPiBMRlBTDQo+IEhhbGYgQ3ljbGUgRHVyYXRpb24gZmllbGRzLCBpbiBQT1JU
X0FMUE1fTEZQU19DVEwgYXJlIHplcm8tYmFzZWQ6IHBlcg0KPiBCc3BlYyB0aGUgdmFsdWUgcHJv
Z3JhbW1lZCBtdXN0IGJlIE5fU3ltYm9sIC0gMS4NCj4gZ2V0X2xmcHNfaGFsZl9jeWNsZV9jbG9j
a3MoKQ0KPiByZXR1cm5lZCBOX1N5bWJvbCBhbmQgcHJvZ3JhbW1lZCBpdCBkaXJlY3RseSBpbnRv
IGFsbCB0aHJlZSBmaWVsZHMsDQo+IG1ha2luZw0KPiBlYWNoIGhhbGYgY3ljbGUgb25lIHN5bWJv
bCBjbG9jayB0b28gbG9uZy4NCj4gDQo+IFJldHVybiBOX1N5bWJvbCAtIDEgc28gdGhlIHByb2dy
YW1tZWQgdmFsdWUgbWF0Y2hlcyB0aGUgemVyby1iYXNlZA0KPiBmaWVsZA0KPiBlbmNvZGluZy4N
Cj4gDQo+IEJzcGVjOiA3MTYzMg0KPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRl
ckBpbnRlbC5jb20+DQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC04DQo+IFNp
Z25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDEyICsr
KysrKysrKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMNCj4gaW5kZXggNWQyYWM3NTYxNTY3Li45NzY4Mjc5Zjk0ZWYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBAIC0xMjMsOCArMTIzLDE2IEBA
IHN0YXRpYyBpbnQgZ2V0X2xmcHNfY3ljbGVfY291bnQoY29uc3Qgc3RydWN0DQo+IGludGVsX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+IMKgDQo+IMKgc3RhdGljIGludCBnZXRfbGZwc19oYWxm
X2N5Y2xlX2Nsb2Nrcyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0
ZSkNCj4gwqB7DQo+IC0JcmV0dXJuIGdldF9sZnBzX2N5Y2xlX3RpbWUoY3J0Y19zdGF0ZSkgKiBj
cnRjX3N0YXRlLQ0KPiA+cG9ydF9jbG9jayAvIDEwMDAgLw0KPiAtCQkxMDAwIC8gKDIgKiBnZXRf
bGZwc19jeWNsZV9jb3VudChjcnRjX3N0YXRlKSk7DQo+ICsJaW50IG5fc3ltYm9scyA9IGdldF9s
ZnBzX2N5Y2xlX3RpbWUoY3J0Y19zdGF0ZSkgKg0KPiBjcnRjX3N0YXRlLT5wb3J0X2Nsb2NrIC8N
Cj4gKwkJCTEwMDAgLyAxMDAwIC8gKDIgKg0KPiBnZXRfbGZwc19jeWNsZV9jb3VudChjcnRjX3N0
YXRlKSk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBMRlBTIGhhbGYgY3ljbGUgZHVyYXRpb24g
ZmllbGRzIChpbmNsdWRpbmcgdGhlIGZpcnN0DQo+IGFuZCBsYXN0DQo+ICsJICogaGFsZiBjeWNs
ZSkgYXJlIHplcm8tYmFzZWQsIGkuZS4gdGhlIHZhbHVlIHByb2dyYW1tZWQgaXMNCj4gTl9TeW1i
b2wgLSAxLg0KPiArCSAqDQo+ICsJICogQnNwZWM6IDcxNjMyDQo+ICsJICovDQo+ICsJcmV0dXJu
IG5fc3ltYm9scyAtIDE7DQoNCllvdSBzaG91bGQgZml4IHRoaXMgaW4gUE9SVF9BTFBNX0xGUFNf
Q1RMXypMRlBTX0hBTEZfQ1lDTEVfRFVSQVRJT04NCnJlZ2lzdGVyIGRlZmluaXRpb25zLg0KDQpC
UiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IMKgfQ0KPiDCoA0KPiDCoCNkZWZpbmUgTUxfUEhZX0xP
Q0tfTEVOCQkyNTINCg0K
