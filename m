Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5C5C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 17:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3010E1E8;
	Fri, 13 Jun 2025 17:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLPJwsUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9A010E1E8
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 17:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749836546; x=1781372546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xd1Vo0thkGteYFqCATSDrBEgWKQO8vkjBBPfwM6pCNU=;
 b=nLPJwsUokMHD+T7RBQ9tj4XmXGCMwSz+IZVHr3jq0088Z7X0bryypN49
 Toj6/YhzZ85r40IOmAN8KoeV4OhxDiMgkP9Tk8oS/8ssFMAxL53sV8kFu
 JTPjapngOI0idQrcGqYQnFVw0LJF1u/kzqhzx5LVHgixPe2mVh13ZDzfB
 rjJ4RfNwFfIyQQblOphVk7m1dCN0sPNGkWMRVY73SIGT4FZvJxHGorysg
 psqZm3RuNqTSYmI9JF0jAsWnt5rKMmQKdKpkjHeuZTk2JaF94+zRTuZtL
 INKQrm9iEJ02rYfiUGLznxO+OySQK5xH9VWijbpKyEiqZ1pwOqQyXlnyJ g==;
X-CSE-ConnectionGUID: BJ767PK8Rk6kJ3B+5mb7kQ==
X-CSE-MsgGUID: J96medooRw6gpz9B4fIVlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55859554"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="55859554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:42:25 -0700
X-CSE-ConnectionGUID: V9pSgVVLSiuHb+gC38haGA==
X-CSE-MsgGUID: DX3CLI3GSL+Sg3wDqp1sIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147732796"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:42:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 10:42:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 10:42:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 10:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhD6fWobv2D+7ZXxXIJ4F3eBekAkD3FIPwt6ARgkz9JDDb/yNOUqRbE2c2xfiSFPUMGyYiZ67Ax8zfZGph6YikEtwPoEcCQQfjYfpZjEjwer/2kNgp8EJq1pZf++VSy8hn2bLhP6t/WXWF/d7qQ39ZtuyOpFiuCFM5oAQfERSCuwhJpcluVOSHkhW5UxQJSenXcxCTkGc7E7W55PtHYwodzM3+H5Xg5JUBO3s8l2pyCFlZ1s2IrLPazI89cLcF3g2nyktQ2mrz6iNyE9WtkeR1/aTQ9uatrPnu058NlE/P8o+udrTsFWI7FgD+V9pn4o+Z96K0C+TjnegTGCvuyh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bObXEG4D7oAJ/MJc/Fjhj2MkGYVNbfrEpUy4n7DJJsI=;
 b=WDiVcpBTZ3z+m3gNv7OrbMfqM+pz6UuJIV296xmG/zsHfTFNORZUmzzWJz1hERzA2Bp75lOb2hrKvk96nFhVXWp9zea7UUrFGfmmnzkfD+qOkD2enu3su4wsiWWWSSKSo8e/w6FDyG83KtyMQBPefvMbRLIE3FjtSEd+HCWjYQU168v331HV3f09zFn9oJr6KvF5qSGEYJZT5hgA91j8LL2c+nTqx878ZyxWpMh6eUv4OTxdVpRnXQMlfcSJWJxcJzibxhQDVNVkd2KN8qkBSua6q6F3lpGEnBtQ13bpQ64SNGVhXFASANTfTIgo+j6JZ7H6mMWdrk68HdVAcgOuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 17:42:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 17:42:20 +0000
