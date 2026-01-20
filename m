Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FFFD2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2810E4C9;
	Tue, 20 Jan 2026 06:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8aoJ0yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741610E4C9
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768892261; x=1800428261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JEkeYdybT05lBCwjmxMBhj3IqO43HkdgXAX1PBjxOGM=;
 b=R8aoJ0yos94sVK2JGdqyrgHu7anXfAPiplOTPryMt3wWCQ/jCEdb6nNo
 +i0wC2CeK+tSzF6Z/dMR248DH/LWm8bSJ7k85WyL0gfm+jS0SUzH0rdf6
 IXtTIq8j1DLhmqz6Vc8uunuGSvljLUoSNSiQSMo40ZMWR3Se1yFwLEC02
 L1rGvV9fzRORDh2W2RBjBgzEEShlyGPdPo8M7L6dYh5fkdaiTPwWKvj3M
 Ek/TZ0ceuz1FHsy4HHny/rIlRgiK8xvWr5FzBfIyBhU9Ztaw1yMhDictR
 UhOFskUT/nlaavIVHLmfQ0EOwWiRwx0CbEMgHleR/5awrl2+WTdJQeHRy Q==;
X-CSE-ConnectionGUID: bx2GeOVdSX6bmXcFHIOiSQ==
X-CSE-MsgGUID: /yxCSvDxQlq8tMMKGguLiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81464826"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81464826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:57:40 -0800
X-CSE-ConnectionGUID: yI3Kh6KoR860Rn/zMct5IA==
X-CSE-MsgGUID: 71WuyPrHTBm7eR87is5IgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210888506"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:57:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 22:57:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 22:57:39 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 22:57:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqJ/T5dejIoCPR/zo9GceZk4U7eThOb/4XaibrxCTTmTyo3jAJl/JZCe4ZjBAbFMN/Ux2YxNFGYo2ECkxptJJkzWsN71rPAQUDipG9b2UqNopGkBnzCR6RjFl+513a5NnTpU0MfVrXSoYD+Z7PXXnPsA9hjHAKTdtFVC7+kUnGvUoE5DJ61CVomQo4byMWym/GhoDY1zAe8NRzcKTprRAFF/LiwDGxocHYmYh6HRZd7L9dN44iOy2qB2nTXD1RwvEGIYves0ldymIStOAphJyvYwSuKuIXr82XjB3U/rndvuoiWFw8Bg+FqTYCBF6KzmPhUKxVCXKgzcOIB2diXD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JcJ0TImkeme/4uiL06v2SA4BJvI6HmG22wXQktFbMI=;
 b=rSJjgrOoBxnIJCPrYFIriSxQr/99+bg8QspBQX6hVlhyCQmmUsQSQeiXi3rjVk2s6onC/40fFRSVeF1l/nhYyDGv1ULKBUxf0SiPiUIEN/5wWoEIlDJzTb0fHjpeRTYfHp0woZ5Vmom3uMW0n2zvciZeKd/OpUHb+WvzxB0P22DA+Hg3KiFNNy8K99RnZPmnAfifVw31pPwxui1zrMgOAiNEa4a1wk/SeRuLA0nK+s3mC1JV3jrSs/7qvd10wDBMwtuTqmochnNOHN2BL/B6ADJ62QgzcgjTzpyUW+FWv/x6F3Ln+1jbvzwY+aNG3Yd6H0a7RDd9xhFG9fRjmGozvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:57:37 +0000
