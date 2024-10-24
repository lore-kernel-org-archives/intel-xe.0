Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034DDCE8E7A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855F10E284;
	Thu, 24 Oct 2024 13:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeeeST7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFFC10E949
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729778091; x=1761314091;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oZpFnab65J92ys2VUYqH6w5m/j6lt2YmqtwfHwXY4Tc=;
 b=XeeeST7BqsSOcZ3QXEkIMJwdknZgwP6TT+Q2Mj7VX5hMLyOBATzjJGGl
 4EYQpTod3x5ZUMfL7LCurJWdEAN7P7rwYaYUNYAITtu0G6JgcWIfjnKl6
 DG8M1K9IxHjrAnkaZCnKrNyM2wZQg6YfNPGFcj89h8PMwUxidc5ULEaOW
 fmH2xLq60xyNeXLPDjbFxFLPlLyH8J1NXWQZud9Kg6xuxSmNsaOLCkQUN
 UtRjH/+nUYR7jA6X8uWt2sxbFXTKERQnpt00lZmSlvRrmlg1byRtN/N94
 ExTcNJv33tqZtugzIOqXpzi1LJS5i0xTTqGrO0oRbQEjRtiG1zIF7QnKn Q==;
X-CSE-ConnectionGUID: pZdcQOLrSs2oR/SdxCTCWw==
X-CSE-MsgGUID: KeSgnbM6Qvi3kthbqYmiFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46894889"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="46894889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:54:50 -0700
X-CSE-ConnectionGUID: c5Tnr6R5TMC0obeRX0Nfhw==
X-CSE-MsgGUID: IDETMiKRRa2Ht7cvbEROHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="118056181"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:54:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:54:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:54:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpvzoaybXEAlm29ed0wlo0eO8ZlP8TJXMgvh3IHd3JxrcI+xA4xmNvKg/pd7aE4cQaGQLYW/E2kMLC0h3MLt2elm3cujUObEvu3L9iDaco128Qflegn6XVZEgUVrO37/olYtLtkbaIEFionoXKEco8d8K+Qv3X+lzxtb8oN5uSTyhbROgZJhHTS8zVLoXsKhjK4ao8mJT0X6WDtX4VSxJlC50fNBADFF478niv+47EtyPFrrx0vXcssLph270+aX8+fAgcV+Gf81Kz/soqctSCpr+U6QqT2UKEUf5AT5jceGnvbtEcXII+C8hziqtOZWRHpa8VEEtwgfmTNOfyxfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkcrQf9aoQ0wTVOHtRns6OxeyojMWiLZVKAwqedDqns=;
 b=CUlahTFIZ3HzqQUCYEw4fjwwO+zlT+o2aJT+KB2LSvsp1HUov0r7K72y5MkVAW3Z+rcC2cWpCuC2kXjhUUdlTKaNCrcwoCtTRg+Apqf9UOl57uDGTohjDBiVFJck//cghQy3e2KPgN/F4xJlugeWLHvIfK4A6RdZWZN6oLTyByzjHCTEmsRgHZRQIBJ8C7b+nLepyeKHL9PIAC7cFhX2tDcOpmHN5c/5rtDS1d2LP7LIbPvDX2edyhKPx6Jak7XYUdrxlsxDerZCj4KBQcFbTFI/sd2TwOSIX6X61OcrE1qZ+EHAyCaowavI0LTmZsLeSJcpj0XGgnIx2ADob1FY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 13:54:47 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:54:47 +0000
