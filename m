Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF87EE6B48
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 19:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E644810E8DB;
	Fri,  6 Feb 2026 19:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/SKUsyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643410E8DF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770404663; x=1801940663;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YnOsme8buUKfh6BKwivPHhWITD/SwXVYEYVg6BLF9bU=;
 b=i/SKUsyGNqGudWC79WeLh7g+xuGmxxIXOkZx3aYjgR+d2JPPualc5yof
 hhPdqbdMtYJUaKTxUJc7FdxGndJKveThWCrKXis1V1Zduh98IfXD6UelK
 k9qnh92uNjd1/ksN+2AbZPuqcc2fYR+hEAB91ygGkaUNmWnjPxy9rl/tn
 ICS13p0J0cmsduTfn7NzNG8h+DTOtqRcU9YNkLqT2Kveisg4D1O8+rShC
 k9cv1i7ye+dWUVqsF4LNpYfqte3ERr/wbWKG3iipWWOTitXD7y+NcI9BD
 gEDpIpZopP3H9fj6Vnw7vwv09knf6n7Mysnhq8KgU40OucTlYh24+vfWW w==;
X-CSE-ConnectionGUID: jkMAOYvfQPmbVdJMgwmuYQ==
X-CSE-MsgGUID: 8Ni7I76iQ9SHy4spIsvMHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82987014"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="82987014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:04:23 -0800
X-CSE-ConnectionGUID: vbRDlgOEQLeNkXFaJ1A6KA==
X-CSE-MsgGUID: WxkN4an9TGmhnb+4SVyGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="248573498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:04:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:04:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 11:04:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:04:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLCUf9ONxaR3wVME11OciXx0y100iKuWmYHxNsTonLd7ooBA8j1fNCz35pUKHxHklqJ7pCnqE968DlAgVBAejmUZqcWpyjB2k1hiIsltMN6cTCyywnQ9W07Tuckq7MfqxH5EBW6RuoCleLCXXBH0GQ9/VL+UvkD5M0kPsSsLJf4H1uzvCGJvW+Jbc2R67v1og9XT7i+D3E2O79c9pW6MaiY7pnhSt9l4LL468N++Upg2eYLG0Gg7x0WlLBec+E/i4pUjjY1xfd4M2C1k/bxaf08lppsQkiRDxtJSu07I/uq0zXO50YhNZ5Pg9OwdglHnXft18QdnfEAom1tAnruAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbS8uZmWERkUHDDUvPLY8bvjOEyt86dYn8kvdTZgAXo=;
 b=h23lGWserxI/7Zokao6TIzRtp5dgMKMovKqAgY3mifJmJcKi4YhO24MAj96JvsqzwRIPSuJvwAPwlvlq62vKuYv2hgkB5NVrmHXYI/0gtGheXx+1nq0fHRNQf+ypqs/0U8uxuTi9eNzrHmeyxvNs5/be4fC6iRlozNwaG7JsNbHMs1UglVscQYmsxZTNLbJhzOolHekACnXkRFvhmO80jFcwuNGmIR8M6Ai4lg3K/+w3hRhdAmsfnTdqTO4o3IT7g5fUXvWM8Sm+Cb5bBx/gzLsmw1JzHEmBC8P0qEgitrcdkENM4PD7mooPXl5wcabxFDx2S2FrIi1Euxd5QMbSUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SN7PR11MB7440.namprd11.prod.outlook.com (2603:10b6:806:340::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 19:04:20 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 19:04:20 +0000
Message-ID: <a460ef76-c5fb-440c-a297-7c42c9b624ad@intel.com>
Date: Fri, 6 Feb 2026 11:04:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-6-julia.filipchuk@intel.com>
 <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
 <6aefe580-a66f-425f-a61d-fe7113b5213a@intel.com>
 <9a5568c3-9ff2-433e-93e1-c4387539f2cf@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <9a5568c3-9ff2-433e-93e1-c4387539f2cf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SN7PR11MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e002d2e-bf36-4f46-7fd8-08de65b28838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVDbmRkcXFQQjczcUFkL2R0aEpIZUY4cEJUNU1WeDU4ME1PWUlxWUg2dS80?=
 =?utf-8?B?cHBxMndIYjlya2NMYm0vUUN6aVZJN25XcEhIcG5PSk5CdkZYdEpuaWNWSjBE?=
 =?utf-8?B?empQWlVvYXpMVGNjN1dMRGVvS2pYNElNc3FuZXdyUGhTY3VpNHp5UWh6ME5Z?=
 =?utf-8?B?VWRGTytYZlNGUUtPWGlWc0dTYUxJNW9DNk05OVRRTVdRSEVRNmg5d2xTRitW?=
 =?utf-8?B?NXJ3ZXN3NjdIT0c5T1Iyb25qUk9IZFJsSHpEQWt3cnhnSElFS01qN0RZWFFl?=
 =?utf-8?B?K21HcnZNalBHc0Qya0hnUjdnR2xEb3FyaHA4VjExRmpoWitESEhOZUd1UTc0?=
 =?utf-8?B?Wmp3aTk1KzFtaTZERUJvNXdsZ2YvdzROWUpGY3Q1SEZSN1NQbHR4ai8yY0h6?=
 =?utf-8?B?VmQyQVRzMlJ0a3JvUi8yQXFnc1c5ajAvcGhVNlE2QXBpV28vMmtJYWVqQnVp?=
 =?utf-8?B?UmVvNGp2czdjdEd0UlZwdVhiVERqQkNpNmNvZk5KbGJFMWtqckl2SkpQWnRJ?=
 =?utf-8?B?SDJTVTdBY0psQjhLV0lYWHNSc1V3eDFlNGQrdWRlcXdndk9RWDJOdTQyYTZa?=
 =?utf-8?B?ZlBCMVZCTXVBZjI3N0w3TUVYWVlZYWhzdllCVXdRWUIwRWVDRXFRU2x0bGZF?=
 =?utf-8?B?eHBBamp4OXIzY200UHloTGdkMnpXakRLNGp2MGg1R0ZKd2hHNkVkMTNyU2Y4?=
 =?utf-8?B?dDJJMFhyZmcyQkFlNzJKYlZXcHBGL2RLSlVQa0RqS0dCKy8xL2xJaGhnM2hH?=
 =?utf-8?B?WnJGaGh0ejhmLy9PWkFlZDJJbm93Z3BYWTVYUExXZGdoZ3JjYmViRnhDUU1B?=
 =?utf-8?B?NzFGSXZwSVZVUHYrTUliUld4Vi9lMG5vTGwybEx4ZDM2TDZvWEdnaXpTUHFo?=
 =?utf-8?B?Ry85NWR0N0JpOWgzMzd1cCttZW02bXE2WkdsSkt6cmYxeFcvWlNQRUY0R2RB?=
 =?utf-8?B?VmQvRzVuVy9MU1FzUTZ5Z3JQcXp5c095cEZ5dTRvdFp3T0hOK3hMdmNsUVh2?=
 =?utf-8?B?RkthZ0ZwWTVidk1qd3d4cGMrTXJkRVdyeVpnV3pJNDgvL2lZa3NWUlV3TzVK?=
 =?utf-8?B?T2Y3T1FqSEd1dTdpdDVvTjZjNENVdjZXUlBPMXR3UnJnTTZZTGFFa0wvZXVQ?=
 =?utf-8?B?MHd6Y3Jjb1ZxcEdMOWN6TmxVeHF4MU5jM05DVlBVTUhzWU54eHFJbzIzdzkz?=
 =?utf-8?B?ZGdsUHJrMndSbDZycXhIdmc4dWNWRjEyU01hZHJZLzdZZ25lU1IraG8vQ242?=
 =?utf-8?B?WUNJQnpmN0pxOWFnckhpc2R3ejFQUDhtMFJ3SVBGWk5RUHoyM3BTMkx5TkNy?=
 =?utf-8?B?aVZnR2grczA3SWRyOG42NDlzM0c2cVF5OWkvS2Eya3RRVGVPVWlxak0xVFhu?=
 =?utf-8?B?M0VaTGZaK0NWMEJsUDFxTFRiS1NoeXdyTGI5djVmMVR4QUZwMmtTUTk5ZGF1?=
 =?utf-8?B?aFZEbW44c0NNQXZEL2RFdGJJNHpnaVpJbVNEYzlkODZOTXlPYU90ZTdqU0pM?=
 =?utf-8?B?NFFMZTkzZmcrOFlDZXR6d0hMYXRSeHpZZlpoL0hNM3JQRVNUZDNJM2J6MGdr?=
 =?utf-8?B?SGRsUkV2RnlaVXE1VENEbTQxakNZZ1E2dUhKdldTRUhoS0xBTU92UVJmOFhN?=
 =?utf-8?B?ZkNPdTFreUpoTk81Zlo3QjFRZTNBZXZla0UrSXJqbUN6T3RhQ1JmNXBrQ21B?=
 =?utf-8?B?SnAzcyt3OU9ZUUtsSDJZMTBUQlArYUUxWXNzQ0ZiM0o4UUJ5Nkx6UC90Tnlv?=
 =?utf-8?B?c0ZmbnlmcDNQTmV1WUR2Zk5nSjlXZXhob1A5eVlHQUJYUmRlcFlxbVFNYUtT?=
 =?utf-8?B?c3FSSUFCQkNrZk9CL0k3UmM5dUw5S2Z6TkwzSGhZUjU3bHNYTURpTUtQdXp0?=
 =?utf-8?B?MFJFUndzU0FYQ01CNGpINkF6d1BxVU9WcXQ1QWprNEl1a3NjN242QzRaMTNv?=
 =?utf-8?B?V09NQ2RPR1MyZzBUN3hHYWlHQkttQ2g0TUswOXRGNmt0WlNxcWNNWk9iWHhO?=
 =?utf-8?B?OGJKTXV6Y0R1TzRPaXZhbzZyYldUcy84RGJzWmZZQUp5d2h3OEZFcExDYm5W?=
 =?utf-8?B?Z1ExNmRhaFQyckMwSlJFaGR5RmlxdTViVGZJRTBwbmlucCszODUyOXJBc2Fz?=
 =?utf-8?Q?geQo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djN5SzNKVk5HSUhFQThwWjdJWVQ0dk8xWTM1RTJTd3R4Vy80dkxKb2tKR0VE?=
 =?utf-8?B?eHc1c3hYRTV0Qy9NUUNhSld2cGY5TTh0NWxMWldaUWdSZE9sdmF0R1Vzbmtv?=
 =?utf-8?B?bHBMMGpqeFhnb3RvbUsvVE91MkQ5NitvTnphL2xnOVBlV3dZblFCS2N6SHpx?=
 =?utf-8?B?WG9GeFdzNEZ1cFl3T3R1TFZuZHl0N2xXa1d6V3E3QzV1d2V4ZHRrckxDT3dw?=
 =?utf-8?B?RU1Dck8yODArOGw3NGpEQ052NUZNWnNvVE9TMnhvRWdRYkhLNUtKYm5JSWRY?=
 =?utf-8?B?SitwWGtRMzBuVHY5aklhWlN4akxsRU9oTlFtTU9nUkl4bkJIN2JFU3JsNW04?=
 =?utf-8?B?M3hzMmE1MWJoalJubHZuSGo2a0pTWWFqb01YaW4vQzJ2R3BXUDNxeDhJUHZM?=
 =?utf-8?B?WG14UURzZEY2dDZEeWhKcjRTR3kxZTFzQXdjS3ZLZkw5MEFRcjMwamVoVXZ2?=
 =?utf-8?B?cW9yeDZEREtZaFZlQ2xTSUlBRXdsRjdpUXBVeHB5YkUrcjZaa3k5RmZlU0hm?=
 =?utf-8?B?SU1GNlRIWERyVW5UbXFnM3pFTUxvTDVncG44Yyt1ZW1FN21kcVBtaW5UNWVN?=
 =?utf-8?B?VHE3YlhvcytUMm1wemNhMHY5bWtaK1hYU2FTWDlQNk9JSmZya09CdVg0YllV?=
 =?utf-8?B?QTlnUEtEbmhZQ1B2cU9UZTRIbWk1T2NsWVdEbVgzdy80ejVXR1VNeUMwWitJ?=
 =?utf-8?B?L3htejFiOHI5Ym9tMmxPemp0NXBtT3NaVjRPdUdRNlR5M1ZpZ2ltcGZlc2hP?=
 =?utf-8?B?R1pZRlhaZWxhRVdFSWFGVDh4VWFWT3g1MlZVckFKcjJPOGZ5QUZNVndOVm1k?=
 =?utf-8?B?T1N6WHE5QTJQdlJpWG5BcnQ0MkpIbTQybHhVZTRyVmE4U0xhLzYyYlBEMVVR?=
 =?utf-8?B?Q2hxM3B4bVZ4ZEQ3VTU0eHBER2xUbmR5cEJQeEk2UStsL1Z5MmVoWFJYVi8w?=
 =?utf-8?B?bEVQL1JsWE40TWhYTWwxc2dnQWJudU01aXNnQ0Z2MG94aWlkaE54ZFBudnk3?=
 =?utf-8?B?NC8wYnpRcVRVYkRSakJvWFgwUTg3dGR4OWI5TlUrbUlwRzVrZVY0YTlSbVRy?=
 =?utf-8?B?d24wWk53TFRWRjVHdlYxdDFnVFhwOFNNU2M1QkF0T1lNQ1lPdGtQM3UzT0VP?=
 =?utf-8?B?ZUgwYjlMT2NRNStoUHB5U2N2dEdxMk5HenJjWnEreE1kQi82SEtsOUtJNFcz?=
 =?utf-8?B?L0tOMXNMYkJ0TnV4Qmd6ZkkvTFI4ekZKbUpzbUhHamhUM2FPQXJ1L2V6NTlv?=
 =?utf-8?B?NThWeHZDcTBoUnQ1ZExDTFNtb21QaGlRbCs2SjFYVXJScjNUVWdxRFNjTTdt?=
 =?utf-8?B?UUVCT3RNZUhablIreTFGSzlDbHFJaGxvZkxCNUE5TDRvRnVGOStRcHNSV0tI?=
 =?utf-8?B?K0VUYWNZYnJXVTdsZDR3QllqR3JKc2duUHprK2JWdEk5ZmU2c2M5bkVvZU5q?=
 =?utf-8?B?bkFFSFJxT0ZiUldBTHBWZDVSaEJ1V3V5RWpmZjBETmpobDhQREl6d2VBbDF2?=
 =?utf-8?B?eUZlN3BQdnZXZkhpNktYTlVDd2w4aXo4THVPbWROSCt6QXJTWGlNdE9MYjRU?=
 =?utf-8?B?czRhUTM1ZWI2M1VQaHptdXZyOXBOMUFWc3FtMys4aVhDdjFiNFBlYnRJRzNZ?=
 =?utf-8?B?L1pEN3gwdnovcUNwK3Z2RCtMYTA2TUdCcUFHbFV6TmxuWXdPb2VrN3dybXVC?=
 =?utf-8?B?VDArcFJGVnV1bUIwZFUvQjhUQWxCR21Ca2V5YnErT0NuUzl1ZlJZeSt6ZDJ6?=
 =?utf-8?B?ZWpqb0FlNXZ1a2tVUzhYNkVxdGR3eUxkbE1mL25qZVk2RHlwNzNVbUlISzh1?=
 =?utf-8?B?bnB0c0FxVFJPQk1vaHo4NC9LdDRUNDhieXBCRXgvKytzdW1QcFB1bWtwcXQ0?=
 =?utf-8?B?ekJ6WDZXNHFLWU1jR1l4RXhJa0ZSK2JGZUdaemQycklQUzRHRytoSmd0NzZM?=
 =?utf-8?B?QkY0eFpMRlhZdmFQRXc5ank5cFljL0l5TC83NURVK1hmSTZvczhielNkemM1?=
 =?utf-8?B?WXUxK21pYVNRSEhjM2lKZGs2Zlp1ZUl4NTRFTnpwQ3BlcVBTQnpTVi83Q0Ex?=
 =?utf-8?B?U1hZWkpwRVBpUXJtekovQTBKQ1hkUmNBNkg0a0N2OEF3eVl3bTYyZFFjcGhG?=
 =?utf-8?B?OXJhN1FDUnFNMktjTTN1WjcxOHpNVWs3RjRhOGY0bExJenBYSWxFa0ZMUmV3?=
 =?utf-8?B?b2ZIZTJ5anBIV3UxM1ZwT1FOWWRHZTcvczVWNmtRR042T1dqc2pyYkVKa2J5?=
 =?utf-8?B?SXNhVjJOaXFYWVJZTFlyTWo2Yld2cGR4b2tBSTNzUm1DNitLOExoQ1gvZURH?=
 =?utf-8?B?T280cU42UGpnNTBRWGpoZ0NLeGpUa0M3WmZxR0ZLeXl0eWtraEtZalVuQVJF?=
 =?utf-8?Q?U6lqyL1Vzi/w3uoo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e002d2e-bf36-4f46-7fd8-08de65b28838
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:04:19.9131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm+eoNRGSrvBGcwrVCEPkgOGYDheL5qWeY7ZvDHKL8FadhTWxq0YvnwznUcYmktr7yhhBcGBPnJhUwC1ZbEl9eS/ELAUcPjzm5buDXx5Cj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7440
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

On 2/3/2026 3:43 PM, Daniele Ceraolo Spurio wrote:
>>>> +14025515070    GRAPHICS_VERSION(2004)
>>>> +        MEDIA_VERSION_RANGE(1301, 3000)
>>>
>>> We usually avoid using big ranges that cover multiple gens, because a new
>>> derivative might be added for an older gen that doesn't require the WA.
>>
>> To clarify, this isn't a blocker, since we do have exceptions. As long as
>> you've confirmed we don't expect this to change for derivatives we're good.
>>
>> Daniele
>>
>>>
>>>> +        MEDIA_VERSION(3002)
>>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>>> +        GRAPHICS_VERSION(3003)
>>>
>>> According to the WA database this also applies to Graphics 3004, 3005 and
>>> 3511 and Media 3500 and 3503
> 
> Looked at this again with Julia earlier today and confirmed this doesn't
> actually apply to G3511 and M3503, I had just misread the database. It does
> still apply to the other missing versions.

Correcting applicable versions. Thank you.

