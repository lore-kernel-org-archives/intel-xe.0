Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C26D2FEF4
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 23:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D489A94;
	Tue, 27 Jan 2026 23:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3BmJCB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DFF89A94
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769556752; x=1801092752;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GdwjNSq8bcscL8dqGq73RY1IMzz5raSKBZ8lzBKR440=;
 b=S3BmJCB1KSR4vrBz8MIZWvumlmEF91rZt/1JcjggV7KAvzq14uQMFAoC
 Qv8cAUBwZPj5uPZoYycV0FZaLekbtMU9/vC5aCTgn8FoFASVLm6lPHsxe
 KZtAMZpWx4PJyfFGagDBQbbbWehPnlgIw4JZSN6zHSWc2k34SZVNLMoCi
 +rcBnWyer9s264bn9L2ENt2nXbKV3zG4pA/ZcYfGBD+jbVcwuIJsPGc8Y
 jowk8NKeFQdBzGMZYEnSzvk+ZtuMBDHz6Esb1qZPrBZSx/41mpXxTY6be
 PKaddfKSf3AAwG3aPygP0pQdpXj/Zfno8c9/AEOYz7jCPUWiJ8h0g5uBS A==;
X-CSE-ConnectionGUID: 3Tbdky4NS5WAVlIqDgJQIg==
X-CSE-MsgGUID: E8Y5AJxiRiCOtfBqrGryrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69965087"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69965087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:32:32 -0800
X-CSE-ConnectionGUID: cxR+aYrXRcWRfHZrwFmidg==
X-CSE-MsgGUID: RmH7eNweQ2+4+5xgCWKw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208339209"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:32:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:32:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 15:32:30 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:32:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pR9Y4e/iEKCW8M7gvVqoZMdqvpJ2m8VaTvTMag3wECejbADcolLWqguEIXq2Tni5QhngsgmQpY9g5L3FZykylzWvRlME5JKr3CTStKkkPCIauWz3ScRSHjeKnp6I5Vqt8wWTRIkca2BCGxENsmU8PsfZ7J14CELqJ0BtDqdsZPRI/IrXmrtdRc2UyMmLPCOxySJUO6A/JT7O+YwTuggDbmexWlULw54VmNGTDll7Ff2MiMuewodEkjkDqpRH/qdt1vlrOUCcRMAMm5LWPMHbeaUZ/AmysivoLRii7KmCStS7o7C15bBgzqYOkrmLL2qnzv4eS26MI94pi/bgnkjxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90d0RoQfVwuMlh6RPWsWO2WycnmuCAjPv4chQLH/xww=;
 b=RL3B2wWDzVNHYd5QAPoej+68pjzjZGj5FLkCLRFyS5zoEXbca1J0MXHTFX34F3j52jjCParYRUpo5hFHkBkSdSzftUdCt/b2HRIFuUaONi0cJgsFRQoA+BOcONn+U4u4kSJnPcBuxuNw2UjqJYOSZdNAS0Hp8yiPzQYPQ298POLfKg2MlyjjmpAE1z4XwHev6u+6CDr//1wbgK5gyky90QAh0aEIXWBdOtUOL3toX8qpyiPf5QpiisUA3LY924DmOZcLmb00PBb2f0fR3j2SazyWcTg395xYb7EgUq6VUfvtJO3rp9Gbj9p+5XT3qmNdPj4+d2xMV/aGjEPuu9kKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 23:32:27 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 23:32:27 +0000
