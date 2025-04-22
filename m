Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CDCC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86210E5D9;
	Tue, 22 Apr 2025 15:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuCZtty/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D7E10E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745337311; x=1776873311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HAWhkz9WqIWunQPBYxCBlRIcMbk3jy+evoKEovDogrk=;
 b=QuCZtty/CZC7GI4hAhnWKqBuX8VjAGw9Oa5J4VDVU1WmMGuXoB7HwHcP
 NKBAwOwL/zlAqDdP32jaMnP5eMC2OEUlRD/tjbrr9YbZD2KZW9KvUK4GD
 e7bovqmKHTuVe6Wnv87lPo4wUkR8FPOTdLA85gQ2/PaNboxOVTN4cwL7o
 rQgsNYZyBCUizkJFx27c5+4LlAMQ8MgN5CqAqRZ20G7pR+QxLneZI8iVc
 l4FCdbElw4x+hIRwty+Hn2MxwE9QaZsb+f+5IRVSB8fwOiVkZJ9VBmlXt
 snRd3zgW/OQCQbKHfiQdE4FF9kVBVeJmNeROb3F36rCW7vd9fABrLVCAs A==;
X-CSE-ConnectionGUID: u0ZT0veKSjOwgob9u8qXsg==
X-CSE-MsgGUID: y2aZvoYkSXaG3TxS+AtWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57886648"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57886648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:55:11 -0700
X-CSE-ConnectionGUID: M9GMd197TF2gNF4oNG+y4Q==
X-CSE-MsgGUID: 3kuqwJgkQrq0pvHFyPjwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131893813"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:55:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:55:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:55:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKlDNi389woNRjG2HDNqu8rCtlW8GMus/vjtaRzZLCfWv+3fT0LOo7KMMD9FEzYZEDB1Jys0uGlxyaYFUhDu2s/pHampYGjGwnklqj8Y8rp4rCiIvX6EozwMHHEulmwqiOzbyz+623i0lCwfrAIvXpGDijSGhnOWCSUiIQkmJ1ludwwQy+aLbinXDQMTPs8VVtmnzEAPYOSC01DonWo+MDgbOKanBeq23q69HZC6emZWJv3jhJde30xntbsaqamPAvmzd0tY+1XrJVnpt1z/3v0l7ldpUbJEbhpdAgtOYf+EZ2ImB8SB24V53AxEglAI0bJHAkuP6YXW9yaO6oOIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAWhkz9WqIWunQPBYxCBlRIcMbk3jy+evoKEovDogrk=;
 b=bbZfDkqWwMvh2fqtr1K9Crg/EG7Kr39YrUdwiIbqxoFsUnoUN5pi0UAqv+ZJq1Ct9pvvhWnAlqhI+mVSUfZb6loCLQUgMs0pRv4z8kHo2yVZooa+smigaMv+4GcvE4kQRFXj4q3yechB8V4nJzfIgrDlMxFxO+dvlhH4HhuoRBPyX4wa6RwvcDpc7gl5JV/GgcbtGOOsFIBVWQLSXv3H9V1EylsE5m3bhkY+X2E/ECG4aryMzb1A0yzMdH8zi5lZeifIUan0QMpWyKFpN8Rl9wFu4u7E0NlNqwDv/7+HnBe8HFwmynQtZCXE+/ZHsLBmZ01Gx4r7giLwKtcFTrikmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Tue, 22 Apr
 2025 15:55:06 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:55:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Index: AQHbp6Lu7DD/vlYFq0a8UzzQfyhwEbOoO1iAgAABOgCAB6xWAIAABaIA
Date: Tue, 22 Apr 2025 15:55:05 +0000
Message-ID: <0a38de6386a7a98817852f697ca95c4faa5f1a6c.camel@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
 <e25bd47bce1167d576a42b231cabb26a7ca102be.camel@intel.com>
 <aAe3HHTarmhI7zAj@lstrano-desk.jf.intel.com>
