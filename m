Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA45C83F1A
	for <intel-xe@archiver.kernel.org>; Sun, 20 Jul 2025 20:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385C10E057;
	Sun, 20 Jul 2025 20:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkduzTcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE4D10E057
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Jul 2025 20:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753044739; x=1784580739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qUWMX3ibC0l83uplNegeC1CjuGqJ9RGl5R8vOcFUOnU=;
 b=nkduzTcfFmZn+rt1zKD1A9ndd/erT4rgjbBHTITXvi7dmHRq2wqCNzbE
 dap6hzDdDpJ/kpcM6b+E8YPEk36ZgkinURPX7WbpIgUn7UitaiQdAlefp
 JECsc1ccXWYoOtYdz6+W6p+DeAAoT6lVOTsw4phWOqa58QXD4kKxuY9rI
 lBp0cFi8d9p1J1gdmpeRsO/5sZWzBhkDZgcGrbZET7padL/Umq3k47/Yp
 msWtHuYwelE2dFHoJ7epowfNPesyb1ML4Y9eLo2VkBZaTFrnPfxWNbA3x
 Vc9iI4+c0wX1jPwJluEhGWDoXY/FBhWzGZCX3fLzPhW8Njq788SgzvXIe Q==;
X-CSE-ConnectionGUID: OHIe3CFlTomAd9y9O+no1w==
X-CSE-MsgGUID: XiuZbiy5SCmTHTV7smmH/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59074884"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; d="scan'208";a="59074884"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 13:52:19 -0700
X-CSE-ConnectionGUID: mLsiKsrGSRqQL8mRc+FA6A==
X-CSE-MsgGUID: XlDa1P/XRvC26zEJ2W/Dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; d="scan'208";a="162963085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 13:52:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 13:52:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 20 Jul 2025 13:52:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 13:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhDDwaGoIwYmu7fcMRDofCrHNMqseTUHC+y0UxlT84UpZtKbUgsEK/6TVF3GPXoz8yGYehMzKoIcFOA+6HUeVcpDjx/Qhe1bY502FQa35+MOpezVcFNGtASOa5q3WvE6NQNP7Rz5cW0ids3Dki7d9wH9XPwYCr69uwod7Ga3SSkaotSN/+mDXXf9p6mDPCYzkdBkFOEatxgmoUcx1G5DWUZV0/Z5gVTS+rIFkiXNTrrKsrVGgb+oLaDUfANlyN1f75r41VG6VlR32PpsAQBtzaDH/pFqNi6vQB9jLA3TqJ1O4DWhwVteV8JW7wyABbJ1hFtGuHxvdA1CkhpSkWy5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjaEaijz7X8krjJqLDnVwvr9Nbuk7+8Yb8YVPeJUXIc=;
 b=P0f52KOrKp8QpkJ+GKSvqCdJL/UlrvPJA3vjsnSL4Wk4Zs1G3KLBl68VxeJxqcepGH1Hs94UqhEW9SYduPXt57Ue01XcKz/XvZO+vi8KAqbDbeAA+4JLTQPWsIp5oR/MpaK6K3rJls7+UkwTruT/XCdrZfinrsl4jrQJ7UEsV6Q+ZHz58xTExWLUXaktq7jc8hP0njQ0LVkpsA0hZ/LidxMRJhC7Gd1lN8PD7a6up58xKSzDG3nTiwFDvjiYBWz/dNlPIZRRxascFvt6ZjTd+m5Mbgekyy67CQJekkqQakdrAl1JCnLb00/tYgKGa4dleIdnk2AJvMfeh0Q3U8S1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 20:51:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Sun, 20 Jul 2025
 20:51:42 +0000
