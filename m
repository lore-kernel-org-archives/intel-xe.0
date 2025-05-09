Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC472C3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 10:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9610E9F7;
	Fri,  9 May 2025 10:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0VekCSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D5210E9F7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746785384; x=1778321384;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LczR8AiPYaEk8CM3velEoeNFvjMvIQ9D3ox30v1Tg78=;
 b=S0VekCSnS3guIMEM3DD2KUCAwrepIBMUaPipiFa6IeM69YYfzT0EjisG
 uhhz9mHHupSrNjQp0cO3UNa6h14C9ZYHRldGWL+rpgCxYT64Lxg67tFTO
 p0K30gvANluXdYRo2BjQJz8Vh2vAlGTKDteWWiBglNI6Oc9oMMDZxxyrK
 gpNDVMzeW/y60ZaDYnizJSZP814hEaVBkYQATUL9gYlIqdzQ8wFQsEN0L
 HE5ADbBKgxdulZsz2ghGAfdO5NieN0fsiq3loafhAgsHED9OXQQzYHK5x
 TCyxI426Bs+a680IQs2b16bnERlQy1BnYKc36D21o4nzer+tAsGjrEL66 A==;
X-CSE-ConnectionGUID: 5fcL7gs6Rc6/vSjcdrwGpQ==
X-CSE-MsgGUID: t/5h/KS7SPS0ykexOtcGxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73990017"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="73990017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:09:43 -0700
X-CSE-ConnectionGUID: tnVsX7mMQC2s2dRbE2TTqw==
X-CSE-MsgGUID: WDxqcmuAQQejH7I9SHzfhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167508615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:09:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 03:09:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 03:09:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 03:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgx7LJ8rArEm0lmO6VJSZ4XmAT6RS7LTHAlRPJXdEPpwe9biv1TePOHcqwrx+X/Ctn3/RblMzKjtpbWZNiX1uHYdGRU2iik51Mrn7imMy6RSM+Iw8bqVqlI7sexpj6QlbS49Po5QSJfGQ4z87LIZuZJptaS6tJQYLfhpuKD67boFszpM0ym3+Vm0mhWO9encRO+UVdjUq0aNiUWB2Dk8miKAG8g2M5MTFFMMjQowrkUvd3/uv/87eJvGqfq8xpWvFkY9ddQDKVFQSWcMAjS96t1y9tOG6vpiqupEUVaKw9wS33ZB6GCd7FYYPTrs4F/yRXdcL0QI3q2W92eOIiAmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgR8zPEnUHe2w5o++cdF3STyKwvadgn1S89phM77gKw=;
 b=sp7SNFdrU+oG9Z+ImH+52b4IU3vsY6SCXDCVBdULxttMmLUWet5P3XYona+Lr9aujUtrlbMgZZMGIzyzJM6jI80JkJGM0ySXzMhpYcJuxE91aoAEqVm7H/WemiIdCGumfzBoImC9BJPly6u1NCt57aiMXDPTv6MJ2Gf4eo4Y4xF2THJpi0ymwGjyblR2IXjJEkGGoSLExZf09kUROx9ZX7pJXwAJ2Ei3sIa5GTEwOjXWq/8aGbXn957JnToHhz2PtNYLbYZaWL6C3TfjayScxC5/1eL5GnHI/rxoSxi2gLXhMHiIqFIdM7D2S+KpHrk3ALq2xtNZAZJTnLbbhUDckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 10:09:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 10:09:26 +0000
