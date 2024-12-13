Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286ADE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 15:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC55510E449;
	Fri, 13 Dec 2024 15:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ge7M4t8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B72F10E449
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734103515; x=1765639515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NK4jSpPmzdp2SVnqHIGAbE5mqjuYkN1q9jHckWu/ooc=;
 b=Ge7M4t8/ws4Bi9cZV42kJWvqyTMcEkaaCLEgE1sp7KjZq17TFO8JWVjq
 pStxmlG/3fvZNWC4FCQvnySHKXWhVgtk0JHozD9vF8gclVqYVRgmhkCrY
 p+mplggZcuziK3uBSWyhr+s41hC4hE3od63daR2d/6V6RpO0MRpJmDWk0
 LI5F6LaSVWkMvgm2B8l2txjRSTH1eBRjVyqYrATPtoQg5HHGCMaGHeWCj
 tvx2HIDTDgY56N8cu9JcedYTgpfnl1w0peivlQOh3tPKyyo9mGLsdNyPN
 y38GAP/FEcy/oqU0WUQbXpBRhhH6Dm67qEY8cK3YQRszqBEDYI2UPUAGn w==;
X-CSE-ConnectionGUID: jwtWF7nCRm+8BjkVmrSQJQ==
X-CSE-MsgGUID: rngiv1SySu2niQoH+38Isg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34699808"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34699808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:25:15 -0800
X-CSE-ConnectionGUID: btHP7TbwTKO9XKUmXTPzOg==
X-CSE-MsgGUID: mw8XkxI+TyC8AtwLufX+ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127369625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 07:25:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 07:25:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 07:25:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 07:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyXaMZrpyslqtqm7zIuOBtOyle0NpSYka2eAXwJeDWvcLfd39rGa3Jg3f/YBiXxlg7JJ9txPOKOIvJ6gQhdCjuDn5tUeAOQ50/qa0wOZL/pgnJFU+ERi0P4Q64lg7eH5IeN+99dHNcGfQNDlQlrTt2nAIYuZ1ZLW6qWVC7DooWpwb/cbP6MND0ux3b5Ddyx3xIM2d9/drAaSWf7YDpZvWMVfOamdwknpuYw6u9e4UVGtdQQ42v6NEIO45NYhTvaJcvzIihhBUSIfNbdAniyiwCVW16JCsmX+/QJ55yWu37UHqtkMIWuKYaR1lSA8HmFCdXmatONxg1FJgajArqIvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK4jSpPmzdp2SVnqHIGAbE5mqjuYkN1q9jHckWu/ooc=;
 b=wo8nKEJFhqj2OZxlZVMkEjR5WN5IxNlE1Cxhh1ysGMFMef9KwuoQS28AiDLS6mGKMTYr4yqfck+k+D6iG7Z/odnaJNdukShyKBnQIVC0hAq3WYgeteEwFCn86cxhP9laP6EkO9NSaEE1CeLk4CX5g0Uf7ilXbQ9b8xg6Q/scGm05iF34rd/r6Lpmaslf/Wu3JQCMf2C1e0m4XhxxF5ue1F4KHZkIVcgiiNUeuZcuuk4Y5jJCk5Oe7b4Y40PVFt+9LrJj5JtzuvX3i8+FmBoT8/yCfQb5yBAc+klUVjPAxaaSy1vwMsLbo6bJyK2vQlXep0aKKScVIJ5jQY6lpjhlcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Fri, 13 Dec 2024 15:24:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 15:24:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oCAAAQoAA==
