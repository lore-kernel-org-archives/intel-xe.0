Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9277CCA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F56610E732;
	Fri, 30 Aug 2024 06:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xyxni8vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEF610E732
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998847; x=1756534847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=apIY9Ou/ssM/0+kkhFG2muTWF50j/0oayI5ZPkVmItw=;
 b=Xyxni8vzxfVWXBSOMbtUL4bjUEXZ7DsyYqlkK3XBYSoKIAhnCA8NzDaK
 uLi40FYtRojad35IUu7u2NMf9mgEPKlH4Mgrf8M2vjFmZeHWDAGL7vtzr
 W0opNDUC8iy5wb6KoRi/rx1AObgRQEsJdVHZd/Q5DRctIkz6uYl/mDQ0X
 ZUYiXURf2I9RizT9NuVEO1nQTl2j9CtV71EvHusC/eTUZy746MwDOej8O
 9n+FRtvBqDwoL3oa3V6w7ootX+X4hgjA75ux5qCN9ktKv2elrUyJaaZtY
 0dLmscSk0zmbrGHpDot3Pa6YKla7APtsopcYqYdpqgR1lh1qL6cA7g/pW Q==;
X-CSE-ConnectionGUID: MMbnHOO5QWK+PBiwtKlGSg==
X-CSE-MsgGUID: HrUkm5nWQt2813YTuWTUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26523488"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="26523488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:20:46 -0700
X-CSE-ConnectionGUID: FGkRNyjJQeCzd2gL291POA==
X-CSE-MsgGUID: 02Q7fLP6ROmj4Io2no/uVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="63794531"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 23:20:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 23:20:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 23:20:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 23:20:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 23:20:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+l/KeWd9OfaHw0pG6zuSp5yP1IPzdZ3QhKXrVJgc6yLeYw5zzyUJSQIovFU3l8CijQWst+/qMt4+oVsdH2C2jJ3tZzii+U/V5RlJ3PFEb+o4x0iY42V5GtheLmPudqP5ZbSuuoWRzWTGjYDNs/C2O698u6R+5QLKy+Een2PKYLjfQY14CV1q4Cv3SbvJ22ZQ3Jj8+Ok+Ct+KpFiQ/VFv0Fc1KlEdMB01GRoznEESAdvlLIY4PGUwQZGXwVjUcGjV6tchHKhu/we3CucBQOmYvbn7pBZ0hVu5mAkyoNgposrJ2wTAwYbHEizvEyUCT1evCPeIirBsVpnjh8AVQOsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDJo0kjW3CXXBnEt5Brs/PRPKsGHumyoQjNcydspUEY=;
 b=Wc+4mobqLUlBaEMVy5L+iJ/2dwB0XdCrqm3xRz+e00Qaizgxv23OQMY1FnYPkCLzsPVPv7wdpM7ieSLKoJ2BPFgux6+7KyUe4oem5yQhi69QrGtnZVGPugMkoaEHqB96hvqcRveb22muwk7UlyyLSuZbCRCR7pSNNOtrrpikPMG8uD1b8XPDNbHaPKJ0xPEvtUivABZzVZF46Ju2wocYmxEA9AFy1jxt0rvOBZ0bwxw5l7D3e+Pe2/QbWLFl65Y+v1UTuwGAz5hovrzm9w+kyKWfKV8Z2y0k85vSaZE91rhwxkFg00yrhfVtSy9AVrLPYndtnX8er7YwZtB56PUnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 06:20:42 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 06:20:41 +0000