Message-ID: <799029c9-a8c2-438c-bc12-e9a091247158@intel.com>
Date: Thu, 24 Oct 2024 19:24:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
 <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
 <63a1062f-56b9-4367-92fa-0ef0dd235adc@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <63a1062f-56b9-4367-92fa-0ef0dd235adc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 800c8d2d-90eb-4aca-aed4-08dcf4336c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFE0RG4rR2lBZkNReE1IWXRpbWRzd29ralR3eW1xclZ0MnBHNWZ0aUdOc1dp?=
 =?utf-8?B?QWM5ZVRFN3BxekxZa2VDMFZTUzhPeUE0VkUyUDdPWkFQUVNpc3JxQW9MVTE4?=
 =?utf-8?B?b0x3aDlCSnZjS1lhNXNhSDlZTnI3Z3RWcGVWVVFGdlEyRisyNmV2bk5VREhR?=
 =?utf-8?B?SkVmWWxET1Q5OGltcWQwKzZYT3ZLeHdPQ0NpeE9CNXZ6c1hQNWdwUGpzeGhh?=
 =?utf-8?B?S29vNW95alQrTU5rRmJ1eDNTOWZjbmVlZllqeXpJdHNPRnJYSGRhU3lpd2xk?=
 =?utf-8?B?b1Z0SnVoREFCTUZSb0pLRlBITG5NRi92T2VaWW42Mi9kLzJhbEl0SFh0UmNH?=
 =?utf-8?B?aUZrMHJqbmdqQ1NXN3JyM29QMDhyb1ZEM2NTVWhmbWZzK3dOZFNDY1NTYS9O?=
 =?utf-8?B?ankrY0lEenU5cGlmcjF1N09LVnBZa0FpM3lPOFRCdU1seUpFQnZDQWRlK2Qr?=
 =?utf-8?B?TFVqSzRheDhiRXc5REJCNDFVUzhuNHhvUkZtKzFpZkNQWjRBLzZMSFZHbmFO?=
 =?utf-8?B?YUY1bDdRYlluNEtQWU9rZFVrV2pmQmhreVppc1AvL2NNK1BMWjBPbUtaZGZj?=
 =?utf-8?B?R3pHdDM4c3o2Zm1mWkwyR2lZSHZGdkVkVzBRSFFBQVJVcDZURzdNWEJqQWpE?=
 =?utf-8?B?VGgvSzZ0Zmt2MnZnaUg2U2VnZzdobHBXd2JjMHQyN2xHK3JhcEV2eWpxNEhj?=
 =?utf-8?B?THFkMU9nV2JBbCtnNmxIMHNOR1hMOGloWUlRdG91b2NTZXFvK25zZUVVcWhq?=
 =?utf-8?B?clBWKzVBVU1HM3hUNEZOVkFGdnV5ZUY1QjhGdDBHK0pnQlFlNVdFSDNSYStI?=
 =?utf-8?B?cUFUZmdyUTRLV3VRT093S2dod0NlMTlPZk5wYkxySFBOdUJmK2pkWEtQcm00?=
 =?utf-8?B?VEU2ajdOSm5nMGI1NFF6K3lZdmxGRjhEV2dNZEpZcTZDVTlUdVg0Z2xabnV0?=
 =?utf-8?B?L3JUTyt2OFJZL1pKdjdWRHpYd3dGaDN3NCtkRHpndjBCaFQ1NkR5dlR3WjZn?=
 =?utf-8?B?M0RJQUx3MVFKeUdZN01rZTRJdXBjOVAySHZnSFJoRHFjcTNBL2JQaGFqTEtY?=
 =?utf-8?B?MU1zeHNObUlrVmhTYmVYcHI3RyswcDdmbi9BRG9JZFUwWU03Q1lwdTM0QVB5?=
 =?utf-8?B?UjdmaFE2VkUvWG1ZM3BwUFNBYVdzRkp1NDFHVjVSM0NMTDBHbUw5OUdSdlpw?=
 =?utf-8?B?OU5lV1BBdFBNTC9MSXBqQTF2eS8zSUQ1OG1tYTE5K1kwMlQ1bDI1TGpEMGRq?=
 =?utf-8?B?WTJZU29iZ1RGVWJIMDVYMnoveE1rTTlXODRzcDFSVy9scHMvMllIcmhLYk1E?=
 =?utf-8?B?eUZreSszWVpZQlNsaGpsWVN6dUJKVmgwaGZYM2xCSit2VE8zWHNnTmxHYWhx?=
 =?utf-8?B?VEpXYWpNV3NEdzAyVkVRdTNnNElKNXhyekhaYnRTcU5oOXBTT1dpWE1vR0Q1?=
 =?utf-8?B?MVRsUndTRzFXTGNzSmwrN3RUeDlIUGhXNFFLcUdUNmRlbnJrS3BrQ0tyTVB3?=
 =?utf-8?B?Yk9vTWFRRTMxdUU5ajdIYmc5cVpsdTNaRmdScHFvdCt5a0FxVXR0SUE5dDM1?=
 =?utf-8?B?VW02WUxKeHF1Vjc5SG1SRk5zdjYvaHFBRzYrQkhFdDRuVVJ0Z2g2ZGFLKzhj?=
 =?utf-8?B?dndBc29xUDZyNjNtQjhwTE9TU3hWTDVId0ZWakdZVVZmNUtHQUxROXBvTEJL?=
 =?utf-8?Q?amYbImb78Au1MnDGYmCM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXM1K2NNRmhSYXg5RkpjK1laVTExaWtsS3NEVWVMb3RHNWhXYXlHSVdFUGlV?=
 =?utf-8?B?Y3ExVGRoZUlxVG8ydUhtWTJIYzd0UEE5T3NnSi9aZzVYbjhrblVCdXpzSUJo?=
 =?utf-8?B?UmRhdjdYazgzVVFQdnYzbVFpckozV3RLVDh0UUcxUElPOHBQZTl3T3hhNWN5?=
 =?utf-8?B?bDBmeUk3V2MyL2ZCU1F6SjJTZlJRc3NYUlRPbkVMZWZqRFliRWc0TG5TMFpW?=
 =?utf-8?B?SSt4dmFDVTNtcWVaTnNJdC9pZzJvSnlCVUx5RW5seWJ2dHFxdHFxb2E0Vksx?=
 =?utf-8?B?RU9qZEt0cWVkWmdRTlZVU2RpT2VOdGQwTjc5cUNsUkY4ZVkrdWxiNDlLNWxh?=
 =?utf-8?B?RUVsY3NSU0U5dlBIZGVLaGdVY2M3eU9qZ005N0VSa2ZKdm9KZm4zK24yODR6?=
 =?utf-8?B?eHVvZW5oa3VuUml5UEFWb0xmTDJYU09ST3RncGhRbnJLdmJRUHpqS0VEZGhn?=
 =?utf-8?B?OS9zUFhIRjhXV3FmWUNrSVFqdTVvcmJKVElEZDY4cnprSlZnRjBVZFY2UVJh?=
 =?utf-8?B?UFp6dzYvdlFCOXNDN3BvZmcyV0p2TmJuNmhMQkhWbXRRelo5d09JKzF4T3gr?=
 =?utf-8?B?WVZxa2xjUE4zTHFoYTI1eW5HM3ZPSWRMeUY5NEg4NkFXZGVlSDBTNG8xVGtu?=
 =?utf-8?B?YnlXVnNyVHMzdFRSN280RXhmeTZSc1BmNGs0c05YdW85dlprRFZ0b1M1QXMx?=
 =?utf-8?B?RjAzWmFoaCs2NFJ6cTZib1J0TmxKblhIWENxeEt5d1N5elFuL2RoWFZwL0Zj?=
 =?utf-8?B?MzllVkpMNExjVlU3akx1eFZTZDBmUWo0NjcyaW1xVWJ0QmwvZGtQUTVkaDFq?=
 =?utf-8?B?Y3JaQ0VITVByZHlEaG5UVGpmVC94R2ZNM0pidEN0U21XZHRtNi8yT0M3aWxJ?=
 =?utf-8?B?bGRZZGxiMDZPeDFJaFZwWG4xT3RvVnpOVlhwT2FLdXJQcXoxRTV3Y0dzNzlK?=
 =?utf-8?B?R1hHUHA1WDIrRjVFSW4yWithYVVoTnRFaUxkQjNZQlRnYXYwSkdXZi9YcHBE?=
 =?utf-8?B?RTZ6blA2UlB0QXlGUjJlbTl2eVJDaDJsRG9QU250NGRiMzVPZ0srNGZSK3Mw?=
 =?utf-8?B?dlQ3eFVSV2tXTGJoYS9FUmVMMEIwR3lUd0lwT2VLN0F3N1dtY0V4Vi8wS1Z3?=
 =?utf-8?B?enkyalZ0MHpBcG1KWTg4endoMlB0UExiNVhwQVlMdG1yTUtrdjJBM3BWMkZ3?=
 =?utf-8?B?NlYzRkZlTHFWVitieGdzbEd6YUwvQnplbWk1YzlPYTh0WXdnNFBZTzF1UHlI?=
 =?utf-8?B?a1RORXBoY0ltdUE5aHRlSVNuUXlFK2xjL1VybFlkaURKTzY1NStpRDI2VjZy?=
 =?utf-8?B?U2dRMTc0OUQzWnhCVUF4YnVZS1BIWVRyNlhBc1F1R01wTWlkdVhUUW5Kc0R6?=
 =?utf-8?B?V1UrTzFtZFlacjJqSE4vMU1SdjdLTjl1c0E5NGJESjZzbnpNdVZGdWhvK0do?=
 =?utf-8?B?UXY3aDNxRTBPNWFKeTRQdElEQjJDYXJoNzIzcjViaWQ1aU12LzhiOG5UOEZS?=
 =?utf-8?B?WGx4VkQwS0RRM3ZaRUQrQklGSkFtb3RTaDNPNXZQNUtqaDh1Vm5PN0J2QTZU?=
 =?utf-8?B?TldjcDlabW5mU0lySFlUbDkxV1pDS0pKczlnY3JpZC9hdmtqSVEwL3Y4Ymxk?=
 =?utf-8?B?WjcyelBLa1F3Wjd0STFEa29KSkNRRnNIY3F3WmNwOExlWlBMZU1qcE4wNTRh?=
 =?utf-8?B?MHJCbEJ1N3l0Z3p0RGdmbzVhYWtQUUhsWUdRVWVocEErellXblpvdnErTXZM?=
 =?utf-8?B?eUNxaWFrcWxqNlJiRGUremhKMVJ3ZDRpL3FqZW1nb3FrUis4RXJLUnpzSVg0?=
 =?utf-8?B?bTFOakx0YnQxcldqNTl4czR4bDJTdkwvK050WDN6cUc3YWo0aFpvbjIvSG5h?=
 =?utf-8?B?L213QWdTM1JBSzRaMm9iWmJGQ2VHTUZIcWszSUV2Sm9zTmF5bVBSbEU2SmtT?=
 =?utf-8?B?bGN3dFRDWFFITHV5MWNxQjlSQ1N6ZGk5WjhDUE5sVlUrbmY3QzU3OU5jS0dt?=
 =?utf-8?B?d3BGdE1PTGJNdnlGRXpONmZoSG9jcm1YK1FnRmZqLzR5UFkvUVNIVFVJMXFE?=
 =?utf-8?B?SXRuSVg2YTlSZXBNZHpRSXMrQ1hEd3QwS1R4UmlHeXJZZkRlTzJycGppVmJL?=
 =?utf-8?B?aVUxOXZnKzV5eWl5WkRkaGhlQzg1cUwyMGtmTVZRN1BIbDFaTDNPOXZsSnY1?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800c8d2d-90eb-4aca-aed4-08dcf4336c09
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:54:47.6621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DH5Q0iwGyavptBtupKLHaEl940FMgROns+pCbyMhHl7zmVODogvW37Amhk8Qkdt+293sF5/XAb8FAl4XEiAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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



