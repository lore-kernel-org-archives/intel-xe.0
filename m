Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDCACCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 13:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9710E2BB;
	Tue, 30 Sep 2025 13:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1j5COCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4EB10E2BB
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759239534; x=1790775534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lpzuGSpvlZVVJD2XPFVoVg0HV2bsoBJ7G07s+uivvZk=;
 b=m1j5COCHl50SsYeV0SUpz1dTJtkWLg7FjfyGJgW1VyBX9Rgf9MnM5C9L
 byjw/R2TYllBspMPYJXH3xv6sdUhiPN6elpH07jWwxK6124KrtkHn1G4h
 nUhlLNX00LZZJqflB4W+izAfLserOo3ifhmZ2RqK4mFeWmw/PflJ8FxE8
 K83nK/6AtIEjyEyZDbI0gP3NIgsRuGOaTbSKAPa4pH4lYAUTceG6qs1ai
 nVJPZrsIaQQBrynuEvurSq2T4CMhODZVJr/+XDNppwFF6aTS5jXIEhLY6
 hpokMG+4E8hyOuPvumf7HySWHWuf6HrRd8wrTKNeEsUhJbptDnpSVrcMj g==;
X-CSE-ConnectionGUID: zJPxa3RKS+2HoxZI68wrLA==
X-CSE-MsgGUID: pawX0l/0QeSJLhEcZrUwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61537362"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61537362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:38:54 -0700
X-CSE-ConnectionGUID: G1uqpfA3SHCwjaPp8u6Lcg==
X-CSE-MsgGUID: WESuT7n1SXiyZyIqF5p3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="209472316"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:38:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:38:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 06:38:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2sejDlqa0/o9u1soyDg40Rcg4oQ2JaTG6oMiTMLcQc5m157HSpSe4DZ+lXxRfaMPcAD2cb1ygD1wS/dnxx0I1/ZaEX/i12E3y4E94NaMylYGYlfKcOjIOE5BL2q4frRsejCms6az4959rObDsRBuGLym3TQgp4wqhVkw9JUeZN7b2grAkdLWTrrpWx+DPIe6xIvpuZeohv6hqK3qgdmf+NSvXZ0+Zn2RqlMXFdwMShO+SIj0bTOCy8NpGpkNgGMd6Oi9WTAXhnYFT6mL1QLd0vPjnB5jmIHJrx7LFJmgp/o8CCbAGTWcd/W3wGGKEdFy/SFZ5MW42QGzyQftxFQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/xcmaqZ+CjWNW5dYHoFRFWl06Khe3sLOir4r41C1Ls=;
 b=pLjn/SBBnc6NyUXWYaWee8Rtk7J5nMFsCaB0HdANxa7VPDuI2N/ACdu34WnmF+5+QaHZ6hzB6Q8AJUvd90f72m4EqH7onx3NCIhj+7xpPmHXMnekyQbAeJaN1xm+nipks94OXUTL7SA6nWDwDqrY2BFCLgQxZVq/TyXsl7VLsublnTpMWgocHfm7IqJCOx4QItolPiSGF4ZtEDjohnuqM2LMYcl1zYUj1PBRuddxG1V3HtzKDJHylGoG7cr701JhGsHOVcBSm34bLxb8VBAbQij3v8K9X0G95UDCBCt+n5iHpgTBytJd94q4ZTtlMBp66b0muIn6uBvWsIfyvIUr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 30 Sep
 2025 13:38:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:38:47 +0000
Message-ID: <e810ff32-f250-4ee2-b6f7-815bd48c412a@intel.com>
Date: Tue, 30 Sep 2025 15:38:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 36/36] drm/xe/guc: Increase wait timeout to 2sec after
 BUSY reply from GuC