Date: Fri, 13 Jun 2025 10:42:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Make WA BB part of LRC BO
Message-ID: <aExi-6EytKh7bJ8k@unerlige-desk.amr.corp.intel.com>
References: <20250612031925.4009701-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250612031925.4009701-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfc3a9c-edc4-49b7-17d2-08ddaaa1a5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3FET28xK3A1TEJsb3Q4ZDJOa3V1c3piakhjNUtka1EzZWxEc3NMMStiUHJw?=
 =?utf-8?B?QzhzQk9XSXBXNFBNSlJzWmhRQ0ZsdWxVcHp1cWlEZ1NaVkVWRlZ2Zm5ZWG1m?=
 =?utf-8?B?WmNESmt4a1d5a0QvL2tMMWMvcDYzWFVnbUpxQVRnalFqelgxcFdCekhQOUUw?=
 =?utf-8?B?OFFaMFdFRHFPMEFpb2NYMVIvREExNVV6V0JiSU1zdVI0dTRnaEVZWEFEM3di?=
 =?utf-8?B?U2VzRUhGMjJOUjJYcUxVL2U4TDBFOWRBRmQvRithak80STRnUkhhMDY1cmVB?=
 =?utf-8?B?cHdZZERWYU1IRmN4Ykl2YXdLUlIvUDFHTW52VGVyRXp3MkhTRXhPekFacFFE?=
 =?utf-8?B?L2xCOGdPMEJnTjZJUlBTcjlPYk1URElHWGlyZXVtYVlQNkFmQzVOUE1EazZp?=
 =?utf-8?B?M2ZFQ3I3ZStvN3I5ZTd2RGI2ZDNXblFOYXZHb0poUG9KeHNLOHhDNkNxay93?=
 =?utf-8?B?MlNWRGgxeXJIUUR0S1o5eWEyOWhsOEl4RVJwRngrdFVOOEVqZUttUWJyVDJ6?=
 =?utf-8?B?ZHlMMC9EQjloSGRSTDRtT0ZBZlVDRHdUTzdsSTRBcW4vVWE3OVNLc2srWjV4?=
 =?utf-8?B?NEJ1YVlUQmo4dDl3SzR4VlJ4VXQ4OXVKWXA2dUdJYlhPWUVTY1BoR0ZRZVpR?=
 =?utf-8?B?aHVkbDBRK1BTblo3Uk9VS2tRVjBxWHdhN01UUkJER2t1bW5IZG4za3N0eW4v?=
 =?utf-8?B?UWRxWm1ScXRObFkrVHBLRk56Vytmb3cvY2Y4SkxhN3phL0wrbDREcktFbmx6?=
 =?utf-8?B?dEpJM09oRVhkN25FZEJ5V1Q4M2tOc08vL1l4cDhvdEd2dzRrZnhYa1gyUkJq?=
 =?utf-8?B?WkgwTE5RK3hTTG14RDNBdkR6aTVRcXhUU1hnaDVsOXRUQml2UzVVTnM0S2w3?=
 =?utf-8?B?RWtYQUprek5xZzR5SHJOTlMwSE91YkNYTm9YcjBaUDRhT0t1SzJLZU9ESTJE?=
 =?utf-8?B?bExleG9OYXFGZE1wTm1WaUZnZlVvaUtuenV5Vi9FbDhBNXdUSkZVMXVvWlhK?=
 =?utf-8?B?SGRGVXk4NkdwN3pDYkhoekJzZjNLcEFhblFabG5hUXJqNEc4TXdBWFBqaDNZ?=
 =?utf-8?B?Mi90L3lMTXhpcDhGSWJ3cTg3cHROeGxzbk5oaEhyYTM5VG9iRDhDblRYY3lm?=
 =?utf-8?B?RENub1FESGxZa1U5WVNvMFJreXkrUmhveHlWK1dBSmpMTFJJamJHU0ViVEdp?=
 =?utf-8?B?TGFIUXlZVkx3MGhYUUNUSmV5VU1GQ1piY2UzUVBSYjBuVmxJNTRGeFN4Mmh2?=
 =?utf-8?B?dEpUM3l6MFRnZ1drYkN4SkJuNG1KMTYwOTBudnNBcHZZREpWZFNidzM1M21M?=
 =?utf-8?B?ZkdCazd3VEY1b3lnbGlyTVRDOVdXSVQweExRNEt3Z3h3eGZYTTlyNWFFVkl2?=
 =?utf-8?B?YUZWQlhYM2lzcTlrU1IyMUdnTjI3ZHcvWmxKYVl3L0ZGM0pJV3BtV1NMNnF3?=
 =?utf-8?B?ZlFIdmtESGpwRmVwbDVFVnBJUDlwSVlSQzd5QlJBbExLL1Yzd1VVYWpvdUdV?=
 =?utf-8?B?QzZ2MkkzbWVQdHBBWlVFQktEK0RONHQ5VHdDSWNRNWtRWENEZENtYWZQeG80?=
 =?utf-8?B?NjhHL3poQUpkTVE5SU16N2krU1A4elZPeXlIbWc1Z2ZGT0FWUEFMWmp1T3BN?=
 =?utf-8?B?clBtRXl6dHVMR1JKR0VVUWR1SFlHNGNhSFFNQktMbWpIQzU3SGpRRWkxbHBI?=
 =?utf-8?B?N1hmN3d5MTlhVmZMaVdpWk93T0ZJODdJK2cyd2E2OE90K3h4bDFjLzZwSmV1?=
 =?utf-8?B?cGNLTEFhVTlYMFV3ZE9HQjNMMjRlWElXVmQxTHlkWnhPNlNONmxtM1ZQbFFa?=
 =?utf-8?B?YlJ3bjhkcVpsbXFlclpaU21JVkpDZUc4V01ucGxubXR5WGxzcWZUY1UyeDh5?=
 =?utf-8?B?N3MveXdJdElKZGV0MnU0bjU4YndEKy9lalZnUzVoWVR3V0c2SjN1ZG8xdEtz?=
 =?utf-8?Q?tGtV4S6rCWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzF4M0kycStnZTEvamdOemEwczlFR01CYUxnV0dRNlp4TlBnSGVoeksweHk2?=
 =?utf-8?B?VTlZZ01PdXBtd1psdlI1S1diTm40NHJBMFZYUlJkVDhhSFBkWGc5UGhsTW9B?=
 =?utf-8?B?MUVRekJiR09Yc2ZBUm9NdUppQ0FQNTRjQ0NpU1dsTDAvdnJhdHN3cHVjalVY?=
 =?utf-8?B?WkF0cjJmbWNxZmRsVmVFWFoxSlN4QlFvMElJSUlRc2h5VUprMXlVQVBrQWIz?=
 =?utf-8?B?R3ExMHZHa2lMdXdOdUFucXFCUEdMWTNNSlNXRTJIK3BCRVlZWGduc2MvWk03?=
 =?utf-8?B?d1RaSjk0MEFGSTBTWktyRWxxbGtsaVRITG90QlpRaWxXNHppa2o5KzBSVnlB?=
 =?utf-8?B?K2FaNVRINDBpakZ1YlNWdTlaenV4b2YxUzNTYzdJaERiRE5nbXo3YWhVcjhS?=
 =?utf-8?B?V1hwNDVUNitkbzQ4ZC83Q3dNNEMyYVROSjdqWHBHaG1oYmlEVXU2a01FaVRR?=
 =?utf-8?B?TzNEakJRTURsWmlqUXRaT2dEWHpYM1BBWlZORlJ6Sy9kdXZ3NUhJZkRzTFo0?=
 =?utf-8?B?Wm0zNmMrdzJaMHRxZHkybkoxYkhXSUp5aVluN3o1VnorMVdIT2VuZkQ5VlpB?=
 =?utf-8?B?UFdFcW5tMDhoU3Ridm5WMmpzY1ZOZEFJZjJFbHNjVTF2Y3hZeEtqZVM1QURk?=
 =?utf-8?B?VFIzQXNZdUZEV1JWQjlzZ2lJVVAyNldYVTJoWmRMQVQ2U1pkRFpNRDdhc3hL?=
 =?utf-8?B?Nk5Bb2Nsazc5c2l4b3hWRjhHbE0zeWhyWjdRazhEMlpkWmhTU3c0ODFNY1pp?=
 =?utf-8?B?bm81RWVkWUFkWVAzSTBzd1ZoWG1FeGZEV3kybUo0TVNSUTdHc0x5Y2kzSWdi?=
 =?utf-8?B?UVRFdE9PN0Y2anFxZE5DalJSK2hpQlRvMXg4dS9VQ01tcFpmOEZ2TlRLMGlr?=
 =?utf-8?B?QXdiS2E4ZFRIOHhneWFtOVBYTHpzcHRjRzJwa0FKak10cVZyYStjTENDanh2?=
 =?utf-8?B?V2J0RmRJa0FXcktVOUMvdzVhb1N0cnZkMkZGaG8yUWxrdHZJWS9ZKzMraUx4?=
 =?utf-8?B?WVZyOXE1WTJQK0NrS3RGNmpZYzI4TzZTbDV2Zi9lQ2dHQ1FqMUEzcDRpQXFq?=
 =?utf-8?B?S1M1bWJ2L0hFeWtSQ1ZnUk0zYndUTUtDSjV3bXIyQlVobjVTd3RxejNLdFA5?=
 =?utf-8?B?b1hLVG5haEtIV2NWelZLZ1RubndVWXFLV01BYlErc25adWxXZjRidVJybUF1?=
 =?utf-8?B?MThidnZSMkV5Y1l6ZXlHY0VQL2dFY1BWT3dpQjNsTFcrWkdISHhYUjgrSlZy?=
 =?utf-8?B?c1Y2czV0YmhJeUdvRy93WVExWEVHSEVSM0R0cG1zMHd3WEx4RVRnNVNDMjFh?=
 =?utf-8?B?d2dDQm5sRmFRa2d0SXB0SGM5YklWb0VTenYwUDhsMzR5UHdsWExsbi9DU01h?=
 =?utf-8?B?RXdnUkdVRU12UGF6ZDQ5bGd1eGpzRDZlejZLL2JkSEZQc0tFaFY5STJwUDRp?=
 =?utf-8?B?bVFDYVhrT3FqV3NRV01KUnFnR0NBakdIZnA4TFhzdlgyTld5di9yd3hleVBF?=
 =?utf-8?B?YU0yTi9aOU5ocVBZWkl5b29CTWh3VnM3UjVFTDlVM1ZFUHQybFNTWUZPdVF6?=
 =?utf-8?B?anNUUGpaaW5PSkRWbkVDSDVTT1J1cmUwUmtKOEczL2ZLRDBaQk8rb2pOZDI0?=
 =?utf-8?B?VjlwNjhZRks5ZXp6UjNNNDN1aSttMTlDd25pYUptb3YwYWhOK3hxaE1TZU9G?=
 =?utf-8?B?bHFVL0Z5RStIWU1XeFRWQW9UZVBkeTluaHYwdXNSK3NRQSs1ZFh4N0RaY2pX?=
 =?utf-8?B?aWs5Z1dZelk4Nkoza2JSZ21CZE9OWTA0Z0U0SWdHSlcwN2ljQTVQM3MyU1JL?=
 =?utf-8?B?bExqZnJMbGF0eTFTQlF6UHMxYUN6WHg4dWE2KzQybDJBdzJKdStCMXRnNDZx?=
 =?utf-8?B?b09iRUpCdXJUakRqQk9jci9vNXlKWW53aEJ1SGE2bGxpTzg5dXRQaTVYdUFT?=
 =?utf-8?B?eTMvY3dtcENuOFJCOHRwWFBQTG1CY2E4b0l1Uk9vdWpPMVBhY3R4L3E4d3Nv?=
 =?utf-8?B?WjJRUmh4d1E5RUhFTjZ5RkhWU3ZPV0pVVWtFR05vVmVpQk1JTmtOZy9zR3Vk?=
 =?utf-8?B?T2kwV3VDTWo4T0w2dC9KYkwrcDJIbkQyVlM1ZlB3bzZzVjhrektxbkhHdndi?=
 =?utf-8?B?ekdkY3Uxc3Jjd3J4aGVJTFV4N1FXTThYTW5vMHJCdStPUTR6cmRMMUg3UmFT?=
 =?utf-8?Q?IJRFOCbfSWHkPc/zOMvtdpw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfc3a9c-edc4-49b7-17d2-08ddaaa1a5fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 17:42:20.8845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCoeDcxQhJv2f5i9htx9PTzmZ8KQp2dAbb7W2M7dfuSh9xDSc/kFOgskk0HwXZYGDY0ySWN/2wEIitt18+zle+i4YDfls1wk1mk0YDX1qF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

