Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8763CCCD19F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 00:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330810E2B5;
	Tue, 21 Oct 2025 00:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpHM9NcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520F10E2B5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761004991; x=1792540991;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=PEwos7Vn/HDO241Coae8mrN8VZS98pibaJOWqkuPJDU=;
 b=mpHM9NcETZHbmZicIWEbfW7LEbYKATNw8LVAjQICtQwSp3uMm8H9yC13
 Sh1RQVsHxOVNXqmscV3D9kdeCUOFBKlLaXOO0UUg/Jo7alpTh6AynsSaE
 n+w12EcLExa2ZlW7vKV4PwoLsYtHzhLpzF8iVkPq06/82u5wP7CYDVXA0
 +tEeJ8z4r57pmlEP12T1xeCxvXPqwj0IquCiWXl2HVMahQ4R9nABvlsv7
 n8jTX1cfCoIxafxhnu1QWgB2ECGDMpg5nufWxrOUrOejQDTNqVv8hfV/H
 gv9HpvGxYvi0srnrDr2JcaxkIbtdyDfEZ5oNeHrU93rv3G/XVlrgw6iEM g==;
X-CSE-ConnectionGUID: RudFmm3iSpCyj7yHcjPWJw==
X-CSE-MsgGUID: L2fmEw7dQCmpQwYnvKsHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66767159"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="66767159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:57:54 -0700
X-CSE-ConnectionGUID: AN4MsRsXS7eYLB6KzOQ93w==
X-CSE-MsgGUID: twJmiEgTRU2XECs6zi3TgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="207131644"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:57:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:57:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:57:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRrbYZfZLJZ1zA+sNr61S8jJkiPbItMF1hM31q+gvvRJdYgHyDcXSypqMbomM7lp8PtJ4J7a/t3PB3NGaOCBz1rQ34DV/iz41ooaniJY5oriXB4G83FEPB/3Aricdf/aF/wS8JTmeYJKnFogxriHJqKFYP+xchvikcUWOKLN5dEDGliIIa3kNCwdMlBwdIOTjV+Wzf/9TcW6YFERSUMjwXJ+Y1OcVPD4sRSlLBR2Z0DTrnIWrvinq9ciLb1lAq/HbMYYuf6SUT5272oQYX6XQOQBi2tVunxOBZafbX3ezzy1DYyQ+A5m9MM2HKZvK6UC+lEkxjWmARh3G18fVONK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rahBVWadKMfVYkQfNqhv/vNb4XMxm4OsV4pify1BpIQ=;
 b=R9pr2AM5NZdaxSU4mfIydBQquAIN2KrQSowg7FYOjFVFU0qy85OSFpkVvk8yHCfxxAtsMmILieVLkjzWU6sTZfzabPKZkjuLC+HeyJWy7kXuHDCwgUqHYcFD4g/8uU9c8VTDADCqhhZVW8rUXLxEpAjfY6OpQq+ywxwslaRUTCWhqh/2VDa7H5E53eWybDawTjnvR6TWlncnpvTeUdo5/Z975kAHRh10/vKR7sbqomaAgaQhUddEQ25jmYE6tu6ZW55tQdBX2BpKws9urnPmnLo8AvH7eOs+pUJquhfBQ6qXRLWm/jTMDYTm5+E3SW5hHKL4p3ZX37vZi0yFvLr2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:57:49 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:57:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-1-27b03971bc7e@intel.com>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
 <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-1-27b03971bc7e@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/tests/pci: Convert GT count check to
 general device check
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Oct 2025 20:57:44 -0300
Message-ID: <176100466430.3231.16362806979991981230@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: e16ea78a-86fe-4ac8-ae02-08de10347976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anVRQXF5ZXBoM1cvU2ZCdlphdVIwSDVVRnJHOEY1NUtYYmxLRTJzS3FQeFg5?=
 =?utf-8?B?aTRxaStrTFd4T3lpTkpxZlUyb0dLTUEzRkZyMC9pNzcrZWFKdk9UcnpXdDNW?=
 =?utf-8?B?MXRvTmJ1eGJ3RkVxcVdmWjBuU0FvRUtVWVh4MFVvWE5sWWVudGJIOVhVOU5v?=
 =?utf-8?B?YnU1Q3VZRkJjMTJPRm5JRitodC9ob2xMT2tkR3MyTlBzRkZHRUFvTjFpUjY1?=
 =?utf-8?B?YWJ3WGRrNHo1ODVYTXF6ZXk0a0QzWWdtaXNHY1FFY0xLVGFpUm5kTitCZ1B6?=
 =?utf-8?B?MkZHM1N3WkhMZ3NTSEVUSlAycEQ1SlpTN3cxZGdJUEpWY3ozVjdUVFVJUTg3?=
 =?utf-8?B?Nk9PZVlxOTBwT0d0R0VKT2JWNk8zZzdBSXFaT1d0Tm5CWTFKN2ZrcmdURmY2?=
 =?utf-8?B?SDAzZmpNYUhpOVcwZ1llaURtRUhCTTE5U2hwcUhQeHdvb3R0Q212ak94Rmdo?=
 =?utf-8?B?VHN0VkRtV3MxVzEva0RCaGJxelVhR1I2OUZDWlRjVzlHVzBsbWRSeXVCVWYw?=
 =?utf-8?B?TFMrZVdPV3AvM0VnaHRWNCtJRkFzMDFnY3krd05idXZ0RVRxQitrUjk3THV4?=
 =?utf-8?B?anM2aWIxTVI1ZTU3amhmS0NvRlJnTXU4anFrSWhVN294eHVxaTVaYjY2L291?=
 =?utf-8?B?bDFSY3ZpamNvc3dsTDlUZm05NU1HU1VheXpZZGhxRUpHaUt4U21ydGk1WERw?=
 =?utf-8?B?Q0R2RTNyVEkxaWNPVmhPbmRWR0RLcGFPdDhHNTNrakRkM1ZGeTk4dmk3R2R4?=
 =?utf-8?B?SnROanh6eWVCaFdHTXZjMVFtcDcxclZvNy9RUDRpS3JGVDArWkc4Yk5Qdm1K?=
 =?utf-8?B?ZFZ6RDVXcyt6ZU9KZUV0Q2tKbFJGS2I0dERjdXU0OGxhQ0ZyNGlsVHZpb2ZE?=
 =?utf-8?B?VDk3LzBrdGpLOVBTSjFEMHF2QzljSmJYRTRlK05BUDZhQVYzd0dRZ0daMGR3?=
 =?utf-8?B?cU9MVWFnOXFiRmV6Nyt2dFpJSlVBMXYwQ2RIUUU5UWRhZHJ2bGxTS2NKVSt6?=
 =?utf-8?B?cTh5Vmo3djJEeXBCRFhsU01uQ25OS0UzKzBNbStaK1hwaURySkdCSFM5WHdq?=
 =?utf-8?B?WnphemRWdFdaY0FYU1MzOStERWRIQTRxOVBLNHRFdi92cVFEdWk0UStqOC82?=
 =?utf-8?B?R1plLzB4QlF0VEhSY3BNb092QmtUVWR6Rkc4eWtacHYyTGdMOGVhY3A1ZDM2?=
 =?utf-8?B?UFBuQldRSVJKQzdkdWJUckVvQkN1OUFOTy9kTUdsTjZCZFRXczVlRy9tODRt?=
 =?utf-8?B?NVVEME1RVFBpV0xLZTFJVUo1aTlveDF4RUpVVVYzTWkrWUNEeEVFejNxNDQz?=
 =?utf-8?B?eXhXcUlUZWFTdm5JdmI1bjl0ZnJnbHg5L1FyUm9POFErdEl4eHZsSTd6MXdS?=
 =?utf-8?B?aG40OU12VHl1SUNXcG9aM1gwRHdzU3Y1V1JVQkNQbXdwTjlzRW9sekZsMU1W?=
 =?utf-8?B?d3Q2UUdIZzRSbnhSWUcwajJLbnhTeHY2N3Q3cWpVMlo5eTVCOWtYZG54dzlZ?=
 =?utf-8?B?TWZJMzVYR2lqV0pwRURUS2Jma3VmT0Y4bGRpNUFhNVE4bUtIYUdISFVYYUpX?=
 =?utf-8?B?Q2lKOVA4N2FrcGl5RE51aEM0czczMW9nWmRDbUljQWRjd0tNQmhFY1FLVWJX?=
 =?utf-8?B?Y3MxOUFGckZYRHRNaWFzNUZBOEwzbFQ0MFRJckV6NmZjN3ZHSlVtSVhZODdi?=
 =?utf-8?B?R0w1Z21rR25ZUWZTbko3dW8zVndqazFUc25xS2RGZ1gzYnBJVjFzcUlhUHZj?=
 =?utf-8?B?NXBDd2FhcWVCa2JITTdDNWd2M0k4NjJueEpLUzU1cFFybmtLVzBSMUVrUjlN?=
 =?utf-8?B?blJNbkx0NFRpVDRLMWpsRXdCNndyV2FQdUxhbDNtQ0dEL0RSYkdZcTZTeWNi?=
 =?utf-8?B?S0lobDlodWhXV0ZrdUJkWVZ1a05iL0QyTDdIOGo2V3ZWVkJhK1FPc2xRMk4y?=
 =?utf-8?Q?52Moy7VQAKFmMuDfSd8AeBPgqIpmyh1j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0IzRFlENW9qcW9CRWhjWU1NN3FKNVE5dzRVc3djUm10TGkwYkJSSVIxaUlS?=
 =?utf-8?B?TFNDRUFsRUJvbElQang5M3lhUnBrd04yblRuTTY5bTBHSW1QKzlJTXMxMWRQ?=
 =?utf-8?B?bXJ2elcySDZKelR1WTI5RHBnZXpQOEFxWmtieWJTcElXbm9lT21wRkhWck9a?=
 =?utf-8?B?S0FIcmZsTG1UV1M5M1VLRmNjb1NFRGtRdWlyeEdHZWZhRHczYWtUaVZ4Mmsx?=
 =?utf-8?B?L0RUam10MGd2bGlDNWpjSStzRGdMeXRCSnNPbkZBdnRqOW1JK1dWVkhCSkZh?=
 =?utf-8?B?Q3c5M3JlZWUyWE5qMjYybmtSMVJHbnF2c2JiWHd0UjgwY0N6ZXBmQUl3L2VL?=
 =?utf-8?B?Uk5udVR0TmRWOW4rM0pwYWZBUERKaE1WUkVDTlI0RUJQQ2hzTkhaSktiZ1ZX?=
 =?utf-8?B?dU5SZ1FtMDdDTUpSZCtvWGo2ODVVSnlnSlE0SCtBQ1BaR3dFUEE2MFNQOGM4?=
 =?utf-8?B?STAyYWpPNk82NGFHVThXR3ZDeVR4eGE2Um9POHNRd25WeGVYdSt0TnJSYm0r?=
 =?utf-8?B?aURxOWlFVzg0OWdtcjR2WXlkeENKRDduNnptdXJMM2JIWmZma2dGdE85K3NC?=
 =?utf-8?B?ckE4dnF3eXVtVjRCYmhkNlk1UmRCeGlsMi82YXl2Mk1rM1EwcnE0QjBnZ3RN?=
 =?utf-8?B?MmhFNHVKeTVLbjdST2NKc3F5ckc0aVoyQnJ5VXlNMjZVdU5DMjA3bHo3WEJK?=
 =?utf-8?B?aURrbmxIeDFRRW9mS01lRXBVUGNUemhUYldadXQzZEdvdlVSNWNFSFJVQWNI?=
 =?utf-8?B?aDdTRVBKSGJUWjFmazQ2Rit2R0txWmk1RjBmc1pZS2pqQW55MXJkRzJ3K09P?=
 =?utf-8?B?TmQzVjl2WFp3VUg1dE8wQ3ZuTnFGRk82RHZuT1NtQ1dDR09yMzNlVVU2Q055?=
 =?utf-8?B?NlVBWWdhS3VuZklHbGZSOFE2VnNJYkZtUlVJUnQzdjhHejZpZlJQaUZmaC85?=
 =?utf-8?B?a2RpWUl5MFFkQklLbFlYOVBZNElGbUNYR3hEZHJwUWI3UG9rUHkwdk5mQUZu?=
 =?utf-8?B?WWsxeDkzY1dvOGlyS2lCQlVSSnRFbXB1MDlocC9ESlBJSHlMZnFnTDM4V2hC?=
 =?utf-8?B?NW54Z0c1UkZvT3pYNEplK0p0MUcrbnJ5VUVYc1Q3eVR5RE12VytkSldOYkZj?=
 =?utf-8?B?V0VWRG0xcWhJalFGdHI3bDI4WHZJSE1HaEQyd0t3d2R6Z0Zzcit3TDVwYkto?=
 =?utf-8?B?TS9XWUVqUHVGeWtFZDRxNUU3TGZUdDFSbys3Zndoc0FyazloT3VGT1duS3Fx?=
 =?utf-8?B?aTdwWEJqTmpGVFpnWkUrSGtURjNja1k1WkZlWWdhQm00emhQNHpES05aT3JM?=
 =?utf-8?B?ZGxBeU45TUYyMlVlTUFJNHZLNGF3V3d3N3NCUlY0OUh0S1NIeGpQUDk3cFpa?=
 =?utf-8?B?R3pTL1VWKzVKbGg4Y2psQythWE9TUTcveUtzTmZhSjJsREtNNU9sbnJxc2xH?=
 =?utf-8?B?c3FISFFPdW5FWUFNWGlmUWlGT0xOQ3FEM3FUNHVkT2VhY2lwc0d2bGlLZVUy?=
 =?utf-8?B?S2JpM1JhV0xYcmdQamlDODZ3MjVjc3k1UXkrSmk0VDJ1ejZYRThHdnloa2ZE?=
 =?utf-8?B?Q1BNaXEwT29ZUzZudjgyelZ1YVBjRXRUMzJybm9HMERvTjUxbktPVlVWaFFB?=
 =?utf-8?B?cUxDMC9YdytBZU5JZTR4UnJscWxiZ2RPSGt6Z2tyUXNZZXhJYU85S2xUblk2?=
 =?utf-8?B?TGlad21RYkFKZ0Vzb0tPMHRRL2N3ajJTeFhnYk9zR0pQVTBWVnEvdDJoYk0z?=
 =?utf-8?B?ZEJvQ2JJWkh3RzAwVisvZ1RwUlRnMHNqWXRZZm9oRDhPRG9ScTNkN20yanBv?=
 =?utf-8?B?VHhoK0Y0WmJvTk1YZHdwR0lQTVdsNCthVjBvVFVjODdmUW9wWnpqSUl0MFor?=
 =?utf-8?B?bHVVa3RYc2ZsVXcxS2ZEb3hmR1QyOXZzOU92RE52c0w1QzBRMXEvRkRtTGg3?=
 =?utf-8?B?N2k3OGdmZ0IyM3dJZlZhRFM5eGh6ZWxnWXJjTVlWSGl1N2k1b0xBcUpMSEha?=
 =?utf-8?B?VmdWNlJmZnpBK3pDYXZQcjV3dndrME9xaXRqdi9GQWk5U0ZpUkhRTGo1dnI5?=
 =?utf-8?B?NzV5am5nQ25kaFJsY3NVajl4VUY2dTJOTEE2clpJeDdQWExHVUxOTC9YUEpN?=
 =?utf-8?B?SmxvTHcrVlZjODRYbEZ1TVppdnc5ZVBTejZDQW1hcmplOWF2dGFDYm8xK2tv?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e16ea78a-86fe-4ac8-ae02-08de10347976
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:57:49.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TthP12McTWVDY30gjNoHEiiKRJaxYsu+ssBd//gP+INpUGlKX7kqLUT4Fe/lQgMAtf0CqVvPScu5xsGcTXJo4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

