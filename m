Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F0C83F17
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 23:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65110E86A;
	Wed,  9 Jul 2025 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uf0YiknE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5110E86A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752102016; x=1783638016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cTazTb2LXK9Af/daTJINyqWkRkDEKhZlbnasu1BvBEg=;
 b=Uf0YiknE5DolcSGUI+rNAZMOumprYjYqlrrhK3v+QHkGXi0gMe2um56P
 WvPsGh14FsTo4IeqVazZ+djmxRKv5QJ1l6MGxfMZZiPzRTckZa0r1u9fr
 n3bVpuH189cG0xii1h4czVOLm5oKRdFj++wMjeA8tYhKeMRoezsZmZ+yd
 ofgeGfq7tj2RZ7kM+3yAlbglQmdU0eL44HZQS7DidA5IWkn5dr7oMJaP8
 K//Y+x31oaJnmoLCa3+C5uMATjcQBem08Za5tpXKcWVmusnd4TK9LE8rB
 JXmNdrcWZqoyAmovLclX7pA1mtyHyzdodQpkcuCEuf79pBrh+9upCk46w Q==;
X-CSE-ConnectionGUID: 6skLQ7bbSXq529cZgiu+kA==
X-CSE-MsgGUID: TvFKWWx2QTaL6/C/9ElXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54520580"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54520580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 16:00:15 -0700
X-CSE-ConnectionGUID: CP/xraW0SAWbwZYIKGRkpA==
X-CSE-MsgGUID: 4yID3i8WTw6gFdXjpymOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="161461037"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 16:00:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 16:00:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 16:00:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 16:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1hKHRXyzMkinHANMTeAkJhk88c6Vget3VPwq7sq6BqMZSWRbs3xQTVz/st/z0xOja8RPmNCbg8GEHNgarStXN2Z3eZaVWbAtyhStSJbktIz9HPkSBxBhyhoxDmZZ7l66qe1Lr4/Jt+KSjV2co78pzP2kN/mQLO3Oo+G89QIZr2GxLFp/HIqRrBkdYhC8JrtWIAJ9SwozNYglCpi4JXTNiHSjeoaRTI2NsngkDBKU+wcu5NWqhFCA9c1852UYO1mSZCOcC9BFp6b2NANAnP/uhjU6uCw1UZwC8rA9oyKBOw8ssDNonTgkWZHKwBievxtms0vHI0lAQsbnnzL9AgyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTazTb2LXK9Af/daTJINyqWkRkDEKhZlbnasu1BvBEg=;
 b=hW4vqTWo/bLbkzkyB039ACjgYN0oaHubAu/s2LDt/+wy+7DZbUBNrH7tcop9VFgDZAS8O6lVqjdFnAI1PfvsVQ1KRsGHlMXxNnqD3FgPsDu5+m4euChbcJLjsPbgHehe32GYjr5670Wyey5sgMmYlDmdeNI+HT3i4SimFfd9/eJ1fEGdmj9fxIe3jDwKx4xfsG3LIrtmFshj48XDoZiaOsOFZ7ApOZNBYCz8Md6YU4Lv9qMp6AtnWBo8OHFQF7Ow0+m6mqA7YDIVg3OnWzEYLp8/biz8r9dq6uIPXuvkY8K+jhyo3KBMsyt0ItBZweBsua5Vx1j/miHbqeX5ChcFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 22:59:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:59:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
