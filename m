Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C0CAC587
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 09:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D8810E67C;
	Tue,  9 Sep 2025 09:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tib2Q+7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B610E67C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757411276; x=1788947276;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QypswRoRug8daAlv94AUleILfuDPzY6iz87MpIPrf8I=;
 b=Tib2Q+7izx/K7GZ/FqLJrlgMy41sKJTAs9D59ivPDU0DoSN0XFPElOKh
 E8UVRdtqsaOa2ArCzrc4Bq2vmDl3Su77y0EUGzc087wsNBbk5z8nlqrEX
 DapXNgVZb9RkkTwn5A86EUDlHCRLxrf3L0LzKdeL8avzM9W+63gyPVN7t
 jzsp3TYtmYFUTnQDxhMMBORLMasOb7w3wjDzrlkU9NJjCtcfNSU+fvVKo
 Gqr6QPuJ2Bh4ZyDYW+Nh4qVIpw49cF2Hs0PnCSM9qYXrv5ScjSV2rElgr
 DJRXd0ZpoOe410TZ+MaBoSMExoKSVKbmsi5267cNuY29wAQP/L5sHOcxo g==;
X-CSE-ConnectionGUID: KLDTJAoZQcSVfGQnxt0yWA==
X-CSE-MsgGUID: zctS2GlAREe0e0HAmkuXVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59761718"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59761718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:47:56 -0700
X-CSE-ConnectionGUID: lWEGjeLST2OazfxrrJsYpw==
X-CSE-MsgGUID: 24crgCAmTo2IMc5eENlQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173426498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:47:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:47:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 02:47:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJG1+16RQ5fkCxHz1whU5IBoiAk5yuWjg7m0RQNXJnZL60o8Jd2foBmTp3aPyh5hwSCO13KZWEb3Rrm3r9R1cJmelZuxot+uOkuuua0tItkq3yZe+xrCd+uLci4BeeyuUD2cH5fjyds4SPC9kQ5dke+Ssr1QfWcPiP0ZtXzdLiHKM4lLF0qA4CI/0aagRrojIg6nlmiIMTQx6m6dhLb+ftjCm0QAUECNJZIyhW5a16fo93qd4g61mWwUQUDXCebAJ+n4bRR8RwIiHG6CysgXsb7F4ZfsY3Gvqfm25TO0jQJe6QXaP5qO0hjHHj0Ot/XMGPbqJPHTNOPghr0l6cAE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRSCdkgs6rE3cOtJoHKIxTlBLRXwcE0VOg2K34l69fE=;
 b=ZI6hzR6pSzzi3RGvJ36+cCqz+lu0AeCB0BRbGJsnS2sW3M2Z1/ptfKVjUOakLUhrACG8uFdug+JBGwR/JyNz8KgFK6HxIqu59z2MrMbmZYJkMrMHQdgnhkpy/rM+QnWrFnsGWp6Y46+U9+v3TCpzea/YHRFM082g83BqnlF6WRh4IdqMbaLFrAmc/4uPmznFjFdz6IijyAtHkowiwZbRww9+YaOvnNX7z+E24Je4I2wrmGZSwHQvJpLllfBWeTDqBdQXNatXsuTDtNw1ic+7WCwD6LDtsnBFcG4RyqpCkWiqqIN77ZUVIm+f2/nvRfu5EtNSO+JGEJHxrBW5R08iuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 09:47:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 09:47:51 +0000
Message-ID: <e8969775-5c08-4ec4-8ef1-210b029fcf75@intel.com>
Date: Tue, 9 Sep 2025 11:47:48 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/debu?=
 =?UTF-8?Q?gfs=3A_Make_residencies_definitions_const?=
