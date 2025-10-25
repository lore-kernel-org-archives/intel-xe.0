Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C0CCD1BF
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 05:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7843B10E029;
	Sat, 25 Oct 2025 05:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWdc8qyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09410E029
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 05:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761370993; x=1792906993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gNFaWkcRn5KnDUvPu2LmKOSjcP/pBvFBmotdoQCXkWQ=;
 b=eWdc8qyjVgTVpQfqRXzoETE+lGlJcjhwwXaZEhB/4Wv/w+WIsz1nmTcO
 DnC5RhWxD80jqlN4u/KvrN5+BdJ7IH0EyaqwhbkjAu3Lu1pwbKE5moBbZ
 7ri0xgapjeedYIwV2ry56tq/ADuURStPRMzf+hsFmKUEMefEIKjKH2Z1a
 fKwhvZ11rNaCv8vN1FWJ/JJP/cSdYvjtozJZbE2PqdMetG11OTH6sMDgn
 4EXqfaZRPkwbA3GG4ab3d1wbxPoi4KJgJ8JJmlBrWlCCjNkllpOpbJIjZ
 +m2YzHxT91Pn4dy5aLCSiXYzIh/W0LV7jS4TpP+F0NPJ6CEYHgj32OwoK w==;
X-CSE-ConnectionGUID: 0E+U7Pq0TJiYBMHgUDmhFA==
X-CSE-MsgGUID: YUREEdLtRWCX9RWlD1atRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74888364"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="74888364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 22:43:12 -0700
X-CSE-ConnectionGUID: YauiaMApQZ6+QC3psye3EQ==
X-CSE-MsgGUID: +2iqFFokRJyJSfu2Ed5kog==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 22:43:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 22:43:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 22:43:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 22:43:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLaHt5DwJQHOD/O/IcNSoZ8dEVxwBRItg2zt4uAvABLnmTMuqGGgspVHrvmZwand6mWtK77Rki5x7UfHrCJMPPBRgdosyh8pXgWvlK9FG2FKyGGbZ9Lnny0UXVJY65FTdE6WhJmsvQYQxzIgT3SCaIs1MRBIuszDu7qOtAfI2o6obEyogRYe7800LkLsWNaZj7WU/u8meQK7qbS5LYJBaVG6Ajo3Cca1jH5MUu5/DR9VWsFdKb4VmvgTgXrz54FhG2ePdGNqFJY3/yj6Rhk0xmD6U7Zy9mDw1VeWbOZWw0MevW0PMtgaU/RIVALc9r/Hbuwt+DuGxcU3NNSJxZVqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtvXVmAs3s3xIVZW1cCNHjTW4PPsZTgkwncb+6ZkTQU=;
 b=Uo8ZUTzNVkf60QTthUKCFSrW7UxS/qSUYeu1sP/ayTGONZAHaUlDzfJ4Oqltpoylg777dSrg+vxNX8hBFJBP/MDkimXVAlBYZKc2uDZBxtIruhxQoTlHOvph2YzIzZvzZU+meLdfbbO1znG2l4x1Yf+z3MruvCp+NYbKE+PAccDC+pFrjsrl+4nk+cTQ+mRc4VVmseBo4b7+IiPTa7KPurn+qHcm0WUll442qK1Li5kFIXQJTElsCgQgUEPbejhsQdNTlB5EnzGZ+wh/Pdfz3hQNZNAj7N5wdXPvdDdguvl5wcGCxWrAwdy0Ntz19plYqTGiAx1ECm+sEt15/l5KeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 05:43:09 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 05:43:09 +0000
Message-ID: <0f94ff84-c160-4ae0-8d10-0a4f040562d7@intel.com>
Date: Sat, 25 Oct 2025 08:43:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3: Apply wa_14024997852
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>
References: <20251023044041.13731-1-tapani.palli@intel.com>
 <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
