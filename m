Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D2C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 14:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ACA10E6DE;
	Thu,  6 Jun 2024 14:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvYO8YPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36810E1C2;
 Thu,  6 Jun 2024 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717683401; x=1749219401;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=47pSFgxLBCCpM8EArHfwiEucP7Whc7KqMBMwrYSlIB0=;
 b=WvYO8YPgNOSBlysRkdE5jmmVnpRDHkAe2zp1f2bBXD+3J/vtKAa7BZNB
 3Z4j2rnEATu3rqttE4rBNaPrV5xHkhRwlCIiyeSECNis4de5ATyAoz0P8
 5SWY/3KAbH/mMkt5XKCvkNLCEi3iNQcVE3pV6cw4QMsa+CK3FaPc/lyWP
 1LeOs9eqHlH6rXvpAdjTklj95G7V+H4E41SsUnJ+vW6qlVM/yg1eFV6kY
 tyyXGAKc7XJFM4U3tJsjwq9qkjkvESD48DdQZLAM/30OTwwE/k7QEMxUR
 r+QYCdkGo2K72jexN/SrL4lZNkEsf5NMNotlK4rd5/lO90kKQ5JwWVN63 g==;
X-CSE-ConnectionGUID: QTuj28aESMyYsuOJ7QZr8w==
X-CSE-MsgGUID: hLEpPD7OSZC+3b3NAbRf1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14536712"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14536712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 07:16:40 -0700
X-CSE-ConnectionGUID: NWAzRy/LS02TiB6fniLpdQ==
X-CSE-MsgGUID: G5lcJAXxTvWyH2NmnOJZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="69138008"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 07:16:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 07:16:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 07:16:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 07:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oenqL4Ng0LFD9wEAZ7a5KmfoAY3pkFKtjTwgMSdET7wvlaZoO1gvIlUKMIWNJOi4gwMDAbWhIe/i88t+JEbJfIiv9hRGpEVfk2ELmmQ3se2eHaYQ8GpWvwKlv+fzqg92KknqDhKcSsLF/IgnpmbuZY2xyEyRU4t1hY/T2+OoEwUbnqA2E3moPnh+UdgUO+oYnnEgdgJI7zQ15mNglcpYiuC3oBY8Xv19I4Z0w6JxfuuY5Z4fU0uq2PHb5TeatYQxrZWU9/dtU9g1YQo6g4N8dBdfD/3AVijx+J3xWrGhcnOM4PtTdI458gqeUN65tvoiDvYn8Ug/pdyTPLSH0MDidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47pSFgxLBCCpM8EArHfwiEucP7Whc7KqMBMwrYSlIB0=;
 b=FEZrKfchPgiu6H7kW140Vjnjc/v0wFeaTQS+3ME5YZQpStfP0LbQcZAzdtaN7hHMLFhCId7qa8dxQ4+DzkFfX4VYY5aHFIbtsT9CWcm6f5LtZDkbXQhv/yhMkpdEJ6pue+rh/DrYEIWl2dZFFbexJWmRinF1fgHsSqXXSh04Nbur5rT8mTIaMHpWtHDXvXSaC8cbLyoe7cqLUON1xC+Rjj7izkOA8ZSPEJD8LRvVRKpcNovVqRvHyAtMdmSTTySeTlrkJuhVHAroewkC1tg97PkT1qllFWnlMM/7+Q0DJ8Py3Zfam0jWXvyJOG2sytMFb8g22lWDJvQqEkBP5CiVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 14:16:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 14:16:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Topic: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Index: AQHaiylWg/M0mvseZkeTo9puFWC+WrF/9WmAgA3MDwCALWAygA==