Message-ID: <b6736da7-a430-43b5-bf48-d09a2af79af0@intel.com>
Date: Tue, 27 Jan 2026 15:32:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260127024315.359176-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260127024315.359176-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adf7d77-9646-4f39-37b8-08de5dfc5503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bndTOWtqdDB3cHovQ3p1Z2ZMN3RvWVM5bDVGdHJ5M2piTC9sU0lHMHYzSzU0?=
 =?utf-8?B?YlB0UEVXZzdxdzhuSkhCTStscVcyQUZKbDhsOHRra1gvRkVlNnIwS1pRd2k5?=
 =?utf-8?B?by82K0t6WWlnY2gyb2krSGc5cTBUYUtSNHRoRlNuNGpLaEFzeDJ2RUp2MzBr?=
 =?utf-8?B?Tnd2LzlkT1FZL3lwOGQwbjZSVlBPdlhMRkZsNVN3dEp4ZEk1ME1NbWd4YnQw?=
 =?utf-8?B?ekpBUlIreVBMLzJIY3pBZTd0U0hQbXN6NmdjVXE1RkRpUE1qZXJseVVmeW45?=
 =?utf-8?B?NjM0ZjZGekVnKzUweTdJVExMaGxTYXRYekNkTWZwd0hyYVdnTlc2TlgrOW91?=
 =?utf-8?B?OEJOcGR4bmIySFE1bGdxaG5hbkRwK1N4Rkh6SytsVVBEL1dWbjhIM0xPMWVJ?=
 =?utf-8?B?ZjNuR1ZnUUJLZ0hYUmJyMmNSOTJNSHJBQ2Z6VURjUExEeWNEQ0NYZThjai84?=
 =?utf-8?B?YUVyeUxIeGs2TitCUzFUWDc4N2lkTVNxYlNPQXhid2s5Vk4xTHhjMkVGVkc2?=
 =?utf-8?B?UFp6U0ltcjhsYlV0K2FJV3JlS3hlTWMwcHpnUGVpR2laOG1aWGtPZ3lzRTRW?=
 =?utf-8?B?L2k2WFhjZGFtaFhtRi92a1VKYUU4aU9Gckd3Q3k0QlU1VmNXd3VQU3hLV2Jv?=
 =?utf-8?B?dUdiTVV5WnRrMFhqL0dOZ2F5NmdJVERjNENic3hvRnFpaTZ6cDN2ekRZZVdD?=
 =?utf-8?B?UnZDN080OElXbmw2UTdZK1RBVHFRUWxQT2pyVnI2d1dwT3lVSm9aVGhIZ2Ew?=
 =?utf-8?B?cGUvRzNwc2lYcGtacFRnaFB1MDdSUFE2NElKMis2aFgwMC82aVM1SytrZHg2?=
 =?utf-8?B?cGRhWTRxdTl3aVRVdkpIVHI0dDFHaElsWXBRQVZMZ1lFbmlDbS9ZRGRCU0dt?=
 =?utf-8?B?NU00TlZ3c3RqY3NyaVE4WnpCNEtQeERpUjRXbGZtSTJTSDFyanpoYnFDZ2JH?=
 =?utf-8?B?Tkx0Q0ZMVkc3Q0N3TVFid2xjbHpPeFljVVdNSGlYdWpGZWdrZ09xSXY3aDlJ?=
 =?utf-8?B?UXVLZHVLYXhCZkc2MWZ0RGx5VHd1b2NLNU5UQWVzWGpxdndmRlpxTXIzMDBs?=
 =?utf-8?B?MkxUSjdCYXcvWWM3ZUFqQ1RuOG81blJxK3FrMDdQejcxYzRzVWZoYmtsL21r?=
 =?utf-8?B?ZGhjcWVvTndvR00wK3Fxb0E4djdhc2k5N2RwNGdGRlh1OCtvK0w4ai9NYjBX?=
 =?utf-8?B?NzZaWUVwYzJzcmhjbnJiRnpvaVd5MHVEZlZFRE9VeGgzekxJQVVrOFA1Tm9E?=
 =?utf-8?B?Tmw4Z0FxSjNtNng5WnVIb2h3YmRUeXNFaTdBMzBBV3d0U3R3d3ZsY2E3Ni9H?=
 =?utf-8?B?RkNWL1NOYXZ1UEplaEIzVzE2U3Iyd0NTLzRKeFZUT0hKcDNuZURHa3Z3L1hK?=
 =?utf-8?B?WTBwZVdielFoQmZEb0pEMHBhdUx4OWRYd2orVnZFSTYvN2xjMTAwdlkvaHlV?=
 =?utf-8?B?ck92d0EwU2w2QmJVdGU0MVBaWHErS0hjVTlIWG9yK0ZiOWpMd1N3dlRrdFRo?=
 =?utf-8?B?MTRybi8xdWcxU2Nyc1VkVGpDcEFKQm54NDR2bkFJQUlhTUd6MEhFN243NHp3?=
 =?utf-8?B?ZlpCN2I2TldCSlN5UlNoeTJvQmRUaWtKWERjZmdxaXhpVlBVZExraVRqUWZJ?=
 =?utf-8?B?UGV1blRRUnBKeEFKak1kc1JDSFFJN0ZkRUtha2NLVTFtQjhpcUdqdVZkTllT?=
 =?utf-8?B?aWZIU1d3VXhxTXlvTjBBMGtVMWpWTUpRVTRSNmVXWU5lTmR0WnFWeFY3b0Rq?=
 =?utf-8?B?NTc3VmZWTFJ5amU3V2NWZmVFUEtjMDF2S3R4OWJwUEI1TDRWTHhYaGJ0Tjln?=
 =?utf-8?B?SXpzUmFZVm03a2Q0SEpnc2lvMTdPeUsyVjJ6SldkYVlITlVhSnpneFhjZWhr?=
 =?utf-8?B?OHRYUlBBUUp6VzUzdFdWWDM1ZFFaZm9NMjlNbm5XU3dyTlRiam1odVVFUTVF?=
 =?utf-8?B?b2dvVGJlcys3bkRLN1ZHUUdqUVJOb1ppT1BJdEZHSUtCeEltRXAwNEpKWHo1?=
 =?utf-8?B?dS93b2x6SjVYT1kwbnFiUG9sSTBjQWQvTkdHRDhDNmhZeEpaTy8raDV1OVZG?=
 =?utf-8?B?S1g0Tm04b0J4RjArRHAxekVXa0wrQjFiNXNNYVk0MTY3cVNtUkVZekhVNmpw?=
 =?utf-8?Q?kn1w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFN0eW5VeEp1c25lMG5EUUpOd1lYaVoyZnVCMWNtRjJwaHlWNVJUOWFQL0xL?=
 =?utf-8?B?WlZmOFFBWjBjNHdWSXprRDE4bTJqbUFidWNuM3RhYk1QdjFVbElIb0dYSW1B?=
 =?utf-8?B?V3d6RDExSzBkMUJVWWVCdit5ay9WU1YweHI3RjZUVkIrcDlSNU1JVkp6Qzdy?=
 =?utf-8?B?SnR6S042NFRiTEh3TlZ2Ky91VVBVak5qQzFjYk5MeGJ0N1ZSTFJ3TWx3R25Z?=
 =?utf-8?B?U2dlajF5M2FGSlBqZzFnMDh6OEpzMU0xQXFFNUkvYXVSQVlBc3Fxb096YmZp?=
 =?utf-8?B?cVozLzRFby81YWtYM3BtWm1adDVYZjNrTlo5Yk83RytnN0d3ZlljNjZiZXVn?=
 =?utf-8?B?amwyRlVROWVGU0pta1RUODlLVytKcURva1ZkR0dxZTAwOVl4TXYvaW1vSkkv?=
 =?utf-8?B?aDBpSzdVU3p1UDVuZVpBQzdBK2VkK3dkTWwzV1FKQ1o3aXlJTUMwb2dXSVU0?=
 =?utf-8?B?alN3SlZwdGlWZHdnWEFHQVgrc0JVUDNOQ05VeHowb0NCQUpOM3pyREswZnJs?=
 =?utf-8?B?NE5oNHdpM0F3M3dZWU0zVG0xREo0NmFwamVMbEYzRTJEQVJrUTl2WVBydWRD?=
 =?utf-8?B?ZnJQSnZJeUNEekhaT0dLd3NyOVBwMGdndEo2YWFXd2IwNVRaTEJFZkFxK29u?=
 =?utf-8?B?Vm5sNGZnS2x5MDFIS2pHaTkwRmVtNDBsakVUdnY0Y2hPRjI2aE8vM2lQYnh2?=
 =?utf-8?B?Qy9OcjhxRkV3Q1hlQmczK2psMjF6clh4elNVR1pRSkFTcWx4SXVzcVBGQ1BD?=
 =?utf-8?B?SjJ0elhXMWpWendFV241TlZicFlMcFM3NlpUODJxMmUrdzBySWVra0t1TGs5?=
 =?utf-8?B?SjY0QVE0WGhKKy94OE5sbTRPcUVrd3BHMkZ4Z2tnSHYvZlRXR2MvTnc4RGVi?=
 =?utf-8?B?TTRvMzhSaU9rakxUV3RGelgxRnFvM3dHeE5wNEFDRk1iWUhGWGpIN0lmVHVw?=
 =?utf-8?B?SEJQWktTOTYzTG1ldkxleGgvQ2twbTltN2xxTFhCM250RFdtYzZ4ZEMxczJD?=
 =?utf-8?B?ZnErYzNtSDZUZ1lDOUZLYmV4NGhPS2R3KytJbFNRd2c4OG1ZamV4RjZmTFRK?=
 =?utf-8?B?Z3poUzBQTEF6MHpZM3IraVg1ekIwelJ6ZW9OMGEzR2gzbEx0a2xlT1hVNDdQ?=
 =?utf-8?B?bHlJWGh0M3E2SVBpVUdvMFZDQkFHQkczK0NVSmJHQ1hWaVNvcWkwNlAvWlJw?=
 =?utf-8?B?U25hY2dSSkZNTjBGcVRyYTgzWU1IMEYzU2pqVUZDeWxrZHR6bnVuVWxjdkxU?=
 =?utf-8?B?NEdtamR1bnNoWVVFUkNKdGsyM2t1dmVZdU9Fc1ptRklkVThGNHdVR2FlWEYw?=
 =?utf-8?B?WWNmVG9sODBJRXdhN2h4NnhOWnhYclZmUE1VeGw4dkpUbmwrMHBUREkrOUVl?=
 =?utf-8?B?UmdBRmFtbUN6bWd1TmE2WURBMzRxdWZLSFhTY2Rab3pOL3M0RDRXbk9uaDdo?=
 =?utf-8?B?b1VPK29sdDNDNlZORTgzc3JIM0VQQTRKZ3huMUZPM21IYlVsVHFnT2lTMU1l?=
 =?utf-8?B?OVlKRVFkMUcxZ3FNZFAwVkpsaldPTmVxTUN3YVhPb1JnWDEyYnovdnFJVDha?=
 =?utf-8?B?U292MENlaGcxMTk3SHVrNEV2M0FWNlhmeTFjZExQdHExa1hDd3R0ZXE1TGZX?=
 =?utf-8?B?aWdhSEhTZk5nV3daN2FUZUZ4RUZGMTV5V3VZRlVsdE9tRlF5azlKQlVPSTZp?=
 =?utf-8?B?QUozWU1yQ2NFQUw5RVlPbG9JREJaRi8xc01mSDlCK24zb0E5Z3AxYjY2Tktv?=
 =?utf-8?B?V0dINkV2SzVVMEluQVMxSloxL1R1b2hoVFBXSlp6UDNrYVh6SjNFMEtRRnpv?=
 =?utf-8?B?UDZsc1FmbmxSbG9Ed3c0WHVVU1lXSWV4UW9yMFAwWlNlY3grUEN4MzQ4YXYv?=
 =?utf-8?B?bGpaWHBaQ2lrN0ZVUHk1OTU5VmpvZzcwOU92Z2s0Y2Q2RWZNbHBkNjBQSnFS?=
 =?utf-8?B?UUoxWXM1QjRISFRoc3NWSUtiZzdwK0JqKzltaWtFWWxPYlJjeFkzK2o5LzJu?=
 =?utf-8?B?ZGplTHQvRFFIUndrbXlJZUwzSHc4MllKY0tnVUJKYXo2VktuampYazZ1NkRB?=
 =?utf-8?B?U0VmckphcEJUcytmRVhxRkkrTC9qcU85WEtzTS9lN2gzbUxWekQ3ajJ5OFhL?=
 =?utf-8?B?NXlvd0xnelRjemRiR0tzUkwwTjZrY3RJT0RnUmJWNEIzOEVmM3FEeUFxaWpk?=
 =?utf-8?B?MGpBc3ZPTytJRC9Jb3FKV1FuenZBT0c4WkdSblNMYWJyRjRiNTJteU1PSUtt?=
 =?utf-8?B?TGV5M1g4Qm83YTFpWDA2L25mNGVIdVF1aTRKYy9IOTNsT1lTTjZhZkhUS1Vi?=
 =?utf-8?B?ZmM5NWNtd3JMellDRmZuQVVESnpoVW9ta0Q5K3V0N3U4S0p3c1Q0WndIUFdt?=
 =?utf-8?Q?lFyZ2VhbiUyfhUgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adf7d77-9646-4f39-37b8-08de5dfc5503
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:32:27.3877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHa+X9NFILHhGmONoVoT2vQaybyzTFKCw2S0iRttGUdOBsDkRGUHnI+F+eZtQk+yROiwlqiLDQG5B67/hCnI1EvnK2WCy/ljW1/NO/xuCo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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