Thread-Topic: [PATCH] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
Thread-Index: AQHb7uUxz1Tr3GtdDEmWGodxRJW+RbQqbJMA
Date: Wed, 9 Jul 2025 22:59:56 +0000
Message-ID: <ffb0c4b4538cf03d2e20e5e1186ea0d9d012ac5f.camel@intel.com>
References: <20250707021510.3525028-2-shuicheng.lin@intel.com>
In-Reply-To: <20250707021510.3525028-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW5PR11MB5881:EE_
x-ms-office365-filtering-correlation-id: 0ca20c78-75ae-4db8-dddb-08ddbf3c52b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T0xGdEkvUTg3QVhEazdqYUNoMlV6cXM2eUdtellLMGJJZHI3VDh3VVM5TlNM?=
 =?utf-8?B?T2dDZmlab2dGdU1aNTN4eFpMUjNSNVlyOUM3c2I1S043WmxNYXYzcyt4bzFo?=
 =?utf-8?B?ZTN3bmdMQVh6eUJkcjJPTlNHVkpNRzlTMjBndWtVT1ZmNk1VKzhmT1VZTTY2?=
 =?utf-8?B?Y1pudXBnci9wbmRmL0RaMkIwYXd4SnI1YXoyN1dFMmllK3ZkVmlQRitYQWpM?=
 =?utf-8?B?cEhZSThWZUpjNWJyYktRRTFwMVR3bG93RmFIQ2x2MEdjUlVvM09XNVdrcDdn?=
 =?utf-8?B?QkI4MHZ6ZDdnR1Q3OGFHdWVnSzNrTm5sMTJpMmU3YXR3RnoraVlCT3IxZGJE?=
 =?utf-8?B?VTkzWGFmZ0NoeXFxM2NMZnU5eGJhRVpTQ2Y1WHdyZjdkTFpCMSs0V2RhamJI?=
 =?utf-8?B?R2pUMmhuZldDc01sOFpFUi9lTXphdGZ5SC9WWXI3KzMyTUlMRXQ0T3pNZS9i?=
 =?utf-8?B?UlA3dSsyYlRNd0FkeTB6TGZtZ2I4alQ1SFl4UGF3QlhCNVFVUjVMaG1mQndV?=
 =?utf-8?B?Q2tDQllkY3FaYVA2ZmxnalRrYXhWVzdkNFQvQVMxRTIwck9US096c1VZMVdX?=
 =?utf-8?B?VjhCbVNLeWxySHFGNEFhaENkVkhaQ0tDQllpWWFWejd5VHNLUGJad2l3c2Jk?=
 =?utf-8?B?TkRhaytPSlpnT0lXNzhpbkJrTTdFVm1uMTR4NUhiT3UzRThZcFQ3VGhmbDNu?=
 =?utf-8?B?Y1hoYUc4RldXckJpWm5MSTJHanhsWnpZUU9Md0JveG5DaFlLMWRvMnBXYjZC?=
 =?utf-8?B?TG01Qi9DSS9IRjJmSTE2cncveTVsbzUzWE1yclZqT0hLV1MxKzNHRTZXcjd0?=
 =?utf-8?B?anF5SVIxYUZzWW95ZXVUVVpocWNRM3pLRlMrMVIzZE95T3ExclVNWE8xYWtE?=
 =?utf-8?B?YVFzTW0ybmdJUVpCV1U0Y3g3RURqd3haODFBS2ttU2YwVUV0aE0xbU4rYW5M?=
 =?utf-8?B?MmR5em05RklSdkpGWDdybCtsMlhIYWRyYWFCUUwya1NGNTJWN0xxc1ZDWVZQ?=
 =?utf-8?B?Ykx5dUNDL08ybWFHMlpxK3J0YnJrenVRSEwyNTNUNThXbmR0aVNTb2FydERF?=
 =?utf-8?B?YWxndnMvbjNQOHpIWXo0QmtaZFJaV1g4cDVWcXd2eTUzZmtqTGJyS0FWdGRr?=
 =?utf-8?B?N3BqRlBBS1hqZTR2MGxyTi9YeFpTMlFQWDhxZ052SFhkZXVrYjZHR3orNlpz?=
 =?utf-8?B?SWFJL0lhamRLRWNxQXpURmxCbENwZUxFWmNiekdoYnl2b2I3L0FqcElpSlpy?=
 =?utf-8?B?V0hHbVhESE1mYzFNTHRGT2YySVRhNkJQNjFqdGNjTW5NcmRGajk4ZUprQUto?=
 =?utf-8?B?dEpjOWpLaUo4ZEd0dEJwak9xaUMvKzZMYWR2MUN6RWw1K1ltQlc2aVB6UEpq?=
 =?utf-8?B?cW9WWElFbVdlbjFZdkJnQWtNb3cvU1RISnZqSVpiOS81UGdmMXEzcFZSdUlO?=
 =?utf-8?B?MXV3TzJuNXdla1JQb01zeVJSd1lqTFVvcEFHU2xybzNld1B0TlA4RXV0clo3?=
 =?utf-8?B?TjRuS2hHSU8xWHBoSFAzNDdXZVdxbThLVVZueFVmeWZYUng0S1AyNkd6aitl?=
 =?utf-8?B?ZkRsWXNlaXB5RWZsTjBkZFd2NDhMRkVodUdBOUZJM29HVU9GTTlVaGZBcU43?=
 =?utf-8?B?MVdKbi9qTlRTQXpDb2ViQUtqdWlWazRQMXRqSE9MdzJsa2I0L0wzaFlnRWRw?=
 =?utf-8?B?M2toRFVRM0d1dWpBNGpzNnJraGwwRDh3V2pLYXFDNGJrU2lSOFlFR2N4azFU?=
 =?utf-8?B?d2RKQnI2bjRjU0tXeGVtOThYdDhaVkx5TlVGNzRKVG1WQk8ycjNNUUozY1Rq?=
 =?utf-8?B?K2Vnb3hha0RwMklqWGJLUzdVY1B1eHJzNUMwM3hnbXlzdTV5Y2NocW5PNDc0?=
 =?utf-8?B?R0FpNnk2ZXFhWlNZY1RBeXhldlhaaDQrd0diSjZZU0JBMUpJOHNKcGJ6V2hL?=
 =?utf-8?B?ZDlOYVhRMmRTQ3JUNVltekVOby9vS3VqR3M5Ykg0dWhqTnoxVG5DcGtQcWdy?=
 =?utf-8?B?ZlU1SC94ZFBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUZ5NERId05yUjRLa1ZJR0tpVkxMWHdiRjdZUHJUclRsWDFKR3dnS2xlSXBO?=
 =?utf-8?B?Y29UZjNmMUJmWFhrUEhsa1lYY0liZDBBc1M2dU1SVWRjL0tNRFlERnFBVVlt?=
 =?utf-8?B?RW5adzdDV3N5c3dWS290Q1hIbE42OWl1Wm51UjFGSzJmYnlBSDdlU05OZE14?=
 =?utf-8?B?cjNoeHdub0RySWMvTGZmWXpEbkE5a1FmZFFkak5JMGh2b0h2dElrbXBoQkcv?=
 =?utf-8?B?NkxqbnRMN0VUZ05waEZNc0l0MkRWOENCVjQ2ZHpaSG5nYWZ5VkhVdW5SUm5l?=
 =?utf-8?B?am1QaWFNbmx4QkRBTVNqdGt6TEtQZUl0WnF2YkFlbnY4TU91Z1RkRkZqUUNH?=
 =?utf-8?B?YWJqOE1qZ1I4RGVXMVNmSVdUSy81RDFBeWNPQXF1b2xMc3BuQjVYRkRnZnZY?=
 =?utf-8?B?YjF4Mk91L2UvemdLQSt4RllXNHIrYUkwSWZiMlE5Tjdva0JhVWE2RzY0VUI2?=
 =?utf-8?B?Z3hNWXlrS2IwcU1Vd0VDejVtcjIyR1I4bUx4MkF4YWJKeVNBcUFENFA4Mk5r?=
 =?utf-8?B?WnB3amo3UHpXWW5lTWtRazAwdFlBZkgvbWZ3OHh1TmZRaXNRZDBXcjBucTJP?=
 =?utf-8?B?ZGZaRG1LaE5BaU1kdy84RWJnclZXdHljY2tLRk5wZFBXeVhDUTJwUDhxY0d3?=
 =?utf-8?B?ZG9NUkdZeWlQZ3AwMzlXOFl0NmNoeTJZekkzRzlnQTVVNE1remFOWTVlbEQ3?=
 =?utf-8?B?aUM4cHVQci9Pb3VFUmRDQ2hHa0dzRkt0YUR1TGNQcThXY29uTVY2OHd0T25R?=
 =?utf-8?B?SkI0VGkvbVcxOVp1RXBoUnZtYTk0amR5c1MzVHpzYlNHcERHalRoZ2N1bW4z?=
 =?utf-8?B?SEMrVUdRVEtuQys0bmVtYytxcXNnVkhqdHdNSzBPc25nWmNPeE4yNHh4Yjl6?=
 =?utf-8?B?eExYN0puYjQrQ0Z1MXk5TFA0VWc3aU4wNEp2TVpTeDl2TjlTOHp5N1FZM1Y2?=
 =?utf-8?B?eitaSCsvcnUrWE5TNG4vOTNCSkI3SHNEeVZsNkFLcURmSzE2V09BK2VXWEwx?=
 =?utf-8?B?bElxNmF0UUZmRnpneVNhSTlsNEZLVUdLSGVvc1FkUk1yNkh2Qkx0bHlJbmR2?=
 =?utf-8?B?VC9JZ2dYL0ptNEVseE51YVRpUFpEaTU4dW1jRUJBWmxqa2JGTDgrUWpVZ3NM?=
 =?utf-8?B?Y0dmTzBZQ1RISWFmbWVSSkU2enB5V0JTRTZsS1poL1VzZkZJTmpSUWZ4L3k0?=
 =?utf-8?B?d21iMmZNQzJncllUMWVYVlIrdDQxNk5jTFZIOGN4N0Z0R200aXdHc3ppczg0?=
 =?utf-8?B?WEt1b0Jwd01TMCtrejMyRnRwS1d3aWNhUFYwU1dwT29OaFNLem5DVVdMSlRt?=
 =?utf-8?B?TGYyU3Azc2I1ZUx3bW1KMTBEaHdFaWVmNXdXWTRQdmt5WlA5YjBkdTFKaktm?=
 =?utf-8?B?TFBvTkdYYzJFcE1WUFZibnhCbVFRbEcxMitsWlNPMXZkZTMvZ2lRN1pqeHUw?=
 =?utf-8?B?S3FjaC8rb3c0NHkxZDJRenp3ZFA1MkFKYjc3NUxncFVmYXl6VHVyL081Um1U?=
 =?utf-8?B?cHlmWCt3QWNya0RSY2I0OU9TYkhBN1hQUno1UHBncTkyMHNQWjRid2xLcVZF?=
 =?utf-8?B?ZnJodWFaMkd5amhVSHNROExxTEpXMUxMa2ZpN3ZJM3FBSk1XSklkYkpBMVpT?=
 =?utf-8?B?TEFDNEJ6M1VDZzhvNEYvSVRyd0FLOU41Y1lDSkF6WUFOcVo3MkV4ZWdET2lG?=
 =?utf-8?B?azA3OHk1cEFLN0ZHQy9yOTJ4emFNUytMRkxWeTZBYjlaWU5IelNXdVJoc3Jh?=
 =?utf-8?B?WDFIMnVta3BualcvY1Y2NHdCeVhpSEVVQkJNNVpYKzRjVFNHSnVPS2dqdUtl?=
 =?utf-8?B?cGFGQ3h4MDk3UWd0V1VqUmEwZnNWVno1cURNR0EyMkJMTDhQc3Zsd1lYK1JV?=
 =?utf-8?B?WG9SelJqbDFyL3RkbW9UOTN1bjRud09ZZ21kWWdsSlZzUlhGczE5Sk1UWlhP?=
 =?utf-8?B?Q2NycjlSMUNjVFlFRkx0ZkZYdkp4OXZvTDM2a2pyc1JKanlhUzVoc2xPWWRa?=
 =?utf-8?B?Z0NjdEtKQ0dNeEtpdXdXeXlOY2VETGJuTHVBM0pIemlTeUwyZ3VjVTZERU92?=
 =?utf-8?B?SUw4Y0pUYWxFZmpZb0ZhbzJ1MkU0ZkdaTWtBdTBPYmt0bEpjZjVLSjJIeTV1?=
 =?utf-8?B?SnZNczNPT04zQ1FueGtBYjJQb0ZuNkRHVzJTTzNkQVV1bXFmeW5aT3pIUFla?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0343ACD772DB84FAC490594E62B192D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca20c78-75ae-4db8-dddb-08ddbf3c52b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 22:59:56.2622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDtMD4Qe2DUUAYfZ1k+kewSxDyZ3mU/oL6QzweVsAHm8WtFWpbs42SSHby8zxiOXMLAFndTWzWZ49iHhzhhIYUBjsseU1lu46nru1y9p6Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
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

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDAyOjE1ICswMDAwLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0K
PiBUaGUgcGFyYW1ldGVyIHRocmVzaG9sZCBpcyB3aXRoIHNpemUgaW4gbWIsIG5vdCBpbiBiaXRz
Lg0KPiBDb3JyZWN0IGl0IHRvIGF2b2lkIGFueSBjb25mdXNpb24uDQo+IA0KPiBGaXhlczogMzBj
Mzk5NTI5ZjRjICgiZHJtL3hlOiBEb2N1bWVudCBYZSBQTSBjb21wb25lbnQiKQ0KPiBDYzogUm9k
cmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVp
Y2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BtLmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiBpbmRleCBiY2ZkYTU0NWU3
NGYuLmM3NjIyZTFjNjE0YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4gQEAgLTc1NCw3ICs3NTQs
NyBAQCB2b2lkIHhlX3BtX2Fzc2VydF91bmJvdW5kZWRfYnJpZGdlKHN0cnVjdA0KPiB4ZV9kZXZp
Y2UgKnhlKQ0KPiDCoC8qKg0KPiDCoCAqIHhlX3BtX3NldF92cmFtX3RocmVzaG9sZCAtIFNldCBh
IHZyYW0gdGhyZXNob2xkIGZvcg0KPiBhbGxvd2luZy9ibG9ja2luZyBEM0NvbGQNCj4gwqAgKiBA
eGU6IHhlIGRldmljZSBpbnN0YW5jZQ0KPiAtICogQHRocmVzaG9sZDogVlJBTSBzaXplIGluIGJp
dGVzIGZvciB0aGUgRDNjb2xkIHRocmVzaG9sZA0KPiArICogQHRocmVzaG9sZDogVlJBTSBzaXpl
IGluIG1iIGZvciB0aGUgRDNjb2xkIHRocmVzaG9sZA0KDQpUaGlzIG1hdGNoZXMgdGhlIG90aGVy
IGNoZWNrcyBpbiB0aGUgc2FtZSBmdW5jdGlvbiBhbmQgZG9jdW1lbnRhdGlvbiBpbg0KeGVfcG0u
aC4gVGhhbmtzIQ0KDQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4NCg0KPiDCoCAqDQo+IMKgICogUmV0dXJucyAwIGZvciBzdWNjZXNzLCBuZWdh
dGl2ZSBlcnJvciBjb2RlIG90aGVyd2lzZS4NCj4gwqAgKi8NCg0K