Message-ID: <ddfd9b99-071a-4a2e-baad-ffb05e26da92@intel.com>
Date: Fri, 9 May 2025 15:39:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/xe/hwmon: Read energy status from PMT
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250509095157.340680-1-karthik.poosa@intel.com>
 <20250509095157.340680-6-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250509095157.340680-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: d40ca606-71e4-4a1d-018e-08dd8ee1945a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ykdyc2J3ZVUvM1F6YU9qOFlvRlhRS0s1MkFZRDNpWUp0ZkZCZUdNTzJQSW1x?=
 =?utf-8?B?R0NNMzVlbUxXanRjMDhhRTVwT25qNkJQNzIydXQ5a0xneHJWTHdFbkphaHhX?=
 =?utf-8?B?K0ZQZFpjNElmVHJWc2hJSWc0WXJiS2VTNG15d0s3ZWlCY2ZWUHV3cXJ5Vmtj?=
 =?utf-8?B?TlRGN0g5aGVwc3VKYW9vd1cwOWRvK3d6Y2Nrd2ZKRGIxZnJHNEdsVTBzMGg3?=
 =?utf-8?B?aE4zVUtidi9FT1ZBUUtZbUIxTzlxUG1pLzMxb3pLcjBQL1d0R3dtbGRaMm5u?=
 =?utf-8?B?R2JyaHVQYlo1YTJRRmRCTjRJZ1JLK01UcElaWk00N1Y2QlZVb3AvbytuZ2Rq?=
 =?utf-8?B?bkdibFB4YmpWekJZL2JQcTJwVWNPUUwwYS9nTTY0aE9xM2J2YytiRTFrNThs?=
 =?utf-8?B?M1Z2aXI0YzZBV2t4cVdxeGFNNkVhU3NRZzNEYk5LUEt4NmhrV3p4RzgwNnpR?=
 =?utf-8?B?QjZGN3RjckN4eExVTkRjZWkvVE15cG9aUHUyeWtHYU82Q2hLTkV4bEtJTFln?=
 =?utf-8?B?dlJ5Unp2QmpXSkdZRWphcnZFcnArYVJJRGUrWjNIanhuejlqb1RRbVVJMW40?=
 =?utf-8?B?dEJlUmtGdGdHSkFLbzI1TnhUUWRpbGxqMW01N1pZdDY1TFJ4U3RVUXNRMCsr?=
 =?utf-8?B?RFZRaE5kT1luam5Sa3RWMlBpWXJsSDdjeDEvd1htU2NuRlo3ZjJST3FpSVNT?=
 =?utf-8?B?T01DR1JNaTYxSEkveHdrMUYvRTV4MWd1TERxMEsvcWYxdlpYOHI5eVZrd3JP?=
 =?utf-8?B?K2pzcVNHUGF6MlFtYUxxTktXV2FuMk9aNU9scDlvUW5UdEZ1WUR1MTJ3WXVs?=
 =?utf-8?B?NkIyZzNOYnlkeTE5bVlSSjJHbHhleFNRMVVnM2pCWDZ0aDl2OEVKK2oyUE9G?=
 =?utf-8?B?N0xlYlV3RmpQUTJKQ004TEdremZrS2VJVkNwTTU2Q2JuMmNZZWpPY1BTRVpG?=
 =?utf-8?B?ZHp5a01hdElOcVpaZUlRVU9xWEpySHh6a21RUmlVd0U0TVlud3pPaGZoVkxo?=
 =?utf-8?B?eGZ1WEtySHRpR1h6ZG5NS0F0a2JDd1lEODk4Z0NCTnFVdnhGSU91S2Q2by9v?=
 =?utf-8?B?RFVrSG1JbDRtckEwNVF4Q2JMaUVLQi93WjR1VTRYQThoTm9aQVJCYlB3OVN2?=
 =?utf-8?B?dUE1ekt0bEZaVnU2RkduQXgydkFjWEREZ3dPMVV5VE5neTlZZXRPQUthYXEw?=
 =?utf-8?B?SFB1Uk9COGpCWkNWZGJWNXZDNEdISE9JeVVLZTU5S2JVUTJMdkliU1I0SVNT?=
 =?utf-8?B?cUM3VjRDUHNBMTNuVFUzRUJRQWhpNVRvN20xbTNidkRUb1lRNzdDeDgyajBZ?=
 =?utf-8?B?RTNnalAxd3J5aVVFdWYyYVk0bXhCT0I4Q1ozcU1WWXdlQ1hvUjQxbkhLa1Rw?=
 =?utf-8?B?YW5HWVRsOWhSOFRxcDJMaTFXY1hXR2I1S25TaVFjUVppQnZyblF5dVdkaE5w?=
 =?utf-8?B?RTMyZTUveUZoYTlFdlJhR0xtQ21Oa280RlIzR2JsbjlLWC85bUZZL3hVYUZs?=
 =?utf-8?B?Qk84NTN4c1VyTHRweWFEazRiRXU1MEU2aVBYU2tWakQ1NVdWaVVpN3N2czdR?=
 =?utf-8?B?aW5SS3pEZGdGZHVIOUYxRzV1NFAyaEN4d2hVOU9mcXNkMkdpOEFRMzYvNDhQ?=
 =?utf-8?B?ZmphaFdOWmxmYVNIRlp1N2dlV2NXc2hHa1ZMQUxRZkJSN1Rwc3kzdnJZY3Vr?=
 =?utf-8?B?djkvTFdEbnZ0TUk2eWVtUU1lbm5vYldzUXlWL2krU3JVOHB6aUN3MHdmek9M?=
 =?utf-8?B?cUdxbDZMdU0xNWtTTDVka0pyVnJzSUkvYVhrMmo4dk1RZHZLeHJ5dlY2N2pT?=
 =?utf-8?B?VDF0UUxHS2NtU004TXFEMkd6RXRtU2JLYnM1MjJKOHo5Q2U3Mko2KzhRV0Rn?=
 =?utf-8?B?eWRzUG5CQm1nRkxJYVFNMnlIS0l5NXk5MlNJQnhKelhuWndNQ1lBZVlLYjJB?=
 =?utf-8?Q?EhA+LEhYDH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjlEcEc3QUExRGE2UXN3akJxckhxamgxbG9JdDUwREFSM01Xc3BsUXlMbXNN?=
 =?utf-8?B?Uy96RmM2aS80Q2JkSGJGZ2VGTFBQeGlaM1h0ZUw3MitoclQzNzdtWkFGWkM4?=
 =?utf-8?B?bnluMWthSXpueTgzRS9HNWlOclc3U2Zubk9TZ2ZDM2JRcGc4a1VWanpBMUln?=
 =?utf-8?B?aUNMTkxxNDhub0l3Smo3RjkzQVptZkJBNmRRQTE5VjRmcnZRT2ZXT2JMVGJP?=
 =?utf-8?B?dDJkWFpSUFN5YVBWYVA2NnQzdHljeG10ODhnbGs5K3VnL2lOV1d4SG13M25N?=
 =?utf-8?B?a25jZDduak04MUExTG5FZnRpQmNyOGZKZkpoeGUramt0Y0ZZYWdkZk0xaTVO?=
 =?utf-8?B?dGpibG5ObXhnakVVRFExUHN4M0pnWVVFNTZpbHhuYS9DVU1XaVUxMi8xeURB?=
 =?utf-8?B?TFFDYzlhUkphdGxEdUh4WFMrTXE3ZFlla3FpbnZaR2hGdmVEamJDVDZTaVVY?=
 =?utf-8?B?dkhyVFJwWERYS2RRaSs2NVRORWthczlvUERJdTdmTWhBTmh3QVM2aU1FanFm?=
 =?utf-8?B?TW5uYUwvRFB3QVZuaWtoMFRHS1M1WDN5M1ROQ1hOTFBzdFRXOVEvcmw3S3A4?=
 =?utf-8?B?T0hYUm9hSWdYTEVQSkM4OGg1OCtUbitPcDNNb2dTRDR5bVRwOVNSWE5FNVpo?=
 =?utf-8?B?aTU0V2RkVVZXSEk3YjN0b0JOd25wenBaZngwakc3aXAwbnFvUEZ5cmhqaVJv?=
 =?utf-8?B?a3lpZlhoNDVvQTNxZHdSNTV0c3pOaVE4bkplZTI5aGh5TFBxV0VVNnVrS2Nt?=
 =?utf-8?B?bTI0eHpjd1g0UVlhakpoVWQwYXFML2ZrUDdGNlZVSkhUQk5udUkxNnBkSlVx?=
 =?utf-8?B?OGpXbWk2VjJoMUFDUjlRc1lWbENJKy8rbFlnL2dQSE9xN1RZdUpmbC9nUmRu?=
 =?utf-8?B?cGQ1WlcwV1FFVEJhbzZZREt5NlA2WExpckp1b0ZRbjlqUThNTkpDbXRIbkxO?=
 =?utf-8?B?Q0NFcEFLTVJEL0hoVmt3ZzVNRjB3T2Q1L0NCNWZvVkliVUoxd0ErZjI2Rkxo?=
 =?utf-8?B?YmZJSUYrMUlrbFIyZHdNdGpwOVZLd1c3cVhxelltUkc5TVNOWnIvZXdyMnNy?=
 =?utf-8?B?YVRPeGNtUVVkZjdmc2tHZFBUaGdaRzQ4TGtjNHltTjVxa215L2pib3haZ3R0?=
 =?utf-8?B?cXBmWDdJZi83YjJGVkM4dkRyZVpwa2JOMEdvczRQRDMzTUtKK1dFSDNHWTNk?=
 =?utf-8?B?bm5WL1RIUGlCVDRST0N4WkFMZzNCeEptTHJjMUZXZm91YzZVSjlxZGlid1NY?=
 =?utf-8?B?MjU1L0VWT05NWldySU1yRmd3bXZRVnhrcFRrY0pxdTNMN1c2OTh3K2RURll6?=
 =?utf-8?B?T3oydWM2ejRyM3pJVDdPdW1sdHYweGpMSlpCQ1JhV0pwS0RoN1JhNXZxcU5u?=
 =?utf-8?B?T3ZYdWQ2d1BSNnpueTVJT3VCTU4vRVQrdnpLdXJnTVpJTGZFdmlGSkdsazlH?=
 =?utf-8?B?K2xqckRsR0h3QjJRTFV3cWtyVDBXeXI2WTNFTDZTYktZbDM2NC85a2FHdUZK?=
 =?utf-8?B?Z2VwUUNwVFQ3akk3UGR5UXZDekh5a1RxYU9aU3FOL1hSditmeXg0SjV2MHRU?=
 =?utf-8?B?cDNKUkxsZm9UUnlLUC81QU1KbHpVZzFXOUd3KzY0a2ZrbWo0d2hWNUhWNzBH?=
 =?utf-8?B?SDJrMEJCRTRRbFc4VjNSc0wwcVdhOEhWVjViRHpVdU5SN0todE1YQUVDN1Vn?=
 =?utf-8?B?L21aWkxwekZGUFNPQ0Qrd1NyQzBQLy9aVmF5d3k0elNJa2x6WDJ0MDhDNmVZ?=
 =?utf-8?B?VmpRMTE2Q2RpVWJSL01IL3dKbWFCWVFBM1pEOTZBTUNqWVFkTURReW9XVWhM?=
 =?utf-8?B?NnNnT04rMHFzYkdHekpWSXRYNXVib0RHbVJLaXFISDF5RGNHR0tNV0RuRGtZ?=
 =?utf-8?B?SC9icEM4OFRuZEFDZzJvQnczZHI0OUVMWDVWTjEweE56MjhLRjdmRldGcjA1?=
 =?utf-8?B?MW1qbHZvSjg4ZzN1eGIxSEJYbDhKdHEwaUUyN1ZLYmg4MXF3RFdjdHpOdEdF?=
 =?utf-8?B?VUljZzBQZmV0NDNRUDRybGpXU3BMWWhFbUM0cC9va01BK2doMjUwRVJWMEc3?=
 =?utf-8?B?ZzM3R2orQnVQUVprMHNHTWsvY2tsNWlSVUxLSWZzMUFNVlY3S0VUSSttOVlJ?=
 =?utf-8?B?L3VGSmtTNGpWakFVS0RWbE5tVVBCY1Y3eWl4ZU1wL3pzUEVSb2Y4eU1CZElJ?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d40ca606-71e4-4a1d-018e-08dd8ee1945a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 10:09:26.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEJiBttpmXuLCo/anpGt+r1Sc+ajzpnwSDO/39Cr7PP4AiCE1QAZD55aM4qsHewHPISfSJKkYcNqkB5puUkRwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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