Received: from CY8PR11MB7396.namprd11.prod.outlook.com
 ([fe80::98a9:b02b:213f:d655]) by CY8PR11MB7396.namprd11.prod.outlook.com
 ([fe80::98a9:b02b:213f:d655%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:57:37 +0000
Date: Tue, 20 Jan 2026 12:27:24 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v4 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Message-ID: <aW8nVEtytA3gyObB@soc-5CG1426VCC.clients.intel.com>
References: <20260119132938.2173032-8-anoop.c.vijay@intel.com>
 <20260119132938.2173032-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119132938.2173032-11-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To CY8PR11MB7396.namprd11.prod.outlook.com
 (2603:10b6:930:87::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7396:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb8ca5a-3867-4226-a9c4-08de57f131ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWlkdGpZSFhmMG1GZGlLVDlXeSszY3BLdXMrUDBGSytFdWJhOHVUSFE1NXhn?=
 =?utf-8?B?amMyd1hvb3ErczkxV3hEZURSZEhpR1NjY1hMNmhpdFNrNXVyQ3dGUHF2clR5?=
 =?utf-8?B?YUtPM3YxanBVK3hBeHNOZ29mSW4reVZ0b3JyWXo4TGVuREtxakx3ZTF3Lys1?=
 =?utf-8?B?YWRrYUxQbzF0bmVCc09WVDlkTnIvU1pDb2lCZ2I0MFNHTVEyT1UwNVFDOHhM?=
 =?utf-8?B?U2poTWVRN21Yb2p5Sk5zci85dWMyU2U2Wi81NGdHZnVDd0daUEZuR1dLSWF5?=
 =?utf-8?B?NytianZNRFE3UXJhNUJ6VjNqb012b0FWSzJlbm9pcXJQTE02b2l3bmNrSGlC?=
 =?utf-8?B?WDI1UmxlTUsyTmlybTU0ejJUMkg5VFgvYmhwbFZ6R1RJUTRRRGlvRmxWcUxL?=
 =?utf-8?B?MVdTRXlPWXl1YVpUZUpHcFozU0taNEJTMit5REhKZW9pRjVOU1JJTE1vYVdw?=
 =?utf-8?B?ZDhHWTVML3ZkMTl4L2dhS0RYWGdJWm9tMjVITkhYdHFUSlVRZGhxTUJGYU4r?=
 =?utf-8?B?b2F1ckhZSHVOVHBmUXNKdGJ1ZzBHYzdaOWI2bkZ3OHptWFZBYmpvN0JoMUhh?=
 =?utf-8?B?WW9SWWRhRXB4UjBYV3cvd1ZiVEoxN00yejJ5Z3E4bWdiR1liWFhIc00zcTBE?=
 =?utf-8?B?NitWQzhyZmJuR1ZqQjVyellqYnloRWF1ODE1VHlJUjltNHdFUW00LzRRSXF4?=
 =?utf-8?B?dlpQY1BYa25iMzlwRHlsR0dZbE9KVElObEhnL2dZbVgyck9Td0Mvek9nZnA0?=
 =?utf-8?B?L044STROQ0l5cERNejJ1MmJRUDJtbVhITlZtWUVDSHRvcW12V3dybmRLT3pE?=
 =?utf-8?B?Z3U4VFZvZTFua1E3SW81SzJGYkxjUzFmZW1aRnZ5RVQ3MGRzbEVYdHl6a3U5?=
 =?utf-8?B?aG16dDl4dFdGcVZhTHh1Qi9sQ25CQ0NoN3hzUy8zbGVTSC9hV3FKa1lXWnpG?=
 =?utf-8?B?Nk1FdFNydlgrRExkaTI3QlZTTXBGSGp2bUQ0dXZ4Tm9NN0p3a25TeWlDbDUy?=
 =?utf-8?B?bDRMVTREckNTZ0Q5djB0dW5CclhhOVAwNjVldUkrVW9WaVBjMWFRN0dBWVlj?=
 =?utf-8?B?RWlxcUZVYUdZa1poVlRieFk5Um1vWTZIWnpaSVZUUmNJd21YbDVEaG5NKzZs?=
 =?utf-8?B?R3piN1BKK21pZThKcy8xTHlqM2FTTUw2SGNQRkpUR1dIRTk5R0JUTG92WWtM?=
 =?utf-8?B?aE1DRTJUNFJYOWwvaXJaSjRjbS9yT0FvRHg1dUJkQldjUTUya3Z0b3BxRVVo?=
 =?utf-8?B?OGxQa1hUd3ZPRFBxaEtuYnZkNExwYWZNT3Q2dlhOd3M3YUdvaDZ3cGk2dWNX?=
 =?utf-8?B?WjVHb3dKSmtFaVJlbUxDZ1lmclhTdU9qMk5XL2JVVWgrOUhLUmFiQzArUGk4?=
 =?utf-8?B?eG0xbkRJTzcrOUtqNGhHcTJuT3Byd0FFTVJ1T3dsN0NvZkhaUEwvaFJVdTZu?=
 =?utf-8?B?N0xNczA0Kzg3clNDL0ZoUmlLc1BqSW5WTTFOMUMxY1Y0L001MTB6RE5HcDRR?=
 =?utf-8?B?MEkwbDJObmI3aEhDMWEzS3lNTkhmQy9KWXl3bCtqQzlhcUI5YWNsMHVjUmNE?=
 =?utf-8?B?a3kwMkZQMmRIaTB4SVVjaU5SM1o1dkdGTHFqemNYTE15dk9vL0Q3VElHeHBv?=
 =?utf-8?B?WWZlWFBpeHVTN2RYd3ZJN1Z0N0pWclZHcWhpSnJydFl5Nm51RWp0MGY5WXJ2?=
 =?utf-8?B?czArSUVQSWpzTk5TZ0ZkN2JtbURaZVEydStxZ3NPcEdiTkJGZm1ZdGZESDdS?=
 =?utf-8?B?TVVMWlRvaHdmN2pzOUFQR1d4eXZmMmxFeEJCQjNNNGpWaUdockZNZko0V2NX?=
 =?utf-8?B?aXE0ZlNaODNzQ0R3VTZPMVV0bzc5OHNJUFAxVGwxbHg2NC9oNW1WUkxsU0lq?=
 =?utf-8?B?ZXZUOVBhZGhBemE4UzlyTy9nblUwblZ5bXJjWHplbDI4YVNOS1lJckZRN3Zi?=
 =?utf-8?B?OWRCUXB6cVdlVTJSZU5KOURCOXlhTXJBRGxMb1FUZGR2VTYxTi9sb2lxRkNU?=
 =?utf-8?B?T3RpcVQrVFp3VFdqeTMwRmxSMURRQy9saFpSRWNSMW0vOXhyWXd3RGpnazBy?=
 =?utf-8?B?U2JhM0VXM3ZPZkp4TUZickw0SWNUQUpmcWk0YTZ0MC9xTW9BSE9HdHJSWG8r?=
 =?utf-8?Q?xeV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7396.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXRIVmZ1SmZYVEpPM21RRVVLOTRxVzJXS05wMHljNXBnT010bUtRWTdrdkRi?=
 =?utf-8?B?eVBOYTJ1TnZuU1dWbVlvYUFtdXNPTnhYbStubWQzQWN0MFNxWTdRNThFNWtS?=
 =?utf-8?B?ZUl4Y08wQXU1OEpGeURUSE8yQlJPbmFkb293S0R6ckRPRUt3V3hITVVZN3Z1?=
 =?utf-8?B?MGM2WkJZMzYwKzhQNXlpajhEcnVWMCtCOTEzYzRJWlFKemg1THdSNHZtZksz?=
 =?utf-8?B?RkZ6UDZKOS9pSW5iUlpqWmN5cEVXVWtycEdIS1FtUktYYm1JRU9Hdy9vczFX?=
 =?utf-8?B?TXVCUm53NW1TajlPNXNOeERQTEptbGViZVpCV2htWnFuOG5HczM4ODZMcTZy?=
 =?utf-8?B?VkUvcllHTW9oSWRDNTROQWM0MEUrMm5Ld2N0SVNCaFhOSjh4b3BxK0V6c3Q5?=
 =?utf-8?B?aEVhSkU1RFdPNjBxSHJBTndKKzhHU2JqdEhGZXYyTU1uY2Vwb2QzY2IwRWxK?=
 =?utf-8?B?bTAzMkVWZ2dEVlF6clZ1L3k2bGg4ZVN4akF2TG1xUWFvcU0wWTgyTFk5cWU2?=
 =?utf-8?B?QzhGZCtCZkVrUUdNbjFyNDB4THFkN1QyRDBZS1VmV2tGWXdrempEQVorb3Rk?=
 =?utf-8?B?S0cya0JBZVMyY3BvZ2hqMkRaaHlLTDJHdldDcWlHTjViQUFCZmZycThrc2k0?=
 =?utf-8?B?NERtbjF6UmVIVFpPc1JhM013WEhkSXpCVmtKNTlrbUJoWXUyWVlpNlllYTRX?=
 =?utf-8?B?a2tDNjB5eWE3NkVDSEwrNWdFM2ExbllGSEpDN0NDK1RBRllKa2EyS3JOOElO?=
 =?utf-8?B?NitrSVZXYW13Mjk1ZGY0THUzOVVabHVEci9LRG11SXNKcHVSQnhxRWViZFFQ?=
 =?utf-8?B?V21zYlhsZlhUdTZkc0drU0NVQXpiL1Arc2ZGYkMwdy9HSld1UmtXekJhNUdM?=
 =?utf-8?B?NnJDMzh1UGJXNG1zL05VS043cXF4MFhOazM2eWRkK0I3dlVZQ2pwZnorT1Vz?=
 =?utf-8?B?ZFYxNS9jQ0tUOVZ0Q295L3NJcHpsZ1U3aFdhSndZZmZ3QVFkZkp1WGZGTUVy?=
 =?utf-8?B?R3VIR0ozUzZSYUZzeHpROUVzdDZmQTZrdjgxeFd1MFVFaFVWV2tZK3hJN2lQ?=
 =?utf-8?B?MjRRcWFVcW9OR3V5ci9hUnBxc0JJVWI1Rk5NMm9aVjh3N2hxdXVLWllVU25G?=
 =?utf-8?B?dnNwRkVVZ3RLaUxBb1QrYnMyOGlnbEl2TldwVTB2TTRjRmsyeTVlTkN3dzBB?=
 =?utf-8?B?ZVZqQTFTdFBqL2N0SXJpOFErQ1c2dWU2T1dRNjcwQmdTTWQrREZ2bS9GZ1Vi?=
 =?utf-8?B?RUwrVzdWY05OU2JZckxWUU1LNHg3NVRsTXRxUTB5TGNxdHgvd2VIK29OSzJP?=
 =?utf-8?B?WmJRaEFmenNGb3FHRUxUSk82NklpQ3c1M0RsSWFWL1dsalp5RiswMytrZXE4?=
 =?utf-8?B?V1lOMGE5cEJUdk0zM0xac2dhM01ldVBMWG1Kd1hRWGlIeWVLSjdaa042R2dZ?=
 =?utf-8?B?VkdOM1M2UWhTUWZCRUVsZEpPQ0R5bFNzVkJNZ3JoMWI5bzY2Sms0UGZBTnZ0?=
 =?utf-8?B?UG1VbmorOTJWR0oyZmpXRzNRaTVLQlovUUxCMlpNWGpJUi9rNmJlMFR5UndV?=
 =?utf-8?B?Sjg0ZHFiK3c3aXhvMll6T0FwS3JIT3BRY1kyUjZ6NUwzMG1naEMyYzdxcFVB?=
 =?utf-8?B?VWhraE55amd0Ums1UXdMeWVBSk54bVpXVlRrS053WkV5azZ2aVJIM3kySHhH?=
 =?utf-8?B?N2RTQ1ZJS1FhVE5ObVl3bXBWYnRQUmNtQldlWHlRM0R3UzRITFoyWUc0OFRa?=
 =?utf-8?B?YU5kSldzWExRTThyS2lRdlhxWG5NcURuay9oVnBUQ3ZRRjVPMkRDaThScnZ3?=
 =?utf-8?B?dzBrWCtCcFhvWS9mb01yV3JGV0crTDdKOTh6a2ZwRUpUNGlIMHR4TFFwa2Fy?=
 =?utf-8?B?MlRNZjhOVW5nc01kT1F5ci84cm1RNUVYaisycWNWTXRHQjcrM1ZFMnh5bFR2?=
 =?utf-8?B?cUZGOTVrS1FkUloyeFlIa2NzeGhtbXRodUhHSzVPdHg5aWJvSkxvR2dCK1hl?=
 =?utf-8?B?MFlNY1NsUzBVV3BoZU1jN0t4SVVZTmdFS3BITWhjbWxFcnRvWWh5WWVzRmZT?=
 =?utf-8?B?S1ZqVzI5QlAyK0lyOHFLYnA1dTcxZWptUVRJVnFkMTBGdGNlMEhtQS80ZmNE?=
 =?utf-8?B?aVJZN09UTXFKalhtRHkyeDBVdk56bEh4WkFRTUJrZlg5dFQyUGNZeEV2MW1T?=
 =?utf-8?B?SFpFZTRMS0N2c0VtM2J1aGNZTGJscGc5MnZPRzJWTzlKT1pOMmZBM210aXdZ?=
 =?utf-8?B?SEh0NHZMUVN2UlRGc0NiMTdqK053OUF5MG03cE9KMUFMOVJIMFJ4c3ZkQjdP?=
 =?utf-8?B?ZmplRWxjUG5yQ1AwbXhGU2pucWlqME53TlRlNWVZUHIzbnVjcjNscnZBTGtC?=
 =?utf-8?Q?fvvQpvLhfzpahMGM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb8ca5a-3867-4226-a9c4-08de57f131ae
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:57:37.1603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoPcAQ7QOZsVxL0oOM8H9qaXcY5tVoKnPHBgQ13OXDzku4jvRS8no7BgjaFHwhqlxtKG1IwUzrdlsFyY6A4dlS++eUoBIhYQ85OFBmly1d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

On Mon, Jan 19, 2026 at 05:29:40AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Implement the System Controller mailbox communication layer:
>- Low-level frame I/O operations
>- Mailbox busy/ready state polling
>- Command preparation and fragmentation
>- Multi-frame send/receive with phase bit handling
>- MKHI protocol header validation
>- Public API for sending commands to System Controller
>
>This provides the complete mailbox infrastructure for
>communicating with System Controller firmware on Xe3p
>dGPU platforms.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4: (Matt, Mike)
>- Refactor MMIO access to use domain-specific accessor
>- Add input validation and buffer overflow protection
>- Add bounds checking for multi-frame operations
>- Fix potential NULL pointer dereference
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 445 ++++++++++++++++++++++++
> 1 file changed, 445 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..162208f6018b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,445 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/container_of.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+					      unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+					    unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
>+					  size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
>+					 size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
>+{
>+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
>+					      u8 group_id, u8 command,
>+					      const void *data_in, size_t data_in_len,
>+					      u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	if (data_in_len > SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
>+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>+		return -EINVAL;
>+	}
>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
>+				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc,
>+					  const u8 *mbox_cmd,
>+					  size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min(cmd_size - bytes_sent, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+
>+		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit ^= 1;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>+
>+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			sc->phase_bit ^= 1;

At this point, you have already written to phase bit into the ctrl_reg.  
How do you know that the FW did not already interpret it? Maybe 
something you want to check with FW on whether you should reset the 
phase here.

>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
>+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+						  void *out,
>+						  size_t out_size,
>+						  size_t frame_size,
>+						  size_t *payload_bytes)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>+	u32 frame_data[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)];
>+	size_t hdr_size = sizeof(*resp_hdr);
>+	size_t payload_size;
>+	int ret;
>+
>+	if (frame_size < hdr_size) {

This will never happen because frame_size passed into this function is 
hdr_size + data_out_len OR SYSCTRL_MB_FRAME_SIZE. Even if data_out_len 
is 0, this condition will never hit. Hence redundant.

>+		xe_err(xe, "sysctrl: Frame size %zu too small\n", frame_size);
>+		return -EPROTO;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>+		xe_err(xe, "SC: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>+		return -EIO;
>+	}
>+
>+	payload_size = frame_size - hdr_size;
>+
>+	if (payload_size > out_size) {

Same here. You are still operating on parameters passed into this 
function and neither payload_size nor out_size is being modified here in 
this function, so based on what you are passing into it, I don't see 
this condition ever entering. payload_size will be equal to out_size.

Regards,
Umesh

>+		xe_err(xe, "sysctrl: Payload %zu bytes exceeds buffer %zu bytes\n",
>+		       payload_size, out_size);
>+		return -ENOSPC;
>+	}
>+
>+	if (payload_size > 0)
>+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>+
>+	*payload_bytes = payload_size;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
>+					    void *out, size_t frame_size,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	int ret;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
>+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+					     void *data_out, size_t data_out_len,
>+					     size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t hdr_size = sizeof(*mkhi_hdr);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t received = 0;
>+	u8 *out = data_out;
>+	size_t frame_size;
>+	int ret = 0;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>+
>+	if (total_frames == 1)
>+		frame_size = min(hdr_size + data_out_len, (size_t)SYSCTRL_MB_FRAME_SIZE);
>+	else
>+		frame_size = SYSCTRL_MB_FRAME_SIZE;
>+
>+	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, data_out_len,
>+						     frame_size, &received);
>+	if (ret)
>+		return ret;
>+
>+	out += received;
>+
>+	for (frame = 1; frame < total_frames; frame++) {
>+		size_t remaining;
>+
>+		if (received >= data_out_len) {
>+			xe_err(xe, "sysctrl: Received %zu bytes exceeds buffer %zu bytes\n",
>+			       received, data_out_len);
>+			return -ENOSPC;
>+		}
>+
>+		remaining = data_out_len - received;
>+		frame_size = min_t(size_t, remaining, SYSCTRL_MB_FRAME_SIZE);
>+
>+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
>+		if (ret)
>+			break;
>+
>+		received += frame_size;
>+		out += frame_size;
>+	}
>+
>+	*rdata_len = received;
>+
>+	return ret;
>+}
>+
>+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
>+					   const u8 *mbox_cmd, size_t cmd_size,
>+					   void *data_out, size_t data_out_len,
>+					   size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>+
>+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>+						&received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>+ * @sc: System controller structure
>+ *
>+ * Initialize system controller mailbox interface for communication.
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
>+ * @xe: XE device instance
>+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(struct xe_device *xe,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len)
>+{
>+	struct xe_sysctrl *sc;
>+	u8 group_id, command_code;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	int ret = 0;
>+
>+	if (!xe) {
>+		pr_err("sysctrl: Invalid device handle\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!xe->info.has_sysctrl)
>+		return -ENODEV;
>+
>+	sc = &xe->sc;
>+
>+	if (!cmd) {
>+		xe_err(xe, "sysctrl: Invalid command buffer\n");
>+		return -EINVAL;
>+	}
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	if (!cmd->data_in && cmd->data_in_len) {
>+		xe_err(xe, "sysctrl: Invalid input parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd->data_out && cmd->data_out_len) {
>+		xe_err(xe, "sysctrl: Invalid output parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	might_sleep();
>+
>+	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
>+						 cmd->data_in, cmd->data_in_len,
>+						 &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
>+					      cmd->data_out, cmd->data_out_len, rdata_len,
>+					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>-- 
>2.43.0
>