In-Reply-To: <aAe3HHTarmhI7zAj@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB5092:EE_
x-ms-office365-filtering-correlation-id: e15c4d37-8470-46b9-1384-08dd81b60d35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmdsT05saURlYkdickVTemF1Vkx0WkNYK0NPN1FaMkpDbndQQ093T01ZRE94?=
 =?utf-8?B?aHFvUFZGc28rVndlSStmY3V5LzVoMm5lc3FOTjMrSTRWc2xHSmlBVUdML0tz?=
 =?utf-8?B?OTUyakxiTlA5UVkxTGdFNEdiVmh5MEdlSG1qWEJsNnozY3NsdE14ZStVbXMz?=
 =?utf-8?B?NFFnb2d5QnB0b2ZPamxPV2dnRGVoMWdKanpmR3JlR1dNMUR2cGZxU05ieGlF?=
 =?utf-8?B?U0JDbEg1ZkQrcUN0V0VhZ3RPRVczTzBHWnFobXQ3dEJ4b3NlZ0dIR0dJcWF4?=
 =?utf-8?B?aHYzRWNaaHdIZXdwd2FMQkJLZ3htSGpqUmxmekxLa1F4eVJINUQ0TENOQXRj?=
 =?utf-8?B?RU15VEJTbmFTRTZZYVlkMjhqY0pZOW0vSHNjc3RjekJTcURKNXlyU1FZaGYx?=
 =?utf-8?B?VkZ6d2xpTllXZkV2Tldsbjk3aW42cW9QZ2dMZ3lOOEVnYWdxdVJ4TldEbUV1?=
 =?utf-8?B?cnpRTGwrN0hSaXJjNnRVeWg0T3Z4Q0MxQlpXbEZucXoxR1dXYWZ2VnVQWXo0?=
 =?utf-8?B?bDllT2hqMzZJVDkyZUhFL09aOGUwRk5jazBjQUJ1VmhRSy9LSytqT0luQ0hl?=
 =?utf-8?B?R1dqVXBWWWZpK1QvK2hqWWtTRmZSTm9NaWxYdmowY2swRTZkakRiakRzRXJP?=
 =?utf-8?B?NGJPUDc5ZC9pa3hha094TVFTall1dWc5NTI3eHNxU2xna2NDZE9CalRZVG5x?=
 =?utf-8?B?d3h1TzlYT0JKTWY5QWpDYThZY0hTWVBvOWZKMXBUaGpaaXcrd0VDYjR1QjdW?=
 =?utf-8?B?MHAzWGNmc3JHQU1ZZklnWFBhdlpFWUZaOWpiM040MEJ4K0syR0NFK2U4QmVa?=
 =?utf-8?B?ZWQ3TFVQRkdaY1pOajdqb2RjbVBUNXdka25ERS9XcEVzSWMrbnJ0NkZvVU5T?=
 =?utf-8?B?Nm1ZdVdhMXhuanljaTc1R0w2TVFSVkpoWFhaMlB5WlFwMjFSUTl2cWhOMk41?=
 =?utf-8?B?WXFxVGJyUTlMZkFPL29wNHBmL3JYSVNUcW9DSnpVeWlCNXZQMmhjRmFFcE5p?=
 =?utf-8?B?V2VkQkNGQ2JIVmswOWUzQmFaQzZaUmN5d1VtdDJ6UURBcGcySWE0MFdySkdm?=
 =?utf-8?B?cVFwcTgxYzFZc2Jiek4rNUJmYS9CS29EY25QUmprRUF3eXcxUlY5akN0T2Fm?=
 =?utf-8?B?Z3NKeU9UMDhadkUvVHVTV0lBVFFkT3JCbm43dW10NDZ2T1ZJMGYyZUpEdTFo?=
 =?utf-8?B?d0JXeng1eDV4N1JZQWJqaU0xSWNwWnIvZ1ZjRThMQUFaNUdVbGZSM3dQbFZZ?=
 =?utf-8?B?WkY5Y2xRNmhjdFlVZENoTm0vVHhwbDllS094TmFHaHFYKzJGUllhaCtub25X?=
 =?utf-8?B?eUxhc3NmcVdFdVpsSERUMWlIb01IQWJBL0d0S3BBQkdwRW1PTHRRUG8xdmhU?=
 =?utf-8?B?RW9lQjFTbEdSa0tCbVc5bVl5Z2ZtUkx2MDB4bFpHMjQvQWxqTzRMeTAvRCs0?=
 =?utf-8?B?SkVYbGVtVFg3UHdKSlFjZFloTzhiYmFMZXFMWWpldngyc1VFQUYxNHhxLzR0?=
 =?utf-8?B?eUpGWGxyOUs1cFJJL0Yvb3VwS1UxbjdSWTJxSFVncEdBc21GTWdsYVZMLy9u?=
 =?utf-8?B?KzNwODZKVlRLWmtENUR3ZTB1NUltVStBZnE2NFhOejFqL0ZGcG1wdm1yZFRI?=
 =?utf-8?B?c21vSnozVk5UbmhhMjBheHZrU2xzUFduYkFldkhTYXRaZXBxMnp2RWhiNzVa?=
 =?utf-8?B?TDhWV1FXNWdOY3NYS1JRZXpBNk1sL01aVjRCQ3BOT2VDZCt5VGhBZDc2SmFC?=
 =?utf-8?B?MFZPaytyZkRaVzVSTHo0UXJaMU5QZG42ZnVtR3VKRnA0TnhtazBjZmZBNUdm?=
 =?utf-8?B?N3J6Y1BkQ1Y5VlVnaU1qN3RmSFQyckl6OENVVi9SU2VzZXkzWVg1cytlbzhO?=
 =?utf-8?B?MGZpN0VMa25JTVAwNmhDeW53RHA3US9tektjWW1ZN3dEdjRyVytSbVJHZ2Iz?=
 =?utf-8?B?U2tvK2JETDVFTVlPTnplRWMwRGRkajBZdnJyajZKdkhpRGc2Nm1LZmZ2ZjB0?=
 =?utf-8?B?N3J4WEdxOTZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnF4ZlpGSnowd0JQM0VCZnBHa2U1VFVZYW5NRkZhMGJJWEE5SUo0UVZmMTZz?=
 =?utf-8?B?M2hPQ0twS25xZ3lZMmlObWNUajl4V1BoK1U0bUtSOURacG1DTk9UMFphYStK?=
 =?utf-8?B?K2tFKzNZYm55WFFUcmJJamN2WDE0MnBXQWx5SUpJL0dmVHd3ay9GSVV3cDRs?=
 =?utf-8?B?TU5wM1BSenV3VGwreEZtVzBaMnVsUDNaZDl0dExrNENxU3BHY3lYYjA5NXZD?=
 =?utf-8?B?WVZaS1JnNm5JT1JqVHVXMUFacmV5LzlzSGF4YzFtYWdhMG9ucDIxeTVxZG00?=
 =?utf-8?B?QmNXVGVWZzNzT05tYy9ldUtKRzh5RmFGUlpMMjhORERmZjVkbVdkM3BLSmU5?=
 =?utf-8?B?SGMyemRLRGJMRi8rRTNQWE9VSHEyUkptaFpFc21tR1liK01VL0VINXNYVmZ5?=
 =?utf-8?B?UEg0T3BuRWFldUhYVjJaSXQ3SS9jN0pNekF0Ly9HeTRrbGo3QW9NM2NpTStP?=
 =?utf-8?B?amoxcDZ4M1VMSFg2bHBWa2JKeDJ6Zm94ZDJHNkNtMkMxMDV3bFlhR1hFYU9W?=
 =?utf-8?B?Q1BMVmJ3YXU0RVpoRUQ2SFJwaVUvNnVUZ2dkVWNNWmtlQ2ZWR2JOTlg5YjRy?=
 =?utf-8?B?WTJ2K0FjVkNIZ2hTZ25nSW1UU21NVDVpMHE0L09GdmRLTzhSQUUraHcveXdp?=
 =?utf-8?B?QkRxU3oxUXllWDFQaEFSV2l5U2piWkxtby9qNUpEY2lGZ0NPTkw3YzRZRHc0?=
 =?utf-8?B?Nkp3WFdCV1BWZU5MZTFGeXZwMmZsVnJZY3hiUWZlN2lJY1lDbEczd0lxcTlF?=
 =?utf-8?B?eEhENmlEZUxvOUw1bWZMYVlYa1I4SEpIQkVLUzNuZFBmTlV1anE4N0lJQ1RG?=
 =?utf-8?B?Rk1YUHBKVUdFbkF6SElld0tqQnMvRjRGTGZpR0xEU2wxbC9yMzJudDJTeW95?=
 =?utf-8?B?eXl1ejQycDlFN25ySXZ0a2hoQ0ljYTgwWTJuc1I0ci9UZDBpRmlvUTNacGky?=
 =?utf-8?B?M29FMXpvbStBVHlQY1BKSVZaM0dvdmNiRmlLSWNsUnRsWVhzR3dGR2xDdWpD?=
 =?utf-8?B?NHpyenE1V3kzcnZ6TkRqcUtCQ3gvZmsxMGlrSmZyN00yMnNaZ1B0bWlGOW1a?=
 =?utf-8?B?SGVUY2kwbDU0NllSSk9PS1gxNmdDeWk3c0wvcTRKMmN2QTlVWmNZTnRvaWJ6?=
 =?utf-8?B?TFA0ZjNBWUdXbFVLYUF3cGIvWTZCR2h2di9HclA4Tms5dXZwMWlyTjZCdDd0?=
 =?utf-8?B?Y0svWlFqV2hIaDdhMUtOeHdwVVY1elErcW5uRDFJTEJiYWdUMlozMmwxTm5C?=
 =?utf-8?B?T2tKYzFRTWtXTGh1VjRld3dUNmZ3U1h6STdnbzRscjRlNjZ0RnZJeVAydGN4?=
 =?utf-8?B?eDNySmxrcldrejBvYlY0UnVnZUkvcXZQYUpydHVUdTRDYVNHYjBMcjY5R2Uy?=
 =?utf-8?B?K0hWcWJMaHdtTFl4S0lETUZ4VHBMbE5kZWxhTjlPSGZIdlI0R0llcmpHUGJo?=
 =?utf-8?B?dlc3UzhTdmJBaHkvcUVYTHNwQi9uU0plb0oxTUlzbHBIWW1VL3F3R2M3U0V3?=
 =?utf-8?B?Z0xaNyt5M0ZsY1hxaGpzbEhlTlNTUUFYM0FQUWFXZFlDRjA0UkNsb1JaSFp5?=
 =?utf-8?B?Y0dVam9Ja0g0Uk1iamFYL3kzNGhMNmd5WnRXT0kzVmJORytaOWJGd2ZHYWtq?=
 =?utf-8?B?WkpDTkg3TE52LzVnOVJvZGZUcjJqaXZtM2FtTGpTeEtoZ2NDVGt0YzhRbE4v?=
 =?utf-8?B?NitMVWw1WnZzblozQmxweHJxK0tKMHp5WUYxbUNlVFYycGpYdXVINU9HSWdU?=
 =?utf-8?B?QWtPM1pCVFhJUFh6NmVRZDlVWUxDZG80NWVkSnpwM0h2RUJsby9HcFVGU3VZ?=
 =?utf-8?B?b2twT3NLR2Z3dmw0c2JleitMMnFsQldjS3hNbGhLM2xhSGlBNnNBb3R5L0tU?=
 =?utf-8?B?M29Vd2VWc1p3L3MwK2oxMEY4OVJQdFJOWkJab2EwUkhtLzd2bGxUZmRKZGln?=
 =?utf-8?B?SlBzK1UxdlBqV2JpY2xPU2VMdnppdXFydVdpeFRCWVk5RTV4Z3ROQ3ZGTUdt?=
 =?utf-8?B?RTZZa2YvcUE5M3B2cG82MjFpT3JNN0xkWEJybDY3WG5BOGFLZy9CVU82QnM5?=
 =?utf-8?B?VndhOU5DRWtnRGdWWDZSdVlIYVhENTRhdk1QY0JhbUZFSkUvY25pc3d1Q3dJ?=
 =?utf-8?Q?5ixOnz98Em5S1T7FVIRxle0yt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61AF158432464A4DA5F8F2AF6702394C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15c4d37-8470-46b9-1384-08dd81b60d35
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 15:55:06.2039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRmdmbqoimOmQLoElsgFu8hqk9rLQUOzxvn5xvSr61LKWbKW+OYJhdvMJb1Vz6+xXsC1QFvuk/ygSfsWbCVV0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