Quoting Gustavo Sousa (2025-10-20 20:45:56-03:00)
>We already have check_graphics_ip() and check_media_ip() as general
>functions to check the IP descriptors.  The check in
>check_platform_gt_count() is simple enough such that we can convert the
>function to a more general device check.  In an upcoming change, we will
>also add some checks for other members of struct xe_device_desc. As
>such, rename check_platform_gt_count() to check_platform_desc().
>
>While at it, use inline (unsigned int) casting of max_gt_per_tile to
>keep checks for each member localized; and use KUNIT_EXPECT_*() variants
>of the macros to allow multiple issues to be reported.
>
>v2:
>  - Use (int) instead of (unsigned int) casting. (Michal)

Whoops. It's actually the other way around.  I'll fix it when applying.

>  - Use KUNIT_EXPECT_*() instead of UNIT_ASSERT_*() macros. (Michal)
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci_test.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/t=
ests/xe_pci_test.c
>index 37b344df2dc3..4ba2fb93c9de 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>@@ -44,21 +44,20 @@ static void check_media_ip(struct kunit *test)
>         KUNIT_ASSERT_EQ(test, mask, 0);
> }
>=20
>-static void check_platform_gt_count(struct kunit *test)
>+static void check_platform_desc(struct kunit *test)
> {
>         const struct pci_device_id *pci =3D test->param_value;
>         const struct xe_device_desc *desc =3D
>                 (const struct xe_device_desc *)pci->driver_data;
>-        int max_gt =3D desc->max_gt_per_tile;
>=20
>-        KUNIT_ASSERT_GT(test, max_gt, 0);
>-        KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
>+        KUNIT_EXPECT_GT(test, (unsigned int)desc->max_gt_per_tile, 0);
>+        KUNIT_EXPECT_LE(test, (unsigned int)desc->max_gt_per_tile, XE_MAX=
_GT_PER_TILE);
> }
>=20
> static struct kunit_case xe_pci_tests[] =3D {
>         KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param)=
,
>         KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
>-        KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
>+        KUNIT_CASE_PARAM(check_platform_desc, xe_pci_id_gen_param),
>         {}
> };
>=20
>
>--=20
>2.51.0
>
