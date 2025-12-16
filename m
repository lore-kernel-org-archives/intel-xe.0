Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71518D5B87A
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991410E621;
	Tue, 16 Dec 2025 01:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI1njgaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948410E621
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 01:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765847946; x=1797383946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=0LsJSSBI39lQkyrPuUudmuwcHU3pN1jt+ZS9wc+9WzU=;
 b=oI1njgaE4ho5cGqtkBUmoWa/dSRHc17ALVwH+AXMVlXGZckPRmR1Tvlq
 tWuAFbeGNupSGvloR5wN1s6muw7n7scyx/Ww9lz7VU+mQUbZh+Je3jZ3+
 iRQOuwPwsbPKKVlKTt5svscK1U716yLwERPebD6ciXUh9a8Wl9OQ/h67B
 bHa8IbnO4OJj3eoyZHabJc0YQ0mXzdoKaacmci17xCwThzJFkIN6h2zul
 wG5VVgmWXoU7HYzhmoW3U0BQBRHzWmCCmi40oDfI1vJ9iZHwGN50xw4ad
 KG6Q49W6F5KYOMB/O+XeFTYTGaYvb/JzZlH6XlgMrP6BnrqfjWXisvqSw A==;
X-CSE-ConnectionGUID: WVlP1m6/SJ6rz2u/m5bwGg==
X-CSE-MsgGUID: iyGL/pDJSyy7Kd/Ak4w8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67700992"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208,217";a="67700992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:06 -0800
X-CSE-ConnectionGUID: nWKyyn9tRkWFEMAZx4GEHw==
X-CSE-MsgGUID: f/0IXxagTTSiYG2utXNRVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
 d="scan'208,217";a="202985193"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:19:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 17:19:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha6I7eC3O2SfbpgmOKpeaRx9wkSel+OUWGGF0Bp93Q9r1DMkqWPYGs4PSPi2LUJvqPSpaBoIvk2qeoaIDP/5UkQ3jWrQydXRufW60vRjW5/n0/vPmA25wWP4CcgEBgRd7J3nXuCcdyfNmq8ROjoLniJr3m4/XMyL4CE8a2gxxvAMafkeOc9j0caFnuL8NaUgzbSg4PabCZhgjDcoiwdgm/mxmrr4Fl6QNicQnLIg6/1D8DLqd39tXUjSUIJfnBFvhPDA63IQpRIscEfeoTkka4y7Aqi01HA1OKl36GZoMFs3AD86UO3aqA5+fxiLiGJi73hKLGbwFcBvi5KrR85nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSpzLUxM847786Rq+UlGnPwmRN3UcXvjW9Qu5n6xLII=;
 b=Cpg3NlKiMn7l30wPFoGi6yZ2uj/dkIz8dBE1DnDkDiHKlNglQ7w+RMxXV5GE2c4410yNX/MCQ7bzNY1dfDDxbqklgiEbRWJMIzslZFpO+/plF7vNQpGDjKOF3u+sWeDWE0kit5MNZg1/6EFGdOzK8ObvimR3hG/ssIpgq2NCUgLTaiPKbujHOlyfRpB46u+b6LFg2sqZgQ7coD507yQNEEIMvbN6e7VwS3S21Ha6HO1K+sdA+TvqbrI2pLlfcXalTNO7YwLcRsDnudxAhXL4k21oIlKRPtCCvN+4XgP9M4YPghG9oPOlQit9+rcAqASY3rfybTW+dlBaHTDJkR384w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 01:19:00 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:19:00 +0000
Content-Type: multipart/alternative;
 boundary="------------sLcUjs9BX8YGA4fRUje3FU88"
Message-ID: <9335d8a0-8d06-4fbd-b855-48dfc2966330@intel.com>
Date: Mon, 15 Dec 2025 17:18:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/eustall: Disallow 0 EU stall property values
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <peter.senna@intel.com>
References: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
 <20251212061850.1565459-4-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Harish Chegondi <harish.chegondi@intel.com>