On 24-10-2024 18:41, Matthew Auld wrote:
> On 24/10/2024 14:00, Nilawar, Badal wrote:
>>
>>
>> On 24-10-2024 15:47, Nirmoy Das wrote:
>>>
>>> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>>>> observed on LNL and that points recent scheduling issue with E-cores.
>>>>> This is similar to the recent fix:
>>>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>>>> response timeout") and should be removed once there is E core
>>>>> scheduling fix.
>>>>>
>>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/ 
>>>>> gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index 773de1f08db9..2c327dccbd74 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct 
>>>>> work_struct *work)
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>        struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>>>    +    /*
>>>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush 
>>>>> g2h worker
>>>>> +     * in case of g2h response timeout")
>>>>> +     *
>>>>> +     * TODO: Drop this change once workqueue scheduling delay 
>>>>> issue is
>>>>> +     * fixed on LNL Hybrid CPU.
>>>>> +     */
>>>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>>>
>>>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK 
>>>> tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in 
>>>> IRQ handler itself. Is this change solving the issue.
>>>
>>> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from 
>>> GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.
>>
>> Agreed, it does handle in the slow path as well, but upon receiving an 
>> IRQ, it will be managed in the fast path.
>> So I suspect this is a case of an G2H interrupt miss rather than a G2H 
>> worker delay due to the efficient cores in LNL.
>> For now, this change can proceed as it is helping out, but considering 
>> the possibility of an interrupt miss, I suggest debugging from that 
>> perspective.
>> In another thread, Himal mentioned that this issue is also observed on 
>> BMG, which strengthens the possibility of an G2H interrupt miss.
> 
> Note that we currently still process the G2H events in-order, so if 
> there is something earlier in the queue that can't be safely processed 
> in the irq then we leave it to the worker to handle. So we might get an 
> irq for the tlb invalidation completion and yet be unable to process it 
> in the irq.

I hadn’t considered this scenario. Thank you for the explanation.

Thanks,
Badal

> 
>>
>> Regards,
>> Badal
>>
>>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>
>>>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>> {
>>>>          if (!xe_guc_ct_enabled(ct))
>>>>                  return;
>>>>
>>>>          wake_up_all(&ct->wq);
>>>>          queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>>          xe_guc_ct_fast_path(ct);
>>>> }
>>>>
>>>> Regards,
>>>> Badal
>>>>
>>>>> +
>>>>>        spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>>        list_for_each_entry_safe(fence, next,
>>>>>                     &gt->tlb_invalidation.pending_fences, link) {
>>>>
>>