Date: Sun, 20 Jul 2025 13:53:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 5/5] drm/pagemap: Allocate folios when possible
Message-ID: <aH1XSTWZH6VF2UbI@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-6-francois.dugast@intel.com>
 <aHnQcwv0qYcP/zis@lstrano-desk.jf.intel.com>
 <aHngfEfHPmiNRJ/g@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHngfEfHPmiNRJ/g@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 276ab9be-8705-4022-2a3e-08ddc7cf3b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekcwWStqSitIeTBURjltdXBGVlVsQkN2UllqNzB2WnlGOUpESE45RDg3TTE1?=
 =?utf-8?B?V2xmUXhHVFN1U3N4R0lkQVBvYVpBSXIrTTZWYksyU1BKYWZoMnBORDM2VTVn?=
 =?utf-8?B?aVMwTk82OHg1U3pBUXUvaFh0UjczYkRxUVRZYTREay9XMG1FTElBSks3YW5T?=
 =?utf-8?B?TWJteTJhM21GUUpCL0kyRXEvSFR0Y2xiVjY3VzBuL3Rub3JHUEZDaUkwUnp5?=
 =?utf-8?B?VWpDYUxlUWd6SEFVaHQ1bm5aWXRRL1doYTFMK1dsOGpaSjJlT1lnVllQQ3c5?=
 =?utf-8?B?Z0o5dXlNWmg4OXl5TTVQVnZhRzBZVmJUUVJkU2xKdXR3YXhBM29SUlJoa0pR?=
 =?utf-8?B?VHIyS2swcGVqWmVNQ2ozWHgvTnpxRlpZY1o4M2RTVXVhZ2ZzTmxIeUVHNEc5?=
 =?utf-8?B?NEdCSE1UVzZXeEZWSmxVOUFTWlpTMWFGMDhUK3FuTlRLUzFxVjZVSnNKY3hJ?=
 =?utf-8?B?UW1GbWhhYUhYdVNjV0g1ZjNPbU0zR1VnbDBRTzJyc2VscGpkL0ZwWkFXd2hJ?=
 =?utf-8?B?WkViUjBxK0sxVWxaNjZKMjh6OTNaUzB0bWphYWhNVm5LNVZjeDJIVWd5SEZa?=
 =?utf-8?B?Tkh2blU0aWNJSHJ5cmZ4MmxMSXNnNXpkVUpDKzFlc0ZrcFJ3UGhNam1uNGV1?=
 =?utf-8?B?dHFYTi9QdHovSS9vS2lsYUxreVM0eXlmbUswSWh0b05USG1oUE94TlBmVFQy?=
 =?utf-8?B?NG5teWg4TjZvQnBTMWR4Zm9NSGJaN3FHdHNTZDlLWklxZ1NyU091WE1tK3lJ?=
 =?utf-8?B?RGFJVkk2NVRZZWJFaDVOUFVUcXRJeTBvbE9GOTN1VFFvYjBXS0hsMStNSVlT?=
 =?utf-8?B?OXlwMTNHRzJ5NzJxelVYdkxaVnlVSkdaZElLRm5RRlg4Qk1ia2dSUXF2UWtx?=
 =?utf-8?B?bEo4c2I5WVRsS0ZIYXc2ZTFCS0VNQ1dmTy9VSE5rMnJKYkpHdi8ySEprY2V3?=
 =?utf-8?B?QytwQjlSNTRQZmNJdkllSFQ1SzhZZXpwemVLR1lCSC82clF4dXcwcU0rbDEr?=
 =?utf-8?B?UC8vM3FVWlk2aFVldURQOFFsdVlnWXFqMTRIZ0xlN1hndUN5eDQySlU5UFlp?=
 =?utf-8?B?YTVOZjF5cmYxN05NaU9ic2ZKdzczeFRiN2d6aFUyelJ3ODBuWTZnMjRXdzY1?=
 =?utf-8?B?aDlzTEVuY2k1RWo0cUwxancxSzdqcW4rMDVlT0RuRG9EOTYyNlpGRU51U0tN?=
 =?utf-8?B?bnVkU1IwZ2Z0Y053bTNYcmx4WUxvOFdSQzNleS9ldkw1TExtanpWQnFuNEZk?=
 =?utf-8?B?MG5EVGJMZzRickxRNmdRaHVWTzNiVGVsWG5SMWNXYmxYcHNmSWlHS2xicjVC?=
 =?utf-8?B?NzZLUkFJUk9UZ2g1TUpJeUIvVUtMd3BUUWM1Z04vU1l6UWJLekdFLzJ0Y3Fq?=
 =?utf-8?B?L1dZWFVKWG1qMExMQy8wUXdMOW1BN0Q0c3hWMHJleS81eS81N0FkOEpsayta?=
 =?utf-8?B?VWFUcXdIZlA2b3JtUG9RcE5veFozakZxeEhDYXlvQkVwQzZTYWdzTFl2dnBr?=
 =?utf-8?B?ZSthazZqN2tESjA1OWsyRUVmMXZvNSs3V05ZV3FnZ3ZsdHRzU3NKQzN4TE1G?=
 =?utf-8?B?eXF3bnl6eElmWk1GN2ZXWnNEVlhqYzR5UFRTRjR4VHgvMzNxL2g2ZWU2QVBr?=
 =?utf-8?B?cFdRVEtTODNKQndtZkc1MFcvakpRN2F2QWlqV3NYNDAwWGIyREp1VzhrcHRO?=
 =?utf-8?B?ejRQTHF6UldnSmFCOE00UnFrY1hyVlFoaDdrQ251NjVGSEhjYXVkWGJDSzRy?=
 =?utf-8?B?RDhaQytIZjF5bXpBMTFTd0VDb3BTR1VZUWsyN1owK2JWa25JWGtMdHZYVyt2?=
 =?utf-8?B?K2RJUzlYeFNxcTRnSkdZcnBOMU82R1RicVUvRVpENlE2dWdERG1ucGFGTXZX?=
 =?utf-8?B?bGpFQ0IzbU5oYkRkUlJBMmdST0pJVFkrdTErbklaYWRsZ0s2Ymg4QkxJVDU5?=
 =?utf-8?Q?Sjy9WQLFQLU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnlJdUVETytVOVRpbHBWQmhSWHFGTDExRkl4cXBEV3plVi9HU25UMDN1bWJX?=
 =?utf-8?B?TFJhNm5objMyWERIczQ2WU9xSFdLZGZBOU45REtva3dGRU1BSlZDZXVpWHhJ?=
 =?utf-8?B?TlhLSlhQdlFXK0JXWUNLUi9uU0ZZNG42amIybFRZellJNFRSOTgwMDB5NDBV?=
 =?utf-8?B?K3o3SytZMGJxbHN5VG1DNk9pVmZ6NnQxRE1hSzVYOU1uQ1FWZXJRNnU4K1ZF?=
 =?utf-8?B?NnJOU2cwN3FXQ2ZvbnlobWdXejkzbE1BaVZ1ZWd1Q3FKSGRNQUlLZzB2NGxk?=
 =?utf-8?B?ZGkvMDZiZjZoYzdKNkxqWHc5RDBtaC9iK2pVbHpwZ1JpTzB5V1RkQ21Uc0Jm?=
 =?utf-8?B?SXlQanB3YTVJZ3BhdVNGZU84R1FxU1RsRGRGMVE1R3VLWGdtVmpBM1pKclhG?=
 =?utf-8?B?VEYzTVExZlo0RGlwMEJTYnorT0MzK015b3NzUVcyZFlwcUkzSjFVRlR3TkZ3?=
 =?utf-8?B?VzcyOTRxa2F4R0QvcndWdkxBYmtGSm5GbmhjVUNlZGQxV3lueXNob2hjeUcr?=
 =?utf-8?B?eEdtc0xEZFcrUzhXd2h4amwxRUNhMlBVcWdwRHd5b1lsOUM0elZ5V2FjT2dy?=
 =?utf-8?B?Tjc4alNrN3JKTkQ3MWNlOW9FWC9LeWNVcDdrbzd2MGVtYmdpbUVFc1JOYmtS?=
 =?utf-8?B?L0hwVUVBUUwycHNvc1ZKZ2FOYWNmRkszSlVFNlJtdDVlbE14TEtrVVRLODNx?=
 =?utf-8?B?dHZRR29uOGs5QS91MG1ERWtTL3R6dmxIeDMxMytabFJLa21lUStEN0tlN0V4?=
 =?utf-8?B?ZXN1Y1NYaUZBOVZYK1hmUFpFaE1xZlI5VVlBVVcxVnNOeTE1ZHlqNVVuRlE5?=
 =?utf-8?B?amhPeTJoa2svUlJwbldiblluVnBZL3ZGT3ViVkplcjE4T3FxMngvbWs3dTNQ?=
 =?utf-8?B?NTg4bEFDSFZ2NzRoQnY0eExmSmduTXdXV0xMVlV0S0lRZytQbGhTL3FIMCtS?=
 =?utf-8?B?b3dDd2liOXoxYTRRTEZJZHdHMDh2VDRQa3RjRVJMQkFJQTNzWnB1RG15clJ3?=
 =?utf-8?B?b1MwaXNaNENsNFc1YjVXeXBUSUMvZEFBL0xSVTRFbGhKMkxwZUdHNjJtNkhZ?=
 =?utf-8?B?a1piWFVOYXZTdS9Ydm0xcGRleUhFRDhNQkdmc2E3YWFRVUpyOUU0M1VRUlgv?=
 =?utf-8?B?UnVrNk5iOFcwZU5URC80MlNVYkluZ200WGtvVElzOTRJZEt3NE82elBlZTJX?=
 =?utf-8?B?VkRTKzkxVXJ3aW1aaENPbnFiRnBNcUxKU3NjU0M1VjNWS1JLODBjbWhSNkpu?=
 =?utf-8?B?Q0trTG16clZOVkRHWHZlSVdWTWdDd1p1Si9oQUxmemtjRStMbjF0OGl5ekRU?=
 =?utf-8?B?M3lzSXRxS21BQXcrWUU0Q0tPRVdSRVlDR2pOWDFjZjgrK25ZRHFKSFdSdm5L?=
 =?utf-8?B?eEFBcUpkNFg0Mkx6ZkVhdXUrWE9QYTltOUNGZDZiOVR1VmN0akY4dEZqUU54?=
 =?utf-8?B?NU16dWcrRCthVFVCemUyVHBuUTR6ZGFXY1lQalFlMndVbmxsWlZLY2VSZG9x?=
 =?utf-8?B?bmw0NUN1QkEzNVRMWisrYnRJbkF4UGw1VWdXWEkzalhyMEFMeE81b0xYeU0r?=
 =?utf-8?B?MmVvWHZDOHJrMkVSTGs0YmM3YVJobE1aSHRoMGJEbGZhVXl4dXZXRk1oRy9s?=
 =?utf-8?B?TURnVy9kd0JLT1Z3V2FzQ1dHcC8wRTdQTENyU1FCekI4RWVURHJpL2xlZGN2?=
 =?utf-8?B?TDBJWVRHMmRZd3p0c3lOUXBIQldIeVA1RmdkdHRlNjIzVEdOVEY2SnM4ZkFl?=
 =?utf-8?B?THR2S24xMnhuNFpsMUN5Y2VNZHdUZWQxbzlYRjllQmhEaGRSVjFDUEsyVzZu?=
 =?utf-8?B?K0NVREl5TEhtZXhyV3NlQkhBNHdveEduS0IxSFMxWkxnQlZrRUNTenkxUmFN?=
 =?utf-8?B?VU4zVnU1Mjc2b0pJQlRuZUI5QXFCckRpSnoyRHhJdmhIZWZFNUJ0M0MyNXo3?=
 =?utf-8?B?Sm9vY0FJWFlEcFAxS2ZzMXlDaW81YmtpYlBLbnZTMnFoK3p1WFFmRFVpTm9J?=
 =?utf-8?B?ZXBHNWtqTlA0ZEJvNURweHgzTmcvK0ZZNytPQ3BjRVdHV1kvZEdhSjdFTjZL?=
 =?utf-8?B?bnJHMC9qQjZjOVBvZ0QxZ0dOVm8xZ2oxWDRxYWtmeVA1RVFGb0NyaUVzSHhw?=
 =?utf-8?B?QWNzMHRBUXdnUWViQnVYVmhJbzQrellNUkkyR1lsNWVGYlVUeTZHV0xjV3VW?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 276ab9be-8705-4022-2a3e-08ddc7cf3b75
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 20:51:42.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7bCXuKzQbEIboCSXrENLmnHPhxhAUT575WybDtJRB+Xo/pFDw4pl3k7XrUML9ax4OMLuntisyYJO8RRpIB9eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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