In-Reply-To: <20251212061850.1565459-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|DS7PR11MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 793fabfa-99cb-469e-aba7-08de3c4117ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk5HMmFJSmg5Q1paSklsVjJ1VGNzK0hFQkRac3FNQVBJWUVEdGdpNHpGcjhT?=
 =?utf-8?B?bzFJZXNFTkFoUW53dG1EOHVCZGsyaWVVZm1vSG1Ha2YvY1RQNUNZamZPWlgz?=
 =?utf-8?B?KzNNaUVMWHVCOVpqdW9YY3NoRERjQlRGK3dPNTdSWkMrVmVITU8xd25uSFNR?=
 =?utf-8?B?eWI0YUhuZXdqU3liSktOcTVldXYyY1doeDk0d2IyZVY2WUlZbTFoTGZydkxx?=
 =?utf-8?B?WVYrRUhpOE5NN3poSGZUTjFnVUZwb0tnYVhqTXpTNjU4VnV3V1ZWS0F6ZjNW?=
 =?utf-8?B?aC81K3lwemE1akxOdkpZTXpJSkc5M2lPNHhLUUlQRSt5Q1BRZldvRG9qUnlm?=
 =?utf-8?B?SWpLbTdTcm52SEx4ZktKekFUb0FONkUyemFaQzdPRS9KbFJ2TWJWUWtZcklS?=
 =?utf-8?B?MVdaSk5CVThEVGVnM3FySXBnTEQyMGQ5dkRSelhmdnIxVDBWMmkzOXNYdTEw?=
 =?utf-8?B?eHhrNEhsUWhDR01IcFZYdzl5MjJjNURlR1JOci9LdXY1eFB3ekF6TGNkNkhP?=
 =?utf-8?B?YkJjQVd1WGFpcktnb2plQVJ3S01vYjUxeVY2c1VzbXlHaVZqak9lNmZSbUJX?=
 =?utf-8?B?NlA3YXJZWFJOVFhnellKUmg4bE5iUnB2UUF0Z2hyWXZKR0ZpZnhQRnhwVTJz?=
 =?utf-8?B?ekt4VmRpbXBZSkxLQ3pQdDNmUkpxUFJVcU96Mkwvek1lNCtYWHJuM0wzd0Qr?=
 =?utf-8?B?WURzOFE0N1JMM2lOQ09GcWVlSFpYZ282ZE1vVjN5OXRBNTVEWHpwd0E3Sjdn?=
 =?utf-8?B?ZU5rb0ROdnBUb3RMTzlXbUdrZWdOZXp5cDc2NnlqeTc3MVp3bCt2bFhheVNm?=
 =?utf-8?B?UXZqa2xpMm85MjhkM1FibFNLMllhbzFkejVseDhKQnFOME83L1hoVWhSZkt0?=
 =?utf-8?B?UjFQYk9QSjUrbUYwempQeVVOT3B6UmlSRlB4TGRsZi9MTFdLSjFSQ1FQRWZx?=
 =?utf-8?B?ZmRBdUJzSDBsdFUya3NxYU93Zy9pNkZibDM0ZmhTSkpwQVY0aThENmJmekxt?=
 =?utf-8?B?THJRS3FjZnNFMGg4WDJkQlNFWFZGV1VPZm9sUEFSd3kxUGR6VjB5MTcxM24z?=
 =?utf-8?B?T05odWF3SllDNnZuamE0bjNackNaMjZScWxXMGVLM2FsNjZrQWRXaStDNERP?=
 =?utf-8?B?eDRQMkRKVTlmREx1KzNoMmZKN3FiRmtEa2hYN0d4TGIraGc0ZkdjaE03R3V2?=
 =?utf-8?B?YTdlYS9zM01kUUlxa3o0d3RUZEhBRXRRWUNPT2p6SWhiMTR0WDJGQlNvOXZ5?=
 =?utf-8?B?cDN2dURvazExMmdMUFgxbFkzUXNxcittVlV0SG1LekdBUEVZL3JGL0cvVlMv?=
 =?utf-8?B?MWFNRml3SlNhNk9xbGgyUVRjZ0hVTm43S2wvSkt6SWR5T2xDd1JZR01pYkxy?=
 =?utf-8?B?SFNCQlBIelN2QjVacG9Fb0IyUDk3R0YzZkNEMURjWFVsNjE2VzBjWTRlanpT?=
 =?utf-8?B?S01PUnBNdnI2L2NUbEFFN3dKL2FqN1Rnc04xNzIxQU80V2c3MEE5V2RpVWFI?=
 =?utf-8?B?TlQwVjh3QnFQei9oL0hQdTNTRDNoZmg3UW9BRWdVM2llaXJEV0xWeEs5dXY2?=
 =?utf-8?B?SC9OMkN2TU5FNWkzVEFmWk5BbDlBV1h5ckFmWjR4VURhTFVvdmNRM0VzR2dB?=
 =?utf-8?B?MHJ5czVQay9WOUlBL3ZpUEJuN0h6VW5mTUpOT1Nyb2JURnJCMTl5TkNRYXNM?=
 =?utf-8?B?ZFJ5UnhZazhVVHQxV2gxc1N1R1dpeVNPaVBRZE9VemhHRzQyejhsNFovdTZE?=
 =?utf-8?B?WjgwK2RUZ0RmOGpVUFl0M2J1cDhGL2Z2bS93VWFZb0FiZ1hCK0wzUWYwT1Iy?=
 =?utf-8?B?cEsyS0wrbmZndTZPV3NKWEpjc2xPdmUyTmNQRjBMRkpad05NMGZnZThUa05F?=
 =?utf-8?B?Z2FITDBCZ2tXanRZaUk1WjFhUlJnZktEd1hObDdEQzFXZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRKRWtlMXBPM1Mzd1NyU0dlZ1VVSnJQYzVMWkRDaDJZNi9JK1IrNnJpeDlS?=
 =?utf-8?B?RmNKMGV2ME1DQ0g0OHNMampYcks2MlE5RnJpSUdXVzdEOCs2b1NheE1Jb0Jn?=
 =?utf-8?B?ZGZEblVldCtuYiswTzlkekdROEt6RSt0dEk2RkNKYmZwUGdtai9FeUtmbmt2?=
 =?utf-8?B?NG9CK21reWZ3NGZOZHZUbU1RTVBhbFpuZ2tBV2syYjdha0wvcDduUFgxTm9P?=
 =?utf-8?B?Z29iem12cE9NRnQycmxvNHBHSDFTUkYvcXFmOTlET0lUaTYvNnVwNEM2elVE?=
 =?utf-8?B?K3A4YlFZYUI3RDBFdTNIY0ZJS29XZFZ6dVU2UkozQVB6azA4ZW4vMUQ0M2tJ?=
 =?utf-8?B?WlJlN2xiUm5sSFN5eFF2WkdTbUdBVlE3ZzlxVzBDZkM3a0JzOGdYVGw4bzJj?=
 =?utf-8?B?c3NMdHBpMXIwZzNTbmFqQ0FOZExyZFIrUXdiQzZ4L25ub0xHL2xiR0xUSTR1?=
 =?utf-8?B?ZVFVWUNXbjFtdDhPTjk1S3FHdDNWN0hyd0xLSWREa2hSK1JwZ29ZTjJsQTJv?=
 =?utf-8?B?Vm5BTEx0WHZnWGRoNGFVdVFOS3RKMlo5SkVYUk5lZ2h6M25OR1VzMG1GY2Q5?=
 =?utf-8?B?dmlaQXdzUDRnSU9iL1NEM2lHNmZqUFdNWW9zL2FGa1hBV3JuL3JDU0VjZ0ZT?=
 =?utf-8?B?bk5lc0Nla2kwQndsdGI0RnhtRS8zenIzUDFIM2tMUU5NMnpGWWdRejQyZThK?=
 =?utf-8?B?RVJNVzc0cXF1WWFPZDd6NEtWTndBc1FSVFFSMytWV0Y3QmRNeHZJbnRoanBr?=
 =?utf-8?B?SVQ2ckh3eDZGQVVGRWRJQ1h4WUtCSUhnQWJ6Y1hvS0xpbHlqaEszWStpcERh?=
 =?utf-8?B?U2JBVnVIUHo3S2gzWWo2ZUNMNUk4QmlEenNybldNYWlza1c2V1lKR1FxUUhw?=
 =?utf-8?B?RlpzaTZVbzJ0K1ViNmk4dEppSXB2ZS84U2VnemlBMFFQZDJ1VjQybmovL0RQ?=
 =?utf-8?B?N2p0ZytQRnhnR3VaZWlkQlYyUzNoeFBmY3VUNCtsRm03QlhDWFIzSi9ydXF3?=
 =?utf-8?B?Y0o4TVNHTHNTMEQ1eGxNWVp3cy9TSTI0eDF4Ly9jZ21QSmFiUUFDcUoxbS91?=
 =?utf-8?B?VlBsZitLNTV4QlN4ZG5XbVZ5QW8wekZWS2lOSlJNZkZqS1VGbVN1TWtJS0ZP?=
 =?utf-8?B?ak1NNlE0VVV3bGVXaFJhS1dOYzl4RmUyNGpHN2gyaVNPMitwWHdYeHBJS2xV?=
 =?utf-8?B?QS9NRVY1MmwycER6UFdmVWtXVmc2c3pPWHFvdmRybWh4Y3lNcm5rS0NFWTRx?=
 =?utf-8?B?dmJ6MjFrTzhjZGs4ZTJXTkV5cCtMWjVRRExxbXRLckM5dnJ3V0x0TjFmVG1W?=
 =?utf-8?B?YWJmRVk3bWVRcWRsZjF4TlJ4RkFRdmF3Y05hMlhzZGtMQlZpckJVMWFFS2Ro?=
 =?utf-8?B?SEFLNVJNK1ZiZllTaEtzejVTeGVRbk0xYXlCSGswUVVQeDdyQkx1Vm0xcndD?=
 =?utf-8?B?ZWJWT1RKY1ZEa3lkU1RkQ2RhQitoOVlNeEoybnYxQTM2VG5QYnhqZjMzTlM1?=
 =?utf-8?B?aUxzRGFaOVV2WjdKbjZZRGp4bXFoRFV3MW5aWGhVYjlIVHFIV2IxWTk4bkE1?=
 =?utf-8?B?SVN2UVVMQ1ppZUVuUHlWQXFPOWs4d1lkN3JzV0JBQThScHpHcFF2b2RrM2U0?=
 =?utf-8?B?dERRQjRWWU9lTFVrQk5mdmkxTWdPUEtYUHNaL09uaTdidFl6YUFEd2dHV0FD?=
 =?utf-8?B?cWNWRm5sZ01rck9qVXRNQTZVTWUva2FaNWl1VXVTOUt6NjRURExjMHBPd25i?=
 =?utf-8?B?ZmFCSzE4Nit3R3F0QS9Gd3pnUHpzRDB4RElWM1hubmxWSjFyWjMzdUl2YmZu?=
 =?utf-8?B?NXYwbHU0enJvVnJZaXJjVnB2M3Nielh5WEwyUW91c2dGcEVlaCtQeVBQalI3?=
 =?utf-8?B?Rzlhd252cnorSkMxWUFGK1RHOWpBaUpZS25sUmJidXBQckdHbit5dTJmUnJM?=
 =?utf-8?B?UGNmMDNqS1duRDQ0STNkQjJjN3pnTVhIZjlKVnA2N3h5eUR6UWY3dGxjVmtr?=
 =?utf-8?B?M0ZuUk9qc2ZFN0hRWEk0bFdBcnkyNVBJMVZ3ZVJSemZaMml1VWdCdUVLZDF5?=
 =?utf-8?B?djQzdXhmUE10cEpYS1VIcUo1WmtMUG9aYnlpMWJ6K29hQW9HWjcrUERpV2tv?=
 =?utf-8?B?UGlyZ3B4SGFZdUhNVGY2b2tMSzZtclpBeEdMc01ONWMwM1p6Y1ZTYWRCbzNU?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 793fabfa-99cb-469e-aba7-08de3c4117ea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:19:00.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFqBvtfAeYmN/bMw0huBx94IXLxm6cp5V9tweDTX2bx/jXNIDq3vrSSWsXz2usKIHxCeUUIfjWug54of7svOdpFV9WwAfhJMCwoBQMNCDzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6271
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