In-Reply-To: <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0245.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::10) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: acee7854-2495-4ebd-fd45-08de13896023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG1IcnFzSnhYVkVONTlnMElMSDY4WnJhaUNTMGtPRWxSK2JBN1lGUTdXbFZn?=
 =?utf-8?B?WEV4QU1lUWNSQ0FXRW5FdTBRUTJkKzlwZ3ordVlPdm4xR21JSDdzcXVrNHVH?=
 =?utf-8?B?M0hNYlVDZDJobzlSUnMrQ1RKb2F5djdOYnFPeXYvNEU0bGtYdEFqczhURnRR?=
 =?utf-8?B?L1hyVzhqeWpkZ05yMEE2NWxoL25zMXNDL0pSQi9GUlZ2ektxYVdoQTQvMHR4?=
 =?utf-8?B?YkFHbUFhTmdSSDUrRjVhNWQ5dnRTWFc5aWYzWHNQM0ZHRDZZMVYzSjI4RWM1?=
 =?utf-8?B?M3dCdlBZVnV4RmNjdUM4UXpYYzlSVmZzZGdKUXUxeVJaTHExWGdwang4SVFQ?=
 =?utf-8?B?NUU4NzNSckdLYStTc25oMTBhcEpERU9VRWtHZTNJZGRxcC9sY1RzSllrLzdH?=
 =?utf-8?B?cGVRZFovOWU5QlRFMUhxVTcrL0d1MUVGSmpGNUt3ZnpRY2xDTlpzMy9peDJq?=
 =?utf-8?B?S3QrYXhjTG56VCt2RmVlU00xUkhDZERaYjRtdEM0RFBQWEh6MUp3UlZ3L0dh?=
 =?utf-8?B?YVpNMGdIZjY1WTNJRHcybXZIUnBEVWpPb2xlei9yZU0xa3hDaklMb0YwdGlW?=
 =?utf-8?B?bkp1dVh4UnBoa3Y5T2hnYXpiZHF5MStLNlNBNEhJL3p1eXFueW45STNsNWty?=
 =?utf-8?B?aDBsRTg2QitJbDNiVnpTR0RKa1p1QUpOSHJ0SFFXSlpnb1ZVM1hKVkZJS3FZ?=
 =?utf-8?B?d1djQmNqdkRacDNicWJmWitwaGlOdDhMN1g0NUdVUGVsZmNSa2lZM3RqcXVx?=
 =?utf-8?B?VHpPa0hSS0JNb3JmaGRQY0lieXA4ekFSM0hZSlR3VHlPY2lTMS8xODc0Wk45?=
 =?utf-8?B?N1Q1aENjQmtkNG5QVG5xUUZWcVl5NEs0NjVWTC9Gb05VUXRvT29QMWJKZnFt?=
 =?utf-8?B?bDNhUTZ0aC9vZFBUMFdkZ3E1VVBGenJscTNPS1pCQUZhSDB0clA3T29FelBQ?=
 =?utf-8?B?Vnk1dGF2bkRCbUwreldnWnVYNHN6d1E4MWVXcm1TRGxtL0k3WUlaMFF2SFFm?=
 =?utf-8?B?TGxLSmFqREtGZkJYdWl6cDM1WE54TG1aMDdxT3hXS25nNXY5WEFBZnJqSVY5?=
 =?utf-8?B?RlhxcGpiT05SeVNFcFdvREdrRWd0Nkt6L0k0NUwybFV1bVVTN2doSGxkNGRC?=
 =?utf-8?B?ai9WcktBWkxOellMaS9wRTZleitocjBGNWZvU2Rmbk9YWkRFVUdxY3AwZ01r?=
 =?utf-8?B?dmZ5M2pMTzVWQ1VUUkJBS3d1OE1PcDY3ZWpRZjZLeG1GdkRvbWZIK3paTGkw?=
 =?utf-8?B?WHV1SXFCbXd4amRKU1cxaFpGaGl3ZnRoMUtjcjU1M3ZCOXNUdmlhL29SUnZS?=
 =?utf-8?B?c3RNSndJTHhuMVlMZXhsREloRXhEY0l3MmN4a2piRUZ1TVd2alhISkU4ZjNo?=
 =?utf-8?B?TU9qUThlV1c1SDJxZ0lpTGoybnVPSGRtVjNwZ0xGMmlqU3lBK3hBOUZrYVJl?=
 =?utf-8?B?R3VJQm5lU3Q5cGpiWnJkVklIbGErb2V6YjYycUwreHUwUGlEODR6b3B4MS9l?=
 =?utf-8?B?c1A1NERrTnZSeVJJcmVsblZaY2daWXV5Wm9YVmhIaWhoaUd2Tk4xc0RkYkxL?=
 =?utf-8?B?T0dDbEdjV0VXRk9uZ243NmhPZ2RIQytLZUZpNlZWMnp0ODNLSENlU0UxeEh4?=
 =?utf-8?B?djN4ak1CcVBqcDJ0VDVncFRZdmhyQzVkNzJqL2VJamljaUc2U2xJcENXTCtz?=
 =?utf-8?B?eEFKNk9lbG9LRUJvMlVaV2JqTkVqd2lwb3VlVjdENjYzSTUwVlcxSXdna1M1?=
 =?utf-8?B?dnVlVEViVmI1cXVzU0VLbVFVSlI3R3RxTzhEOHpWRzFSaEU2cmhZQWFHRjRr?=
 =?utf-8?B?UWNJSjRBN0F3dWpJaDdvMUYwWGkwNk5hb1lvWlFXYitmYTluQk95c1k3ZHNk?=
 =?utf-8?B?NHNta2txY0FPcFZOYlcxTk9QZW9UWE1Gb1h6VnFLSWVNaXBuOUFZMHBqbXVz?=
 =?utf-8?Q?UFeZ7a07oqGw14AvKSrkomKWl70mfRv1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlRhSG1sNm9XYTJacGMwSnZXYm1XQXEyYklpYStoYkQ1dFlWWDdvdjF6T1J2?=
 =?utf-8?B?S0dqcHFGUWptU29JK2lySHc1S0IzbVhVZmdwcjkzUzZ5NFB5N29SYVpQbTJT?=
 =?utf-8?B?TmgvNmc4WXpPMEVEbU1EenU0Nkl2cE9qbmhIbHlxZ0YwKzVLSm1oQXhzQWl0?=
 =?utf-8?B?QTlJZEQ2TEkva09MczJNNXpWTmh1OSs0KzB2aXNYajJxUEdaY1ZhbEp2NWZo?=
 =?utf-8?B?L014amVtRlBwcFg1Yis2YUNuMUFsRXl6OWRQdGF6Y0tUYk1hbUlKRWJmeWsz?=
 =?utf-8?B?Mmw1RlBaV0hBVU1sdUhjSDkvUHArejBqYUhkRDIxUnlydW1EbENuaENpNEcz?=
 =?utf-8?B?MnNrOS9RdTFwcjhIc2pIVm1uamgrMzVVNHc1dm45YnMzTGkyNTI5MXU2Skh6?=
 =?utf-8?B?bm5jUkxlVGZ3SUR1TFNDMXBjYW5qeEliVkR4aUJvZmdXeXdFeGMrSjI5enZV?=
 =?utf-8?B?OE4wVlIrK3orME82VnJMYnAvOFRUNGZhT0k2Y2hiblg2S045UFlvWGIxbW1L?=
 =?utf-8?B?NEtkMTVvS09FeFFuMFF3V0t1ZnRyTmFFT1Fzb2V2QTdpTXJJR1JNOHdzMkJt?=
 =?utf-8?B?SE9IS3U5eW1ITWNKeCtHQnhCbkppSEFDc1czODBqQkdWMU55VlhBQ2QrVHY3?=
 =?utf-8?B?RDh0SnkrVHVtUUlmSlNjbFVnbVdidDIza2g5U1JJY2Z1NFZWeEc3Nk0ydUVF?=
 =?utf-8?B?RlhEcHplVWFOM0FJTEZOTmJKVUFsRVNaQmhiUDIwR3VBVG44S2tsUUFjYXN4?=
 =?utf-8?B?enBkRVZHU2RHMitlZjcwZXZNcVArcVpmRWU5OTBoZzQxWDJpZS90eHk2VW9J?=
 =?utf-8?B?bVg4WUZ4VStpVXY2d3VMSmZ5V0VNc2lTZDJoRTA0T2Y5TzFTVzNzREk4TnQw?=
 =?utf-8?B?VmZvSUlGWWVtOE5Xb0tuK0t4QjdzaWpxVm1lYWxRUDJHTWNyOE9iZlNyTlBE?=
 =?utf-8?B?REZqcWlGc0l4TDFFTDA2QUpoVkpia1RhcVlrZkpCWkVuY2VhSFhnbzVTeURx?=
 =?utf-8?B?Z2FMSWVBdWRGM2E0ZS9qdG9xZkF3QVYyZEJkUVBza3BuR0pTbnAxSktxb0cz?=
 =?utf-8?B?YUV2ZkxYRTE4aCtZVjJwd2dVcklwVDlRdjgvQ3c4SDJRdWZTSDNwb2xsTTZK?=
 =?utf-8?B?bHlTTzJRV1FyN1VaU20yeVZEOGV5YmcxNXJFS0FZR3RoK3VxcjZyU2FRS1h6?=
 =?utf-8?B?OG9xd1ltcGN1blhDSVE5QTRRcml1UzM3RC9zZ1hFTjVZcXFOdTdROUJVdEw4?=
 =?utf-8?B?dW40aUx3dG5jOTdvUC8razRSM1RoNHFlRTZyVGdDb29LekYxaHRKN3krZGt0?=
 =?utf-8?B?SVd1dnRWYnFCZE1KcXppUkhnMnYrbzFkUXpXSEI0bm1qNk9Jb2hOdjlWcHEy?=
 =?utf-8?B?YmNyMURHS1J6NEE1R1RWVFplUE5IblNSb0tmdy8yMzI2WTMrMHBadkFjWU11?=
 =?utf-8?B?Tnh3NVd1SENES3BqTUlnVzFXM3IzUkpGWkhUNkdVK2dGQzExYnFpN05nUjRT?=
 =?utf-8?B?bjUva1AwNXhMTnQrSlM2UmNCWndPQzZPMkJacW5GRzdRQWFGcGRYelFvbno2?=
 =?utf-8?B?NitmRkFBMmorUm1rc01JRnBDeWE1Uk5kN0c0VzMvY0RKcXRYRDAvMFMwNGtK?=
 =?utf-8?B?aExmV0dCalJFZGtCVCtqclhWY2hSOEhoUGtOcXJCSHY1TEI0dmxPaDFyVGhv?=
 =?utf-8?B?MTR2Z1ZxVGZUVjF2YnZJZ2JIdmZzREl6cWQ0UVlWSFpqcHhUR041RDBMZ0RS?=
 =?utf-8?B?UkkvNnFzL3hSdTVvMjBBWDdvaGVGNFlJY1Izc3RRWVdBa2RTNWZCcG1vQTh0?=
 =?utf-8?B?dDRpWUNHTW44L3pBdFNHK2tjcVFNN0NQdVZzUDBycGR3Q3VWWkwwRG1kLzRJ?=
 =?utf-8?B?MjhhSGJBUythUGxIMkJnbFI2L295MW1BOFVqMzFycGtrWGUvTjJMK3h6VnYy?=
 =?utf-8?B?UXZQbTA0Z3JQNHpYbVZLU0o3SFJDc2dhdWZ4TmhwVUYrbVdlQ0lZNkJXbjZL?=
 =?utf-8?B?S3hUSW8zZ0lSclZZRjFFcjNzT3VtOTZrd2Ryd2Jva0NwRHJ1SmJSWHZEaWdv?=
 =?utf-8?B?NmQ5OUQvZUZkYktTR2IzRWNqK0NydDFOSnp4KzkvQURpK1hHYWxMUEUxYTFK?=
 =?utf-8?B?UmhGTGkyVi80Ykp3R3FXYWxodmd3R2R3UGdsTnZyWjFjRERucFhmMzYzNUtl?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acee7854-2495-4ebd-fd45-08de13896023
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 05:43:09.6512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuhxX2oKOsjksAwYALEDP2duywoz99q846nCvw5++wA8sxIbjzFc7RgJyiP0v4evvqiJh7mkwpez1D7DhffEwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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


