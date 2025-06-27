Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49011C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09CA10E062;
	Fri, 27 Jun 2025 18:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+gRdfbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9518A10E062
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751048599; x=1782584599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e2nxGgQlv/UETVYYdeFmwaJbcgPVWV+srgEPBlhpYFI=;
 b=j+gRdfbi1JSwi2ks0SYWyKm4AT7qGw5Gq0nlg8XCaIt/8MmBn3prYlwZ
 G0Iq/PdEN4HxR6+ECJ3glnDGiJ4Twi8KEh9mWH5iX0/LxqN07RIsSFc5u
 hk5u13jfByWCAIAJF1uJKJ7aq8MwcWpuArCLZIdUiE2ZK7c5d5FZ2E22f
 cE2xOzL1L/lS1RwCHV7Y6uI8WUoq1p8e420jMHBGvwFhuAPvLouRevsEa
 ou4ITCaJzlkCd4U6sVWo8uUvs07BAW2PYXNjMIizJbChBkW86fuqjWJ+K
 Y5Ek/foq0iLEi/gcRhV65SW8QMmYysnJb6NREfYQB5hmLWLlqwYquktpq A==;
X-CSE-ConnectionGUID: C5DqVOTgT3mg5eGEpRtmkw==
X-CSE-MsgGUID: xGHRHiZFQyaAPGfdcDHoEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53091122"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53091122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:23:18 -0700
X-CSE-ConnectionGUID: HOE4aFXfQ+OqjP0R1l73dg==
X-CSE-MsgGUID: Oj8VulJ6SzeuFJMHXbx5Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="157154670"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:23:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:23:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 11:23:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC04mGnhXaw2Ebljl5+y7K35UZRg7atsYqDwYiFZadd43KVSqR9OyAwlOusub8O9tEY9uddWktEvH3CSokGKZ60qQhXj6LiY65Zm0x0CC4h3hS0Gx9Nn5WE4JlAYkhPE+8yS2NwqO4v79UqXx9cMF2n3kNKDxGiSBeOFP3TQae7w//ZVLqTKL97wjmYcmsNI2C+0gH4SrF9VWt7RQDC831jthabRXEL3670gKGtSLspb+/4kgRIHsRXzNzZ4s6oRuzEUjeemY7EFopPMdW1cijyWmWv5pfIhojlYELm9cVv1Vl9mrHs1adFDx1gvKQI1+8TRoh78lWtytjN4w45Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2nxGgQlv/UETVYYdeFmwaJbcgPVWV+srgEPBlhpYFI=;
 b=ZDRJ2N8RTM3P3PzfjkQXcSh1vXua7wb+KAorX0GOkwEN2kCD8jlUNrrjrfpSPazCf5d5CtHLt7+GoKd2Yf0VT7j9gnnLwgO7eLaqKHcgrxuNoJm5wWukMCRGc0sI2CS0Ea+aC0c+ePlnsY1p8cTX6DeTACnsnvDKZthmj+5mXU4M7jy7oe2ZODUZDVxgS+lXPlr3M9LCfEYhDBrY4WOErnNIosVN6axfa0xPGvEtW95h6U5TWXii7MtQUOqX7bDuXG34nJcuh8bAoo5p9IwrT0VasT+1yLjq30LpOycCwwGODJ1G+kkj41CZxwDxf0kOqsJHqhuZExLQGziNjv8k+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 18:23:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:23:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH v7 11/24] drm/xe: Flush L3 when flushing render cache
Thread-Topic: [PATCH v7 11/24] drm/xe: Flush L3 when flushing render cache
Thread-Index: AQHb52g9qzxDPgf4y0GJW+5zkZ1dbbQXUjgA
Date: Fri, 27 Jun 2025 18:23:05 +0000
Message-ID: <371c413dbaeb584cf56264bd7d1d44d0ca284ec5.camel@intel.com>
References: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
 <20250627133340.54603-12-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250627133340.54603-12-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB7302:EE_