--------------sLcUjs9BX8YGA4fRUje3FU88
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ashutosh,

On 12/11/25 22:18, Ashutosh Dixit wrote:
> An EU stall property value of 0 is invalid and will cause a NPD.
>
> Reported-by: Peter Senna Tschudin<peter.senna@linux.intel.com>
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6453

Is this the correct URL? I am unable to access this issue.

Thanks

Harish.

> Fixes: 1537ec85ebd7 ("drm/xe/uapi: Introduce API for EU stall sampling")
> Signed-off-by: Ashutosh Dixit<ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_eu_stall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index 97dfb7945b7ac..a5c36a317a707 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -315,7 +315,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
>   		return -EFAULT;
>   
>   	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> -	    XE_IOCTL_DBG(xe, ext.pad))
> +	    XE_IOCTL_DBG(xe, !ext.property) || XE_IOCTL_DBG(xe, ext.pad))
>   		return -EINVAL;
>   
>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
--------------sLcUjs9BX8YGA4fRUje3FU88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">Hi Ashutosh,</font></p>
    <div class="moz-cite-prefix">On 12/11/25 22:18, Ashutosh Dixit
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251212061850.1565459-4-ashutosh.dixit@intel.com">
      <pre wrap="" class="moz-quote-pre">An EU stall property value of 0 is invalid and will cause a NPD.

Reported-by: Peter Senna Tschudin <a class="moz-txt-link-rfc2396E" href="mailto:peter.senna@linux.intel.com">&lt;peter.senna@linux.intel.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6453">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6453</a></pre>
    </blockquote>
    <p>Is this the correct URL? I am unable to access this issue.</p>
    <p>Thanks</p>
    <p>Harish.</p>
    <blockquote type="cite" cite="mid:20251212061850.1565459-4-ashutosh.dixit@intel.com">
      <pre wrap="" class="moz-quote-pre">
Fixes: 1537ec85ebd7 (&quot;drm/xe/uapi: Introduce API for EU stall sampling&quot;)
Signed-off-by: Ashutosh Dixit <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 97dfb7945b7ac..a5c36a317a707 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -315,7 +315,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
 		return -EFAULT;
 
 	if (XE_IOCTL_DBG(xe, ext.property &gt;= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad))
+	    XE_IOCTL_DBG(xe, !ext.property) || XE_IOCTL_DBG(xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
</pre>
    </blockquote>
  </body>
</html>

--------------sLcUjs9BX8YGA4fRUje3FU88--