On 10/25/25 02:52, Matt Roper wrote:
> On Thu, Oct 23, 2025 at 07:40:41AM +0300, Tapani Pälli wrote:
>> Whitelist registers needed for userspace to control autostrip on xe3.
>>
>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index 690bc327a363..fab56673153b 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>   				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>>   				   RING_FORCE_TO_NONPRIV_RANGE_4))
>>   	},
>> +	{ XE_RTP_NAME("14024997852"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(3500), ENGINE_CLASS(RENDER)),
> We don't have any platforms with an IP version of exactly 35.00.  If you
> were trying to whitelist this for everything Xe3p and beyond, you could
> use GRAPHICS_VERSION_RANGE with an undefined upper bound, but generally
> we avoid doing that for whitelists because future platforms/IPs might
> not need this workaround anymore, but some new setting with security
> implications could get added to the register in the future and we
> wouldn't want to accidentally give userspace access on those future
> platforms due to an unbounded range on the whitelist entry.
>
> The only Xe3p platform we have on drm-tip at the moment is Xe3p_XPC
> (version 35.11), but as far as I can see, Wa_14024997852 doesn't apply
> there (and in fact that IP doesn't even have a render engine).  This
> workaround _does_ apply to various Xe3 platform though (with versions
> ranging from 30.00 to 30.05) and we don't seem to have those whitelisted
> in the KMD yet.  Your patch here has an "xe3" prefix, so are those the
> versions you actually intended to target?

Argh yes, the intention was indeed to target "3000", not "3500". Will 
fix this.

For me it looks like this WA is for whole the xe3 so I'm assuming 
GRAPHICS_VERSION_RANGE or GRAPHICS_STEP is not necessary for this WA.


>
> Matt
>
>> +	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
>> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>> +			 WHITELIST(VFLSKPD,
>> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
>> +	},
>>   };
>>   
>>   static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> -- 
>> 2.51.0
>>