On 1/26/2026 6:43 PM, Zhanjun Dong wrote:
> xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and
> xe_gsc_proxy_start; however, if we fail between those 2 calls, it is
> possible that the HW forcewake access hasn't been initialized yet and so
> we hit errors when the cleanup code tries to write GSC register. To
> avoid that, split the cleanup in 2 functions so that the HW cleanup is
> only called if the HW setup was completed successfully.
>
> Additionally, fix error handling in xe_gsc_proxy_start to properly
> disable interrupts on failure paths before returning, ensuring cleanup
> is performed correctly when xe_gsc_proxy_request_handler() or
> xe_gsc_proxy_init_done() fails.

This second one is not a fix. In the current behavior, if 
xe_gsc_proxy_start fails then xe_gsc_proxy_remove is called and the 
cleanup is performed correctly. Since you're removing that part of the 
cleanup from xe_gsc_proxy_remove then this new change to 
xe_gsc_proxy_start becomes necessary.

>
> Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
> v2:
> - Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
>    and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
> - Add error handling in xe_gsc_proxy_start to disable interrupts on
>    early error exits.
> ---
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 42 ++++++++++++++++++++-----------
>   1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 42438b21f235..0f62ee7dab4a 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -444,16 +444,6 @@ static void xe_gsc_proxy_remove(void *arg)
>   	if (!gsc->proxy.component_added)
>   		return;
>   
> -	/* disable HECI2 IRQs */
> -	scoped_guard(xe_pm_runtime, xe) {
> -		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> -		if (!fw_ref.domains)
> -			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> -
> -		/* try do disable irq even if forcewake failed */
> -		gsc_proxy_irq_toggle(gsc, false);
> -	}
> -
>   	xe_gsc_wait_for_worker_completion(gsc);