Date: Thu, 29 Aug 2024 23:20:35 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Cabral, Matias A" <matias.a.cabral@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>, "Ausmus, James" <james.ausmus@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <ZtFks4OB2fzoY-yu@intel.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
 <3cab72ee68db99761ad07c6b8d8127b7d84ee77f.camel@intel.com>
 <87frqrtelv.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360E6440D35516CFF554555B28B2@CYYPR11MB8360.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CYYPR11MB8360E6440D35516CFF554555B28B2@CYYPR11MB8360.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d260622-5921-4248-f853-08dcc8bbdf7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2IrZ2pXUWtmV3IxdncrVFN0Ymt0Y2dsbzlkRTRNcGtNYjlDcjlLcWx0QXR3?=
 =?utf-8?B?aEVOUU04ZXN0cUwwejZBc0d0cXRhd1JqZTVUVUFDMTVFUmlYMlozb0NVbXVy?=
 =?utf-8?B?M3AzMFFzSFZ5U0c5elJrbjJkMGdOVkxEUWZ1V3lMVVZsV1hDL2JPVE5Xbzgy?=
 =?utf-8?B?ODRSU2hqUklZWThxWXg2aENBdXZWWUJodkh6V2VUOVJhSjJiZWNtUWJya2E0?=
 =?utf-8?B?TjRQTW51cW9neXdpUU13d0FhMlFyL0J4WFpxelI4dVYvclJMTWNBQkY4Q0xu?=
 =?utf-8?B?RUdEeFNuWTZCSUgyWThwRWpSeFhaNVFCeFU1T0xnb2w1UG1PeEhPMVBZdFFj?=
 =?utf-8?B?TEMzVTNwWkNYNDVIMkpCeHoyT2ZKWHJGVk1nTzZsVTg5b29CL0cxQ0RUTi9V?=
 =?utf-8?B?ZXR4K1paWVdJc04zWmk5bEJFSlI0UWEwZWVYYVYyNDJ2WG85a3B4REM2YWxs?=
 =?utf-8?B?T3NZKy93OHlSYWFoaXlYcE9tRnZKaXB0VnBmLzhxUjNHdUxvZ0ZCZUphWVky?=
 =?utf-8?B?NFlHQ1pYSVpHK1lvNlNKb01pNVhxNVBDK09KVXphb09VeGhzanNxVnY2SUNE?=
 =?utf-8?B?UmtYZU1RL0doTVpQNUdOM0RDVmlQRy85UW1zRDZzbWhMVjJocHZ0YWcyZWNT?=
 =?utf-8?B?RzltOHRxdGNYZW1tLzU4Y0tZbldQQktDeGc3RTJPRlBjaGhwSSs0SVpOQmU3?=
 =?utf-8?B?a1JIbnp1RTIwSDdYeFptTXlLZDNtUjBoRE80aUJhUVI5SFdJZ29rZzdaUjlx?=
 =?utf-8?B?S2M4dGFybWJNTk5PSnFXZ3BYYkZlUnRxeWNTV1VrK2gzS01QMXZ5VTFORnN2?=
 =?utf-8?B?REQ4QllBVlhoNnZRMU5kNGV2YlFMR1E1WE1MWFZvUUFPK2hvekpWYlZmc1Ja?=
 =?utf-8?B?MzlwMXgyZVVsd3RkVnJnRGlmZGgyMGQ1bXlpNkV1Zk5ETkFvQkFNczF0Z2Jl?=
 =?utf-8?B?dzFYdjU3V3pwUXZkTHAybytEZngyTEc5NG9Idnk1RGlGZDNEZncvSTRZOFox?=
 =?utf-8?B?ZlJhYkRHTU1FWWM1NHRKb1Y2Sk5uVHBYbE5XR2dwM3BBTEc2THRDTGZTcVBa?=
 =?utf-8?B?SVhoSExBTDJaTkhiNm1xU3hrSEVUV29BdnkxbTcyamdkWE5FVFRQbnQ5cTQ4?=
 =?utf-8?B?cGR2NitDRndNZHhnV2p1Q3IwVEZWWlBxZTRkaU1tSzZKUUJKcldMd3RsNTFi?=
 =?utf-8?B?RHhEMlFOTHhETk1aNTVRd2kvNTlLM3ROQ2dMZDVjSjM2MzNhTVYrNXBqSHJH?=
 =?utf-8?B?azZENUo5VFJWSjdocUNXdjB5VnprWlpDREFGR2ZndTBLRHZWZ253cXd6cFZI?=
 =?utf-8?B?ZGFaYmJ4Mm5qcTdkQVVsQjYzSzdsRGU1bFQ3OGVPRm1SSVArVkhnVkg2MFl0?=
 =?utf-8?B?N1VKZEVKcXpuMUd3WnZ6aDJoSEhIZEViNHFxMkVxVVAydzVuOGE5UFI0RmdQ?=
 =?utf-8?B?OWxwOS8zVFAwOVlIaDV3cy9XZ2hTSkdwVDV6Q3BVRmdxOFFIZDVyZmNnL091?=
 =?utf-8?B?QTlZbFBCVUgrQjIzd09Fc1JoRU42UTFwQ0VTa0dXY1FzWDBlZnAvVndMT3Bs?=
 =?utf-8?B?SUdVWWtyUjQxTlZncHlHSHNucklKWDdqTVIwY09CMFRSWjJnejQzMnFzcWpK?=
 =?utf-8?B?Znc3M25HVHBoKzAwdWM3eWc1RTZZVmNNc0RTRTNtTzVBY0E3WVNIdFJhVFhE?=
 =?utf-8?B?OGFrS0tQQ0dTSjNudHZsTVhRT0l1aHIvU2M2TVlqOHluVUprUmU0TStDcEUz?=
 =?utf-8?Q?3IM5BLdckBHFqVIQmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2U1Q3NjS1ZXdEtPVXRvVUZHZjg1aWM5NmQxVFpkcHF0dW9icDhkLzBKc0lV?=
 =?utf-8?B?MWw4bmIyckxRODh4MFY1a1c0Zyt5b1ZFb2Evb2NtSE9nWk15SmcxTTRWRlh6?=
 =?utf-8?B?RjhIZFlIZVd5cWh4aWhPb0ozK29zb3A1Rk1ZRWsvSUtmbHEwaHBidkhyb2hX?=
 =?utf-8?B?SUNpUEJ4QzZZUlZPUXo5OU1XZ0Y2NHVlWXJwd3FKTE5xMWpFMDlabzNLSnY3?=
 =?utf-8?B?dVNkcGVnVGFKZTFxRGlSaU5FNW9RbXNtT2FnNjNxNVc3akJMNHdvWllWS01p?=
 =?utf-8?B?eUxKUjNLemZHdExySnM4RkRaQUxTcHhVc0JQdi95WWdyekJpd1dTVERjNEhI?=
 =?utf-8?B?NC8zUUIwRjArbHBPd0xvZmNubjI4amtqbXhyRCtpblZ4MGJIWE5uU2x6VERK?=
 =?utf-8?B?dm0xRlBadXE0THJsSGhKR0lSZHRPNUc1cXozRnZsa1Y1dmFBcVlaRVRPbVJ2?=
 =?utf-8?B?NzFHM0hIU255bkdKSUFTTzk0cUpkZDdXRm9WMXZicGR0bnhrTlBWL0xvNVRq?=
 =?utf-8?B?RTcvdVgyK3lXWkRKT2hKSE9TZ0R3UTRKMmJvSUZCbzFFcFdOT081Y1NnSTRF?=
 =?utf-8?B?V3F1ckplb2Z6UTNrQnFabGlLTE5UQTZnNVlLdk9wakZsSzdiQkp4NGVkaFRu?=
 =?utf-8?B?U2E3QUZjQXIyKzRnRys0UVM1eVdhWDRxMW9pQXFPWlZTb3MzMnhpUkNBcUYz?=
 =?utf-8?B?TGZUU2hHd09ncm9MbzJNc2orN2hKKzFvU3ZlMElZVXdUZWFDeHRlM0xQdkQ3?=
 =?utf-8?B?TlRiV0tyRkpORnBnMWxxZENQZkUyM3FBV3VleEN0bjNReFk3YUk4RmRUY2E1?=
 =?utf-8?B?MnlkVG94ZW1qbHZVWk85T2lyM0VpNXFDS3pnZWlIS2lKaTVtN2g1eXZ6NHNo?=
 =?utf-8?B?V3AxOHF5N1lsSnZpbHVpUitzTlVmT3BkZWs0TVEyOW1TNnRyK0NUQXJhWVhC?=
 =?utf-8?B?akdFUFJzdzJkd0N1YjVtL2oxNUtmSis0SC9FdWNJWEE3aDhtbkE2QUw3M1VW?=
 =?utf-8?B?UjB1cU1LRVArKzd5bXFoanNFNWtrYnRtV0ZoRmM2ZVJ6U2lML0xrYXRxMTVi?=
 =?utf-8?B?aExBNlFxY3U2VlhFUzlja2dSRUwvNlpqOWpiYkp3cHljMVc2cU1Wem8rbFdh?=
 =?utf-8?B?d1ZFRlhjVmZ5dTdvYTE2Um9pVzVRZUo3QjdXRHprVkNZVGc2eFQ0bHlMcjdG?=
 =?utf-8?B?N0YwejY1WjgzMUx1MlgxU0hBZW81WkdSVnFiVFhPY0cwaW5RRHdaTTV5ODkv?=
 =?utf-8?B?UlhGbkNSaTdyNnhsQWVoekdWMEcvd0d5QitPbTlaZWpvOUo0V01ud0VOaCtO?=
 =?utf-8?B?TEhmUzdZb3FMcGxabUJDQS8yb1hDMzFWT1pxZWJvQ2t0bVRzVUVHbFJFRmtp?=
 =?utf-8?B?S2FSclREcFE3UDFrTDB2cXYyWHJJdDAwQVI1Y1RDa3lzRVBTWmRCRUxoNWk4?=
 =?utf-8?B?VlpUb0s4UnUvZ2lKbmtockhDZ3h6M01tSys0RFhtYzVmMUlueS9udTlySERh?=
 =?utf-8?B?Qk42Zmg4ZUk2amFtY3dKcnJnK2hPY3gzdU53UzE0cWd0R0JSUG5abEJLU2hJ?=
 =?utf-8?B?aVFvTktWVDZvMEhlRDNOTFpPOUFqYWxDT0U2VGY2TFFWM2haUVhvZy8vU1VB?=
 =?utf-8?B?L0dYbHFlS09ueG9US0VZYnpGd3lsandYV2c5eHJWYldBNVozNVBabFhLQjI5?=
 =?utf-8?B?dGp0WUlRdGtlV0xUdmxLZEZwbnhtcm93MDFGSHlEancxWmJnK0ZCY3cybWx1?=
 =?utf-8?B?ZDZicXN3Y2JPNmVBNEdvRUh1L09pZ3lBVTVGTjQ5YUdoQUJvNU04Lzdvb3VJ?=
 =?utf-8?B?ZU1MUmJRV1NwTDBCMlZ4NVF0UWFWaSs1MVZrUDhSc3RCcGhGVlNWOGRuN0V5?=
 =?utf-8?B?REpxSUlwVCtDNkt6RVMvbEh1UHg2bUExYkZBaDljTDRWM1FzZS9yb2dpbmhN?=
 =?utf-8?B?RTFsTEs0NGpHcC9Wa1A3R3FlMDQ1WmhPUjFPTVhWU3k1WXN0c2VUREhYWTNX?=
 =?utf-8?B?R0E5ZExsQWJNRVlkOERJamdrcUZocWgyeHcyUEdweW94OWFUQk1iVCtwQmEz?=
 =?utf-8?B?Zk5tb3kyMENPWkVoODgwTjBBbGJkRnBSaTF5anJaZFFZWUhCdGhvOXlKeGI1?=
 =?utf-8?B?VXIzWlBTRk9BSWQzRlJac3BBd3QwOU00dnQyTUFzR05yT0kyMGJteE9xYTNt?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d260622-5921-4248-f853-08dcc8bbdf7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 06:20:41.5882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3wCSQjF0dLospTgEFkCxQlQi6D5iT+6/1MJyoU0TQ+HDmr54Y+q0GDlgtZ3VhyAysZSoJSBQUQmzbq1ei8xwgN9B3q6hHSOoP1nLl8XuhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
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