On Thu, Jul 17, 2025 at 10:49:48PM -0700, Matthew Brost wrote:
> On Thu, Jul 17, 2025 at 09:41:23PM -0700, Matthew Brost wrote:
> > On Thu, Jul 17, 2025 at 03:38:27PM +0200, Francois Dugast wrote:
> > > If the order is greater than zero, allocate a folio when populating the
> > > RAM PFNs instead of allocating individual pages one after the other. For
> > > example if 2MB folios are used instead of 4KB pages, this reduces the
> > > number of calls to the allocation API by 512.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_pagemap.c | 33 ++++++++++++++++++++++-----------
> > >  1 file changed, 22 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > index de15d96f6393..4f67c6173ee5 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -438,6 +438,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> > >   * @src_mpfn: Source array of migrate PFNs
> > >   * @mpfn: Array of migrate PFNs to populate
> > >   * @addr: Start address for PFN allocation
> > > + * @order: Page order
> > >   *
> > >   * This function populates the RAM migrate page frame numbers (PFNs) for the
> > >   * specified VM area structure. It allocates and locks pages in the VM area for
> > > @@ -452,35 +453,45 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > >  						unsigned long *mpages,
> > >  						unsigned long *src_mpfn,
> > >  						unsigned long *mpfn,
> > > -						unsigned long addr)
> > > +						unsigned long addr,
> > > +						unsigned int order)
> > 
> > I don't think an order argument is needed. A better approach would be to
> > look at the order of the src_mpfn (device) page and allocate based on
> > that. This would maintain congruence between the initial GPU fault—which
> > creates device pages either as THP or not—and the migration path back,
> > where we'd insert a THP or not accordingly. In other words, it would
> > preserve consistency throughout the entire flow.
> > 
> > Also, if you look at the migrate_vma_* functions for THP, it's never
> > allowed to upgrade from non-THP to THP—only a downgrade from THP to
> > non-THP is permitted.
> > 
> > >  {
> > >  	unsigned long i;
> > >  
> > > -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > > +	for (i = 0; i < npages;) {
> > >  		struct page *page, *src_page;
> > >  
> > >  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		src_page = migrate_pfn_to_page(src_mpfn[i]);
> > >  		if (!src_page)
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		if (fault_page) {
> > >  			if (src_page->zone_device_data !=
> > >  			    fault_page->zone_device_data)
> > > -				continue;
> > > +				goto next;
> > >  		}
> > >  
> > > -		if (vas)
> > > -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > -		else
> > > -			page = alloc_page(GFP_HIGHUSER);
> > > +		if (order) {
> > > +			page = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
> > > +							  order, vas, addr), 0);
> > 
> >                         if (vas)
> >                                 page = folio_page(vma_alloc_folio(GFP_HIGHUSER,
> >                                                                   order, vas, addr), 0);
> >                         else
> >                                 page = alloc_pages(GFP_HIGHUSER, order);

s/alloc_pages/folio_alloc actually.

Also I think calling folio_page before checking the return of
vma_alloc_folio is dangerous too as vma_alloc_folio can return NULL on
failure.

Matt 

> > 
> > We may also want to consider a downgrade path—for example, if THP
> > allocation fails here, we could fall back to allocating single pages.
> > That would complicate things across GPU SVM and Xe, so maybe we table it
> > for now. But eventually, we'll need to handle this as per Nvidia's
> > comments, THP allocation failure seems possible.
> > 
> > Maybe add a comment indicating that, something like:
> > 
> > /* TODO: Support fallback to single pages if THP allocation fails */
> > 
> > > +		} else {
> > > +			if (vas)
> > > +				page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > +			else
> > > +				page = alloc_page(GFP_HIGHUSER);
> > > +		}
> > >  
> > >  		if (!page)
> > >  			goto free_pages;
> > >  
> > >  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > > +
> > > +next:
> > > +		i += 0x1 << order;
> > > +		addr += page_size(page);
> > >  	}
> > >  
> > 
> > The loops below need to be updated to loop based on order too.
> > 
> 
> Also the mpages return based on order.
> 
> Matt
> 
> > Matt
> > 
> > >  	for (i = 0; i < npages; ++i) {
> > > @@ -554,7 +565,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> > >  		goto err_free;
> > >  
> > >  	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> > > -						   src, dst, 0);
> > > +						   src, dst, 0, 0);
> > >  	if (err || !mpages)
> > >  		goto err_finalize;
> > >  
> > > @@ -690,7 +701,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> > >  
> > >  	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> > >  						   migrate.src, migrate.dst,
> > > -						   start);
> > > +						   start, 0);
> > >  	if (err)
> > >  		goto err_finalize;
> > >  
> > > -- 
> > > 2.43.0
> > > 
