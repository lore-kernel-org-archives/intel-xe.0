Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B29C52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E310E649;
	Fri, 16 Aug 2024 13:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="becBLXc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93910E649
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813573; x=1755349573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IkuhAsZju5iDtST2PYaDDjYuOECEqmCxv8HQ5VcZjtw=;
 b=becBLXc11lFRPaH2ggvLfp9YkwRcf0ixjxNFgJG3XasSR1e0QObasmq0
 DP3t4/Pl3h1BnxWnJH7h1i4dLIMIKdhrdbUvSePFogTFvk8oSDP6/m9FN
 lHG1i+N6q8VOr0nLgJh1c7UbDraR305gweZEma/oNXS+pUf919qQCwifz
 cqAHVDaJnhrA8RpQ71euniTRn6CCPy7op7HV/hewbjDKnHz/gQY1Lg5U9
 5ckIGcrU/yxxYBRj4JPVRjNBL83T/5Rk/WqsOanMp37vpEyWUwFLf+Rcy
 xbYq0ccdY4fdhktX/zBw1sCtDtwOjMmWuKTqubZTCpqz/HWR+UhUuD2ZK Q==;
X-CSE-ConnectionGUID: n0apqjfkRbSJCea0LOw3JQ==
X-CSE-MsgGUID: 3W3XKYFGRBeWJze4R1h+Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21964015"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="21964015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:06:13 -0700
X-CSE-ConnectionGUID: /1ojQ1DAQ1W672uFGVjOWQ==
X-CSE-MsgGUID: RVTZbJtZTP6Q8Kha/91VUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="63848131"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 06:06:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 06:06:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 06:06:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 06:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7Gzg0L9m7xnOoLy7jvrpMzKSeH5UZcgca63IrGW0MKHOMSHp29bU+x8I8s0uOMyjiDgtI66zOEhXKhId6AUIe/eEJUUmQEFeVYgmcC6DGj7dHdODD3poqv6gOaMGpjMf/HJTYZN6aBcYl1mw/cT2rI0mXd14HbxPwXtdmR3AossLhPYmSMttn9MEFdfuUo/s3pN5USeQ5UwqGXiZzNnJnsQbLv+lBHOxp/b+YaOu1dh0aC/9xxIZsUbu4hJMbVLjb6rM6uoViQkQpqfdECHky0eFdXCPuf+yRN1NvuNQVlDc5LGn3pyYNZxf33MHRq7KeZxIa6C5EJ+5xKPDGVKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKwVXVsi37unBRSVDEmO78UVQgGNgjOOhvFm+39fPYw=;
 b=y3IwG72iEK8gyMyHTADAV8KQ0zsLvPsHOaaEocl9jnJSqy3QGNj8q2W4pWXQ2VOUkOE1cjgoFLI5rfHcsrgrsqyzp/T568HO/nrt+ZC0E3pjLu5jL+gS36WbYQkSf2qNO4Wt7Tw0wrPcGDTRGvB6Qb4jh9vfrBGHVt1TALRYzKhSMiYt6xgXgSQwP8ubf4rlN8gAS9Nulu/sW6tf8Aa14mM6xPyfrRSPLIVIh9/2igN84uTnTImC92cCCnYbOPWUxnqlozFqb54UWeSUuHgFwiKo2/G2yNtm4oeyhHjkYMUHsKRNBiqna4MlHmcMoZx0nXV5lL9yz4+YoTNkjAbgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 13:06:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 13:06:07 +0000
