Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F2C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D69410E1C7;
	Wed, 22 May 2024 17:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1EHpX6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B39510E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397285; x=1747933285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z1oGZY7HaLenu/Hq/AmoxZVaT0C+eTWHYxOiWKYBOqU=;
 b=h1EHpX6CqYr3QxkV4Dbye8fCT+Fu+5sM88UE82UTYn40DDNhJIHcl5tV
 bhiqycplydvEdLgRlmZujo2pDwn2PsQGNTqaPsUcK26kFbWio7SyuzmqV
 UtfZc4kdSUaElmplotQCFaVdXUMt1yyedZVFHYvNBNHrkAmw7Ml/hBJIa
 q+iG6OZU2Kq57Gwq4a3/XZkM9mpEp8J1tteQCkNzorBNN/+BWBlbYUNfN
 kxZqQbDsMTvlBfXhPhwbhQiI1ILfU+xuWmwsr/w1N8WmB/2Fsn/OQOuuB
 wpduvjhmOfKpSN+0xDlPJbOE4o2Fijl2mwnoLsCLhMx+Tm4JqU9nn4zpo w==;
X-CSE-ConnectionGUID: c+PbcDOfRwiDi4MFOYoX+w==
X-CSE-MsgGUID: m7anrUc4Rp+D7BkEf6U2QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23803889"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23803889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:24 -0700
X-CSE-ConnectionGUID: PupW9eZMTjG9HeSC0m5wKg==
X-CSE-MsgGUID: djCquLLcTIeYwcSPFSbEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="64600022"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anV3NxHYfXI1ZYmXnC0ji/JIfYYaCXBsCzV6EzwIImP55Wp7s5BBWR0kTw4FkET5ZVQFHmB7mmDCr8wMg6Y3C8+U9Ywexdmlkcdzs/JKa9nGXmDQjwdJv/yom83Vd8MBh6d88fT1FAB/a39VM336FnxdjYXOPBVHOl+nGMhow8qzS1CB6J1j6H1xSEuxTli3lzwDxHqDy8G6+5xsjVwTr9lRhJN8R7S3RbCWtECX4UM6kfRegVm9FMTEzzlQsEDkOFGDcxKt5JPwV77Tk99YdXO9ZkJ8hS0qRC+qDp6xJZLbGsdCGcMtnIUjpq/buVurwBp5Hk+tB4ww53bPwCK0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c7nJPNwnqNg14cL5QGjJ+EBxSfJIqO8CL/6AptCDVQ=;
 b=AjCh/mZANBT5eWbbTJrFI2OxxcE3gJTefRhf90ioePzANtz52mzREY5a9WlxP8Z/KVN/mNZk4cIbOuv+8GhqK0Go/RBADeR1QVD7mkcZ/e+YZpQi7s/MHc0oNhKHictXduxOGcCiNLD0L33vzVTXyyFdaRcyYfr5i5vY3AKdPsC97yQ02g/JJOpyTZ7JwF2SAcQCnDQk+uf7860qhcMLtGPLx1ZD32zaIit9p6t3v7k4tF4mDCe6CIaOfoWiV6+2ZsaqUj7gn00x+vvKWaTDkZ+MzIW3cKfeHN/5r0AaK9zk+WaIFrALS858rcrcULFuVUpJVnBbgpcPdMeojSbirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, Francois
 Dugast <francois.dugast@intel.com>