On 09-05-2025 15:21, Karthik Poosa wrote:
> Read card and package energy status using pmt apis instead
> of xe_mmio for supported platforms.
> Enable Battlemage to read energy from PMT.
>
> v2:
>   - Remove unused has_pmt_energy field. (Badal)
>   - Use GENMASK to extract energy data. (Badal)
>
> v3:
>   - Move PMT energy register offset and GENMASK to xe_pmt.h
>   - Address review comments. (Jani)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  2 --
>   drivers/gpu/drm/xe/regs/xe_pmt.h        |  5 +++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 46 +++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_vsec.c            |  4 +--
>   drivers/gpu/drm/xe/xe_vsec.h            |  4 +++
>   5 files changed, 46 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index c556a04670ee..fb097607b86c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -18,12 +18,10 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
>   
> -#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>   #define BMG_FAN_1_SPEED				XE_REG(0x138140)
>   #define BMG_FAN_2_SPEED				XE_REG(0x138170)
>   #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> -#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>   
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index f45abcd96ba8..b0efd9b48d1e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,6 +10,11 @@
>   #define BMG_PMT_BASE_OFFSET		0xDB000
>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>   
> +#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
> +#define	ENERGY_PKG			REG_GENMASK64(31, 0)
> +#define	ENERGY_CARD			REG_GENMASK64(63, 32)
> +
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f4849dcab555..4c7a25db12c6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -20,6 +20,8 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_vsec.h"
> +#include "regs/xe_pmt.h"
>   
>   enum xe_hwmon_reg {
>   	REG_TEMP,
> @@ -253,12 +255,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_BATTLEMAGE) {
> -			if (channel == CHANNEL_PKG)
> -				return BMG_PACKAGE_ENERGY_STATUS;
> -			else
> -				return BMG_PLATFORM_ENERGY_STATUS;
> -		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>   		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
> @@ -450,9 +447,29 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
>   	u64 reg_val;
> +	int ret = 0;
> +
> +	/* Energy is supported only for card and pkg */
> +	if (channel > CHANNEL_PKG) {
> +		*energy = 0;
> +		return;
> +	}
>   
> -	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> -							channel));
> +	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
> +		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
> +					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +					&reg_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(reg_val));
> +		drm_dbg(&hwmon->xe->drm, "energy from pmt, ch %d read from mbx 0x%016llx, ret %d\n",
> +			channel, reg_val, ret);