Date: Fri, 16 Aug 2024 15:06:04 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/12] drm/xe/pf: Improve VF control
Message-ID: <20240816130604.4c2b4rn2afkcuigr@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 93728f7d-a054-4245-109c-08dcbdf430f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTNoNitmU3c4ZHFJRHZuRXNLM2tyNUpOWW5UeUprRllWYjhOYTR4SFBWUzdv?=
 =?utf-8?B?cnNrL055aEdtN1JmUjdtbWZXSHpLRER3QmlxOXd4T0RSTmw4MkRHbFdyU1A0?=
 =?utf-8?B?bzFzbHZBWEJBaGszODdDRDJGallyWnhQQVFjYTJQZzlzU2tPdE9EclBwNk1N?=
 =?utf-8?B?Qit2Q0lSMWNGVDZ5a1hESkxYTUFxeDZ5aHR0SnRTUGYzZG5wSkRIeXVmSWZm?=
 =?utf-8?B?dXIyeEs0Y1lWUWxSUE5Fc1BKTXVXVnNzWHZjRWcrdm9TNlZkNUpyOGo0REpY?=
 =?utf-8?B?NTR3SW5WekVQOWFibEo1VEVzNmt5eU5uOERzWk1uS2liSHNQM1RuMEs5MG9W?=
 =?utf-8?B?L21tMmp5TGRLUnFUWTJXa0tza3FleXI5TzRyMTZpcGRnWC8rOEY3TkFrV3Zz?=
 =?utf-8?B?TVVIR1h3M1FZTlZKN0UyaG9uck5icmtJUHpyUXpsTHNwMWZ1M0FLTENudGNn?=
 =?utf-8?B?UGpDTkZVcW44d2NRa2lTcTdkdHhMNTJsZGs4a1ByaG56eEhzdkVJV1U3RXJv?=
 =?utf-8?B?MkFhUFYySDhhR0FYOEEyK1BZUkRFWHNqdzZNdW9hRmtVRmw3VzdjT3NCZ2k5?=
 =?utf-8?B?cm4yUkx6azBYeGpVYUJSYWpCSHZrNzFCTFZzeVpybk9kdzdhRlNmZ3ZLSzRJ?=
 =?utf-8?B?OVFHN2gwaHN2REEzNyt4MlBpNlQ1TXpERHBueHQ1Q1lIdUFPdUlocHp0S3Nj?=
 =?utf-8?B?SmF3UDc2ZG8wOHFJWnlwMEN6cndXYldKdVRPQzFONEU1K3IvRHA1clZiQm9K?=
 =?utf-8?B?ZnhuN09vSUZmTllqYlVwdG5rWGxQbHd3T0xoN0JZRGdGNTAveWN6bkEzV0lz?=
 =?utf-8?B?SWdFVVFsSGJxZ3FXenBkc0JTQVl6aStUZktoTE1XUGhEYVdiTTVOakxRaUFT?=
 =?utf-8?B?dWEvenM2bVU1ZzYyaFg0cUhKNkpxNENHNHgwdEMrQXFhTTNKeTZhV0lYOXN3?=
 =?utf-8?B?dm4yL3pVVnBuZGp0TzBCVXRHcTdRWGIzM2M5WEtjVG9TYmtSOXk4enNJQURY?=
 =?utf-8?B?aFlnWnRnNmR6M0duMEd4M2hOeE11bmlzMmxYWkJHd29Nd3JOZmRCRjVNSXQr?=
 =?utf-8?B?VmlMV0gyU0FENG5BbXVGaERQTk9yWUEwZS9xamhMRWoxSElVMUZUK0FWM3Np?=
 =?utf-8?B?R21oeEJNL0hoODJXS0VkaTA4V09YNXpIYm4yOXc0M0xzaURvUVZhTDRHRExm?=
 =?utf-8?B?SVhEWDZndjJWREx3bDI4enR0SHo2OWY4WUdWSWpuQ0xybmJhQ0RxczEvdDlz?=
 =?utf-8?B?U0RRRTQxTmVIYjhvd0NRM1hXNHJtMWlrd0tqZEdlZng4dFR0NmxyK2JSY2JQ?=
 =?utf-8?B?WlBhc0xuK3hOQ3k5bElrbERjRnlWbUZIdElzaXpqM2ZPRnZSZFJjSjA0RW0w?=
 =?utf-8?B?Z1FHZStHN3F4Zkg4OVZLVjc1RHcrSEprMzdTTGxzZkM1UkdOT3EwNlVLcWcy?=
 =?utf-8?B?WjMrUnFuNk9CSlFSWHh3VCtkc25Lbk41YUhQVVFYQXhjM1FITlNiN0w3VnFl?=
 =?utf-8?B?TUtTdWE3YkxteGVnODA5eXBwREZoL3QvWXJGS2Y1Nlg5S2hlRmhoUVJGWUlO?=
 =?utf-8?B?Rm42SDVlWXlqd2psWUxHcUhqYzF1V3BWWFQvSEpYdHhoR1l4aDkyazZsU0ow?=
 =?utf-8?B?dG02VjE4dlpjMm9mSFRSd1BnV08zeG8yUGJsNmFybHVyeG9IZDZVR3I5MkVk?=
 =?utf-8?B?TlhzTVB1bjYrNHVVNUVIR0xXQjVwdllmMzNGRTltYnowVDc4SE9Vb0ZLdG9U?=
 =?utf-8?B?RDlsTW9FaTdHNFE4KzBrTURFZGVHU3FuQUM1SjZ4WXQ2YWRGZ2ZXVjVwbVMx?=
 =?utf-8?B?bkh0VVVTeExPbXdBbC9kUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVY1V3hrU05STHZDQlloYVRpVFFta2ZsZ21sOUcyUjJidjJoenF3aHJld0Vy?=
 =?utf-8?B?K2RhZFJyZ0tkcmFuYVNtSTVPRkZDQ21xVmIwbVFUQ3pYNWlPaGhxMzF0MDJn?=
 =?utf-8?B?Q3RRL1p4Y1dkTjNPZ0hpQzZadmk5djIyL1k5RE5qT3BlU29rWEpKTGlDZzZk?=
 =?utf-8?B?QWEyVS80NjZoTEZadm1JeHI4WXBBdWZjMzJPYzN4Q2dZaU9LQlJzZVl4NXl2?=
 =?utf-8?B?RnlyQlVqcDhLdXB3WVdRTlRvNk9TaVlZbEJUMkp3U3hXeE1YMWpTZStmWmZR?=
 =?utf-8?B?RTQ0azltSjdzVjJIUlEyc1djVjNzbGFBRjdDaXVGUlQzeFllYzNqaWxBT3BV?=
 =?utf-8?B?bHZPaFBxS1ZsOGYvVitjRVhOUFYvOU5zY1F1MHVBbWkramxWNG9NOWFjMWJX?=
 =?utf-8?B?V3hRMEdjUDhKaE1sSmszaS9rTGhncG5RaE1iZ2NqMWdXbmVZelRKNEZuQlVN?=
 =?utf-8?B?Vm5xWnYrVEtOVlh0Rm85NDZaSjN2RHJLZVU4dTYrY2x3K2NjZVhVNXNsdE5h?=
 =?utf-8?B?YVlxVEk3ZXBVaWp2enFyNUErSWp3cENHSzc5aHBFOHcvQnRGMGMraldpVzAz?=
 =?utf-8?B?RDkvQWx3emI1L3B5MFZGR3pGcGFYaGZWNnpkMG1Keml0eWpDaHlIV0lieUdI?=
 =?utf-8?B?UGZBN0JRVTluWEwvdjcxTld2S2t2UUQyYW5JemJvNFB1TEhWclpIOFdGc29T?=
 =?utf-8?B?Z2NiR1RsNFB4NlIvTVkwQXRTT1BTQ2FVdDkzOElrTjBHQURMZXFxdnAvTUJp?=
 =?utf-8?B?clo0aUpoS1FRWFZYa01MVGI5b0FEK3hYb1REQ21GbGlIV2JKSjZBdmpxSFpl?=
 =?utf-8?B?YnBGUW92VThiV1lqL1g0bzUySGpkM29lV3lPYWVrelVJeG9FdnRSQnpiTmYy?=
 =?utf-8?B?cTBsQkVkVDVjbkpreU5tbmVSL0lhdlAyd0lyQmhmYjRiaHNxVTE4QXlEd0ZR?=
 =?utf-8?B?cENiMWFiSGdabGNQOFJnQWprZ090dWR2RGdKRXc1eURxRGNYa2RoMGZIQjBT?=
 =?utf-8?B?UFIvTFA5RFJGYzJybDZKQ3VaTUFDSDFJNTBnTWpkZ2xyOVFRYUNGcHJOVGdZ?=
 =?utf-8?B?c3Fka2lxTEx1L2hpdTNkTThTV3MvZkM2NzJLWTU0eUk1bEQvSDk4MDZGV2Fs?=
 =?utf-8?B?V1FFWEx3MjZYZDVIdGNjSFQ3Vll4YldsaStzOXFCZTI2SXVZUUpHWFI4emFO?=
 =?utf-8?B?cVBzbzZQclU0OVNJR0gzRjNmUzlHVU1CSi80TExJUW1iYXZWN1RFQmxBMTRa?=
 =?utf-8?B?NlJSUitadFVvTDQ1NWVhd3dTMnNOT3ZOQ2FoMmNZRVpOdFVDbFVVcWlOMWdn?=
 =?utf-8?B?VDBMTis2VHhlaWF1S0d3dEgzazhTN1RBTEVGRVFpaUZWZkUyZjcrNDJNcmpp?=
 =?utf-8?B?U3A1ZFA1ZDFCcDhWRmpFZ3VvS3I4UitIZjBqemNlQzFaTzlDdVZ6WE10UWFy?=
 =?utf-8?B?blE5N1J2S1VrRG1xVTlzNGROTFZDWDZSSjFDVFAxZUROM1NMTnNzVVgzM3pN?=
 =?utf-8?B?aWF0d0pXbEtSc0FpK3l2S2RpanlQUjF6ZHhmQVhlV1pRY2tCQnJidlBseUwr?=
 =?utf-8?B?MTlXQjZUTDVQcXBSVi9JYzVkdW5lRVpjSlZ6ZWVKNDQ2VTZ2OGFlRllOOE9r?=
 =?utf-8?B?aE5PTHQ2K3N5SE1YeXFFdjduSTk2TUNFM09rb0xDRzZmUkk3ekNsbWFTYXh3?=
 =?utf-8?B?VFM3ajc2elRkb0VxUWI1Uzl6YU56blRmWEloaFlTcit5dURGNWh3SVgwN0VN?=
 =?utf-8?B?L0xsUDZrdkpMYTFISzFLNU40TnhzVlJJWVR5eEQrbXZjdG5kTGsrbExKM3dZ?=
 =?utf-8?B?eG1RZFFyazZTVW5pVEQrU0FEdEJjNERwM1hRUStSK3pQYmhCaWVJejNJY2Vj?=
 =?utf-8?B?VzA1L1loUU9zNG9BZStmcnk2Q1pxS041VXNjRU5rMnV0Mm1RcDNpcCtpbzNT?=
 =?utf-8?B?TkROTTNHdFlMYXNXaitTbW04ci9ETmpBTU11NVF5RzkvbEE0dWQ5NURMZ1pv?=
 =?utf-8?B?TEtsdzgvZ0xFUmg4RVFtSWRUdXZzZERFV0NSTS9RODY4NFMvRlhNYmVuUmEw?=
 =?utf-8?B?UElyUS9qbW5qZUU5RHhOZ1NIeHozZ2RWSFdtT2pmaDU0dlBVUk1Sak5jbXRz?=
 =?utf-8?B?QVJRNkJIRUxTOG9jUnU0ditxQ3lBNG45a294UmZ5TTFwOG5DU09Cd0NDMnlX?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93728f7d-a054-4245-109c-08dcbdf430f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 13:06:07.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CpmdURhEKdTu0isuWwk5Jbxtu7HbXVlukaP9Q4xe3cCQ4OhnrDvJI62AwHt2u3hDMSSmiHn7TTbOvUgypS63kT0qYsnalQ5NzUVsuqdb4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:51 +0200]:
> Our initial VF control implementation was focused on providing
> a very minimal support for the VF_STATE_NOTIFY events just to
> meet GuC requirements, without tracking a VF state or doing any
> expected actions (like cleanup in case of the FLR notification).
> 
> Try to improve this by defining set of VF state machines, each
> responsible for processing one activity (PAUSE, RESUME, STOP or
> FLR). All required steps defined by the VF state machine are then
> executed by the PF worker from the dedicated workqueue.
> 
> Any external requests or notifications simply try to transition
> between the states to trigger a work and then wait for that work
> to finish. Some predefined default timeouts are used to avoid
> changing existing API calls, but it should be easy to extend the
> control API to also accept specific timeout values.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1203 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  107 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
>  5 files changed, 1310 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> 


<snip>

> @@ -284,3 +1295,165 @@ int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>  
>  	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
>  }
> +
> +static bool pf_process_vf_machine(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_exit_vf_flr_send_start(gt, vfid))
> +		return true;
> +
> +	if (pf_exit_vf_flr_send_start(gt, vfid))
> +		return true;


hmmm... Should we call out this function twice here ? 



Thanks,
Piotr

> -- 
> 2.43.0
> 

-- 