Date: Fri, 13 Dec 2024 15:24:59 +0000
Message-ID: <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
In-Reply-To: <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: eaea5c2f-5650-4ccf-6fdb-08dd1b8a4e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TWFDR1FGaXdKOWZFUkttUXJONjltYXdLcUFJWmhVbFJpSVVTbEhUTmVkSFI0?=
 =?utf-8?B?Q0RzV1o1a1FrWGYyaHRTTFZNZUh0b2Z1dUdOSkI2UWl6dmd1bjFYemlTdTRX?=
 =?utf-8?B?eWtoYnc4V2xBdFFPRUNHaFFJZjkzK2J4YXRuUUhTZzc4R1RxdUY2eUFGU1Ns?=
 =?utf-8?B?VkVLUThyYmFaeENwTEpmQjB4WGQ0dE1KaUduWlFGM05DUkY4VEp1aURTS1Zn?=
 =?utf-8?B?Z2ovNHN0YkRMWTJVVEJReWpXWWhiOEoxWEFta3BiTGZNRjNBV3p1ZGF6ejNo?=
 =?utf-8?B?K0ZReUIwaXR0U2pjVGphU2k2WUVDRFJNalZPMURmblh0RjdBNko5QzNJT2Ra?=
 =?utf-8?B?UlIyYTNqa3JzTTFKSXpCNDJTSC92NlAvYWRRVFAvQUNvT3psYk5UdVllZnhp?=
 =?utf-8?B?SjVRODE3QkpVUVJRQmNmQ3o1UVlJTmFYSjNyQmhwTEg3N0dVVVFWSllrRkRW?=
 =?utf-8?B?S3dVWVV1R011eWdDTW44TzhIMTRIUDd2MmVGZnpYTi9zbkFKdkc5WEplMTZ0?=
 =?utf-8?B?eDh5SzRNMGFIc0M3SnlWWmFoSmZ1RThSTVhkMkpRbVFuN0JqVEk0WmwyRnlG?=
 =?utf-8?B?NytIMFpHaGZzaEdoN1k2RTY0QmR2dGdBNnl6Q2FTMDJyNzk3WGQrbXFxcXFM?=
 =?utf-8?B?dHN1MklnNmdvdkN6cFFvRkVyZmpYNUl2QXlJamxUVjlhM1E1YWUxNXZKWmM4?=
 =?utf-8?B?Tmh2QkQyd0lVdVdCY0Z0MXBhTFpMWVVzODVDV3NRREtMcjNwTUVRbXlhc2hI?=
 =?utf-8?B?U3BITURSemRpQzRra0VJZ2hpcEZQY3pZaGF0MmRaN1BvMGRyWlk2MGJvOWNh?=
 =?utf-8?B?eGpTM0kxT1dmaTI2TExuMGpaeVIrQ1VEWlpUVGxURFlRUHB4Y21CRDVOUjFF?=
 =?utf-8?B?UUk3WlN3dkgyMEwwS0xTaVNDMjVXbWJoUXQ4RUUzU0Z3dndlaW5WdVNJaG9a?=
 =?utf-8?B?VHJGWUdiSEZZb0M5SWNidGVzRmorNlRCMG5nZGV6SW9DVHR6d3NScGg0ZEky?=
 =?utf-8?B?d2FpTVppbnpxU1pLSlF1dGUyQVJMc2ZBWVQrRUVCc1pzQytCTnhxTXpXNUMy?=
 =?utf-8?B?N3dKSWNUZDJzbVVTeHFNb3VvTll2S2QvVTJub1IyZEVNYTExRHBaa0h0cHFI?=
 =?utf-8?B?SkZFcXhFRSszYk9JcVo5c29uU24reDFicjRsbzBiZnZYNjkrdkwzSXpWT2dJ?=
 =?utf-8?B?Z3B1ejVGUXlsVVBpT3FvY1E5eThYMElMbWZxcHZBbFhuNTJSRFdTVENidk1D?=
 =?utf-8?B?amdIMTZES055ZVljLy9QclQydkNpVG9Mb3kvNmc2UE5ONDhiK2hXcStDY1py?=
 =?utf-8?B?cERlQklBekoyUHNnWXdLQlN3U1R3K2xHazU4Q3cvaUxWaGVCNmtVQ1RkQ2Ey?=
 =?utf-8?B?NW9RdTV2UHJBM0hvU01jcVdMUXZ6OXhNU0NpWnRJWWVmNjZuOW1YTUd0eTh0?=
 =?utf-8?B?ZndhcWFDZmovT1NvTUJsQ2hjMytDVlhrUXlOUXBqUmtrL0JZWkErK1hOY3dy?=
 =?utf-8?B?V1RFMUE0Sk5hSDdPRTJQaVNyWHI5MGFmUlZQWlQ2VnRSWkE0MjExNU01N2hm?=
 =?utf-8?B?WU92eEFrbnJsS1FaZUdZd2tlSWg4RTBrT1lYSzNPTWZEa3lGQWdOWkc5TFI2?=
 =?utf-8?B?bk9EMFE0L2o5MWtrRmxmelhsK2s0OUd1ZUMyZGMrb2xjaEF2UENnMElybUJD?=
 =?utf-8?B?U0lsbGl1YUN3K1pLMXU1K3NxRm1EbFFXNFFIVGlJc1owUjBSOWw5V3FtOGtV?=
 =?utf-8?B?OWhMYy9SRUg4TmJnYndCL04wUU5JU0w0S2VReGhOWUIxKzZzQzlnVDZTbXBG?=
 =?utf-8?B?N2x5emFCS0tQM09ydU9VVmdFL2ZzWjllb01lbjlkYUE3MVBvMWJYNDBFdUhl?=
 =?utf-8?B?YVdpNVRoS0tkSHB1Zlc2N2tDTEVCSEU3Sm1laXJkMFZaekE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVFZajRnRmNRWHllTWpqaU9TaldzdE5EenZpMFVNZksvdHgyVm5RclFyVUV6?=
 =?utf-8?B?TzNyZkxNQVlDcHlVbm9KSGNxRE5Id1c5UmJ0cExBM1l6a0JCejJ6dnI2SUxN?=
 =?utf-8?B?bDRmL0hSRzg3Ni8vdEZheW1FcnF6NGEzNVNSYjloNmFsbzNHL3dXa0dobkJp?=
 =?utf-8?B?aXI2R2hlRWs2b1E1eTdtTWtPZk9VeWxpc2tSTXhHNjRmbFZ0RnlhZUhkUUU3?=
 =?utf-8?B?anlGZUJ6aFRRcWJUc1d5dHJ3WGY0Y2tNWU9taTV0VXVYNTBPeWpqaGd5b0h5?=
 =?utf-8?B?ZnFRcytqaThLRGVHeGRsZjdJd2FhTG8raWliSkFMb3R3bW5NM0VjQmV4K04w?=
 =?utf-8?B?ZFVML3pDdzVReVhQcCtzTTM1VUY3WkMvTzQwR28wRWNOQjlsbStFZ1NFcTBu?=
 =?utf-8?B?bjlsczdmL2ZrK0dSQzA3UmtNcVRsOXIrcUFVWmUyNi85WnFMUzRSbWFPRllh?=
 =?utf-8?B?SlVFNkdCWFJUQlV6aWtCNUduRmhueENTYnpaNGZGMDhhT1NaUVI3U1hOOUxK?=
 =?utf-8?B?ZGxhM0hYWlV4bUVWTGZORUMwbi90RTRTOHRJSUdOb3llajlXNFR3SnFJb0ta?=
 =?utf-8?B?R1loUWlpbmkreVpGSlpZS1duRDVEU3VXblQ5RHhUakFLVXk5K09kUWhMZzFT?=
 =?utf-8?B?VlA2MXRINDA4SVZTL0ZLUVZjYWhPNGJvOEl4a0pKM1ZuTWFxaVlDU29aSnBp?=
 =?utf-8?B?Zk9vb3YxSjE3WDRDcElSSXNyTGZxMWZnTTU5N1ZtYWFReS9hdWdGNlNnbTJi?=
 =?utf-8?B?bkcxYm1wclFCbWlNTDRkZktGNXRoaElwOEtWUzBZb21CYm5zVVowemMxUkYx?=
 =?utf-8?B?UFVzQ1FtbWFab3BZUFUyRWgyOHVLbjZramJCTUFwVFhmNlpZTFlDWUxnZ3lz?=
 =?utf-8?B?aGdUUzh0R3NwODdMcFFlbTZveXpsS0xOck1scXJyMEtQUW1aMEpiNWtEYnp0?=
 =?utf-8?B?TDZLc2V5RWo2eXlZSm56dThuT3pOdkJocnhVTVVjY2xiNDQzZ2Vhay9FdEFx?=
 =?utf-8?B?MFl0N1Z5RDQ4RDhMNWZKUjgwcy9mRUZyaGhQcGpLaytoYi83NzA1NFcwNHR5?=
 =?utf-8?B?TE1ERXc0YzhwNXVkQnQwWGFDV2s5WnN3VTQ0dVVJeit2cUgzczRqZVhjeEpr?=
 =?utf-8?B?QWFGbENSOU9qd3UxWDlqaTRybUdVNlBybHJXQnNucCtzWmxpYW5pbTVVeFQ4?=
 =?utf-8?B?RWk4SkFnYmFtMlpLVFlWQTFEUURwcjl1OU1NVEY2M0JTT2xrcWUrR016Unc1?=
 =?utf-8?B?cHkzOXB5TE8rYWY0R0l5S3VnTkkyTkpvSXZPNHd4ellXQVV1VXFtM3lzV21R?=
 =?utf-8?B?NUZ1U21kY2Q5MC9TNWd5V2tOZWUwQ3ZHVUptb2N5U3VvUjlWWFRnemIrc00x?=
 =?utf-8?B?TEpIcEJvOExhWC9zU0Y5My9TYVhORlJSY2xVSEhnNXh3VEtla3VjdzZuR3o2?=
 =?utf-8?B?RDRLOE5vMEJHRXNzVGlwdkxUM1AySmNRQ01YeU13SmNSMmVHUzByUnZVQzFh?=
 =?utf-8?B?d2FQZCtwUXBob3BzSGxBc3JxM1luaVlBRUNJMGJ5L0hvZk1qZUtOa1JRNW1q?=
 =?utf-8?B?RnFVcmpOOEtDR2xRMUp4bHA2enlRa0IyNUxxVXEvc1Z6TnRua1duZ0RONFlM?=
 =?utf-8?B?Y21vNXdDMzY4RWVNUHNlVi9Wb3dnREtQcFp1aEJVNmRxZTNENjRrZkxIWFov?=
 =?utf-8?B?R21OTys2ZlZlUEtiN2w5eHA3SVErS1NDL1JXNFJDa3YrK1I0TkRWOEk5eVhw?=
 =?utf-8?B?ZjQyeXVKTGx6a0d4M1FiMC9IWmZjd3A5OWRiL0Rla1l4dTEzWlVSVjI5dGZE?=
 =?utf-8?B?UTg3a0lOZzR1cnl6OEZ0d3pXNGpsdkdodG9WUm5EV002TXlWSkhhZzFEcFhq?=
 =?utf-8?B?YkFUVllhc1FiS3ZvRWkzS3p0eGYyUUNwR2J2NWVKbXRsaTYweWd5bjB4NFRx?=
 =?utf-8?B?Rlp6TkV4V1NyaW1lZUNmMERvKzRlalVXRXJYU2N0YzRObkFDRnE2UGxvNmUw?=
 =?utf-8?B?MXpiTkI4QWF2RWxiUVZtY1RpUGx1eEhxNWQ3ZGluOWcxeWxlK0UyWlZLMzlQ?=
 =?utf-8?B?V01zQktpbm5ORFA3UUpTTUtibFJPT3EvMDE4MjZDZmZNSU5SeStUMHJOelpW?=
 =?utf-8?B?R0NGTWp3YWoweHFoZ01OeDVGUUdjTzlYbFJEUUFKM2Q2UE5iZGpIUitKWXZ5?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A05C1CF414AA5B4794F348C7ED7AFCF2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaea5c2f-5650-4ccf-6fdb-08dd1b8a4e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 15:24:59.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNrfbosPTbrxB7mQC4imYXcjl0N6OTKBlEhrD6gO1lE8PVzZi5pUzkmohum52N8gkZYxVqipU6ozGmjNsR2Wog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA3OjEwIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMTItMTMgYXQgMDg6MzggLTA2MDAsIEx1Y2FzIERlIE1h