To: <intel-xe@lists.freedesktop.org>
References: <20250905180225.8434-1-michal.wajdeczko@intel.com>
 <175735720408.313432.1494478557334912588@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175735720408.313432.1494478557334912588@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0115.eurprd09.prod.outlook.com
 (2603:10a6:803:78::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0d920f-62ed-44ce-8c0d-08ddef85f10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXovSzhQZXpWNUllK1dvM2xOa0Z3SVlxamNIS1BQNnJUVTdycVU1SHJobnIx?=
 =?utf-8?B?cDdGa1pNek5UMFdxSUFZYVV4emNEQW1GREMxZVltci9zazdzd0F6VWcxc3Fw?=
 =?utf-8?B?K2wyMktxMnZ4TGtFMW14cCtSODgwNWFiY1hLbG0vNHpaQURIbFFvYVVtcWh6?=
 =?utf-8?B?YWlkaTJ5bzNhRTNZQjh1YmhiUzFSQmpGOUJha1IvbTA4eEc2S0srRnZ4cU1m?=
 =?utf-8?B?TmN4Z3FURzVZWko3WlJhdy85RTJJNjA4Y2tGYklmQ3JlalN2cDlOVXdOWmdP?=
 =?utf-8?B?UityMFViRHJKVmMySHFZS1N6VURhUnNUS01VYlhiMjBObTg0MUkyeWtNcXov?=
 =?utf-8?B?ZitnWVlibFdaYW9NY2lkRE5ja1ZEZ1ZRcGRjMlZ6dEVlZmhmS1lOcVkvRGho?=
 =?utf-8?B?NGFOcUc2NTRoOHp4YkIyVkJKVFk0aFJibndjbWlkNCtpN0ZzeWxMOGQ4U21j?=
 =?utf-8?B?MzdQWGRQeUZNSjMzTjNxaHdqdnZOdExQUUhpaFh2SHZ6dVNySU1VNVIySFBl?=
 =?utf-8?B?T2hVd2RaRkpVTzBZTzkzemJhVnZuRTM5VGE0UnE4ZUFaK21uQlhBT2VjSE9D?=
 =?utf-8?B?eE9GaEs0YXpqYjg3cFZhOFNQci9QaHp1dmZLNklsdWQxU0k0a3ZGWkJSR25V?=
 =?utf-8?B?Qm93WXBJaU1nd0VzaUVLL2ZTVzZPN0JGRFhPS0dHYXcxT0FYbnkxb0FuNGc4?=
 =?utf-8?B?dnBHY1kzUmo0Z0FJaEZlOWZEb1VWWjdXem9jeUNEdDZ6MVM4MFRTb2hFSTVU?=
 =?utf-8?B?UFhqREVrck9qdWlSTE5PQXUraFNQdzhoQ1VhSTBWZ1RjaTEzM3ZialdHdE5v?=
 =?utf-8?B?Smt4ZHdBdHBVU2g4S3FhQWU4NjFPUXFFdUtIamhXSHRncjFWNzdZVTQyMGR2?=
 =?utf-8?B?aDNsOFI4eXdQaVdvT0F3RHRoYXoxK20rN0FCTnJJUlNVVlNLVU1zWktIWHVK?=
 =?utf-8?B?UW8veVBVTFZlZjUvS041dnlyR3ByV1RjTHJhYTB4eVJhbTdPRm55b2J3ejkx?=
 =?utf-8?B?UnFzM3UwOEQ4enpoNWczSSs2VVJsbHNCSkhPK2dvYmU3ZlVabVNzYWZSQVNK?=
 =?utf-8?B?RGV0MERoWDl0V2FUWTJRSFQ3WUtSVGVRaXMvZGFqaVJrRUVBbU00TXBmNSta?=
 =?utf-8?B?T0ZuL1c1ekJoQUlpdm00NzZkckJjZS8wamxaUkpIWEQ5dXJvZlFaNWFsQ3ha?=
 =?utf-8?B?MXFEZHo1QnRMUWlhaW80NHNQQytYS0M4MU02ZGc3Y3BLTnRwam1LZlg0K1Q3?=
 =?utf-8?B?TjQ4Q3dmWFh6TVFvQi9OV0Z1L25pRVRLMzBxTCtJNHV5V1JGeTRLcVVaMU1i?=
 =?utf-8?B?YW9kMEwxY3hzc2FDbHhKcVhkcGFrcWRnNE4yREE5ZmplWkFZN0hJNktiQWZL?=
 =?utf-8?B?emp2dVRlK2JDQzJzaUZKRGJFWGRMNTlycExaTVQvbVZXMitrSmpTVzRBa2ts?=
 =?utf-8?B?L0x5eEhlczdGR056aVZrS2djS0M5R0xnNGZSakJ2WWpCU0dVeXhYbTJBZFI0?=
 =?utf-8?B?cUlzeUZhT3Uwam5vU2t4VEFHUWFGS21UVXROMHBUSXdUc2J1STcrd0ZMejNk?=
 =?utf-8?B?dXdBMzRBOURGZnFzY0g5anlIclJKeXJyMTU2cmhwc09uSUNvRVhhRWtmem43?=
 =?utf-8?B?dVN1cTV2K2JOcFkzOTRPK2xGY0pqVjdCbFN0eXBtWlN6eGNqMXduaDUxQUNX?=
 =?utf-8?B?eDlsVEhWV2xXYzBSRnZiU1VBbmJCY0tMcndrTnhsQzF0M1RTWlpwRElQaCtu?=
 =?utf-8?B?U0tYdEh1VUp2M2xhbmxMM1ZqM2V0NzZHNzZ5UHgwanltWUlzQjRFVUNPRytE?=
 =?utf-8?B?SzhZTWpIa2RENDlmYk1DelFSRHpoditGRUJqR0NvTUxSbW94Q0lFbkt5ZzFz?=
 =?utf-8?Q?ktgkdn/r2aEZw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVVNTZtc3M0M0tCRVROSHMxbkRyN0MvdzI2Y0pxZXZyeVZCQkZ3ZE1UNTdx?=
 =?utf-8?B?ZlpNSnRWNFY4U2JCOXE5TlpHUGU4QnRwUEQvZVErSU91UVZUV0xBbXB2RGpj?=
 =?utf-8?B?WjVvWlVjOUFMRkxWN1dRd0FRMi94RG1LVXM1OGQydXpqK3dIYWY1NG03dWI4?=
 =?utf-8?B?Ry90Wi9JTkJYL2pMUDdVcTQ1bWNJRXpjOS90cU1Dc2k4QytWYlhXek9MRHY2?=
 =?utf-8?B?ZVBRUzRhaUxQM1U2SjJLeTNpT01WU1UvakVtbDBvTTJqN0JmWWhVWXJscnpw?=
 =?utf-8?B?ZnpXbVBLK3pBWFFMbDR0WFkzVVJiekRud0xEempNbjZWQnJFdnVGSmQvUVR5?=
 =?utf-8?B?OXJHb0JRQVo5cllTVERIT1EyQVVzYUpLZEVsNG9DYlNKVjBxV2tZakNJWlAy?=
 =?utf-8?B?Q2l0cFJ2eGdtTnQrMVpzMWsyS1cxb25KbkZwRUZNc1Rhbm1tZjZFUDVnbHdN?=
 =?utf-8?B?TE5McExsamcxOVpqeGRkcmxuSkNxTnU3ZHExZms2Wm42bVZWbDI4RmdxQ0lp?=
 =?utf-8?B?MDZmRWZ5Wjk0NW01RHUxMEpCWmUvK3lic0N5SXZnaUxKT1E5T0d6SnAyekUy?=
 =?utf-8?B?cmIxWkkyem4yV0NHdnJzb1JzODdzSzdMWnZiUE1qUW5pRndpSHIrMW5laUFF?=
 =?utf-8?B?Q1V2R1d1dWZkV1BnazhRbjNaRlBLQUpWNjRMTVNaQllBZXIvcEQ3VUpkcFpx?=
 =?utf-8?B?T2M4ZWFISGdWdy9mTnh1TDJaSjZHZU43czRNaldnU0t2MnZpdmtRMkVkNTNh?=
 =?utf-8?B?ZlVreXJpTityUlZKaGtpd0o4ak16dzNrS0JheFl4Ujl3elpSMzNWNHJaTmNM?=
 =?utf-8?B?Ty91OVhhZzh2SXhqelQ4LzEvTHVFajZWVUhndkQ1blVaY2YxMnQvV0VCaDlo?=
 =?utf-8?B?TUM0R290NHZhN2syL0xHZVNlajlZVXVpSEo1dlNFZDdhREZQbU8rbXJMMCtp?=
 =?utf-8?B?cFZGTkJVUXIrTE9XS3hsWURZVGk4QmdKQnM0ZkVJRjdnU2RDMnV2eXhnUmdV?=
 =?utf-8?B?blIwSVRaakVuTVBVL3NGN1NVQnRENkhJKzNwNWo4UU4xc0JsUHJiWGRXMUpM?=
 =?utf-8?B?U2JCdzRUR0hHdlg0MXEveU9vRmV0MHVYcEJpTzJFeWcwVGl3b2JnaUxhOEJI?=
 =?utf-8?B?eUNEWGJENHhYMFIwSkxrd1I0c29mQzBHR3ZJcWNFZEZGeW90QUlOSjdDaTds?=
 =?utf-8?B?d1JUTGp6RmJSR1dSdkdsVHBxdGJmRHYxZ0dnOHY5REVnUmNiZ3BOTHY2Ny9F?=
 =?utf-8?B?QUFlYlJ6MmVKRVlCM0ZnOTl2aGJlVmhud0xLekF4ZUJGY0I2REIxa3phN0JV?=
 =?utf-8?B?UzYyeVJiOU9oaDdPRUdrZ3Vpekh6ajExeVUvWHFLUjI5anZldWxZam9YMFlR?=
 =?utf-8?B?Mkplb3Z0dTB1SnZpdWUwcjU3OTlSRHNMd09ManFnVzFkQmpRdklwdkNzRktX?=
 =?utf-8?B?TkZZcjI0Y3cvSk8wYkN2WmUvQ2RSUGhrUlRFeHJCSWtkYkwvRUw2NHZZMmxO?=
 =?utf-8?B?QURZRUFSRHA5Q0NtTEl1OVdWbkxUNjUyOHFzdGtZNDdWYWNBUUxlTmUrTFAw?=
 =?utf-8?B?d25ZSzBJSlVrbTEyalhiVm94L3B4YXJzcTlzODI1dDMyV3djNURNeUhEd0dx?=
 =?utf-8?B?bkdCVmFJMGw0RFA2NWhGNndTN1FVZXloR3hqVytPRGk2V3MwRFNmUU9OWno0?=
 =?utf-8?B?dk9iNStRS21TY0JIa1o1MmFaMnJ4dmZ0amVqc2dCNEV4NEdjSURIV0RUSWhX?=
 =?utf-8?B?Z1Bubm9ydGcvaDJkek10cmlrWG5BUjVNZkdLUjcxZk9VV1N2dXVGUnAxSHJn?=
 =?utf-8?B?azBGd1ZLZUZVM09zOHJQUituY1FzZmJTM2s3RzZNVmhPdisrSTc1NllQZlpr?=
 =?utf-8?B?cFpMSDlYYzE0ck9xbHdFTlZ1RzNIL3NyVDZYS2NobnlaUVRacTlNdnkxS3V3?=
 =?utf-8?B?aWFtMU0xRFg2eWNCVFNVZEJXZjhpaXQrcXVlVHJNc0k5RXBIc1JuOFJvNytu?=
 =?utf-8?B?MmVBalprazZYRForUk1NRE84ZmRzUHo4OVZUVC9jQWh3QW4xL29Db3NySFUx?=
 =?utf-8?B?YmJ0NnhFYUdPWlZjeXg4QnRkZGVsVGdUbTJ3M3ltZnBsTHB1R2x2cU1BdGZP?=
 =?utf-8?B?NWNwWXlPOXZjZ2pKazRmOTFPVThORlZoTjQ4YmRTb0FjYURyWVI5U2FIcERk?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0d920f-62ed-44ce-8c0d-08ddef85f10a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:47:51.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ccNjPTmRyFrtkgfaeFZLwK2dchq3X9nHPqD8Og1fZDUJxONxfLs+yX10go1mgTtmKZ8dJE6+I7t98C3cHXj4n5on3YzCJPwuMG+/nrtzRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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



On 9/8/2025 8:46 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/debugfs: Make residencies definitions const
> *URL:*	https://patchwork.freedesktop.org/series/154112/ <https://patchwork.freedesktop.org/series/154112/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154112v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154112v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61_FULL -> xe-pw-154112v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-154112v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-154112v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-154112v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

all unrelated from KMS test and on non-BMG platforms

> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154112v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> +1 other test fail
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154112v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> +2 other tests fail
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154112v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
> 