IMO this debug print is not needed.  With that this is

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

> +
> +		if (channel == CHANNEL_PKG)
> +			reg_val = REG_FIELD_GET64(ENERGY_PKG, reg_val);
> +		else
> +			reg_val = REG_FIELD_GET64(ENERGY_CARD, reg_val);
> +	} else {
> +		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> +								channel));
> +	}
>   
>   	if (reg_val >= ei->reg_val_prev)
>   		ei->accum_energy += reg_val - ei->reg_val_prev;
> @@ -927,11 +944,18 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> +	long energy = 0;
> +
>   	switch (attr) {
>   	case hwmon_energy_input:
>   	case hwmon_energy_label:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> -				       channel)) ? 0444 : 0;
> +		if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
> +			xe_hwmon_energy_get(hwmon, channel, &energy);
> +			return energy ? 0444 : 0;
> +		} else {
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
> +					       channel)) ? 0444 : 0;
> +		}
>   	default:
>   		return 0;
>   	}
> @@ -1276,4 +1300,4 @@ int xe_hwmon_register(struct xe_device *xe)
>   
>   	return 0;
>   }
> -
> +MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index b378848d3b7b..3e573b0b7ebd 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,8 +149,8 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>   	return 0;
>   }
>   
> -static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> -			     u32 count)
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> +		      u32 count)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index 5777c53faec2..dabfb4e02d70 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -4,8 +4,12 @@
>   #ifndef _XE_VSEC_H_
>   #define _XE_VSEC_H_
>   
> +#include <linux/types.h>
> +
> +struct pci_dev;
>   struct xe_device;
>   
>   void xe_vsec_init(struct xe_device *xe);
> +int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>   
>   #endif