To: Matthew Brost <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-37-matthew.brost@intel.com>
 <7caa086c-d90d-4ca8-ab1b-7241e9d8c0df@intel.com>
 <aNvPhmgEhCpGSGW4@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNvPhmgEhCpGSGW4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba20955-551b-4fe0-99f2-08de0026ae7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUd4M1dhWm1rbzBJWDhRUVJubForb1hnOVZyYS9Ga3p1UWhqaUkwTjhHaEJR?=
 =?utf-8?B?a3hPVTFZdEFTQnV3aFlpRkNoY01xQlNxNENzUzZQaTduK1dONVA4QmZuZXM4?=
 =?utf-8?B?b0t5VWRoTmgrUzNGbFhVZVFSMTdUQUFjSEdZYkZQTndJN3NkMms1TjcrWHIz?=
 =?utf-8?B?VjlxNllYdXRaUUNXUStYTTNjbnp1YzFuT3lJSlU0VDlLQUlaNXZXQ0V1MWZx?=
 =?utf-8?B?YlVsZFo2d0RSQWQrdEJOVTVjcDkwY013Vk0xckdHNnlmMXB0YkU3ZG1mdWxW?=
 =?utf-8?B?SU9TWDcyZXZmNDk3Z0s2SzI2R2JzRVNscFFzbDYzNU11RXg5QUR2UnZNM0po?=
 =?utf-8?B?OURJeGEvZlR2K21UcDB3K0lZSndGdlVMT2prUUhXei92YXl6SnR1WHBmTUJw?=
 =?utf-8?B?UHNjUS9LZ3R6alNoa2FhSWZiU2FSZ1V5Y0pUc1R4TjRhY3pGZ3FGY0VlMmZS?=
 =?utf-8?B?cW9VYkNkZzdKanR2TUR3SkMrYXlNSnFsTW14dDFHZ2hqcGM3NzlVTU14L1J4?=
 =?utf-8?B?RG5JRzZpZ2V6V3FIbStLZkl0Ly9CZzIxMVk3QzB3OTBzSGxkL01Yak9aOVNu?=
 =?utf-8?B?UXJHVFl4SFdDM2RNWHVnRzg0WldtZjAyWWVaak13a0JoN1ExMXIzUXVXK3Vk?=
 =?utf-8?B?NmE5bDVKUzJ2T0g1OXhxQlpURWhnSVRzWEwvL2lHS2JMbWpTWHB4dm1ZdTZh?=
 =?utf-8?B?KytUZGNodWV5N1ZWVW5hTFN1T0t2K2JtelVmWWxPUkFwVjE1VGo5eGl4SFVq?=
 =?utf-8?B?WkVBNDhna1N5VjcyRmNYYlVXTDlaRTNNWHpEU29acWc0MWZ0QVQxeGVlRWox?=
 =?utf-8?B?V2NjUjZuU3FyaWxPRE5aMUprT0ljeFlVU3lLUW96RkluTGtnN3lJK2svVGJ0?=
 =?utf-8?B?WS92dm1wWkxyRERCRmMybXhNQTE5cFo2Y05zRVJPSitUanNzbURRSkJLRTZx?=
 =?utf-8?B?UVA5YkdtM1J3VnFsSGVwN1BDeE11d2NjZEIxVE5yNlVCTlIvZXFPVFYwcWx4?=
 =?utf-8?B?VGpTdjc1WWNRMGZEWjEvWnAwUjNZWWZRS3lwSXMwVGc4TkxaQUxlVWpzSkkx?=
 =?utf-8?B?cVpZSlc0WVl1a2tqMWRxVkpxUStpVzN1SjM1QkFmaWxsU01ReW53bDFVMDd3?=
 =?utf-8?B?cHdFcld3MzByWCtHNlVTK24yVHdVWStuWnJNLzR4NHl5MXZTTFV4Wm9mR0xQ?=
 =?utf-8?B?a3BZUWxsZlVpcHJjeEFBKy9vTFc4S1dqd0N0WjZqbUN6a2s2L0VMRHlkMkJY?=
 =?utf-8?B?QmtrRW5jZWpGZW1TeGNGWEh3WFdYVUpxYTBTVDJpTG53N2VLSkZpWERkVmtU?=
 =?utf-8?B?bDB5aGR1QXlyMVUrdklFT2p0eCs5d1ptMy9LSzVZKzZtRGs0cGdqVThwbWda?=
 =?utf-8?B?VDhhSDN4eEkzemlJaExRQzArSU1CSTlvWDZ0QW43aUVNN3M1dEYwVlljdU5L?=
 =?utf-8?B?eDBvc0ZaSHB6a3dMU0UzdHNoZk94ZHZyOXpYM3NnMGllUVFFWEM5SFVBMk5H?=
 =?utf-8?B?elNva1FxRVlTQkhseXlPV1JCS1g3ZlNoNTJLVGMwdlBzMlNpeWdRQ1orYk9w?=
 =?utf-8?B?WE1scXp5Wm5LRDZlQ0FaS3FMNXpBTm5leHJrOGN3ajlRRzVUSVJNZDRFdHhH?=
 =?utf-8?B?RGt2d2VPZnR3SnhCZ2dUbjZTZUJ3QW1LdU9BODl4N2JkRzh1aXJHd28xS0xH?=
 =?utf-8?B?T2hsR2RMMEgxUDBPSld5Y3A2Rm0wODZyRUM4eHg1cXJpUVo1UWpxNmVZaUdj?=
 =?utf-8?B?cEU4U0lVL1lOaFFxZnM0QlpYYlltL2NQa09LTE8wR3d6bnhDbnE3K2h0ZzMv?=
 =?utf-8?B?L2FIWm1Rb1YvamhhY0x0SEw3VUs2OUZxUm9sVytQajJ2Z3kxb1VOV3ppajRN?=
 =?utf-8?B?Y3R1SjRkSHlnQkFCbjlEWUlaVlRrOFNVSTM3NVFXbFZWYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldSYTQ3YnNhbjVZRjJTOXpHQldueHFKWUJ1YzFjWksvNVk4M1NkYXlRdnRH?=
 =?utf-8?B?enJQUkxoRzFKWmJ3VVNQQ2tGcEpHUHFpSWQyTXM2Q1ZJdDRJd3hITFZ4ZlJ3?=
 =?utf-8?B?NDV1K3BEMWJscjVIQTZ0RmhYOWRiUElvUEc3SmlrcSsrN3pxNFRHMjNTaUlR?=
 =?utf-8?B?YnBBekNYdDRZalVybExzbTBobmM2L2h1RkI2Qm5wZ3h0RVc4ekd2WXZXQ2gz?=
 =?utf-8?B?dnpCcGhqNVNMd28wT1U5Y0o1L2Njdm8zYVRodHZtZzNRREtuMlNKc05UL3F6?=
 =?utf-8?B?aEVKbGhjdFZjTUpMQTdDdzJObllRYVFVdGRZSGZDZEswZ000K0VBbm4vKzNF?=
 =?utf-8?B?TnlJcHJjZnMxWkhsMUNtdXQ4QkRVakZlT3RSeWNQZXpzQXJ6RmNER09tejhq?=
 =?utf-8?B?eGFrejcyZTN3eFFvZVRQL1VmRDdUbGNKT25ZL3pvTVR1Y1pMYUxCa01NNE1W?=
 =?utf-8?B?Q1p6eHZyNWhEYTNjd1dTZHFWbUIrbFR5YnUvdEdZSzhIQUlHV2tYalZrc2Rv?=
 =?utf-8?B?N3VNZ1FRblRMWWpxZHRNWk9kMXo0SWo0MmEwc3Y2WFR3VzA3cy96TkUydU9y?=
 =?utf-8?B?ZnBqeS9nQXBmcWRtYWVzQTA5VktUcGI0Q2EyNW9WbmZJMzRMRWpFV1FXQTFp?=
 =?utf-8?B?UlVKdk5NaE5mYlZ4TG1YekkvTmYxK3ZHZWcwdEdXQXhLYWp2TDhobVVKeUl5?=
 =?utf-8?B?TjFFeXNzNkd0R3NDUlcxSERzUmJvZDkva0ZseHV2VHkvOXZnbTdhRzhlRWV2?=
 =?utf-8?B?ZUsrU0xaUmhnMC9oeUpPU1NWdm96ZUlqNjJQWVhWcE10S2RaMyt3YmZSejU2?=
 =?utf-8?B?a0E3VzM5QjAwYUNrU2JaM05mOEVvcWRlOG8xMHpOZEVPTU1BMThiRm5tcmNs?=
 =?utf-8?B?SXd4RkIzcnVwNzVmbnFxdmgyQVhFZkhNZ3hMN3dyWXo5NFBoK3M1UEhJSmVW?=
 =?utf-8?B?MUlBcXRxd1VHTWJoRzdpUm1McTBBTFZQdjFJYm9aTzZydS9UWDM1THdTUW1V?=
 =?utf-8?B?L2M5VW1BbHVodGRJOHg4ZE83UlRjMFQyMDIvdkZnTVhZRHk1MUZMczJNRHBV?=
 =?utf-8?B?dXF2U25QK1dIMG1heUtOOGhzQkRocG9UYlBBQytGQmRaajE2WDhkZE5CU1No?=
 =?utf-8?B?SlJTT3FPYU1uRmpQWjFKMHlRUXhqYlV4ZVFIbjVhZTY2K243WTdLY0YrczF4?=
 =?utf-8?B?UnJ0VDFnQitDa0JNQUgrL0hOYWV2QTBoSzRMZExiRWFHcXpWcHJob0JHZWRQ?=
 =?utf-8?B?THlKaTVjc25aN3dhTXlLcnAyRVJnZFpXeEV6dkJBbmFqR0g3Z1FZSjZ4U0tp?=
 =?utf-8?B?TmpKelVjK3kvMlNKblgwaC9YTG9vMTBHS09yVGI0Vnlkb0JKMHVLcllrRU4w?=
 =?utf-8?B?NjZwb1ZGWEFkNTNRV0hneDRWdDlya0dodGMrUU1pekdpak1nejBxWlRpTDBy?=
 =?utf-8?B?SnFuanFvNkFEbGhJS3ZWdlNYUkJtajZIU3IrZGx1TWtRalgzZ24yUWpXVldu?=
 =?utf-8?B?bmI4aTd4S1hNYWRhaThNdWFGa2U5OTVrSHlOUDR1TU4vWlJtVW44WWxBOWNt?=
 =?utf-8?B?T3VORlZiZVhUUnZ3S0psNURwZU9XeXBYTFpYUzhONHdQQ0VseHI2bW5JN0Ja?=
 =?utf-8?B?QldPSDJaOFg3bmZuMzZvcGdOZGtKc1hQcS9IaTlsMnJvKzFkNGZaNkFCTkky?=
 =?utf-8?B?eHZKSFpZSjZIZm8zc0NJdk1HamJtNk9Ddnd5bTQ0Q3RhU0NodjZPUCtkS0sy?=
 =?utf-8?B?eWxvNXdBeElIbEhKdDU3Y3RRUG9OanhzYmcwbkd3ZFdvYXF5M2lFL2s3N0Ji?=
 =?utf-8?B?UmlCVjJVcko4Kzg2a3JCTk9FM1Z6c2dDWE53akNPTGJ2TXM1Yi9MTVVtb2R4?=
 =?utf-8?B?YTJ1dnd3MEdpbzBsUnJVYW5sdFJuZ2ZwQ2RpL1JjVkxlN3hEMjlzQUJHaXdX?=
 =?utf-8?B?cTJ6SkRPQXY3TzFFSWRMaTB1bkFET0Rha1doM1M2Nk5VWlVnRnFhcnNRbDJo?=
 =?utf-8?B?Q1JFM1hSak95U3ljSTBJV0dBRnRMaE0vVHpPRTRraW9URlJkMHVwM0FtOEFn?=
 =?utf-8?B?ZUlDU3BMUGFCeW9QK09uRzR2NXJ0T21VK0hFdlozQUVmN21Xb3Mydy9YdVMy?=
 =?utf-8?B?Y1FUd0JKMnR1cnFCOUozNnNTQjhSVDBOWXdHWURLMGFHQnlNcDRiSXR5UXRw?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba20955-551b-4fe0-99f2-08de0026ae7a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:38:47.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8CW00RCwi00LHeW6YEThsk5VfcIhnw8tka4r7Nh9jNe7V6Blgg8TyOvuZjt12yf/+gw6pmlCf3nsoEbAOY3ZOVeRkNQ4DuOHHuEJvTz38g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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



On 9/30/2025 2:39 PM, Matthew Brost wrote:
> On Mon, Sep 29, 2025 at 08:47:33PM +0530, K V P, Satyanarayana wrote:
>>
>>
>> On 29-09-2025 08:25, Matthew Brost wrote:
>>> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>
>>> Some VF2GUC actions may take longer to process. Increase default timeout
>>> after received BUSY indication to 2sec to cover all worst case scenarios.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index c016a11b6ab1..f0de1fa61898 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>>   		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
>>>   		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
>>> -				     1000000, &header, false);
>>> +				     2000000, &header, false);
>>>   		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>>>   			     GUC_HXG_ORIGIN_GUC))
>>
>> LGTM.
>> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 
> This is your patch, so can't ack by but anyways:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

but shouldn't we wait until your previous concern [1] is addressed ?

[1] https://patchwork.freedesktop.org/patch/675316/?series=154682&rev=1#comment_1240144

