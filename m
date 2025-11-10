Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67850CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C4410E039;
	Mon, 10 Nov 2025 23:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI+NZVAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8610E039
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762818482; x=1794354482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vjOnq5RhpUIZyb0mw51gIHLn5Wy6kX47VVb1rRRzmMk=;
 b=gI+NZVAJGJ/LoyPEaZX7xKLU6+qdPQ6dTvdYNN3KfUnWkrv1g8LSwL7H
 rtswY99R2VXUJcCdKs18glBdo+8Lcb1A46m2wUry07vlbfDVXUw8wSYyF
 0YIQCCiLhQL9wyquApXh+Zf1o75io77xDvokVh2WJfFwgAFAQuDealU9i
 HUObAlkHyQNUevGV6Qkhyr0k7B6UOOqvqEkLbYkyDgDFlvOU6oAN13/G3
 /houBrt1adfXGT3z/wwXqlShqRD7pin7OuSQ3zeeZi2puKX6mvj3wdbYD
 bUBnjEI1oB2Bb1Io0RXM6f20wjwTVaZ/G40NaJtH6OqLa/0MK5S85+Cwq A==;
X-CSE-ConnectionGUID: UAt1fewlR8SQfLIdmAnB4w==
X-CSE-MsgGUID: P4eZaq7cRaiVCo6bTukCwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64910587"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64910587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:48:02 -0800
X-CSE-ConnectionGUID: 793Yl88ZToqusgU5DhJoLA==
X-CSE-MsgGUID: Ler7iTnLS4yo4FeO3hEq0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193809032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:48:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 15:48:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 15:48:01 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 15:48:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1lzVfd2wYduD9n4eGvz6M/hZvBlrjVviGHpR+MzRZEA12D/CVXvLYh5h5JNQCJkanlNUDAPRXjO7+8Y79mcuq6c7Jtbg2xDK/LyUO5ASEGw33QbmRgpBxYXHfXqCcA3xEb6ptYsKw8xpuyeZZ4ltf+iC2FP7uQnbbEUdLiJOH90kUKYqZXzd8kxPPhYrCyefAYMGY8rOeMU3hu55N8TRduuo/j70H6jzrfaNmuOjrsBViVkTxEZzJMxe3r/MNvl+HW28bvY2wzYO0Q2GBr2Uhudw6rkvrOMTYEXftg2d13DZ7Z7sn0hf1OicJHBoH6aNeYWFdqWrWv8l+1E+/Vvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjOnq5RhpUIZyb0mw51gIHLn5Wy6kX47VVb1rRRzmMk=;
 b=M9zSjRAe3ADMxZzOODK10cl+o8SOC9jE7RRIZ7rQ2e9oAze+TgdUly1//XDVgGFjbhgWSdhryBwDwMH5Lw5tvT6w4v2IPZ7fIbJ2mF7PvrJStM6nOOqWXhS8TCRB+6ZBslCylbBRBohp13GJZoBsvcRH/zHkyiymI23k3BrBiin4ubftwpH0abaK8mdl0JEG0DwJW0PcYfm002wgvSeAUeqoSXA1+6zpxDCfpN4Ke8BuhdWoDakn2LGFqimBi2Tn3iAOMkN3LOTKPb/mAbLl+1gTF3f1BqtFRvHIYnVcsoxaTExQIFj7sHB6wuEI8SInzB8PE5WYKBHPfi/VCzrMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.13; Mon, 10 Nov 2025 23:47:59 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 23:47:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Coalesce pagefault logging
Thread-Topic: [PATCH 1/2] drm/xe: Coalesce pagefault logging
Thread-Index: AQHcUBLJ8689s2Mr206wYlgP+zNxS7TsmLuA
Date: Mon, 10 Nov 2025 23:47:59 +0000
Message-ID: <3b09d748bbe02f2c299b584b11bd54279d52a8bc.camel@intel.com>
References: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
 <20251107-pagefault-prefetch-v1-1-93291d619126@intel.com>