x-ms-office365-filtering-correlation-id: d061def3-1671-463e-d25d-08ddb5a7a8f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTNnSXNzc0E0ZnZESXJrbmV2OUxVZFBwTUY1bnV4TnJOVDJaZkl5SzZHKzUx?=
 =?utf-8?B?Y0Q3d2picVJKeGhVQkphTzFmUU1tWVpua3hzc0l1NXpkQS9wY3lWOUl6dlcz?=
 =?utf-8?B?S0hKNy92ZVd0VVZ4Tk9lYjhyZGx3T2ZiTFBwK0FIbVZ1QWF5Ti9YeEdaY0JI?=
 =?utf-8?B?QWc3UExha2d0QWw1WU1UTVVBSHVWUk5ud2VBYjZreWRmL1FYeStUYkh4aHgv?=
 =?utf-8?B?ZHhGMlZWcFpGa25xbzJ1NFVaQ0NhY0pTRStueG1BbjkybWdaT2UreHg2QXVQ?=
 =?utf-8?B?WWJIQ2JsRXBNMjZnQ1RIajhzbnhsNXZEcWRoKzhRQUtGWWdMVGFLaTBEa1p2?=
 =?utf-8?B?RUZkRnFRTjRoUUVtT0MzNmt6dk1OS0NPcngza3E4N0tMbGVuUUdNVHk1d3VK?=
 =?utf-8?B?RU1KVTBobDNCci9zckt0VzgwenV2bGp1Q1dtejZ4VTNDOERHajFRRzAxMUR1?=
 =?utf-8?B?RUtOSVQwUlV5eEZtZUlTS0JJdStFY3ZGWXdCYnpMMVpkN0xLSGUzUEU4N3F6?=
 =?utf-8?B?eU95dUJ1ZXdHUExmRXVhT29SRzR0VEttMlBweXRodCtPcDJMY3NMZUk3WVpr?=
 =?utf-8?B?dWx4RHBKbHFuYnVod1ZuN2twempFcSt6VllUTnhER0d4UkNwckFyQUdsNXIw?=
 =?utf-8?B?eU5WSGo0NWlMUWYyL2IxY0l4SWx3MjliYURGVllKUnlPOEZSSlUvanFkcDEz?=
 =?utf-8?B?a01pYmY5cUhzTkZQeTNWaUY4aTdkN3lBdUMzYkZVejBORWFVZXFZck1NWDNw?=
 =?utf-8?B?TTZlTEM2M2dwRXBqMEFOQmdLQ2FVQzB1TVJLUE1RMTVQRnFaOFVqbkNDeWkw?=
 =?utf-8?B?RGJSZVh0cjdxS1VBcHpYT045VjYzNHE2SjllbDlmam9HZzhhdkh2ZUU4dCtq?=
 =?utf-8?B?SkdzeXBkSisvNWNjNmY4bjlUUkdkU2M5SnBwZGdXTHhkRmtGdldKYUpVVy9u?=
 =?utf-8?B?UTJxL1NGdXFNVzYvUWFGT2J6dFo4eU9seGd5aTZnVjZZUG83TmdtcmRIeHhJ?=
 =?utf-8?B?MDY4NE1Ndkp5WlpHMTJjWTE0RGFsT1IwVnhEY29Pb083ZUdWdGhvZUIxT1Yr?=
 =?utf-8?B?a0xZamlDWVVaa3M2T1ROYmVObXBxTmZ2KzFXUEQ4Y0NqMjUrYjgvaDV4eGts?=
 =?utf-8?B?YTRaQlZKNncvdUI3RWlJVzA1L1pQemRIaG8xWEVUOThLa1A2S3M2K2FIYTNa?=
 =?utf-8?B?RHd0c3E0WTQ5bHFIN2dyalhJY1RjRU9zbWNVekIvUzFFL1R4MmhsQXhnREZl?=
 =?utf-8?B?SU9DUWx0dWtoaGdMZDhPMTF6bnZRd2xVckw4cUkxakVaV002cWlDa3Q0MUJx?=
 =?utf-8?B?T1ovTE1mYzhyYlBtcjJOMHdsT25QeTdpaXpQUTRXRUNNbXo0TCtsOHA2SXQy?=
 =?utf-8?B?WUZ1eVdvSDc1U1ZIN3NVb3d4amNVVlcyM0RzWExtN3loMDczUkVRV1pwMzhS?=
 =?utf-8?B?RlQxTmlxQW14UW5xS3YzNE96UjdQNm1xTlFGSTU5VXNnM09xcUdOWEE1UFZN?=
 =?utf-8?B?TkNabzhDR1NQSGNHc1VXTE93UmlNWFVURG5Tb3VzNXdIYTRRNTZEekM3bjE4?=
 =?utf-8?B?M2gyUk5lTEoycFErWSs0R091N2RyN0Z0dTFmd2Z3dno4a3IwR2lUUm1pYWd0?=
 =?utf-8?B?QVRVUzdlaFprSEdCS2kzMHdqdHVmdjB6Ri9NWEFaRTNLMkx6dUZKOHVtSEsy?=
 =?utf-8?B?eS9ESGw0dUR5c2VBb0NhMGtuWVVBZThPZ1doYU4rZW1kZ0dSOHZlNmhORE13?=
 =?utf-8?B?RngvZFR5ZmhlQytpeW81M3JucGorV0JZNy9DK25WM29seVo1QkNOYmNkc3kz?=
 =?utf-8?B?R1RYNFVUWXF5UnlweXAyc1V4VWdybk9kU1JoUFk2UVhMWmtNanNySEoyYkkr?=
 =?utf-8?B?QmF2KzFHTlVlNWU1TlFTQWxzL0lEdW5tMW43N2pweERJUXNST2RJZVBlRnRq?=
 =?utf-8?B?TEJ6NDk3RGJsR01NY2JiUkdOUWh2a3VURUl0T3FZbzhRdXRtSy8zWlhPV2Y1?=
 =?utf-8?B?b1MzditvNGNRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHJmZ1luSTdjMXZzS0pFWkYzYlRJZU5YUks2dlJXL3pQSzd0NlhOdDBqUFRL?=
 =?utf-8?B?SVp3NFhMNHdSZWFmcER3SWk0TTNCM2kwRHNDU3Q1bFlDUXphQktPVTNzWnVu?=
 =?utf-8?B?dXpvYWdUQjVwYzdkODhXS0dKRFBqeTcrU0IrakxXZGxZaUVrS0kyVFg2cXNs?=
 =?utf-8?B?dVNRdWZyeWw1WkFsV29OWGxZckRCeVBlbUFKQWFybUkwY3Y1cGRmQ25QNVhX?=
 =?utf-8?B?eFFQUG1zcHcrcjRDNWxIM05uZDltSElmeDMzYzhtdmpINDhEYjlSYmRxenNr?=
 =?utf-8?B?cFFqSzlJL010SmlsS2x5WHJ1dzVNU0dQSk5DZHFBRm9zZ2tlNHRUQWE0N0du?=
 =?utf-8?B?WCtZcVlkcU1GeDVYVGlNSzZDUmdpelYxZnl2UlhoWFRFTmNydHVsZWVUM0FI?=
 =?utf-8?B?UTVzc0d3WUkrUVh6K2FLTEZnQlBYZER4N2hUVzN4UTQ0ZnBySXQrMVVzYkJU?=
 =?utf-8?B?cmZGZzljNnRQT1M5dmtvUTRvVWExY2tVK3hmdkQ4MmFwTWdEaVIrczV3QlBu?=
 =?utf-8?B?d04wL0pUc1VXaDltZmZIMGVFM2ptd2w0YmNpV2ZDS2tETDQvUEVrek4vMzl4?=
 =?utf-8?B?UlNmUzh1WXNIblROOXVtMlArTUlEajRVZm9POUhaM1lMOXl1YnRFMEhaRGEw?=
 =?utf-8?B?Sk1IcEFtRzJlUFAzZ0JqNFAwSVBoempYbGUxREY4TkNCeitRTS9KK3ptanY5?=
 =?utf-8?B?WFVsVWF3TUdXZHVwSUp0alQ4eFBzWXRVK1oxZVVwZFkwNGtTNFpNU0piSm0v?=
 =?utf-8?B?SjFCdmRyNUtXYWJQY0ZDNGFyRWVRVFQzNmhiWFM2cXlvTVZuejRYTUtnTE93?=
 =?utf-8?B?MnR5Y1BMLy9nNGFGMFpZUG5qZ1FRUzFFMDkyQ2FiZWVZekxpNWMvVE1nUkhW?=
 =?utf-8?B?RCtGTW5WZTVUWGxsSDRBd1l5UmtaSzZHUlNvN2Rkd3ljUVNTcENkL3p5NEtJ?=
 =?utf-8?B?S3Z4SHRNVWRiWmczRDZzaWdxdEVlMy94bUZET2U3MUo4Ykg4aFpFbjhFS0NY?=
 =?utf-8?B?SS9Id2NESEovTG05R2J5YmZlNDFOQ05EUm5NT2o1YnlyQlBqL1VYaVhxSW5B?=
 =?utf-8?B?K085L1NhVldLWmd6a1RLanQzc0N5U3Z1UlhWODB2akkzeVF1TWRwdCt3UTRa?=
 =?utf-8?B?clFZZGZaQkZ5UG9YRUhwbXNrRmJ2dGFRQ0Z3bVoxemNlYjdpeUJIRDFDM3Vy?=
 =?utf-8?B?LzE3UUF6c00xYkhmSy9YSkNkMDdIZHQ5cE5PNUg4cTF2Qkh5WVZuSktkN243?=
 =?utf-8?B?QmdDSDZ1NytWMU9acC94aUZweG9qSFZySC85WU9qanZhZ3lxcGdud3RpaGZG?=
 =?utf-8?B?a0JZUnFQMjVpS2JkM2RLVmo1a3FyNWxNOXpvQ1JEK1pCYTJFWk9DclNXY0to?=
 =?utf-8?B?MStyMndDbXllcHVhTG5oTm50Q2k2ZVZXbDRjUnAvUGpUZVdmQnhIeFBrdWp0?=
 =?utf-8?B?K2tueE42NXRJMjRkOEJTeG1vMjhERWZzc3FxUFczQTZiYWtKRnVXU09UUDdW?=
 =?utf-8?B?VWR4SVVBSFhZTVdOaWNNRkJlc1lkV01TblcrRlNtWkUxRUFGVzFkNVVGL0lO?=
 =?utf-8?B?NHN6Y3RNZkZwRVRZT3JpSnNhN1Y4K05FS09HaEdxYnFHblJBcWl3WTg2S1ZH?=
 =?utf-8?B?VDZyQ3ZBV1JieU11WnBaczNOSkJaVXF6MkdkKy83SGx2TGdjZkg3dzJmbSsr?=
 =?utf-8?B?c05GS0RYTkc2RER6SHBiM2pvU2FmOXEyK1dsaWZHOCtNSzNHYWRMbWZTNi9L?=
 =?utf-8?B?SVh4Q1QrYzRGa3hPZDhvU2g4KzlxcWpLZHp1dExTZGJsSmxwVEhBQlJQNEQ0?=
 =?utf-8?B?VkN2UjVyQVZOemYrcklITlJCQ3h3QlRBLzJJUXJiVUtjUExuZFd0QXpyWWNp?=
 =?utf-8?B?M1h0RkQ5THpoZXF0U1BYdUF5aVVTWFhZYVpyeWdPOExWZ2pCUDJuZUNoUGM3?=
 =?utf-8?B?ZEJXOWxLWHJhY2tVZk1meTY5L242dnJQdXJ0U0UralFNWlVYaDJDRzlUK2I5?=
 =?utf-8?B?a3B5WW91a3VtTkRxUG1DV1BJUXFPZ0ZhQmN4T2NucGZMVCtmQzhUU2tINjJV?=
 =?utf-8?B?YlQrQnBRVGQ3ZCtaUFRsK05ZT1RST3Aydnl4TDZaK3dYZUlhcVQ4TnlYVmpo?=
 =?utf-8?B?TzNsa283TVhQQ3BwVGIxMWZDTG5nR0NWNWdVMTFDVGh2cjZLb0dWVlNaTHJr?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69FA008B49BB9B47B66EF168CB023651@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d061def3-1671-463e-d25d-08ddb5a7a8f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 18:23:05.4623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4rmCCmgUHIPzTm/ChS76ywvA6lHw/rNeM8Xt4FIUO4JYqCXD2AJfuwUp9DUWxRVwz7m6Kfjs0oLqSSF4MbDfkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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