Here is the summary of the discussion regarding the uAPI

1. Eliminate the data header from the data copied by the 
driver to the user space.

2. Subslice information in the header is NOT used by the user space since
the data is collected at the tile granularity.

3. The only flags bit(0) in the header currently used, is to indicate if
the HW has dropped any EU stall data due to insufficient space in the
kernel buffer. Instead of a flag in the header, the driver would return
an error during a read() if *any* subslice in the tile has dropped data.
Any EU stall data present in the kernel buffer would NOT be read.
The subsequent read() would return EU stall data for all subslices on
the tile and also clear the drop bit in the HW registers for all
subslices that dropped data.

4. User space doesn't seem to be interested to know which subslices have
dropped data. So, the driver would not provide any STATUS IOCTL to get
this info.

5. Record size in the header is a static info which can be queried
through an INFO IOCTL after a file descriptor is opened. Based on the
GPU, user space can determine this as well.

Thanks
Harish.

On Mon, Aug 26, 2024 at 10:31:04AM -0700, Cabral, Matias A wrote:
> > Matias: could you please explain what L0 does with this dropped flag?
> 
> During the processing of the data, L0 returns a warning message. VTune ( I think) also warns the user that results were collected but will be inaccurate because the draining/reading of data was not done fast enough. By moving the warning to be returned at earlier/reading step, VTune may a) on the fly increase the reading frequency reducing the amount of data lost b) cancel the collection immediately, saving time to the user that may collect data in one node and process in a different one. 
> 
> Thanks, 
> _MAC
> 
> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> Sent: Monday, August 26, 2024 9:48 AM
> To: Souza, Jose <jose.souza@intel.com>
> Cc: Cabral, Matias A <matias.a.cabral@intel.com>; intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>; Chegondi, Harish <harish.chegondi@intel.com>; Kumar, Shubham <shubham.kumar@intel.com>; Ausmus, James <james.ausmus@intel.com>
> Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
> 
> On Fri, 23 Aug 2024 14:22:19 -0700, Souza, Jose wrote:
> >
> > Hi
> 
> Thanks Jose. One question for Matias/L0 below.
> 
> > On Thu, 2024-08-22 at 15:53 -0700, Dixit, Ashutosh wrote:
> > > On Wed, 21 Aug 2024 12:35:51 -0700, Cabral, Matias A wrote:
> > >
> > > Hi Matias,
> > >
> > > Thanks for responding, the input is _very_ helpful.
> > >
> > > Mesa folks: would it be possible for you to provide similar input too?
> >
> > Felix's MR[1] is only using record_size and num_records, if the
> > drm_xe_eu_stall_data_xe2 was the same size and the sample we would not 
> > need the header at all, inline replies below.
> >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> >
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > >
> > >
> > > >
> > > > Hi Ashutosh,
> > > >
> > > > Some inline questions below [MAC]
> > > >
> > > > Thanks,
> > > > _MAC
> > > >
> > > > -----Original Message-----
> > > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > > Sent: Friday, August 16, 2024 3:38 PM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Chegondi, Harish <harish.chegondi@intel.com>; Nerlige Ramappa, 
> > > > Umesh <umesh.nerlige.ramappa@intel.com>; Degrood, Felix J 
> > > > <felix.j.degrood@intel.com>; Souza, Jose <jose.souza@intel.com>; 
> > > > Cabral, Matias A <matias.a.cabral@intel.com>
> > > > Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU 
> > > > stall sampling
> > > >
> > > > On Sun, 07 Jul 2024 15:41:41 -0700, Ashutosh Dixit wrote:
> > > >
> > > > Hi Harish,
> > > >
> > > > Some comments below on just the uapi first, towards finalizing the 
> > > > uapi with the UMD's who consume this data. And also comparing the 
> > > > uapi with what we did in OA.
> > > >
> > > > >
> > > > > diff --git a/include/uapi/drm/xe_drm.h 
> > > > > b/include/uapi/drm/xe_drm.h index 19619d4952a8..343de700d10d 
> > > > > 100644
> > > >
> > > > /snip/
> > > >
> > > > > +/**
> > > > > + * struct drm_xe_eu_stall_data_header - EU stall data header.
> > > > > + * Header with additional information that the driver adds
> > > > > + * before EU stall data of each subslice during read().
> > > >
> > > > One question to resolve is if we really need this header and if 
> > > > UMD's are actually using the information in this header. In OA we 
> > > > dropped the header and are providing information in the header via 
> > > > different means (see below).
> > > >
> > > > Another option is to actually add a property for the header. So 
> > > > headers are added only when user space requests headers.
> > > >
> > > > > + */
> > > > > +struct drm_xe_eu_stall_data_header {
> > > > > +	/** @subslice: subslice number from which the following data
> > > > > +	 * has been captured.
> > > > > +	 */
> > > > > +	__u16 subslice;
> > > >
> > > > Do UMD's use this subslice information? We should check with L0 and Mesa about this.
> > > >
> > > > [MAC] L0 does not currently use this.
> >
> > No usage for sublice at the moment in Mesa
> >
> > > >
> > > > Also about whether UMD's need or want the header itself. For OA, 
> > > > UMD's were happy not having to parse the header.
> > > >
> > > > > +	/** @flags: flags */
> > > > > +	__u16 flags;
> > > > > +/* EU stall data dropped by the HW due to memory buffer being full */
> > > > > +#define XE_EU_STALL_FLAG_OVERFLOW_DROP	(1 << 0)
> > > >
> > > > In OA such information is returned via 
> > > > DRM_XE_OBSERVATION_IOCTL_STATUS. For EU stall, e.g. we could 
> > > > return a bit mask of subslices which reporting drops. So similar 
> > > > to OA, we could return -EIO when HW reports drops and userspace 
> > > > optionally issues DRM_XE_OBSERVATION_IOCTL_STATUS to retrieve 
> > > > which subslices are reporting drops.
> > > >
> > > > [MAC] having a return code to notify of reports drops would be 
> > > > much preferable. This would allow the UMD detecting this condition 
> > > > during the read phase without needing to process/parse each report.
> 
> Matias: could you please explain what L0 does with this dropped flag?
> 
> Harish: do we know what is the reason HW sets this dropped flag? Is it because userland is not reading fast enough so HW is forced to drop data?
> 
> >
> > But what can UMD do when that is set?
> 
> Mesa can ignore this if they don't need it.
> 
> >
> > I would rather have a warn once printed on dmesg, so the issues don't 
> > go silent but it don't need to go to the uAPI.
> 
> dmesg warn is likely not an option because it will trigger bugs in our CI.
> 
> >
> > > >
> > > > > +	/** @record_size: size of each EU stall data record */
> > > > > +	__u16 record_size;
> > > >
> > > > This is static information. Does it need to be in each packet header?
> > > > E.g. it can be returned via DRM_XE_OBSERVATION_IOCTL_INFO after a 
> > > > EU Stall stream has been opened.
> > > >
> > > > [MAC] since the size is constant, it seems an overhead including 
> > > > the info in every report.
> >
> > drm_xe_eu_stall_data_xe2 should be of the same size as record_size so it can also be dropped.
> >
> > > >
> > > > The INFO data struct could also include a capabilities field. So 
> > > > if new features are added to EU stall in the future, they would be 
> > > > advertized to user space using the capabilities field.
> > > >
> > > > > +	/** @num_records: number of records following the header */
> > > > > +	__u16 num_records;
> > > >
> > > > This will not be needed if just return raw EU Stall data without 
> > > > headers. Or even otherwise it is probably not needed, it is the 
> > > > total size of returned data minus the size of the header. Provided 
> > > > we return all available data.
> >
> > Same as above, would not be needed if drm_xe_eu_stall_data_xe2 matches samples size.
> >
> > > >
> > > > [MAC] the KMD will always return atomic units of reports, right? 
> > > > Then this is not needed, having UMD the possibility to query 
> > > > report size when opening the stream, the UMD can know how many reports are in each read.
> > > >
> > > > > +	/** @reserved: Reserved */
> > > > > +	__u16 reserved[4];
> > > >
> > > > This can be handled via 'extensions'. And if headers change they 
> > > > can be advertized in capabilities.
> > > >
> > > > > +};
> > > > > +
> > > > >  #if defined(__cplusplus)
> > > > >  }
> > > > >  #endif
> > > > > --
> > > > > 2.41.0
> > > > >
> > > >
> > > > Thanks.
> > > > --
> > > > Ashutosh
> >