in v1 you had xe_gsc_wait_for_worker_completion moved to 
xe_gsc_proxy_stop(). I think that works better, since the worker 
shouldn't be queued anymore after we disable interrupts.

Daniele

>   
>   	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> @@ -502,6 +492,23 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>   	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
>   }
>   
> +static void xe_gsc_proxy_stop(void *arg)
> +{
> +	struct xe_gsc *gsc = arg;
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/* disable HECI2 IRQs */
> +	scoped_guard(xe_pm_runtime, xe) {
> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> +		if (!fw_ref.domains)
> +			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> +
> +		/* try do disable irq even if forcewake failed */
> +		gsc_proxy_irq_toggle(gsc, false);
> +	}
> +}
> +
>   /**
>    * xe_gsc_proxy_start() - start the proxy by submitting the first request
>    * @gsc: the GSC uC
> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>    */
>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   {
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
>   	/* enable the proxy interrupt in the GSC shim layer */
> @@ -521,12 +530,17 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   	 */
>   	err = xe_gsc_proxy_request_handler(gsc);
>   	if (err)
> -		return err;
> +		goto err_irq_disable;
>   
>   	if (!xe_gsc_proxy_init_done(gsc)) {
> -		xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not completed\n");
> -		return -EIO;
> +		xe_gt_err(gt, "GSC FW reports proxy init not completed\n");
> +		err = -EIO;
> +		goto err_irq_disable;
>   	}
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, gsc);
> +
> +err_irq_disable:
> +	gsc_proxy_irq_toggle(gsc, false);
> +	return err;
>   }

