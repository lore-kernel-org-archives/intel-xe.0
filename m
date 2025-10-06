Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58690CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2105210E06D;
	Mon,  6 Oct 2025 13:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkN8C8L9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E4410E06D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759755890; x=1791291890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f7l4qALxDd13Tf7lL92g/WoH/JxTP+5QtSYQkmIDakY=;
 b=YkN8C8L9NkscLs3rcBStxGZqGkBBC8KWpFebY7sy85efR1jPW2MtiT+x
 qiVNGxSTR3bwgixDLkcX7r140sHatt+84cqHj9kDHiWMV+6ddOjJfgCzD
 +9HoF50OlXpqtpRdZT6CeLrkunrHVAcp8HGK/MuhUiPlQbYWlfN5ETayK
 DvSoNdbJx+LWMCurPnzXQBBdWxotVUhL89BlMASm7Lsub5yKItLq/0T3N
 onXBfm0AGr41+nc5VZzQlvWGnUKewiVkYayuizjT7cjQedIXJYpVeW8Qr
 CYQwjTmldFbcroaTD1zuniR1Yp+3epeNzCae9vd8/HnCKof34oZmPJYe1 A==;
X-CSE-ConnectionGUID: lJoGS3/gQM2MaUZ2b3GmvQ==
X-CSE-MsgGUID: QbjlPR8oSKCCBs/tBkO1Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61636568"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61636568"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:04:50 -0700
X-CSE-ConnectionGUID: L2Pn1DRHQ/mf3shvmM0+uA==
X-CSE-MsgGUID: haClstxzSCa4jDIYhJkCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="184250520"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:04:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:04:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:04:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw3Rb9AHoqAK6JsCGCiNP41LD0i55lvmH1g3Ep49x84uqFSdZSSM4PhaSMfTUu7IduUxJVrvS9AgGk26FoVg4CwELvyKksRI2dhNRS8vFxgDN42Pp76QoRWE8iJQqLdsV2wmHjvjSbLWe1SWuxgV/ujg05v8DdrzmG7bcgYga4kJ/dQMMMOFcfm1aZ1CqcrsLlSl/eKc5MThlQiZTjWIi+ujmZq1pIQzYx8v2Cb43R2H4Zi+qo8cMrLh7OS0mJVsYuAJkdV2eXP3802Q0/saTpOZ/lg50OjAzUbu+/L3PGdZ/pS4JHGGVseBI9aenm7zFUZsXuFikqG9bVi3NcSyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TovqarR6UMtusE7AJdiPLyunv3DgxjyvWaBd1b84A9A=;
 b=iWPYZ6kYl/ayWh/fajDRskaqQ0PP9hR2NGiPj5KTg8BkVjYfu2RmyZjihRFKvd+x/lKRa0PHTo81+YCeCXX9IRV9bXN/jNh1iaMzpDQzdUVY/ldq0XQt5h7NmwAqb5xQ4zOzM8w+CAHYIOJi84XJmzG3i7AJw259TyJ0jMMSVEYEFsiXO7Hw1XYiu9zHqsMPT5vztR4eD1PGg0ZL2JpZsqVfEzOjmLgy7hajeGxuO4EWC+D5zDc/GMGIZMTmIT0QjrKuJf9FY59BN8hNlb26sqKPJMoVr3KxuKlgwCBCWiQxObePgjUTEn26oYtoIM8ExQBDDX3AjfoRDspz3vQrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:03:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:03:43 +0000