Date: Thu, 6 Jun 2024 14:16:21 +0000
Message-ID: <SJ1PR11MB6204D80479F88207E8263D0481FA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240410094052.1033721-1-tejas.upadhyay@intel.com>
 <1eade99f-7964-490c-81b4-417c5429716b@intel.com>
 <SJ1PR11MB6204E841D58F5803C517A7A381E52@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204E841D58F5803C517A7A381E52@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: stuart.summers@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: 146cd702-5077-46b6-18f2-08dc86333dc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?MHU1OVBwK1lDM3diSHFMYlNPVVdDcWpMM2cvcjNQUGdlTUVTNzRCVWE3NWpy?=
 =?utf-8?B?RytPczYzWUZ5T1drTWtRVDRBSHkrMkVPeHBscytMWXpYY2JUeDZRajFJYWsy?=
 =?utf-8?B?Ym1DMU9iR01uem02MUpDTkVVdUlKeGZYLys0VXo1R1pIMzZxNWFudTE1T0Jw?=
 =?utf-8?B?U3BJTll4SGJ3KzArNGNURmloZzdOKzltRWhabVY5eTZVVDkwRk1relNEQ2pr?=
 =?utf-8?B?b2FlNFVtcmpMYnFGeVhVQ2o1RFB0WGR6dVRhK1JXZWtEMHI3NUFUUmw2eGhq?=
 =?utf-8?B?aDlYcjdobExxWUJWaFAvSXlUajRWWVRwR3dHTlRIRUpseklRR3RJSUNadDZO?=
 =?utf-8?B?MFRpeFBWNXhWcVhRaHNVbHI2MGpkbnZjTVVCTmMzcUZBVllKOVRuVGtPNHo3?=
 =?utf-8?B?T1FITkM2UWxoaFl6aCtXQXA2U2h2RHhKOUNGblpHbkZESkdJS1U2cHVWMExu?=
 =?utf-8?B?TFBYVEtlN2V1NXFscjdTUXdqTStENlRsZk9SNmxqRzFmRXBiRTI3SVcvTDNZ?=
 =?utf-8?B?TWEwNlFaRS9nRS9SSllzR2cyMDE1cUdNbjBhcXFjalNmTGxiK1dOaVhMaGNJ?=
 =?utf-8?B?MGVBZXNkWUFDMHY2U1I0Nnc0OUhNOFlZQUkyK2JVdkY3ZXR2ck51d0lVNUpv?=
 =?utf-8?B?bTZ1TzQwYTJwNlZOdnFDZXZYN3NmK0dneUM2eXhoTm5qVDMyY1VXZGI4cE1l?=
 =?utf-8?B?WWR6dUdVZnNCNGN5QXZiZ0lSNGRReENkTkpKNUdUMDNsTmRhaGxaVmJIM3l3?=
 =?utf-8?B?RUZib3RZVTNXL1BZaDFMU3RPWERueE11eXdYcWRVRGdLMmlVbXNnQXhPTHhS?=
 =?utf-8?B?WGxNM0llanhLeElUL2lEbXYyREcwbk9WTmRjTjBITTgyaS8xRFcvenIwclpI?=
 =?utf-8?B?YVMyZVN4L1dNVzExRkdMUkg0Nnk5ZlV3U2FBN3VFQ0NoaytzZUlOUCtMSVZ4?=
 =?utf-8?B?U2FyVThOWFdZdjA0UUlUQVFFb2FQYjkyaFAzaUF2ZU50TVFLb2NUZ2pDdVl3?=
 =?utf-8?B?a0MyNHRrVVBIMWw5NVBHNityeGdwWmJQSk1rYmZ1WUFrVVluSThRNGgxWTl2?=
 =?utf-8?B?Z0F4dEpaTmVzSWtlSk1JNGRNbnBhSGFWUlcydEdqM01iYU5sSlhxOVdYVjV5?=
 =?utf-8?B?UVp5bEhJU2k3aVBzN01PK1lvK21MSkFSajY5Ri84ODYxdml1SzA5Qm9oZEFq?=
 =?utf-8?B?d2paVlU3YWpuRzFvc1JnREpoZzkxdkFLeU55R2hXNitySVVTQlFQZXEyaG5x?=
 =?utf-8?B?MTVkVnAydmdmWm5mbFlqQUEwSnRHZ1Izd3pad282Zk1KNUY2cnlUYjc1Rk42?=
 =?utf-8?B?aWNKMTMvQmdoV3VMbCtmUTRqY0c4cG9qcytEK0o0bmtZNXpzaElJRkh4NkNH?=
 =?utf-8?B?citJc1Y5Qm9MQ01kL3FDWWE3UzdxZEYxRGI4TERBd05RSkt4aWtpbE5lZmo2?=
 =?utf-8?B?Ny9CbXNubmNkQ01sZXRHY1JSbWtEd0RlOW9uYklod3pjamh1cktqSXN6MXdt?=
 =?utf-8?B?cVNpS0NoOFJpWkVnSXJhdmJRSXduM2FwaEU3K29yVzNZQ0dXSkR3cHZWN290?=
 =?utf-8?B?WU9XSDFoTG5rQ015NFNYRitsVVFJc0dScmgxbG1GbzF3ZzVhS0tuTmpFT1V3?=
 =?utf-8?B?UW9hQ05FNTNCUnpNQWgxQjRoNDhvWHUwY0lyejUvaStscmtxaFVPeE5LNHBn?=
 =?utf-8?B?UEkxM2VIWUkwdm9CUEFTanYyOHJ1bHFFQW1FaWhZeDdzd1FWN2JTUjFiQmVG?=
 =?utf-8?B?NEw5bHdtOEtPbDJxZGJhRUFQd2YzdzIrbUVweVd5ZVpaRUNscDlqY2dBTWpG?=
 =?utf-8?Q?f9R9HK2WKKkp2QiyQHkyQ2+kHYpuq6wJgS9S8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M09PazNPQjk3ZitXbU5jWVV5MkJZeTkwQTZsOGFRRUhDUmNwaVNCQ0p2WVZH?=
 =?utf-8?B?bHZHdUpEb3RGS29LcitVVXNYcmpreVloTDlDV0F1RDcvbkdXNEg1TDhxTXFu?=
 =?utf-8?B?dTJDVlFEU3QyTUs4UDNLeHFXUWMvcUdqVTJoN3JLWktMaXQyNGhkcVcrY1Rk?=
 =?utf-8?B?T2pHMWR4aXpWNERZMzZZTVgrbGRqN0cvZUdIZjdjWEduTWpVMExGS1c0UVlk?=
 =?utf-8?B?eTQvaEJKRWNkc2xzaFdIalJwQmtwVkQ5UGVkZFg0SFpadndoS3gybnhwZDcv?=
 =?utf-8?B?WnNGNnlFREdVc1R1dldZNGprSGYyb2RCRVlwOHVoTnowYjlVRlJQSHBpUmhW?=
 =?utf-8?B?d1ZYUkhNd3Q2QzlzbXA4K2tkdUdjQnRvMVJyalUyOXdmOHlDOFI4eHlKZ0sz?=
 =?utf-8?B?RGRtQzU5aFV5aEs3WGtlbDZhb2hzcm4rNVAydDMyaGNNUVZwd1BlY2NWK3Va?=
 =?utf-8?B?SWpzbERDTVZOcFZidk1vZFRQT0Jac3p0M0dFWnMzWVdZVWpJb2FRcnQvMmFY?=
 =?utf-8?B?VG1pMTRQNmdOSnAyV2x3UlJUN0hJalRDTXlaRG1tcjd2Y210Yjl3K1VIQTk5?=
 =?utf-8?B?RE5qYzZ4bzJ3NEwwYXN5bCtFT085UlhSZkxacGJzbFVZWXBqRUN3ZW5sTXMv?=
 =?utf-8?B?RjIzSEZ6RlNrbSsyWVJHUFU3M3VQT0hPU1pMcEszeEsyVVN0ZW0wTmRSNVpv?=
 =?utf-8?B?UDlXT0lRWjRWL3BueFQ2amNGZS9QMml6UVE2emR1MEhOL0k2Tk5qOVZ2L29p?=
 =?utf-8?B?R084d2Vha084RG1ZRlc0L1U5VXdKdHdXTmVHZDdwVjFYWXJWZkIwV2pUWU81?=
 =?utf-8?B?azdMbVVRMlNkRnRSVTJnK05HMWJFREpySGJjazcrK2JIVGFtODBiREdEcUZn?=
 =?utf-8?B?TWVaN2w3K3plbllEcldIRTBmRkNzRFFSMFRLM3MzQXlDcFBwWUFQS3FKYlNv?=
 =?utf-8?B?SkZxZlQ4Y25UWDB5THZWUVdXZ2xTdlhFQWxqMXhLamd4Y3FSTURwb0J1Q1Vx?=
 =?utf-8?B?MWpibzA2c3NyRFFreW5jYmFON2thRFZ4T0V0aW5Ic2d3V0tXaHpFTCtXYU44?=
 =?utf-8?B?MHB4Y0pNU3BpYmgzSW1zaDJNcVk1ZUcvQTJOc2szTWZYU0ZMRUxBOFY3M0NQ?=
 =?utf-8?B?Tit4MDdKc29LUWNwbnYveUY4NE1wVGl6L003RjlGQmwrRnl5UXlLZUtFVjBk?=
 =?utf-8?B?Sm5iUEJOUTJkbmIvcElRT1F5K2VJV1l0T0pneUU3cjJmMFFwaXhSbCtmQnRi?=
 =?utf-8?B?WlB0ZWRGSG9VYlQrVGQzZ3gwdjlCMDBtTDJUSnVJVHNjMzdXeWNOOHhFZ1Yz?=
 =?utf-8?B?YjRuNVhiOFIxQTZiaWR0ZWZueUV0dlVEOEwzR002QWhKczc3bzJ3TW4yQi81?=
 =?utf-8?B?Z3h2eFgrNCs0OVFtdE0vZm9DY2JzMlBkSSsrRzZRYjJxenBKVThlWElvbk4v?=
 =?utf-8?B?WUdjcWx4alNGMzBEdlp6KzhQcGxkNk1VdVhNKy9qSEkxZzFFdVZvT1JZTjln?=
 =?utf-8?B?NFlETWZocXd3eE1wL3BUNjZZMGhZYWp2TjFZTHR2Nkk1QkQyOGJKZldIMXha?=
 =?utf-8?B?bjc2Skd5OGZyZkVrUHFYMnZibEZQTldaNk43YmpueVpYVnBpTmtyelNINDdj?=
 =?utf-8?B?b0wyUGllYXp0N2dHSG90R1ZMZ21pQWlxak45ckkxV005YUVRck9rTW1veUlO?=
 =?utf-8?B?ZVEvNUMwSkQvT1lxa3pKWkVzTEh2Y0hhN2ZnOC9nbmNRZHk1VXhnL1VJbXJZ?=
 =?utf-8?B?T0NZc3NXQ3hiWjRHeXJOVFQzc2dDa3FRdVFkcGdkWjgvWStqaS9KYTAvOXNr?=
 =?utf-8?B?QitOTkt2cWQ3YTFGb2pHK1F3a2F4aHR2SEl5VUQ1MXNkNFdNdXZRN3F1R3BH?=
 =?utf-8?B?cFBPTi9LUXA5MWJnU2o2dVdZNDExRjljZHhnY0pBbDdqemlxRDhDeWMzdTlZ?=
 =?utf-8?B?cmlJenpxYnoxcUFKMEtTemJKNjlIYWxVVHcwN1JMUkdhdzVKTDVnbzlTUUZo?=
 =?utf-8?B?aXZORm91U3ZQK1I1SWk0Wlk1R2Y0STY3UExDQjBFU0N2bmhxdkpnUGMxM05p?=
 =?utf-8?B?LzN6R2JsU01veDNZZVdvY0VVemk1VEp1Nktlb0VwT1JGSkgvRDBzLzNtV3ds?=
 =?utf-8?Q?wYwz39X7nkqD7T7nUOBk1rO4f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146cd702-5077-46b6-18f2-08dc86333dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 14:16:21.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2o0cKQg/mk/9vLaqGsSh3XT6ltSpPWKi/GsV/LuUnfsohOSCzpdRxk7ltcqfko8K7CLk9drRgOkMwgbCYcIujNwehOOz0NZfxZE78XsiNFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gVXBhZGh5
YXksIFRlamFzDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDgsIDIwMjQgMTA6NTUgUE0NCj4gVG86
IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+OyBpZ3QtDQo+IGRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGUgTWFyY2hp
LCBMdWNhcw0KPiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BB
VENIIFYzIGktZy10XSB0ZXN0cy94ZV9leGVjX3RocmVhZHM6IE1ha2UgaGFuZyB0ZXN0cyByZXNl
dA0KPiBkb21haW4gYXdhcmUNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5j
b20+DQo+ID4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMjQgNDowOCBBTQ0KPiA+IFRvOiBV
cGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGlndC0NCj4gPiBkZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgQnJvc3QsIE1hdHRoZXcNCj4gPiA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBEZSBN
YXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCBWMyBpLWctdF0gdGVzdHMveGVfZXhlY190aHJlYWRzOiBNYWtlIGhhbmcgdGVzdHMN
Cj4gPiByZXNldCBkb21haW4gYXdhcmUNCj4gPg0KPiA+IE9uIDQvMTAvMjAyNCAwMjo0MCwgVGVq
YXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gPiBSQ1MvQ0NTIGFyZSBkZXBlbmRlbnQgZW5naW5lcyBh
cyB0aGV5IGFyZSBzaGFyaW5nIHJlc2V0IGRvbWFpbi4NCj4gPiA+IFdoZW5ldmVyIHRoZXJlIGlz
IHJlc2V0IGZyb20gQ0NTLCBhbGwgdGhlIGV4ZWMgcXVldWVzIHJ1bm5pbmcgb24gUkNTDQo+ID4g
PiBhcmUgdmljdGltaXNlZCBtYWlubHkgb24gTHVuYXJsYWtlLg0KPiA+ID4NCj4gPiA+IExldHMg
c2tpcCBwYXJhbGxlbCBleGVjdXRpb24gb24gQ0NTIHdpdGggUkNTLg0KPiA+IEJ1dCB3aHk/IElu
IGEgcmVhbC13b3JsZCBzY2VuYXJpbywgdGhpcyBzaG91bGQgbm90IGhhcHBlbi4NCj4gPg0KPiA+
IEFzIHBlciBlYXJsaWVyIGNvbW1lbnRzLCBiZWZvcmUgY2hhbmdpbmcgdGhlIHRlc3Qgd2UgbmVl
ZCB0bw0KPiA+IHVuZGVyc3RhbmQgbW9yZSBhYm91dCB3aGF0IGlzIGFjdHVhbGx5IGhhcHBlbmlu
ZyBhbmQgd2h5LiBUaGUgcHJldmlvdXMNCj4gPiBkZXNjcmlwdGlvbnMgb2Ygd2hhdCBpcyBmYWls
aW5nIGFuZCBvbiB3aGF0IHBsYXRmb3JtcyBkbyBub3QgbWFrZSBzZW5zZS4NCj4gPg0KPiA+IEFs
c28sIHRoZSByZXF1ZXN0IGZvciBtb3JlIGV4cGxhbmF0aW9uIHdhcyBub3QganVzdCBmb3IgdGhl
IGVtYWlsDQo+ID4gZGlzY3Vzc2lvbiBidXQgdG8gYWN0dWFsbHkgYWRkIHRoYXQgZGVzY3JpcHRp
b24gaW50byB0aGUgdGVzdC4gSSBldmVuDQo+ID4gZXhwbGljaXRseSBhc2tlZCBmb3IgdGhhdCBp
biBvbmUgb2YgdGhlIHJldmlldyBlbWFpbHMuIFRoZQ0KPiA+IHhlX2V4ZWNfdGhyZWFkcyBleGVj
dXRhYmxlIHJlcG9ydHMgMTE0IHNlcGFyYXRlIHN1YnRlc3RzLCBub25lIG9mDQo+ID4gd2hpY2gg
aGFzIGFueSBkb2N1bWVudGF0aW9uIGF0IGFsbC4gVGhlIGNvbW1lbnRzIHdpdGhpbiB0aGUgY29k
ZQ0KPiA+IGJhc2ljYWxseSBjb21lIGRvd24gdG8gc2F5aW5nICd3YWl0IGZvciBjb21wbGV0aW9u
JyBpbW1lZGlhdGVseSBiZWZvcmUNCj4gd2FpdGluZy4NCj4gPg0KPiA+IEF0IG9uZSBwb2ludCBN
YXR0aGV3IEJyb3N0IHN0YXRlZDoNCj4gPiAgPiBJZiB0aGUgSEFORyBmbGFnIGlzIHNldCwgMSBv
ZiB0aGUgZXhlYyBxdWV1ZSBwZXIgdGhyZWFkIHdpbGwgaW5zZXJ0DQo+ID4gYSAgPiBub24tIHBy
ZWVtcHRhYmxlIHNwaW5uZXIuIEl0IGlzIGV4cGVjdGVkIHRoZSBHdUMgd2lsbCByZXNldCB0aGlz
IGV4ZWMgID4NCj4gcXVldWUgb25seS4NCj4gPiBDcm9zcyBDQ1MgLyBSQ1MgcmVzZXRzIHdpbGwg
YnJlYWsgdGhpcyBhcyBvbmUgb2YgdGhlICA+ICdnb29kJyBleGVjDQo+ID4gcXVldWVzIGZyb20g
YW5vdGhlciB0aHJlYWQgY291bGQgYWxzbyBiZSByZXNldC4NCj4gPg0KPiA+IFRvIHdoaWNoIG15
IHJlcGxheSB3YXMgdGhhdCBpZiBvbmx5IG9uZSBzcGlubmVyIGlzIG5vbi1wcmUtZW1wdGlibGUN
Cj4gPiB0aGVuIGFsbCB0aGUgb3RoZXIgc3Bpbm5lcnMgc2hvdWxkIGdldCBhdXRvbWF0aWNhbGx5
IHN3aXRjaGVkIG91dA0KPiA+IHByaW9yIHRvIHRoZSByZXNldCBiZWluZyB0cmlnZ2VyZWQgYW5k
IHNob3VsZCB0aGVyZWZvcmUgbm90IGJlIGtpbGxlZC4gVGhlDQo+ICdnb29kJw0KPiA+IHF1ZXVl
cyBzaG91bGQgc3Vydml2ZSBhbmQgYmUgdG90YWxseSBvYmxpdmlvdXMgdG8gdGhlIHJlc2V0IG9j
Y3VycmluZy4NCj4gDQo+IEFzIGZhciBhcyBJIGFtIHNlZWluZyB0ZXN0IGNvZGUsIGVhY2ggc3Bp
bm5lciB0aGF0IGlzIGNyZWF0ZWQgaXMgbm9uLQ0KPiBwcmVlbXB0aWJsZSBpbiB0aGlzIHRlc3Qu
IFNvIGFsbCBzcGlubmVycyB3aWxsIG5vdCBnZXQgYXV0b21hdGljYWxseSBzd2l0Y2hlZCBvdXQN
Cj4gcHJpb3IgdG8gcmVzZXQgYW5kIGhlbmNlIHdlIHdpbGwgc2VlIHRlc3QgZmFpbHVyZSBhcyAn
Z29vZCcgcXVldWVzIHdpbGwgYWxzbyBub3QNCj4gc3Vydml2ZSBvbiByZXNldC4gQEJyb3N0LCBN
YXR0aGV3IHBsZWFzZSBoZWxwIHRvIGNvbmZpcm0gYmVoYXZpb3VyLiBXZQ0KPiBuZWVkIHRoaXMg
dG8gbW92ZSBmdXJ0aGVyIHRvd2FyZHMgZmluYWwgc29sdXRpb24uDQoNCkFueSB1cGRhdGUgaGVy
ZSBwbGVhc2U/IEBTdW1tZXJzLCBTdHVhcnQgRllJDQoNClRoYW5rcywNClRlamFzDQoNCj4gDQo+
IFRoYW5rcywNCj4gVGVqYXMNCj4gPg0KPiA+IFNvIGVpdGhlciB0aGUgYWJvdmUgZGVzY3JpcHRp
b24gaXMgaW5hY2N1cmF0ZSBhbmQgYWxsIHRoZSBzcGlubmVycyBhcmUNCj4gPiBhY3R1YWxseSBu
b24tcHJlLWVtcHRpYmxlLiBJbiB3aGljaCBjYXNlLCBpZiB0aGF0IGlzIG5vdCB0aGUgaW50ZW50
aW9uDQo+ID4gb2YgdGhlIHRlc3QgdGhlbiB0aGUgY29ycmVjdCBmaXggaXMgdG8gbWFrZSB0aGVt
IHByZS1lbXB0aWJsZSBhbmQgaXQNCj4gPiBzaG91bGQgdGhlbiBwYXNzLiBPciBpZiB0aGUgZGVz
Y3JpcHRpb24gaXMgYWNjdXJhdGUsIHRoZW4gdGhlIHRlc3QgaXMNCj4gPiBjb3JyZWN0bHkgZmFp
bGluZyBiZWNhdXNlIGl0IGhhcyBmb3VuZCBhIGJ1ZyB3aGljaCBuZWVkcyB0byBiZSBmaXhlZC4N
Cj4gPiBFaXRoZXIgd2F5LCB0aGUgY29ycmVjdCBzb2x1dGlvbiBpcyBub3QgdG8gc2ltcGx5IHNr
aXAgdGhlIGZhaWxpbmcNCj4gPiBjYXNlIGFuZCBoaWRlIGl0IHVuZGVyIHRoZSBydWcuDQo+ID4N
Cj4gPiBKb2huLg0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBJdCBoZWxwcyBpbiBmaXhpbmcgZm9s
bG93aW5nIGVycm9yczoNCj4gPiA+IDEuIFRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUgZnVuY3Rpb24g
dGVzdF9sZWdhY3lfbW9kZSwgZmlsZSwgRmFpbGVkDQo+ID4gPiBhc3NlcnRpb246IGRhdGFbaV0u
ZGF0YSA9PSAweGMwZmZlZQ0KPiA+ID4NCj4gPiA+IDIuVGVzdCBhc3NlcnRpb24gZmFpbHVyZSBm
dW5jdGlvbiB4ZV9leGVjLCBmaWxlDQo+ID4gPiAuLi9saWIveGUveGVfaW9jdGwuYywgRmFpbGVk
IGFzc2VydGlvbjogX194ZV9leGVjKGZkLCBleGVjKSA9PSAwLA0KPiA+ID4gZXJyb3I6IC0xMjUg
IT0gMA0KPiA+ID4NCj4gPiA+IFYzOg0KPiA+ID4gICAgLSBDaGVjayB2aWN0aW1pemF0aW9uIHJl
c2V0IGRvbWFpbiB3aXNlIGlycmVzcGVjdGl2ZSBvZiBwbGF0Zm9ybQ0KPiA+ID4gLSBMdWNhcy9N
YXR0Ug0KPiA+ID4gVjI6DQo+ID4gPiAgICAtIEFkZCBlcnJvciBkZXRhaWxzDQo+ID4gPg0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT4NCj4gPiA+IC0tLQ0KPiA+ID4gICB0ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYyB8IDQz
DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiA+IGIvdGVzdHMv
aW50ZWwveGVfZXhlY190aHJlYWRzLmMgaW5kZXggODA4Mzk4MGY5Li4yNGVhYzM5ZGUgMTAwNjQ0
DQo+ID4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYw0KPiA+ID4gKysrIGIv
dGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiA+IEBAIC03MTAsNiArNzEwLDI0IEBA
IHN0YXRpYyB2b2lkICp0aHJlYWQodm9pZCAqZGF0YSkNCj4gPiA+ICAgCXJldHVybiBOVUxMOw0K
PiA+ID4gICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBib29sIGlzX2VuZ2luZV9jb250ZXh0c192
aWN0aW1pemVkKF9fdTE2IGVjbGFzcywgdW5zaWduZWQgaW50DQo+IGZsYWdzLA0KPiA+ID4gKwkJ
CQkJICBib29sIGhhc19yY3MsIGJvb2wgbXVsdGlfY2NzLA0KPiA+ID4gKwkJCQkJICBib29sICpj
Y3MwX2NyZWF0ZWQpDQo+ID4gPiArew0KPiA+ID4gKwlpZiAoIShlY2xhc3MgPT0gRFJNX1hFX0VO
R0lORV9DTEFTU19DT01QVVRFICYmIGZsYWdzICYgSEFORykpDQo+ID4gPiArCQlyZXR1cm4gZmFs
c2U7DQo+ID4gPiArCWlmIChoYXNfcmNzKSB7DQo+ID4gPiArCQlyZXR1cm4gdHJ1ZTsNCj4gPiA+
ICsJfSBlbHNlIGlmIChtdWx0aV9jY3MpIHsNCj4gPiA+ICsJCS8qIEluIGNhc2Ugb2YgbXVsdGkg
Y2NzLCBhbGxvdyBvbmx5IDEgY2NzIHRvIHJ1biBIQU5HIHRlc3QqLw0KPiA+ID4gKwkJaWYgKCpj
Y3MwX2NyZWF0ZWQpDQo+ID4gPiArCQkJcmV0dXJuIHRydWU7DQo+ID4gPiArCQkqY2NzMF9jcmVh
dGVkID0gdHJ1ZTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gZmFsc2U7DQo+
ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gICAvKioNCj4gPiA+ICAgICogU1VCVEVTVDogdGhyZWFk
cy0lcw0KPiA+ID4gICAgKiBEZXNjcmlwdGlvbjogUnVuIHRocmVhZHMgJWFyZ1sxXSB0ZXN0IHdp
dGggbXVsdGkgdGhyZWFkcyBAQA0KPiA+ID4gLTk1NSw5ICs5NzMsMjAgQEAgc3RhdGljIHZvaWQg
dGhyZWFkcyhpbnQgZmQsIGludCBmbGFncykNCj4gPiA+ICAgCWJvb2wgZ28gPSBmYWxzZTsNCj4g
PiA+ICAgCWludCBuX3RocmVhZHMgPSAwOw0KPiA+ID4gICAJaW50IGd0Ow0KPiA+ID4gKwlib29s
IGhhc19yY3MgPSBmYWxzZTsNCj4gPiA+ICsJYm9vbCBtdWx0aV9jY3MgPSBmYWxzZSwgaGFzX2Nj
cyA9IGZhbHNlLCBjY3MwX2NyZWF0ZWQgPSBmYWxzZTsNCj4gPiA+DQo+ID4gPiAtCXhlX2Zvcl9l
YWNoX2VuZ2luZShmZCwgaHdlKQ0KPiA+ID4gKwl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkg
ew0KPiA+ID4gKwkJaWYgKGh3ZS0+ZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1Nf
UkVOREVSKSB7DQo+ID4gPiArCQkJaGFzX3JjcyA9IHRydWU7DQo+ID4gPiArCQl9IGVsc2UgaWYg
KGh3ZS0+ZW5naW5lX2NsYXNzID09DQo+ID4gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFKSB7
DQo+ID4gPiArCQkJaWYgKGhhc19jY3MpDQo+ID4gPiArCQkJCW11bHRpX2NjcyA9IHRydWU7DQo+
ID4gPiArCQkJZWxzZQ0KPiA+ID4gKwkJCQloYXNfY2NzID0gdHJ1ZTsNCj4gPiA+ICsJCX0NCj4g
PiA+ICAgCQkrK25fZW5naW5lczsNCj4gPiA+ICsJfQ0KPiA+ID4NCj4gPiA+ICAgCWlmIChmbGFn
cyAmIEJBTEFOQ0VSKSB7DQo+ID4gPiAgIAkJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KQ0KPiA+ID4g
QEAgLTk5MCw2ICsxMDE5LDE4IEBAIHN0YXRpYyB2b2lkIHRocmVhZHMoaW50IGZkLCBpbnQgZmxh
Z3MpDQo+ID4gPiAgIAl9DQo+ID4gPg0KPiA+ID4gICAJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBo
d2UpIHsNCj4gPiA+ICsJCS8qIFJDUy9DQ1Mgc2hhcmluZyByZXNldCBkb21haW4gaGVuY2UgZGVw
ZW5kZW50IGVuZ2luZXMuDQo+ID4gPiArCQkgKiBXaGVuIENDUyBpcyBkb2luZyByZXNldCwgYWxs
IHRoZSBjb250ZXh0cyBvZiBSQ1MgYXJlDQo+ID4gPiArCQkgKiB2aWN0aW1pemVkLiBBbHNvIGlu
IGNhc2Ugb2YgbXVsdGlwbGUgQ0NTIGluc3RhbmNlcw0KPiA+ID4gKwkJICogY29udGV4dHMgcnVu
bmluZyBvbiBvdGhlciBDQ1MgZW5naW5lIGFyZSB2aWN0aW1pemVkLg0KPiA+ID4gKwkJICogc28g
c2tpcCB0aGUgY29tcHV0ZSBlbmdpbmUgYXZvaWRpbmcgcGFyYWxsZWwgZXhlY3V0aW9uDQo+ID4g
PiArCQkgKiB3aXRoIFJDUyBhbmQgb3RoZXIgQ0NTLg0KPiA+ID4gKwkJICovDQo+ID4gPiArCQlp
ZiAoaXNfZW5naW5lX2NvbnRleHRzX3ZpY3RpbWl6ZWQoaHdlLT5lbmdpbmVfY2xhc3MsIGZsYWdz
LA0KPiA+ID4gKwkJCQkJCSAgaGFzX3JjcywgbXVsdGlfY2NzLA0KPiA+ID4gKwkJCQkJCSAgJmNj
czBfY3JlYXRlZCkpDQo+ID4gPiArCQkJY29udGludWU7DQo+ID4gPiArDQo+ID4gPiAgIAkJdGhy
ZWFkc19kYXRhW2ldLm11dGV4ID0gJm11dGV4Ow0KPiA+ID4gICAJCXRocmVhZHNfZGF0YVtpXS5j
b25kID0gJmNvbmQ7DQo+ID4gPiAgICNkZWZpbmUgQUREUkVTU19TSElGVAkzOQ0KDQo=