cmNoaSB3cm90ZToNCj4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAwOToxMjo1MkFNIC0wNTAw
LCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiBXZSBkbyBub3QgYnJlYWsgdXNlcnNwYWNlLg0K
PiANCj4gVGhlcmUgaXMgb3RoZXIgcGF0Y2ggdGhhdCBhbHNvIGJyZWFrcyBNZXNhIHBhcnNlcjoN
Cj4gDQo+IGRybS94ZS9kZXZjb3JlZHVtcDogSW1wcm92ZSBzZWN0aW9uIGhlYWRpbmdzIGFuZCBh
ZGQgdGlsZSBpbmZvDQo+IA0KPiA+ID4gDQo+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IGVjMTQ1
NWNlN2UzNWEzMTI4OWQyZGJjMTA3MGI5ODA1Mzg2OTg5MjEuDQo+ID4gDQo+ID4gQnV0IHdlIGhh
dmUgdXNlcnMgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLi4uLiB0aGUgcmV2ZXJ0IGlzIG5vdCBzbyBz
aW1wbGUuDQo+ID4gSSB0aGluayB3ZSBuZWVkIHRvIHJldmVydCB0aGUgZnVuY3Rpb25hbGl0eSBy
YXRoZXIgdGhhbiByZXZlcnRpbmcgYWxsDQo+ID4gdGhlIHBhdGNoZXMsIG90aGVyd2lzZSBpdCB3
aWxsIGNhdXNlIGEgbG90IG9mIGhlYWRhY2hlcy4NCj4gPiANCj4gPiBJIHByb3Bvc2Ugd2UgZ28g
d2l0aDoNCj4gPiANCj4gPiBhKSBkcm9wIHRoZSBcbiB0aGF0IGJyb2tlIG1lc2EgYW5kIG1lcmdl
IHRoYXQgd2l0aCBjYyBzdGFibGUuDQo+ID4gDQo+ID4gYikgbW92ZSBiYWNrIHRoZSBlbnRyeSB0
byB0aGUgcHJldmlvdXMgc2VjdGlvbiB0aGF0IGJyb2tlIG1lc2EgYW5kIGNjDQo+ID4gICAgIHN0
YWJsZS4NCj4gPiANCj4gPiAgICAgSm9zw6ksIHdvdWxkIGl0IGJlIG9rIHRvIG1lcmdlIGEgcGF0
Y2ggaW4gbWVzYSBhbmQgcG9ydCB0aGF0DQo+ID4gICAgIHRvIG1lc2Egc3RhYmxlIHRoYXQgc2lt
cGx5IGxvb2tzIGF0IDIgcG9zc2libGUgc2VjdGlvbnM/IE9yIGV2ZW4NCj4gPiAgICAgZHJvcCB0
aGUgc2VjdGlvbiBjaGVja3MuLi4gPw0KDQpCdXQgaWYgWGUgS01EIGlzIHJldmVydGluZyB0aGUg
cGF0Y2ggdGhhdCBjaGFuZ2VkIHRoZSBod2N0eCBzZWN0aW9uIHdoeSB3b3VsZCBNZXNhIG5lZWQg
dG8gYWxzbyBwYXJzZSB0aGUgbmV3KGZ1dHVyZSB0byBiZSByZXZlcnRlZCkgc2VjdGlvbj8NCkkg
Y291bGQgQ0MgdGhlIE1lc2Egc3RhYmxlIGJ1dCBpdCB3b3VsZCBub3QgYmUgcGlja2VkIHRvIGFs
bCBNZXNhIHZlcnNpb25zIHdpdGggdGhlIGRldmNvcmVkdW1wIHBhcnNlci4NCg0KDQo+ID4gDQo+
ID4gYykgc2V0dGxlIG9uIG9uZSBvZiB0aGUgcG9zc2libGUgc29sdXRpb25zIGZvciBcbiB0aGF0
IHdlcmUgcHJlc2VudGVkIGluDQo+ID4gICAgIHRoaXMgZGlzY3Vzc2lvbi4gIEkgdGhpbmsgdGhl
IHNhbmVzdCBvbmUgaXMgdGhhdCBhIHNwYWNlIGluIHRoZSBlbmQgb2YgYQ0KPiA+ICAgICBsaW5l
IHByaW50aW5nIGFzY2lpODUgd291bGQgc2lnbmlmeSBhIGNvbnRpbnVhdGlvbiBtYXJrZXIuICBC
dXQgbWVyZ2luZw0KPiA+ICAgICAoYSkgbWVhbnMgd2UgaGF2ZSB0aW1lIHRvIGRpc2N1c3MgYW5k
IGFkanVzdCBpZiBuZWVkZWQuDQo+ID4gDQo+ID4gQWZ0ZXIgdGhlIGR1c3Qgc2V0dGxlcyB3ZSBt
YXkgdGhpbmsgb2YgYSBiZXR0ZXIgd2F5IHRvIGV2b2x2ZSB0aGUNCj4gPiBkZXZjb3JlZHVtcCBm
b3JtYXQgc28gaXQgZG9lc24ndCBjYXVzZSBicmVha2FnZXMgaW4gZnV0dXJlIHVwZGF0ZXMuDQo+
ID4gDQo+ID4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KDQo=