Subject: [CI 4/7] drm/xe: Relax runtime pm protection around VM
Date: Wed, 22 May 2024 13:01:02 -0400
Message-ID: <20240522170105.327472-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 90008539-0ead-44a7-e990-08dc7a80cd88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3pKOUlaY2hWNEhONCtpTXA4Vm9vbDdEbFM0em9FT2ZuTUFVSWNUTTRWTVR3?=
 =?utf-8?B?dXhQeDF3K3J5VFFQZFRkbkJxRWZHSDl6a3F3UVdrR2lYbWxJWktXTUF1bEF4?=
 =?utf-8?B?enJ0VWNMZEx6eDJEUllOWlpXbkFESzJmdGI0WTdqazJmM3pyWC9lY2R4ZURx?=
 =?utf-8?B?MUlpSk42VytYbkpsdGswVXFGUlZ6YldpWTlnQ3dBb2g1cjhZWFZlUW5IOHZD?=
 =?utf-8?B?NExMOEhyUDZVNS9ueWxJZUVQUTB3cnd6d0g2MVhvUHMxVlNMRS9jbjE3bERJ?=
 =?utf-8?B?RTdRWHNSU2ZxVlRaVnZDOUtHNEhzQzZyL0lhaEJDNjVZclkxanUrYzRPTnlv?=
 =?utf-8?B?b25TSFBJN3cxaHoybWVUaXRpRWp5eGNCb09YZllzMGZYSy91c285VjBnYjdo?=
 =?utf-8?B?RGc3eTVZV0RMREpvNmo2U0ZOeFJaK04yL3VIZWxBK0t0bHlJNkh1eGJ0SHQ4?=
 =?utf-8?B?LzUrNzM3Z0hZMGYycUgyYmlOTW5VYjY0MFlubWNZZ1pmNkh2eEJ2Q29BYzIx?=
 =?utf-8?B?ZFFFQVpNYnVNTlFya3NOdHI2SzZKTnZMY3JXOVVWbFI4UDVFMThnOU5UcStr?=
 =?utf-8?B?bHVWQ3VXSmIvcWxCZ3NLVHN6UU1pZmhKWng1UmxsVUpLZUNRNzl2enpUb0Y0?=
 =?utf-8?B?T29NQmNNZ1BJOXA5L0FLZmhHVC8wOWhTVTRheExFMk00YmZxc3c1VVEwQUIx?=
 =?utf-8?B?SEdkc2hrTjFncDRjWk1XTDBrckloZm94T0lnZWgrODhRajJsSXdmR0VzZFA4?=
 =?utf-8?B?NndoY0VvQ21PY0xlWEJpMzM4SXlDSWZqc3F6MGE1a3VTbXduazcxRWxzYzk4?=
 =?utf-8?B?R1d3TU51b1djMktubDM2VjI1WnhXWUtqZ0RJOXJwMXgzYTFNRGhjU2NlNWRj?=
 =?utf-8?B?Q3VTYnhjbjM4Tkg4RGczVU5OZmxjY2RvWGJsUTZJUVBkRmlCSXc5d2RXRTVh?=
 =?utf-8?B?Z3pDbnczWEl3aVFrNGhQdmQ4TjhkM0Q4WmlITkxoaklTc0F1b2lwUTlqTGFl?=
 =?utf-8?B?T1FFTFIxdWtjUHBieng5UXk4MHQ1Ty9XSFZnaE5pSFNFZ094SHRaWTNhdzRj?=
 =?utf-8?B?ZldjcDhJcE1hY2FqbmlsanVTYU5kei9nWVZqWnFMS1lDVjFXOFBkOU1oQkZ2?=
 =?utf-8?B?Y1A0TVJVdjJ6QTZrUVhvUEpvclFzWUlXc3BkaVpSdWMzYksxV003STd3dWhL?=
 =?utf-8?B?TFVVcndJaUM1RXZBZGplN3p4dkpPaHlaYVkxOW9tSHlpaWsrU0srSEp6NFFs?=
 =?utf-8?B?NWVlZDFMQ3BpRk9nb2s5dlFCQlNkZWNNbTVYL2RuY2VHeUlQN3AxcTB0aHBj?=
 =?utf-8?B?OE9YVFUyZGxTRjBYSEZkV0N2VFpFdXpQV1FMN0R1SUtCbVlGSmhEQ1VJT2hn?=
 =?utf-8?B?b0JFMEJBWEM3bHpzaDZEREU1eHd2MjdONWJhMTNJb215WVFqb2tTN0FCWGdH?=
 =?utf-8?B?Y1dETnBhSFZySTFkYWxTanU0OVpTaFpXRTBKTm5TQ09NQitkSG5PakRyb3dN?=
 =?utf-8?B?T2h6SFJIY0VoZW1rY1pUS1l3NmtEMzhnTXlpMTliSEFtYkZPVHlkNk1JM3p4?=
 =?utf-8?B?Lyt4ZENxTG5lV0ExVU93aXlQY1FucmxHR0wxQlR2WXB6YTlETzRWdUZNdU4r?=
 =?utf-8?B?UGlsL3VOTlJOOG5MR0xidXlVUDI2MXRMaWl3NjZHcExUSDZSdG1Ecy9yMm13?=
 =?utf-8?B?Yy9USkg2cVVwUi9nbk1JZnFrQTRsSDBVR0hiSWoyd1NkMFAyYWd6bzZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXBXZDVkemcxUkgwdU1LbVIrOVA3b256VFpubm84R1JRSks3dUtkTzFMMlhm?=
 =?utf-8?B?RE4ySjFBUmNtbjhpRzFXNW44YjNjcTh1K1pZNWdKZUN1a0FuZXJ3dFZ4NWwv?=
 =?utf-8?B?VE52cnM5UVZkSkFTVTdvV2xUTCtERDcrclhDUU5oR1JIUGYzN2owYmNUaDBh?=
 =?utf-8?B?RnNHbFZQS3Q4NDZoWlpXRGlJL0VNUWF3dVRURXl6OGtUSzlGVkpqc2h6K1hI?=
 =?utf-8?B?MTBlYzJnMWdVVFY0Z2E5ZnR3eVF2MUh6dE5ybDZLMjhiTjIrdk15cXJvS01T?=
 =?utf-8?B?V0pnaGdRVm8vM2FIRnJJcDFPR3pGTXNRakhUaUFSNlNKd0lxcTQ4Y280UU1s?=
 =?utf-8?B?YWJFcGQzczkzTXlBWHlBNGg0dG1tKys4WUVJUFo0Tk43bzk1RnBScE0rUVZW?=
 =?utf-8?B?WjRKRCtuLy91MkFvSXV6aEt0NW5Jc0dpeWpLU2tMMlFsOUZmZ01Nek5hd3dt?=
 =?utf-8?B?NGtKMS8wRXQrdkJVbHpFaVdNenBhRVJqeGU5MlgyVVFsbndFV0pGV1d6Rndx?=
 =?utf-8?B?dEhWMXNhS2pEN1ZyYXg3bGVxTGhvSDhmbUNDVXVPRW14Si80bnh3YlN0c1lH?=
 =?utf-8?B?alNybC9xVldOM21WUm1LemxLckRKQzNRUEgxUkpvT3gvbTNRWGZ1S1JmVSs1?=
 =?utf-8?B?NUpXd2lIUXFjS2pYWlZCWXU4R2FLQnozUkV4VFA1VCtKMG5uQkJJRlNzWG02?=
 =?utf-8?B?bnpFL0llWWRRRmE1Ym9HdVR2SGw4Q0F2bzlWcytLYi9aaC91d1BPWXNNcXJG?=
 =?utf-8?B?MjdQSXRQRWZ5NVdoQUpJb3RnZ2xHR3VMdDNhYTU2Vk9zbitNVG5nbWUzYm1L?=
 =?utf-8?B?QUdQV2ErVVdKaW5BOU9YYW9HQjllam0vUlV0b1BiSVJvbkFRM0NYdmkyUnRh?=
 =?utf-8?B?RWd1aHRHazU4eUNRSXFzcTU4TFVFVVhkcysvSWlsdnl6RmZDQ0ZXVXU1bVI5?=
 =?utf-8?B?OHpnbmE3WEZDTFl6Q0xNVWJMTFhjTC9BSzJvODR4cG9BcUd0M2FMR3JkRXVJ?=
 =?utf-8?B?b3llUXZtTi9zZFNtaVQvV0JVdHNRZDFmdGRpUkNMdTBQNEhGRnNnQ3hlTVRw?=
 =?utf-8?B?RFlHOUlxa1BWcmVoQ3NkSVhCWUwrWmtnaHo1SDVDREc0czFtRWxGa0VlNDdl?=
 =?utf-8?B?M3lTc0tuQk5HbU9mb1RpTEszOVlYSUVhcEtTOUc2UnliNUs0VUtuWlFQSnJu?=
 =?utf-8?B?RDZxQ2x1QytodWJFcHJWZ2ZWY0tPV3VXL0tIeDIxaCtFRDZ2VWFLSDdVN0Za?=
 =?utf-8?B?MnVDM09XcE5tcVh3OTUyamFYbzhTSkJLalhvaW9rOEErSnRSVW5lTVBubzBi?=
 =?utf-8?B?cGh0S2dCZDJ4UTgyUzRuQW1pNjVPVWJOUTZSQUYvTEtuMm9PZ01RU3FNY0dW?=
 =?utf-8?B?Zko5SnExbWMwRjNwdUVlM2I2V2JNaFFqVnB6cWV5SmZ5bHVrVUMzamptdTNp?=
 =?utf-8?B?Q210akd6bkZsYTVva3JIUmNMS3hvSCtvWExhVWRNVjA3QTdFNmFURTZTQlZP?=
 =?utf-8?B?eHU1WnphbTdtendnWFU0SmxWaDQ4REI5S0VLWVhPcXZKNzE5Ykd4MXdiQ0hU?=
 =?utf-8?B?aVJJeFVLUUhqaHVOd0M5QytzckRjK1JibXRPc0trOVFzbjFjejJ4ZEdVNWFm?=
 =?utf-8?B?cTVJRVZMWlN4YTNnY2FXd2s3dW1pd2hpMFVjbmx1TW01WFBhV2c1MmRybDJp?=
 =?utf-8?B?cFMyZm9KM3FSTVlnQ0o1WW1Da2NFMmU2TzlvUGhRYUdmNDd2VlZsUEVBWW1x?=
 =?utf-8?B?QXl2YWMyYVptZXpkMFpFQ2xrNkFlalQybnZtOVczYWxGUFpnMmR4dVgyenpy?=
 =?utf-8?B?dGY4NExoYTBtdFl2LzVwU2tqenk2NzlhdHAxOG1HcFNvOEV6STA3R3N0NjBG?=
 =?utf-8?B?VEw3Rjg4Z1FuOC9DbkEwVXMvOGM0b1NjVGU0bmw2dzRpMGlaZHhKZ2srWW50?=
 =?utf-8?B?L3JWbnByVTY4TmRvN0c3UmtYMEZnMGQrYU93N0x6OGY1WU9WNkhpWHdHVnla?=
 =?utf-8?B?YTk2T3BDVkk5R1VTRm85RWFIbnFpWDJqM0JaMWhzRnh0Rm05MUNTb2RIam1u?=
 =?utf-8?B?RDZHYVBwYXJmY1RYQkh5Rno4dWtCaEdqQVFpcXVhdjhRMk1YbHRkdUJiM0Uz?=
 =?utf-8?B?VmJUalM4N1l0OGJIZzFQeWxOZG1KSFpadGFpbTVWYTFhRkVkeVh0cWNQem9p?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90008539-0ead-44a7-e990-08dc7a80cd88
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:20.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST/LMRq41zjU+hatDEIvD/8Pfo3InOQc5oVNgbFtA8E5RKUxJX6EaogCjHbwtuvtMQag2NGbGXv2vd5a1XKAUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

In the regular use case scenario, user space will create a
VM, and keep it alive for the entire duration of its workload.

For the regular desktop cases, it means that the VM
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Limit the VM protection solely for long-running workloads that
are not protected by the scheduler references.
By design, run_job for long-running workloads returns NULL and
the scheduler drops all the references of it, hence protecting
the VM for this case is necessary.

v2: Update commit message to a more imperative language and to
    reflect why the VM protection is really needed.
    Also add a comment in the code to let the reason visbible.

v3: Remove vma_access case and the mentions to mmap. Mmap cases
    are already protected by the gem page fault.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5b1694b292f..2a49dea231e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	/*
+	 * Long-running workloads are not protected by the scheduler references.
+	 * By design, run_job for long-running workloads returns NULL and the
+	 * scheduler drops all the references of it, hence protecting the VM
+	 * for this case is necessary.
+	 */
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
@@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
@@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	mutex_destroy(&vm->snap_mutex);
 
-	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
-- 
2.44.0