T24gRnJpLCAyMDI1LTA2LTI3IGF0IDE0OjMzICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gSTkxNSBzZXRzIFBJUEVfQ09OVFJPTF9GTFVTSF9MMyAoYml0IDI3KSB3aGVuIGZsdXNoaW5n
IHJlbmRlciBjYWNoZXMgYnV0DQo+IGludGVyZXN0aW5nIHRoaW5nIGlzIFRpZ2VybGFrZSBQUk0g
bGlzdHMgdGhhdCBiaXQgYXMgcmVzZXJ2ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gLS0tDQo+IElzIHhlIG1pc3Np
bmcgdGhpcz8gT3IgaGFzIHRoaXMgYmVlbiB3cm9uZyBmb3Igc28gbG9uZyBpbiBpOTE1PyBPciBp
cyB0aGlzDQo+IGFuIHVuZG9jdW1lbnRlZCBiaXQ/DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL2luc3RydWN0aW9ucy94ZV9ncHVfY29tbWFuZHMuaCB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9yaW5nX29wcy5jICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKysrDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX2dwdV9jb21tYW5kcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9ncHVfY29tbWFuZHMuaA0KPiBpbmRleCA3OGMw
ZTg3ZGJkMzcuLjI3ODkyOTg0NDAzYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L2luc3RydWN0aW9ucy94ZV9ncHVfY29tbWFuZHMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUvaW5zdHJ1Y3Rpb25zL3hlX2dwdV9jb21tYW5kcy5oDQo+IEBAIC00Nyw2ICs0Nyw3IEBADQo+
ICANCj4gICNkZWZpbmUgICBQSVBFX0NPTlRST0xfQ09NTUFORF9DQUNIRV9JTlZBTElEQVRFCQko
MTw8MjkpDQo+ICAjZGVmaW5lICAgUElQRV9DT05UUk9MX1RJTEVfQ0FDSEVfRkxVU0gJCQkoMTw8
MjgpDQo+ICsjZGVmaW5lICAgUElQRV9DT05UUk9MX0ZMVVNIX0wzICAgICAgICAgICAgICAgICAg
ICAgICAgICgxPDwyNykNCg0KT24gc3BlYyB0aGlzIGJpdCBpcyBQcm90ZWN0ZWQgTWVtb3J5IERp
c2FibGUuIEkgdGhpbmsgd2hhdCB5b3Ugd2FudCBpcyBiaXQgMzAuDQoNCj4gICNkZWZpbmUgICBQ
SVBFX0NPTlRST0xfQU1GU19GTFVTSAkJCSgxPDwyNSkNCj4gICNkZWZpbmUgICBQSVBFX0NPTlRS
T0xfR0xPQkFMX0dUVF9JVkIJCQkoMTw8MjQpDQo+ICAjZGVmaW5lICAgUElQRV9DT05UUk9MX0xS
SV9QT1NUX1NZTkMJCQlCSVQoMjMpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcmluZ19vcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+IGluZGV4
IGExMjg5ZjA4NjE5MS4uOGY2NTViNmZlOTEzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcmluZ19vcHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19v
cHMuYw0KPiBAQCAtMTk3LDYgKzE5NywxNiBAQCBzdGF0aWMgaW50IGVtaXRfcmVuZGVyX2NhY2hl
X2ZsdXNoKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwgdTMyICpkdywgaW50IGkpDQo+ICAJaWYg
KFhFX1dBKGd0LCAxNDA5NjAwOTA3KSkNCj4gIAkJZmxhZ3MgfD0gUElQRV9DT05UUk9MX0RFUFRI
X1NUQUxMOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBMMyBmYWJyaWMgZmx1c2ggaXMgbmVlZGVkIGZv
ciBBVVggQ0NTIGludmFsaWRhdGlvbg0KPiArCSAqIHdoaWNoIGhhcHBlbnMgYXMgcGFydCBvZiBw
aXBlLWNvbnRyb2wgc28gd2UgY2FuDQo+ICsJICogaWdub3JlIFBJUEVfQ09OVFJPTF9GTFVTSF9M
My4gQWxzbyBQSVBFX0NPTlRST0xfRkxVU0hfTDMNCj4gKwkgKiBkZWFscyB3aXRoIFByb3RlY3Rl
ZCBNZW1vcnkgd2hpY2ggaXMgbm90IG5lZWRlZCBmb3INCj4gKwkgKiBBVVggQ0NTIGludmFsaWRh
dGlvbiBhbmQgbGVhZCB0byB1bndhbnRlZCBzaWRlIGVmZmVjdHMuDQo+ICsJICovDQo+ICsJaWYg
KEdSQVBISUNTX1ZFUngxMDAoeGUpIDwgMTI3MCkNCj4gKwkJZmxhZ3MgfD0gUElQRV9DT05UUk9M
X0ZMVVNIX0wzOw0KPiArDQo+ICAJaWYgKGxhY2tzX3JlbmRlcikNCj4gIAkJZmxhZ3MgJj0gflBJ
UEVfQ09OVFJPTF8zRF9BUkNIX0ZMQUdTOw0KPiAgCWVsc2UgaWYgKGpvYi0+cS0+Y2xhc3MgPT0g
WEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUpDQo=