On Wed, Jun 11, 2025 at 08:19:25PM -0700, Matthew Brost wrote:
>No idea why, but without this GuC context switches randomly fail when
>running IGTs in a loop. Need to follow up why this fixes the
>aforementioned issue but can live with a stable driver for now.

If some specific tests caught this, it would be helpful to mention 
those, the loop-count, platforms etc. here. Could help future debugs.

Thanks,
Umesh

>
>Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
>Cc: stable@vger.kernel.org
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c       | 36 +++++++++++++++----------------
> drivers/gpu/drm/xe/xe_lrc_types.h |  3 ---
> 2 files changed, 18 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 529c6a972a55..a875b93697a5 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -40,6 +40,7 @@
>
> #define LRC_PPHWSP_SIZE				SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>+#define LRC_WA_BB_SIZE				SZ_4K
>
> static struct xe_device *
> lrc_to_xe(struct xe_lrc *lrc)
>@@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> {
> 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> 	xe_bo_unpin_map_no_vm(lrc->bo);
>-	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> }
>
> /*
>@@ -973,22 +973,27 @@ struct wa_bb_setup {
> 			 u32 *batch, size_t max_size);
> };
>
>+static size_t wa_bb_offset(struct xe_lrc *lrc)
>+{
>+	return lrc->bo->size - LRC_WA_BB_SIZE;
>+}
>+
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
>-	const size_t max_size = lrc->bb_per_ctx_bo->size;
>+	const size_t max_size = LRC_WA_BB_SIZE;
> 	static const struct wa_bb_setup funcs[] = {
> 		{ .setup = wa_bb_setup_utilization },
> 	};
> 	ssize_t remain;
> 	u32 *cmd, *buf = NULL;
>
>-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>+	if (lrc->bo->vmap.is_iomem) {
> 		buf = kmalloc(max_size, GFP_KERNEL);
> 		if (!buf)
> 			return -ENOMEM;
> 		cmd = buf;
> 	} else {
>-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
> 	}
>
> 	remain = max_size / sizeof(*cmd);
>@@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	*cmd++ = MI_BATCH_BUFFER_END;
>
> 	if (buf) {
>-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
>-				 buf, (cmd - buf) * sizeof(*cmd));
>+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>+				 wa_bb_offset(lrc), buf,
>+				 (cmd - buf) * sizeof(*cmd));
> 		kfree(buf);
> 	}
>
>-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>-			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
>+			     wa_bb_offset(lrc) + 1);
>
> 	return 0;
>
>@@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
> 	 * via VM bind calls.
> 	 */
>-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
>+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
>+				       lrc_size + LRC_WA_BB_SIZE,
> 				       ttm_bo_type_kernel,
> 				       bo_flags);
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>-	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>-						  ttm_bo_type_kernel,
>-						  bo_flags);
>-	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>-		err = PTR_ERR(lrc->bb_per_ctx_bo);
>-		goto err_lrc_finish;
>-	}
>-
> 	lrc->size = lrc_size;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>@@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->seqno = xe_lrc_seqno(lrc);
> 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
>-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
>+	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
>+		LRC_WA_BB_SIZE;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index ae24cf6f8dd9..883e550a9423 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -53,9 +53,6 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>-
>-	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>-	struct xe_bo *bb_per_ctx_bo;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.34.1
>