Date: Mon, 6 Oct 2025 15:03:38 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Update SRIOV printk macros
Message-ID: <20251006130338.i7e3h5ij4vjfxs2g@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
 <20251005133641.2651-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005133641.2651-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL0P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::9)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: bb28e890-7255-49bf-634b-08de04d8c6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGNLaXNhY3EyeG9VOEluNTZ2M29qazBibGJTaklqc3E1NVRxZUdkQUFTaXdL?=
 =?utf-8?B?Y3RDdEp4T1lDQU5CL3c2M1lSU002QnFDdWpNU3M5S0Q0V3hTb0lZWFU5L081?=
 =?utf-8?B?R0VHalJGNTg1OU1XMmpuSUQ1b0tvN0dTdkJRRTBYNnlSTUFBWlA2eTZ6a0lV?=
 =?utf-8?B?b0lacnNVVHNab2E0QmhXQVBrQXUrTGdVY2tlazhyQ1JqTHFNVmZ6a2liSzdS?=
 =?utf-8?B?Z3YxWFRzcGY4b3JmVzdyLzFMM0hDRVBFeG9Dc0pxelVSOHlzSTI4VUpMZFdT?=
 =?utf-8?B?Mm1RbEdtUm1tdDdvS1dDeGM2UzVTSW16UktwNEpNMERVbmhVbDNVSTdXZkpx?=
 =?utf-8?B?dXpEcTZvaUtFbWM4U2pGY2hSZDJJbDE5elc1TzEwWWx5K1ljVDBJeHhyVlBn?=
 =?utf-8?B?U1E0UVFqcCtseUg2Wi9QOFc4UmNTcTdhWmYvM0Zibk5PNDIxUWtnUTI5OW9V?=
 =?utf-8?B?bnBOR0pvbDJ1UURIOENPTStVbldEN05LUERsZ2d4bS9hbXk1SWJsbnNVU1BQ?=
 =?utf-8?B?NCtQOXpqUEZVOVUrbHJJNDVoYjFlcnpJUm5DYkMrVWhhc045WnhBTGpsdFN3?=
 =?utf-8?B?ZjgyUVk4TEphMEMxYmJyZTZud29rTVc5ZU55NnBSSGtIN3N4OUtubkgyemNo?=
 =?utf-8?B?RnA2bGtpQkhUMVd2RmoyN3hYdUxzcUZpbEpFUWUrUmJkZWdmYVFLZG5Memxo?=
 =?utf-8?B?MTJKTDcybW4rclUycmxlNjU0VXVGSGFKNi9DZEVsN1ZNa3dJU2NoY1hDVGIx?=
 =?utf-8?B?QWoydzdGZmZrQ2ZZMGloNmV2MVhDSnlrNktRQWFDVkJ2Nmhxcm1wQnJOdU0x?=
 =?utf-8?B?U245MWY3aVp5Q0NDR09rQmJNZ1c4cmVqTVFTeXVkNWhOdTBjd1lEZk5WeG1w?=
 =?utf-8?B?RThDNVQ1WlczVHZlOHJ0aGdzbGpIemc2eGVybDBoZkxYeEtUK3hXWjFSNVEz?=
 =?utf-8?B?dWMrYk9yaC9zT1ZUR01MK245K3UzSFNYekV2aExua2FZa21RSldNTHdHYXpD?=
 =?utf-8?B?Um1ObFk0b2FlUU8vZnFSenJNRVBTVm5SS2dzZEVQMS9COHJ2WlNWM3BLYjBB?=
 =?utf-8?B?M1dObjZJY3VET2pOaHJPbndGZnRqdmRjL05oRDFuQ0FrSkU2UWVMdnJudENQ?=
 =?utf-8?B?b2gxSlBkYkxNUGs0dEFYOUd5SUNLOUFSMjR0cUNMTlY2bGVRRnF2UlYwTmVT?=
 =?utf-8?B?YmJsellKU3FxRThoN0czZ1NvNXVBY29sVVVaWEVOVHpzZkNzOTNYRFJNaWdr?=
 =?utf-8?B?MGNwcEtHaVVKVkhSclgwS1FrOTA4MzFFczFVMDgzMnR3UThWckoyam42a0Jp?=
 =?utf-8?B?blFydmlHaytLV3MyM2twWHJJR0Rsc0ZzVmV6c1dnNlJXYysvNE9lM1pSejZT?=
 =?utf-8?B?NkFTeUFDRllwT1NlUnE3Zm15QVJmWUhsMUFKL1Q4RDhJRmhsSWFML1hCclRR?=
 =?utf-8?B?MUwwVVB6UHdYNGJJRzFHWXVqR2F2cytPMklCMDJxL2JjeTh3ZmdHenBPc2NI?=
 =?utf-8?B?YlBkS2hrMUhPdkxGclpTeWw5cStMYXJIQjFicDFRdnpyUFJpSXM4dGZOZzZX?=
 =?utf-8?B?c2lWVGtzVGYrNEMzMHk1Sm0zTXZNRGN6d0R4b2hEU2loRzI4RHFCMzc1d2No?=
 =?utf-8?B?SnJ5WjcrQUxKeTlYMjVacm5mSXRqRXJVeFRtMVQvbnhzc2tZSGlqOUtkenZT?=
 =?utf-8?B?V3MxRllzdVFMcWRHbHNIOHduWU92OXJyMlZjdjEvWEZud3h5dE1kaG91QWVC?=
 =?utf-8?B?TGVrdUY1bkczZFFBb2h0ZU55RHZ4cFRWcE9TcVNpOFVxNWRRd1F6bC84aXRE?=
 =?utf-8?B?UnlGeEhIZXlPNUl4R1A1WkZVZ2ZwYlozQ3YvVWZlUmF4SlQxUi9qc2NQNXk5?=
 =?utf-8?B?cm92YnZoQmdwNkxjZEU2UGZjVTR5V3JiWTVNRE9iWFdYL1I5U3RtME8rZFFH?=
 =?utf-8?Q?VQwegS0Z8aGSnrBdX11EYg7pQzgYeEaq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2sxclBwNzA3aFBzdThqVGkrOFlhOTNvVHBHRWVGSkJkWms1bFBDSkFUdElN?=
 =?utf-8?B?MmN1QklCYTQ4anR0dm9nc25lOGgya1l6bUYyMEg2Tnd1cWlEUDhkVmwxdVl1?=
 =?utf-8?B?a1FUTzRLaExtTEFYQWd1VmVyZFBKR2M5Y011L2xQL3dzSmluNUpEN2hKcmxp?=
 =?utf-8?B?SEh6d2duRGhtUTc3L0V0Wi9XV0FVNlZ4Yll5MUZEaFcxNzJkR1VqdE5XSU5R?=
 =?utf-8?B?dmJrOFRXaXp4M2VxZGZZY0xHanlpWmFBMUJDaG81c1BwQUtyRmlrVWFTM2xu?=
 =?utf-8?B?WEpYcFc1V0tDRFRCT1M1WTJ1bW0wdFYwRWNpOGI4UWp5N0hmQWgrUEwydWor?=
 =?utf-8?B?VjAvSGdHdXV0M29HMmd5dnlJVEVkdkZKM3VvR2RZbVlNUDhUeG9jYmY3OVNJ?=
 =?utf-8?B?OXYvOEY3NDlyQ0xLQ2tuemw0ditOeFFaQnNsNDdZNkdNekVEUlVhaFpoRDJv?=
 =?utf-8?B?ZWwxbjAxZ3B0VXN1cHBDSU5jVzNVVDRRaXNCRGg1cEtnN3BBMHFtWnlPb0lk?=
 =?utf-8?B?Z0JZT253K2JIWXZ4NkI4UWpqdlp5TVNpWWU3a0dLTkdVT3J1cFZGeUVIMzc5?=
 =?utf-8?B?VE5IeFNHeXc0bGxWTXBZVVZkeHk5SWFFZlRqL0RjSHhLTVltYWkwc04zMmor?=
 =?utf-8?B?MzJFdHJjaFVySFJyeVlVTXRQWUtuNWgwTUN0cStDVWlOR0pRUEoyVjlsSTE0?=
 =?utf-8?B?S2VOVUxQdHB5d1RzTnFXbTRYS0NmMDZsVk8vZzU1bmxHMXdBdmNFcllLK0FG?=
 =?utf-8?B?YldBWmVIOGxnNWFJWmlYN0VOZ1IxOTlPbHVKb0VXRkpiWXhOQ1hoSUI3MWxH?=
 =?utf-8?B?ZFpYb2xjN2xiUG1mUnFMMDlsUmpkWFNaM2YwT3ZlRkJsTnZyR2ZXRFkrT3gy?=
 =?utf-8?B?dGVkUWFMNC83YzZaOVdaLzBuQWpiKy9JREtwTm1YeWU1a3lWUG9YK1J1azJ0?=
 =?utf-8?B?VUJRTnFBQU0yQkRVVE5uZWU4cEF4L2ZSaGI4TTF5RFUxY20wUC9tam1malVy?=
 =?utf-8?B?Y3h1WG5xVVlMMG1LZHQ1QkpUNE1PbFhtZEsxc2daakJDZisyRTRRWFVkU0dx?=
 =?utf-8?B?ZVcwdGs2VGRTRE9VbnNoVjJuQVNnQXNBZTNCNjZSdFlEaEpJQXdTa0s4L2k5?=
 =?utf-8?B?Q0srd2N3TDVWZ2l0NGR2M2RvTkZkc0xWRnVJcWZ1ZEM3Zkc0bmluTEpROSt4?=
 =?utf-8?B?cG13aGFxUmY0aVU2UWVzQnZ1cmUrbTZpdmZxWHhGK0ZSWjFNa0hEYU50NWwz?=
 =?utf-8?B?QnNOeFhiQTh3N0NhUzFpL2x0UlF4YlBMSzZBMno5UHptZ2xRMmpkTkxEV1hM?=
 =?utf-8?B?V0tZZXJkUkNOMy84N2I3T200WXYwUlhGYUFNT1BiaGtaVEZHQngzWnI5ZlFC?=
 =?utf-8?B?REFSRW9qZmVsU0JWZThkTWpndnpaUy9iMjE5Q1BWbyt2YktwbUJabDVjeHBQ?=
 =?utf-8?B?ZWMwa1hvMlF5Nm5rVURzdHl1eVVhRWR4WDF5VitYMXRYTkV0eWxPMnQ3RDM5?=
 =?utf-8?B?WDBxR3ZKbVB5UCtZeVNIY0p1MHhjdk5PZnFCdUp4Mi9ZallkNDU1OTJJWG5X?=
 =?utf-8?B?UGZGdGlNUnVyazBXU3AvQWVQeHRyQ2dCcTFzaVQ2VFJUS0owQjRiVnY5NzBC?=
 =?utf-8?B?UjdDMFlKU09nMnJGR3VrN05zSGFHUEZpV2ExZkRJL3NWb1JLWjFwdUMzTk16?=
 =?utf-8?B?REw2SmQzNy82NDBHQW5rR0ptZnNQdC83OXNhTVQyMDJQTHBGYXQxTi91ZEZx?=
 =?utf-8?B?Vk1RbzhHRGY4ZDRpMk4yZG5yNEovNnZDNGpISENOcmRwS01nUWVyUlV4TXV3?=
 =?utf-8?B?MDJ3eWhMTFBuUy90ekliTlVQOWNQUlJaQ2ZPRkYxQW5tMGZsZi9WenZWNDFO?=
 =?utf-8?B?OEtWNkxsdjlWcFQxb1JPNXVibERzSmViQ1UzNjh1UmwyQXlDMVRkeC9HNStB?=
 =?utf-8?B?Rk9wVWMzdHprd2FHUG1jZE5mV3JrLzNEVTF2a2owYlRoaTNPOHFuMTg1YW02?=
 =?utf-8?B?VldDT3hBanJIbGZRZVZXTHJVZXNpT3BxRVBTQkRDMzBvWXZETnZIb3k3V0pV?=
 =?utf-8?B?RlFQcm9VNzlvTzdrbjZxV2xsYnpPTHR1TEh1a3lJTVdxMzdqeE9hVDk0Wm5L?=
 =?utf-8?B?YjI3dDZzZXhpRVJBQzBMS2lOaURrMjlMNGFDci9GTFJrMkpLN05saFZYS1ll?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb28e890-7255-49bf-634b-08de04d8c6f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:03:43.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KZfyMInECuBKKU/qgfKNClXIvmCdf/k5a4fLvLG1YFdHOBrlN5qI9m/q2BMC2Nj9Glhl4w5HVaYBzBeBcbnEAPxZnuSfE6HzLrDYL+Oq+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-paź-05 15:36:37 +0200]:
> Recently we introduced xe-based printk macros, use them instead
> of plain drm-based ones.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_printk.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
> index 117e1d541692..4c6b5c3d2190 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_printk.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
> @@ -1,22 +1,22 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>   */
>  
>  #ifndef _XE_SRIOV_PRINTK_H_
>  #define _XE_SRIOV_PRINTK_H_
>  
> -#include <drm/drm_print.h>
> -
> -#include "xe_device_types.h"
> -#include "xe_sriov_types.h"
> +#include "xe_printk.h"
>  
>  #define xe_sriov_printk_prefix(xe) \
>  	((xe)->sriov.__mode == XE_SRIOV_MODE_PF ? "PF: " : \
>  	 (xe)->sriov.__mode == XE_SRIOV_MODE_VF ? "VF: " : "")
>  
> +#define __XE_SRIOV_PRINTK_FMT(_xe, _fmt, _args...)	\
> +	"%s" _fmt, xe_sriov_printk_prefix(_xe), ##_args
> +
>  #define xe_sriov_printk(xe, _level, fmt, ...) \
> -	drm_##_level(&(xe)->drm, "%s" fmt, xe_sriov_printk_prefix(xe), ##__VA_ARGS__)
> +	xe_##_level((xe), __XE_SRIOV_PRINTK_FMT((xe), fmt, ##__VA_ARGS__))
>  
>  #define xe_sriov_err(xe, fmt, ...) \
>  	xe_sriov_printk((xe), err, fmt, ##__VA_ARGS__)


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