In-Reply-To: <20251107-pagefault-prefetch-v1-1-93291d619126@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4570:EE_
x-ms-office365-filtering-correlation-id: 7416a38a-9030-46c5-b667-08de20b39454
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L0MrcFNZcDVzRWVQU2lsc2JWRlcxU1RuWk1IWlVnZlN4UElSZVBaSGNjMlRi?=
 =?utf-8?B?Y2hXbDgzZXV5RXJaR2NNNU01YUl4TTIxZG1SQXBzWWFLSDYvcDdHL002ZTZU?=
 =?utf-8?B?anAzVUhvOHg2TDFWLzh3RUdWblM4dUhmSXJHdW4zeU1PVE1Fem9SS1RuSFBx?=
 =?utf-8?B?R2pLdm5ZUTV6bndHKzI1aGN6TGlER1RPQlNtMVpSWWpSQk1QdUZzQXpsaUta?=
 =?utf-8?B?bGhJMDVXYWhjUXRtcGF5bTN3aGpiQkhJVzB4cmVUa2k2T0ZzMWNKL21QTzRJ?=
 =?utf-8?B?MkIybVhDdHo1dTFURkFKV2dLS2cxMjJ1WE5VUDVJMm1XblRuUWxkSlFOcmF6?=
 =?utf-8?B?UnI4Mk9QQkxiY0NRMWV0TEwzemtka0d0eGJ2L1ZhVmFpS2JCMS8xWUFGbW9i?=
 =?utf-8?B?cUpuNGo4QlpTNk91OUY4UG9sR0N2MSt1dk5iK0NlakR5UGlwa3lRL25JQVNi?=
 =?utf-8?B?OXZWZUhuY3g0ay9zZG0yMEdMOWZuT1phSHFvVEhpb2Z6R3pmNzFJNzB3VmFh?=
 =?utf-8?B?QktZRWtkRUgwVUhudjEvZnVvemFzMHcyc1FWVkpXN1hYQjZPTDFaVEN0eUV4?=
 =?utf-8?B?TDJzYzdYS0dxcXpFNnF5dThEY2NDMGxBT2J0bTlsbGFWR2NIZUduMzJQdTlt?=
 =?utf-8?B?eTN3VDBlRmZXbXJvMFJFTkhaY2h2R3hueXQwQU4vY1luNU9SYUh1aHJmUWFN?=
 =?utf-8?B?akYwR2dDY0ZNeXFwVkRKMGRjM1VaYy9IcWM1SzFRWEpEZ3IwUlVkeTFNb0Z2?=
 =?utf-8?B?Q25MU0RlTzBCVjZEaXJJcTkwQnVSRk5VUmxVUFFTejZwdlhrR2RkVWZKdkZw?=
 =?utf-8?B?Tm5YVUpXMjUxWUlLVldLR0liN2JtTkV2ZDFVbVZYNXdXeGczMVhNalpnUE45?=
 =?utf-8?B?VWRrVmNjakl6czBRVngxNzBkdjBJaHJwVzQ2eGtqaGJsUXhiVjVHTGpQd2hF?=
 =?utf-8?B?UllURnBZQThqVk1qdjhIQ3dvaDlCdEdMTWFDQU5YWk1VZGw2SXprajg1RTBY?=
 =?utf-8?B?aGxQeUlOcU1JNFg4b1piTW9RU0QwcW96cjBVK2ovVEZnMTI3Tjd0RVJJS2xN?=
 =?utf-8?B?bmZoRVIrVEk4dlNBbE9TUEhjRlZFSjR0RngybmZmQmtNb01rb3NrTHdtcFds?=
 =?utf-8?B?QkNoUm5wcW16RHM0YlgycTZlZTJtdURFckJsMjhpaXZ5dDg3L3pwS0xSOG0r?=
 =?utf-8?B?NERnOTJYM29pT1UxVHBWMlRlRGxvUXVXT1A3VGsxUG05U2R4NmRUNEVDY3dz?=
 =?utf-8?B?ZVh6Rk4zTUUvc3VKaDRoVVRwMmpTWU5SRWRUOEFOU2lHOHYraTJNMXY0SC9s?=
 =?utf-8?B?dHNzZ3VwTzF5bmtTeUhsUlVHN0U0Rll4Umt4OGxjMHFlNWtSMkJnTWdZcitw?=
 =?utf-8?B?UEdlS3VFVTFDeWtvWm5mS3JiTmF4TTZNSjVvOTM2R3FwbFRQSjZXY09CQTV4?=
 =?utf-8?B?a0x6THZ3citvelNMaG41VlVwK3FOQmZZb0hNem5pdXJ5c2JlUmQwcFNHN00x?=
 =?utf-8?B?OWZNcklpWGMzZmxlS1Njbi9Ldm9oZU9nUW84Ymg0LzkwTFBnV3VJSWE2eVhJ?=
 =?utf-8?B?c2VCbTZKbXRHd3A3MS9nclkxYnlscU9EOVE4TTNLd0VwRmdic3hhcy9NVkpK?=
 =?utf-8?B?S2pKOVFrWGpaY1NpQi83RjhiVVRHS0RacVJPVElRb1JOMzdnTVBRdEZyTkdB?=
 =?utf-8?B?K2I5V2djUmlRQWFrYnNZcElicTdHOXVmR1E3eHNxeE5JOXpPN2pJS1l3cEZ2?=
 =?utf-8?B?SGxiRUdidlFVT1hvbWVrVnVNaW1OV3QvTXhBZUl4cDRGc2hHbDR0MVI1L1Br?=
 =?utf-8?B?bnhiOXVZbml3b0tJdWtkRTloZjRmdGZKT3VkeWdCa1FMZUw4T1ZNeWhTM3k3?=
 =?utf-8?B?UVBYbjBURlFPdkt3NGs3ZDZXUm1qTjNBbmRsZjRZNVNFV0ptK2psRmtzWkx0?=
 =?utf-8?B?dTFldHB6T2F6aGtaTFY4RExkbGM0QUMva3Q3WHVJSGg4amxLQWRSOEVLelJY?=
 =?utf-8?B?M1VSUDd5N2FkZ2NhRHdFZjBSR3ZzQndKc0MxbkVLZmxHM01tUytQblNqZHdX?=
 =?utf-8?Q?IvrNRX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3U1NDJSYzZhSWV5dzY0dk4vZnFYYmxRNUJ4VEFHSzRNVVZyUjk3TmtQTlJi?=
 =?utf-8?B?bHZvelJVRWt4cjlKUTZsOXVFZTdNbCtuK01MN2pWRDdtbzlTMERaRmZEc2Q1?=
 =?utf-8?B?aWdUVTI0U0hLTVpnQjZBR0tZeTlWWkQyT2t1cDFDeDdRalpEakxxWHhnMHFi?=
 =?utf-8?B?SWt6b3FDRms3V2dqd3VCOWdmQW5wRFFzeEN1WlIzKytYc3VxZ21NbDhrc1Fa?=
 =?utf-8?B?SVJEWDFNU3Fqa2VCSmsvaDFZdTNNdzhLVHp2RG1LME5wVEJVWWc5YThvY0Zl?=
 =?utf-8?B?c0JRYytZVkVXcGRpcjJETnhBMDR2TFl5REt1cUd0UmNVc1JPOGNtaTJIdTFr?=
 =?utf-8?B?UC9lbExzMzAvYTBiMG5GdkVYVk1SVEtQL2RWZXd1RjM2VWZyQ3ZnWVgvbEl1?=
 =?utf-8?B?a2UxUVVkU3QxdkhHM3V6WUlKdEhtQXJxSy8xWEhRaGJiVDM0NFU0d3lIRmcx?=
 =?utf-8?B?WEZYVElQNEtWcnlid3FtemY3NG1DcWhzZzlTajBuSWw2dlFCL2syTVFZeXM5?=
 =?utf-8?B?b0dSSG9DcDJNaVAyUDhQNGg5SEJhWUNJMEpQOHNZZWRwQlV2Y24rdXJKTnA5?=
 =?utf-8?B?M3hwNEIxR0RtUDBpTU01d3FJTXNqWlpFSGRqSC85Vm52SDFBQWpkUHp4RnAw?=
 =?utf-8?B?ZUZnby94R1lIUWxOTUlLOWorZzhBMHcxUXgrd09ySmVhN2NTM2V4VythVm8r?=
 =?utf-8?B?TVJlWkdQdFpBMGVnR0FHUE5YaGJhSmJlbTZNUFNlMWlRbWZReS8vRlpoR2dm?=
 =?utf-8?B?M0RMOTFUUFJjOVl0KzkxTndjT2x1VWZmV2tySVdtVk8rS0l4NS9WRWdBcml6?=
 =?utf-8?B?YmZCZkIrQzZhQjF0bjNXSk9sdTV3aDVja3dWR0p0Y3RsbDJXWGhEVzFIeGFG?=
 =?utf-8?B?TWx6V2RkdW8zeEgrTWhBL1k3MGZCazJNdmloeWxQVmJpeEhEMlVpSWRSbDBo?=
 =?utf-8?B?Ukd3MEhra09qbTNZK0hFajVSbXpGTkpmakZCclJoNE1wS1pQNFNwVEliby9s?=
 =?utf-8?B?Ums5M3YyT0hENG52RWY3YkR4QjM2UHhTMzM5STZEUC9tVmczOU5lZE9QSzY4?=
 =?utf-8?B?cHlUNjR4ZkxVRTFVMWZtdkY2b29CUW1PdHdLb2Y1Y1NSMzNHN3JqYnI2YTdB?=
 =?utf-8?B?VExISzUyMXlSc2pqa0g4YWdyVmJpbUsvSExRM3NwaDBZMDBqd2k5VjVWU1Zy?=
 =?utf-8?B?aTFhM0JTa0FmUmdWemo5M0Yvb1FjbkpVOVdjdWp1R2puUzNiVldrUDFOOWZh?=
 =?utf-8?B?aFprQTJ4Z0VFTUJYU2NOa2FzcEdPK0VCSzFVT2lOVjBUM0puSUZZUEMxMDBH?=
 =?utf-8?B?bWVTZmx2SG9IQkhTK3NGZXlCTm1yWUs2c0NFZldvNHF6K3RFWUV0UDV3a2dN?=
 =?utf-8?B?aFZ3NGtiTmZYYVNTb3YzUmFabFdjdFluS0ZacTJJcnlFOW5MaXRUZnR4aVVy?=
 =?utf-8?B?a2M0YlZYVVF0WVBMaVJZaW9XRVRVQkNjc2Q4ak5VZGQ2R1hrdVltcVd4dHUv?=
 =?utf-8?B?MUVDVnhURWh4N1MzZkhiMzBuZFR1R1FmeUkwSHFONFpLeVRmbXJXZ201L2Fu?=
 =?utf-8?B?ZXJoTWRmajByNjgvMEFIMkx0eHZhdEN6bEM0aEhLK3h3NnF1dWdBbGZacm1v?=
 =?utf-8?B?aUpvN2t4YzJoQ2pqMHhLbjZQbm9SWjdpb01oY2RCTS9QWFRFZ3J6SndRWW1D?=
 =?utf-8?B?ZFUyMXhWMjFFU0lOTnJBNGtzUTZWdCtzaDhqWExqZWxqdTF2aXR3VnpURmZ1?=
 =?utf-8?B?ZnNrU20vdVVSV0VDLzBNUno5RklzVWNNQk14ZitGWTYwRzEyL29tM2lsdFFU?=
 =?utf-8?B?Mno0V3czNUFKK0cvclF3MTR0UERnc2pwVlg2ek1WaERsRXhQNWFydVdyRis1?=
 =?utf-8?B?NHhEbHduOWxxcVpJaHM4OUZGSVBGRVhkYVpkNXJrTFJWV2FVQlhuUXBCaVNu?=
 =?utf-8?B?clJJTU9DZVRIdTU3UnBPZ3NxcGdubTRMOXdtK1ZQYXVGVmZsY1JNK0FmWDZR?=
 =?utf-8?B?YUVFT2cvNW12Nk5NUEcwWWdJZ2ZyWldHeEJmQnpaZ09Rd2szdGVZUE5Odk9u?=
 =?utf-8?B?NmljcEthMklqUVMyUjBTV0g3WHBYcXVGWk83Z3lIVUcxSzhCSittdUJ3RmFT?=
 =?utf-8?B?UWVzcUxlaU5BNUtDWGt5K0xQWFhUNjE0ckVFZHdES1NhTzJRMnd2SmdqbkxP?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58EE75ADA510C8429831765FC1984014@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7416a38a-9030-46c5-b667-08de20b39454
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 23:47:59.2682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToxsYHtFxdiiMxX0KvBpyGqmA4VeylojqW7GGTQevAW+mI3MueGIPNrGKXedz48VPmmkBNbLJJ42lOyEet4urEieuntAHt1tMFtiqhw/CNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDEwOjEwIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
Cj4gVGhlIHBhZ2UgZmF1bHQgaXMgb25seSBldmVyIHByaW50ZWQgb24gd2hlbiB0aGUgZmF1bHQg
aGFuZGxpbmcgZmFpbHMuCj4gVXNlIGEgc2luZ2xlIGRiZyB3aXRoIHRoZSBmYXVsdCByZXNwb25z
ZSBzdGF0dXMgYW5kIGl0cyBkZXRhaWxzLgo+IAo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdl
ZmF1bHQuYyB8IDEzICsrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wYWdlZmF1bHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4g
aW5kZXggZmUzZTQwMTQ1MDEyOS4uNjhiY2MyNWYyNzg5MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGFnZWZhdWx0LmMKPiBAQCAtMjIyLDE1ICsyMjIsMTcgQEAgc3RhdGljIGJvb2wgeGVfcGFnZWZh
dWx0X3F1ZXVlX3BvcChzdHJ1Y3QKPiB4ZV9wYWdlZmF1bHRfcXVldWUgKnBmX3F1ZXVlLAo+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gZm91bmRfZmF1bHQ7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIHZv
aWQgeGVfcGFnZWZhdWx0X3ByaW50KHN0cnVjdCB4ZV9wYWdlZmF1bHQgKnBmKQo+ICtzdGF0aWMg
dm9pZCB4ZV9wYWdlZmF1bHRfcHJpbnQoc3RydWN0IHhlX3BhZ2VmYXVsdCAqcGYsIGludCBlcnIp
Cj4gwqB7Cj4gLcKgwqDCoMKgwqDCoMKgeGVfZ3RfZGJnKHBmLT5ndCwgIlxuXHRBU0lEOiAlZFxu
Igo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X2RiZyhwZi0+Z3QsICJcbkZhdWx0IHJlc3BvbnNlOiBV
bnN1Y2Nlc3NmdWwgJXBlXG4iCgpTbyB0b2RheSB3ZSBhcmVuJ3QgZG9pbmcgdGhhdCBpbiB0aGUg
bWFpbiBkcml2ZXIsIGJ1dCBmb3IgZGVidWcKc29tZXRpbWVzIGl0IHN0aWxsIG1pZ2h0IGJlIGlu
dGVyZXN0aW5nIHRvIGJlIGFibGUgdG8gcHJpbnQgdGhpcyBmb3IKZWFjaCBmYXVsdCAob2YgY291
cnNlIHRoaXMgY2FuIGdldCB1bnJlYXNvbmFibGUgZm9yIGxhcmdlIG51bWJlcnMgb2YKZmF1bHRz
KS4gSSBndWVzcyBpZiB3ZSdyZSBzcGVjaWZpY2FsbHkgbG9va2luZyBhdCB0aGF0IGtpbmQgb2YK
c2NlbmFyaW8sIHByaW50aW5nIHRoZSBleHRyYSAiVW5zdWNjZXNzZnVsIDAiIG1lc3NhZ2UgZG9l
c24ndCByZWFsbHkKaHVydC4uLiBBbHNvIGVhc3kgZW5vdWdoIHRvIHRlYWsgaXQgbG9jYWxseSB0
byBkbyBzb21ldGhpbmcgZGlmZmVyZW50CmlmIG5lZWRlZC4KCkVpdGhlciB3YXkgSSdtIG9rIHdp
dGggdGhlIGNoYW5nZSBoZXJlOgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJc
dEFTSUQ6ICVkXG4iCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiXHRGYXVs
dGVkIEFkZHJlc3M6IDB4JTA4eCUwOHhcbiIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJcdEZhdWx0VHlwZTogJWRcbiIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJcdEFjY2Vzc1R5cGU6ICVkXG4iCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiXHRGYXVsdExldmVsOiAlZFxuIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIlx0RW5naW5lQ2xhc3M6ICVkICVzXG4iCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiXHRFbmdpbmVJbnN0YW5jZTogJWRcbiIsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEVSUl9QVFIoZXJyKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHBmLT5jb25zdW1lci5hc2lkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdXBwZXJfMzJfYml0cyhwZi0+Y29uc3VtZXIucGFnZV9hZGRyKSwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvd2VyXzMyX2JpdHMocGYtPmNvbnN1bWVy
LnBhZ2VfYWRkciksCj4gQEAgLTI1OSwxMSArMjYxLDggQEAgc3RhdGljIHZvaWQgeGVfcGFnZWZh
dWx0X3F1ZXVlX3dvcmsoc3RydWN0Cj4gd29ya19zdHJ1Y3QgKncpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX3BhZ2VmYXVsdF9zZXJ2aWNlKCZwZik7
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9wcmludCgm
cGYpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVf
Z3RfZGJnKHBmLmd0LCAiRmF1bHQgcmVzcG9uc2U6Cj4gVW5zdWNjZXNzZnVsICVwZVxuIiwKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBFUlJfUFRSKGVycikpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9wYWdlZmF1bHRfcHJpbnQoJnBm
LCBlcnIpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZi5wcm9kdWNl
ci5vcHMtPmFja19mYXVsdCgmcGYsIGVycik7Cj4gwqAKPiAKCg==