T24gVHVlLCAyMDI1LTA0LTIyIGF0IDA4OjM0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxMjoyNDoxN1BNIC0wNjAwLCBTb3V6YSwgSm9zZSB3
cm90ZToNCj4gPiBPbiBUaHUsIDIwMjUtMDQtMTcgYXQgMTE6MTkgLTA3MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjUtMDQtMDcgYXQgMTU6NDcgKzA1
MzAsIEhpbWFsIFByYXNhZCBHaGltaXJheSB3cm90ZToNCj4gPiA+ID4gVGhpcyBjb21taXQgaW50
cm9kdWNlcyBhIG5ldyBtYWR2aXNlIGludGVyZmFjZSB0byBzdXBwb3J0DQo+ID4gPiA+IGRyaXZl
ci1zcGVjaWZpYyBpb2N0bCBvcGVyYXRpb25zLiBUaGUgbWFkdmlzZSBpbnRlcmZhY2UgYWxsb3dz
IGZvciBtb3JlDQo+ID4gPiA+IGVmZmljaWVudCBtZW1vcnkgbWFuYWdlbWVudCBieSBwcm92aWRp
bmcgaGludHMgdG8gdGhlIGRyaXZlciBhYm91dCB0aGUNCj4gPiA+ID4gZXhwZWN0ZWQgbWVtb3J5
IHVzYWdlIGFuZCBwdGUgdXBkYXRlIHBvbGljeSBmb3IgZ3B1dm1hLg0KPiA+ID4gPiANCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hp
bWlyYXlAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmggfCA5NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gPiA+ID4gaW5kZXggOWMwODczOGMzYjkxLi5hYWY1MTVkZjNhODMgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+ID4gKysr
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiBAQCAtODEsNiArODEsNyBAQCBl
eHRlcm4gIkMiIHsNCj4gPiA+ID4gICAqICAtICZEUk1fSU9DVExfWEVfRVhFQw0KPiA+ID4gPiAg
ICogIC0gJkRSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UNCj4gPiA+ID4gICAqICAtICZEUk1f
SU9DVExfWEVfT0JTRVJWQVRJT04NCj4gPiA+ID4gKyAqICAtICZEUk1fSU9DVExfWEVfTUFEVklT
RQ0KPiA+ID4gPiAgICovDQo+ID4gPiA+ICANCj4gPiA+ID4gIC8qDQo+ID4gPiA+IEBAIC0xMDIs
NiArMTAzLDcgQEAgZXh0ZXJuICJDIiB7DQo+ID4gPiA+ICAjZGVmaW5lIERSTV9YRV9FWEVDCQkJ
MHgwOQ0KPiA+ID4gPiAgI2RlZmluZSBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFCQkweDBhDQo+ID4g
PiA+ICAjZGVmaW5lIERSTV9YRV9PQlNFUlZBVElPTgkJMHgwYg0KPiA+ID4gPiArI2RlZmluZSBE
Uk1fWEVfTUFEVklTRQkJCTB4MGMNCj4gPiA+ID4gIA0KPiA+ID4gPiAgLyogTXVzdCBiZSBrZXB0
IGNvbXBhY3QgLS0gbm8gaG9sZXMgKi8NCj4gPiA+ID4gIA0KPiA+ID4gPiBAQCAtMTE3LDYgKzEx
OSw3IEBAIGV4dGVybiAiQyIgew0KPiA+ID4gPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfRVhFQwkJ
CURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9FWEVDLCBzdHJ1Y3QgZHJtX3hlX2V4
ZWMpDQo+ID4gPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9J
T1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJt
X3hlX3dhaXRfdXNlcl9mZW5jZSkNCj4gPiA+ID4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX09CU0VS
VkFUSU9OCQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfT0JTRVJWQVRJT04sIHN0
cnVjdCBkcm1feGVfb2JzZXJ2YXRpb25fcGFyYW0pDQo+ID4gPiA+ICsjZGVmaW5lIERSTV9JT0NU
TF9YRV9NQURWSVNFCQkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9NQURWSVNF
LCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2UpDQo+ID4gPiA+ICANCj4gPiA+ID4gIC8qKg0KPiA+ID4g
PiAgICogRE9DOiBYZSBJT0NUTCBFeHRlbnNpb25zDQo+ID4gPiA+IEBAIC0xOTY1LDYgKzE5Njgs
MTAwIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZXVfc3RhbGwgew0KPiA+ID4gPiAgCV9fdTY0IHNh
bXBsaW5nX3JhdGVzW107DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPiAgDQo+ID4gPiA+ICtzdHJ1Y3Qg
ZHJtX3hlX21hZHZpc2Vfb3BzIHsNCj4gPiA+ID4gKwkvKiogQHN0YXJ0OiBzdGFydCBvZiB0aGUg
dmlydHVhbCBhZGRyZXNzIHJhbmdlICovDQo+ID4gPiA+ICsJX191NjQgc3RhcnQ7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKwkvKiogQHNpemU6IHNpemUgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyByYW5n
ZSAqLw0KPiA+ID4gPiArCV9fdTY0IHJhbmdlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsjZGVmaW5l
IERSTV9YRV9WTUFfQVRUUl9QUkVGRVJSRURfTE9DCTANCj4gPiA+ID4gKyNkZWZpbmUgRFJNX1hF
X1ZNQV9BVFRSX0FUT01JQwkJMQ0KPiA+ID4gPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUEFU
CQkyDQo+ID4gPiANCj4gPiA+IEluIG15IG9waW5pb24gd2Ugc2hvdWxkIGRyb3AgRFJNX1hFX1ZN
QV9BVFRSX1BBVCBhcyB3ZSBjYW4gYWxyZWFkeSBjaGFuZ2UgdGhlIFBBVCBpbmRleCBieSB1bmJp
bmRpbmcgYW5kIGJpbmRpbmcgdGhlIFZNIHdpdGggdGhlIHdhbnRlZCBQQVQgaW5kZXguDQo+ID4g
PiBTaW1pbGFyIGZvciBEUk1fWEVfVk1BX0FUVFJfQVRPTUlDIGFuZCBEUk1fWEVfVk1BX0FUVFJf
UFJFRkVSUkVEX0xPQywgd2UgY291bGQgaGF2ZSB0aG9zZSBwcm9wZXJ0aWVzIGluIHZtIGJpbmQg
dUFQSSBhbmQgaWYgbmVlZGVkIHRvIGNoYW5nZSB3ZSBjb3VsZA0KPiA+ID4gdW5iaW5kIGFuZCBi
aW5kIHRoZSBWTUEgd2l0aCB0aGUgdXBkYXRlZCBhdHRyaWJ1dGVzLg0KPiA+IA0KPiA+IEFoIGFu
ZCBpZiBpdCBpcyBjaG9zZW4gdG8gbW92ZSBmb3J3YXJkIHdpdGggdGhvc2UgSSB0aGluayB3b3Vs
ZCBiZSBuaWNlIHRvIGhhdmUgZHJtX3hlX3N5bmMgc28gd2UgY291bGQgc3luY2hyb25pemUgdGhl
IHVwZGF0ZSBvZiB0aGlzIGF0dHJpYnV0ZXMgd2l0aA0KPiA+IHByZXZpb3VzIHN1Ym1pc3Npb25z
IGFuZCBmdXR1cmUgb25lcy4NCj4gPiANCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgZXh0
cmEgcmVzZXJ2ZWQgYml0cyBmb3IgYSBzeW5jIGludGVyZmFjZSBzbyB3ZQ0KPiBjYW4gYWRkIG9u
ZSBpZiBuZWVkZWQgYnV0IHRoZSB3YXkgbWFkdmlzZSBpcyBjdXJyZW50bHkgaW1wbGVtZW50IGl0
IGlzDQo+IGNvbXBsZXRlbHkgc3luY2hyb25vdXMgYXMgYWxsIGl0IGRvZXMgaXMgdXBkYXRlIHRo
ZSBLTUQncyBWTS9WTUENCj4gYm9va2tlZXBpbmcsIGl0IGRvZXMgbm90IHVwZGF0ZSB0aGUgR1BV
IHBhZ2UgdGFibGVzIChpdCBjYW4gaW52YWxpZGF0ZQ0KPiB0aGVtIHRob3VnaCkuIEEgc3Vic2Vx
dWVudCBpcyBleHBlY3RlZCB0byBiZSBpc3N1ZWQgaWYgeW91IG5lZWQNCj4gaW1tZWRpYXRlIHBh
Z2UgdGFibGUgdXBkYXRlcy4NCg0KU28gdGhpcyBuZWVkIHRvIGJlIGJldHRlciBkb2N1bWVudGVk
IGluIHRoZSB1QVBJIEkgaGFkIG5vIGNsdWUgYWJvdXQgdGhhdC4NCldoYXQgZG8geW91IG1lYW4g
Ynkgc3Vic2VxdWVudD8NCg0KSSB0aGluayB0aGF0IG9ubHkgdXBkYXRpbmcgS01EIGJvb2trZWVw
aW5nIHdpbGwgbGVkIHRvIGlzc3VlcyB0aGF0IGFyZSBoYXJkIHRvIGRlYnVnLCBVTUQgY291bGQg
ZXhwZWN0IHRoYXQgVk1BIGluIHJ1bm5pbmcgd2l0aCBhIHNldCBvZiBhdHRyaWJ1dGVzDQp3aGls
ZSBpdCBydW5uaW5nIHdpdGggb3RoZXIuDQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gPiANCj4gPiA+
ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRSX1BVUkdFQUJMRV9TVEFURQkzDQo+ID4gPiANCj4g
PiA+IE1lc2EgY2FuIG1ha2UgdXNlIG9mIERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RBVEUg
YnV0IG5vdCB0aGUgb3RoZXIgb25lcywgc28geW91IHdpbGwgbmVlZCBvdGhlciBVTURzIHRvIGxh
bmQgdGhvc2UuDQo+ID4gPiANCj4gPiA+ID4gKwkvKiogQHR5cGU6IHR5cGUgb2YgYXR0cmlidXRl
ICovDQo+ID4gPiA+ICsJX191MzIgdHlwZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCS8qKiBAcGFk
OiBNQlogKi8NCj4gPiA+ID4gKwlfX3UzMiBwYWQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwl1bmlv
biB7DQo+ID4gPiA+ICsJCXN0cnVjdCB7DQo+ID4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRP
TUlDX1VOREVGSU5FRAkwDQo+ID4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0RFVklD
RQkxDQo+ID4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0dMT0JBTAkyDQo+ID4gPiA+
ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0NQVQkJMw0KPiA+ID4gPiArCQkvKiogQHZhbDog
dmFsdWUgb2YgYXRvbWljIG9wZXJhdGlvbiovDQo+ID4gPiA+ICsJCQlfX3UzMiB2YWw7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKwkJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiA+ID4gKwkJ
CV9fdTMyIHJlc2VydmVkOw0KPiA+ID4gPiArCQl9IGF0b21pYzsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCQlzdHJ1Y3Qgew0KPiA+ID4gPiArI2RlZmluZSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFU
RV9XSUxMTkVFRAkwDQo+ID4gPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRF
X0RPTlRORUVECTENCj4gPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVf
UFVSR0VECTINCj4gPiA+ID4gKwkJLyoqIEB2YWw6IHZhbHVlIGZvciBEUk1fWEVfVk1BX0FUVFJf
UFVSR0VBQkxFX1NUQVRFICovDQo+ID4gPiA+ICsJCQlfX3UzMiB2YWw7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwkJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiA+ID4gKwkJCV9fdTMyIHJl
c2VydmVkOw0KPiA+ID4gPiArCQl9IHB1cmdlX3N0YXRlX3ZhbDsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCQlzdHJ1Y3Qgew0KPiA+ID4gPiArCQkJLyoqIEBwYXRfaW5kZXggKi8NCj4gPiA+ID4gKwkJ
CV9fdTMyIHZhbDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQkJLyoqIEByZXNlcnZlZDogUmVzZXJ2
ZWQgKi8NCj4gPiA+ID4gKwkJCV9fdTMyIHJlc2VydmVkOw0KPiA+ID4gPiArCQl9IHBhdF9pbmRl
eDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jOiBwcmVmZXJy
ZWQgbWVtb3J5IGxvY2F0aW9uICovDQo+ID4gPiA+ICsJCXN0cnVjdCB7DQo+ID4gPiA+ICsJCQlf
X3UzMiBkZXZtZW1fZmQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNkZWZpbmUgTUlHUkFURV9BTExf
UEFHRVMgMA0KPiA+ID4gPiArI2RlZmluZSBNSUdSQVRFX09OTFlfU1lTVEVNX1BBR0VTIDENCj4g
PiA+ID4gKwkJCV9fdTMyIG1pZ3JhdGlvbl9wb2xpY3k7DQo+ID4gPiA+ICsJCX0gcHJlZmVycmVk
X21lbV9sb2M7DQo+ID4gPiA+ICsJfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCS8qKiBAcmVzZXJ2
ZWQ6IFJlc2VydmVkICovDQo+ID4gPiA+ICsJX191NjQgcmVzZXJ2ZWRbMl07DQo+ID4gPiA+ICt9
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsvKioNCj4gPiA+ID4gKyAqIHN0cnVjdCBkcm1feGVfbWFk
dmlzZSAtIElucHV0IG9mICZEUk1fSU9DVExfWEVfTUFEVklTRQ0KPiA+ID4gPiArICoNCj4gPiA+
ID4gKyAqIFNldCBtZW1vcnkgYXR0cmlidXRlcyB0byBhIHZpcnR1YWwgYWRkcmVzcyByYW5nZQ0K
PiA+ID4gPiArICovDQo+ID4gPiA+ICtzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ugew0KPiA+ID4gPiAr
CS8qKiBAZXh0ZW5zaW9uczogUG9pbnRlciB0byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwg
aWYgYW55ICovDQo+ID4gPiA+ICsJX191NjQgZXh0ZW5zaW9uczsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCS8qKiBAdm1faWQ6IHZtX2lkIG9mIHRoZSB2aXJ0dWFsIHJhbmdlICovDQo+ID4gPiA+ICsJ
X191MzIgdm1faWQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkvKiogQG51bV9vcHM6IG51bWJlciBv
ZiBtYWR2aXNlcyBpbiBpb2N0bCAqLw0KPiA+ID4gPiArCV9fdTMyIG51bV9vcHM7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKwl1bmlvbiB7DQo+ID4gPiA+ICsJCS8qKiBAb3BzOiB1c2VkIGlmIG51bV9v
cHMgPT0gMSAqLw0KPiA+ID4gPiArCQlzdHJ1Y3QgZHJtX3hlX21hZHZpc2Vfb3BzIG9wczsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArCQkvKioNCj4gPiA+ID4gKwkJICogQHZlY3Rvcl9vZl9vcHM6IHVz
ZXJwdHIgdG8gYXJyYXkgb2Ygc3RydWN0DQo+ID4gPiA+ICsJCSAqIGRybV94ZV92bV9tYWR2aXNl
X29wIGlmIG51bV9vcHMgPiAxDQo+ID4gPiA+ICsJCSAqLw0KPiA+ID4gPiArCQlfX3U2NCB2ZWN0
b3Jfb2Zfb3BzOw0KPiA+ID4gPiArCX07DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkvKiogQHJlc2Vy
dmVkOiBSZXNlcnZlZCAqLw0KPiA+ID4gPiArCV9fdTY0IHJlc2VydmVkWzJdOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1
cykNCj4gPiA+ID4gIH0NCj4gPiA+ID4gICNlbmRpZg0K
