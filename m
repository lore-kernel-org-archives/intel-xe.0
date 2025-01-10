Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAA6E7719C
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 15:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A9410F108;
	Fri, 10 Jan 2025 15:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRtGQggV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABE310F108
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736522518; x=1768058518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=giW1IzGuDUpZjlBpqM2d+SoAUsgGnyeo/aQ84vg7B3g=;
 b=TRtGQggVC5Ua8yjlUFp7ijTScKHGRdWzit0Tr8yrxKvWdfVwok+vSJxy
 RLZ5f3yhqPjZVTuhikHE/h6mn5rlpbRwYF7zTtBoPTFypsGtjUyAkaXZW
 Zr+ZQ0gsUFSCUcX+cEAmRlYMVJYdBj2EHQ0CMnrBdAmrfxoH5j43Rd6uf
 VHMbRJkOtUITtKXzh8nSXPAVeGq9smh1J54J+tMpGXcV2iNwM4qIifRMr
 ZixT75kIVzHlWb9VXOBvYf3EzZrBl7Frtr3OxS9vuRvlPD2V+qO7SQoTR
 STNM5n/jWdIA+WFSRcY45LiKwWaurPUWpoukmwajs/jD7IRnVlp8jqVWj A==;
X-CSE-ConnectionGUID: fkqW1EkmQaSm7FwwWnC+LA==
X-CSE-MsgGUID: BWTMySAKSVC9XQD3B7c2YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36845869"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36845869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:21:58 -0800
X-CSE-ConnectionGUID: NxLRg8NAQtq0XudTkTn+qQ==
X-CSE-MsgGUID: eLcDPpcPQmamsOZuecDfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103569305"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 07:21:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 07:21:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 07:21:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 07:21:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3Blf02iCvztbeequFpfMBMZCVmfTBlc445cqk8dOxqjkZ+zdlOl8YjM5fz7EpyNL8WT9ICFtGH+gSgmtb8hJICrcjxc9TsC8mth/7Zw15Q6vKOYvJhzkRqLFPhtccMyYiwjD1dS8HcjjycCV5gbBLEu5Af4M4kiQrQWP1/7wslg9nJihyYiCYxoVYa2kf2y6mWW0Sj5OPvuiMuCNMYXWB0TslL3cJvyP+pc+5J7y4ycrsFTGVU0TUgOo75iPwCbK1Ry1tvy1luAH3TrVhFs0D36iMYaqSChv523EQ8gOygjwvbFyKAyUJIGq+VvAdbMR/fyf/63vLFvFNTsUc8fdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chLi9D8x175S2s8zt/ZBKFwfquNAJc+MeIaftChAx3I=;
 b=pLNYdqx+E7bi5pFjlbqOUBQKC7jMLYKFpvtVizootVRHMfAlbw0d1nUYY+zfInvzFvjQKiPF1yjEjGYpc9cpwGfhEdtEoxt2mJG5F1bOAA0k90ltpHyFEQRX2pgVdNWstNHvBqX93U0ICUdmVyeYuc6u6rNUSdk2WgGfe14CrNr6zJlaNN0bt4YZVR/N+WFWRQscofgn9d7BDRd05v2YaG7tCyjBAm4TkMnVFWQI0y4xYQzVX5IRCuF6dFWRJC17afnnHn4AqVkdIsa7yVumCI38LAq4L81rcf0pK9Uoal7vCCf+aJ4POandE0koepVH4Vb9JcOlhnRpoGAhRRK+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 15:21:52 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 15:21:52 +0000
Date: Fri, 10 Jan 2025 10:21:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z4E7DB6pbb11QDWT@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108103959.1219312-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f3716b-be19-4c1e-49ac-08dd318a824f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alBhdkdBM0VpSXJkMlNFVmJ6RUpkNkNvdnBRK2ZsdytzS0g4K0hvSHpRU3Zp?=
 =?utf-8?B?UkozcjJ2QWF5Rm5xL3BSOVNESGZMZVpDT1MvNU5wSlhjL1Jmek0vMTRKRUtw?=
 =?utf-8?B?R1A5K3VWRUNFT0JubFMvQytjK0N0M0dISlE5bzR3Sm10TVNyQjdJK2NNRmc4?=
 =?utf-8?B?ZUVaS0Z3MFk4TU9XZHZhT2lJVkQ4WENFdEJ1MitaS2Y2c0Y1QU53VkxIR3JS?=
 =?utf-8?B?RFlUdWZRUlZ5cWpheTcwT0dTZHUvdjMyeHRnYW5IclNmUUxtbVQwR2ZZNWY4?=
 =?utf-8?B?MzYrRVlpbmxDYXF5QWhaWTZndHpiKys2eEl2VDNrZno5c0JsbEtLdUt5NS9l?=
 =?utf-8?B?ZXNpQTJkTEFxUmV2S2hybHozd3NuNUxtWlBPSThvZUFtbFpnTUF0Ti81R051?=
 =?utf-8?B?cmNvcHVpRk44YTRTZm1WemE1R2IwN3NHN3hRTGtHd25XNDE1OE1YT0JoMXpa?=
 =?utf-8?B?SWpBeHNjRlFqRWVoRzY3MWFjaFJIeFA0Q1Juc0ZQZktiblA2T3hYQnU0akNm?=
 =?utf-8?B?d09KaDhtMTlxbUpTRC9rejFqSE5KU3FsTC9HNGcyZ2M3bkQ0SHRaem0vdmVp?=
 =?utf-8?B?Q1VhaUFFN1FiM1JJWFl0cEZYbUJueVhkSlMwUUFHbytwZUdVaVZyRm5sOTBZ?=
 =?utf-8?B?R05vSnU4L3ZXTDdGWS9jM1VhQXNqOUpQT05iSDlOYklVNlRjeTQyWE9OTnI2?=
 =?utf-8?B?U1k5MDdEZ0R0ZmxNYVNZM3RBdWpTd0ppdStHTFBOVVZLenFPRFE5cXdXbURZ?=
 =?utf-8?B?Q28yby9qMitObTY5Vm1OOGJtbVVHNkplUUZvdVgyMDNiSlZXajh5TTVPWk9S?=
 =?utf-8?B?SSt0OVpwWU0xM1d1VjFRb1QwUmdyY1MzMkFDaDFqTjg5U0RSeDZRTHo5VXRp?=
 =?utf-8?B?SklJcE9jY1ZNd2diZ1U1cmo2VVV2TlFKakdkUThFdWRQT2hkU0lwNXFPK0VZ?=
 =?utf-8?B?eUUrODluZERjbzdpWGllZGtCajdlRERDK2JwaWZEUWlzNFh4RVhETE0yMmc2?=
 =?utf-8?B?NTlYSWhBYmVHRjAxYTB0VTMwR1JUcEdqZVhQaFAzMUhpR05zckMrK09OVkRN?=
 =?utf-8?B?SWl0VnVjMk9NWk1aeEhSSGZSNnJoNUJXYjV5dFZqa2Z3c2MrUmNRNWYvLzdO?=
 =?utf-8?B?cXo5UXlKcU9JUHlmcVo4LzJRQ3lyYlJJam9xMFA4LzNYb0J0R3BDdHgzdVg0?=
 =?utf-8?B?cG1oN1grbmRpa0pZN2VQdFJwQzk2S1dJNW5xa1B5Y1NaVEFYZndIVmxUbng0?=
 =?utf-8?B?M3d0MEpMZE1wV0NiQUFkMWdPc2k4RmF4dWtKUy9PTkhIWFM1cU5xTEo3R0NO?=
 =?utf-8?B?VnJ6dmlpU1l4amNxV09JekxWdHNTaFN0SUE3SUJEWi82RW43R0tDQzlTTjVN?=
 =?utf-8?B?UmhLRm03UVBNa1M2Q1FnNEM3R0xlY25Ta2NCcGZMaUZLdEp2NGh3WE01eExI?=
 =?utf-8?B?YlZRcm1sT3JyakxnbVhZVGlnYk9CZGQ5eGJPdGZQRnVVWmxTUUQrSlliM2xB?=
 =?utf-8?B?NkRaZXZGKzBtRDVVNisrTE5UaXRCWDFXT2ZobnhLenp3QTVuSlZ0SUx5ZGl2?=
 =?utf-8?B?bm9kTk5VYlhhWEduL0lscDhrcFdGdDBUQnBDYWhGOFBNcmE0ZFJSaVRoVWlY?=
 =?utf-8?B?QS9CY1MxU0Yrc0d6SGltdy92SHVpUDJmQjF5VVFVSkdJclN5aGVISU9qUG15?=
 =?utf-8?B?RWZoeUhoeXpndklJOUNnM3o2bTBoa3UxMG0xU2R4U29waUZhdHkyblhOeUtQ?=
 =?utf-8?B?SERhbUZxQjZSOWhXRlVqR2lnZnJCeDJnZFp5TmpHWXM2YTk0V2xGWG1COVN4?=
 =?utf-8?B?VUpaYUZaL1NlZ2xBU3Nhc3ZZUm51OE9iMmtKNnBRdS8wMzJEbCtBWVM3b0Nn?=
 =?utf-8?Q?nt9wPsef8JhPJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXhUc2I2NHU3MkNmK0RkalFZM05zZ2t6ak4rZURMZlJwU3B1NTlIWnNCb1BX?=
 =?utf-8?B?Q1JmMXUzWEI2RjAwNEdCQkhzb292a3B5eWg0d1NCay94WGIzS2FYRzRLOUdW?=
 =?utf-8?B?YkZneXNqdUZ5djNGQ1F6MzcwRFNBdGRua2tRM2ErVFVraWVPb01xaGZJQnZP?=
 =?utf-8?B?YittR0NEeDhxem9CV2FVdFBxM09FTG5zOGNQUWlvdjBReDlQL2lWRXZqYUdX?=
 =?utf-8?B?ZktLUWV3RzhxY3Y3a3VRMDJOS2lIYWZ6d1hXVVgwTHpvSG9iNUdYSFU2L2Iz?=
 =?utf-8?B?aEdrT3d4amx0WHNuWExyRjlWRGhMbW5EUXpvYnNzVG9OS3AvaDloM09pQWsv?=
 =?utf-8?B?RkxQc2NJQkxOcTd4M0NaMGlleDh4eHpuaTlUTDR3UnFuZFBXMHk2R3dKTHlC?=
 =?utf-8?B?SEFmRVVHZE4vdEV6bHpPWHBXMTY4SW9zMjg0cHZqZU1TT1I2RE9ydVFOUlpU?=
 =?utf-8?B?YjM3SThmUVIvSi8wLzQwL0ExcDRvNmlZRWdhN3JBU2liK0hpOG8xZzY1WG1I?=
 =?utf-8?B?RlZ3OURBTUNLajZueWQ2RDlDTExXSkkyM3JXQlhaZkhBM2NmcGp2NUYyYmxG?=
 =?utf-8?B?SDBvNGtGeGJ6bm5KWXF0ajAxYlNpQVhPWURvMmtBemJoWCtKTXhOdU5hd2k1?=
 =?utf-8?B?MHJORks5a1VQWGJPcDNHby8yS1djcFlhYSsvTnJJTmRaSkY3M00vZ0RMWUVl?=
 =?utf-8?B?ektoaFNrVUxhb2FpMHdRMDExS0N6L0I1c2V4SlRzY05hSmZ0Sks3dHZyQ2Rk?=
 =?utf-8?B?QS8wM1I1TzhwVkZsWnU0aHFWazc0WnhuY0VyRG1xdzI1VkZCb09KVWJlWXpC?=
 =?utf-8?B?V1BKTlNBWWxhaEU1Nk5IaWJGUHdrNUhTbTZ5T2pYOEd4UENmdWZKZnJ4V3lR?=
 =?utf-8?B?ZytPZy9tTlNjSnlyRjNzb3ByUjVvM3Jla3pxazJ0NVpRdjJ2RnZWNHVsOFdV?=
 =?utf-8?B?S1ZPUnpFK3dEMWp3UG9KdW5LQm93UWJvV0dpN2F3SVpSRG5UQTgrUkl5MEJ4?=
 =?utf-8?B?eEZIVEdTSTNNOEVtY0JQY1VUZ1Z2RFQwTUpLck02TDZ1bHYrWWhEQnVNR3Fj?=
 =?utf-8?B?T2xoM05rYTFSRllZNUNaSlRKYk1lcEt3RnUyZzNDK01XM3JIcU9XUkFvdUpr?=
 =?utf-8?B?T0JIbnp0c3NBWUNiTWl5N3o4TXZvRW54cWM3YU5NRzVzaHRMRXFZVmRzSytv?=
 =?utf-8?B?cjhLVU1iYlJrRW9veThmNEEzUG5FUCtBVWxTeXIxZGdJZFlRS05KU3Izelo2?=
 =?utf-8?B?RVJ3MXU1ZnVVVEoxU0xJOVVia1ZpRnc5RktHUHhnak15SFlpeVk0U21GWXAw?=
 =?utf-8?B?cGcyUGFWSWIvMFRuMVJHbVNOWXVhTndxemV1SStnTnFTYjZLSkZrVEVzNVZo?=
 =?utf-8?B?MEV0YTFVMmJ0MHB6dnZTSTQzNGQvZUJkZ1o0Sm5NYzEzdXBBWHRnbHNlT042?=
 =?utf-8?B?b28zSTQ5dzY3OTYyajFpeGN2eDY1a3Zmc1QyaUs4aC9wcVY4ZmlVQ0FwMFVh?=
 =?utf-8?B?TktwN25UcHNsKzZYbzZPUlB2dVZGMGZhZ0o5VktyU2JqUE9kNGdPaXphOWpH?=
 =?utf-8?B?ZVpWdW55OU9weURlZVYySTZMaXdvV2RrdGJNWSsxZE9vZjN1SjdMTzYyd3No?=
 =?utf-8?B?dlQ2UWVCSVJtZEtYSGNNMVZMUnQ5RlVoZ0xTOHdtT01KWmlmR1lNZVhONGln?=
 =?utf-8?B?d0lJYTd2L0RuMTc0SWluOWFoa3ByZWxUQW1CS3J1cE1Db1RldUhhSXZTaVk0?=
 =?utf-8?B?Ny9odFVtU3VrUGJCTHJyZStza2ROMi9qVWoxV2NTUENabExRRHZFZHdIaXNV?=
 =?utf-8?B?OThSQmNLM1hHc0ttbDZjT2oyb2pBQVdBSDdZRCt4TkRYbnVJYTJqSVRKUUh6?=
 =?utf-8?B?R09RaExGRnIvUHZ6Z241aHNzZ1ZiMnVGUWl6d0lMU2YyL3RoS281bTBNT1Ro?=
 =?utf-8?B?NysxTnFtUGNxMGsvWjFrZHBZbkN4NGE0azRSRndKbFNwN041UGRwd0ppYm16?=
 =?utf-8?B?T3FtaGxFNlQxZ3ZBbkJGSkNhTkpJcWZJNVpNR1B4K0dNdmtaSWtycHpwbktr?=
 =?utf-8?B?ZHUyTzk3YzVJWVVEYmhEbnJwNS95TlJQU05xejNaa2VPMXdjblZUMmpGUXFq?=
 =?utf-8?B?RVpqMUVwRXVlMi9reDd2YzhjaUtPakgzRDBuWWZCVEFQNVFhQjVOdHU3Ykky?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f3716b-be19-4c1e-49ac-08dd318a824f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:21:52.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJf/jZaX6uZ/K3nJ6AwP0N41b26g9n0xuO9Jllz/abgVUKFjGtyHsA63Tl23SpMuxQU/03eoohsHe87wrkX7lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

On Wed, Jan 08, 2025 at 04:09:57PM +0530, Riana Tauro wrote:
> Boot Survivability is a software based workflow for recovering a system
> in a failed boot state. Here system recoverability is concerned with
> recovering the firmware responsible for boot.
> 
> This is implemented by loading the driver with bare minimum (no drm card)
> to allow the firmware to be flashed through mei-gsc and collect telemetry.
> The driver's probe flow is modified such that it enters survivability mode
> when pcode initialization is incomplete and boot status denotes a failure.
> In this mode, drm card is not exposed and presence of survivability_mode
> entry in PCI sysfs  is used to indicate survivability mode and
> provide additional information required for debug
> 
> This patch adds initialization functions and exposes admin
> readable sysfs entries
> 
> The new sysfs will have the below layout
> 
> 	/sys/bus/.../bdf
>              	     ├── survivability_mode
> 
> v2: reorder headers
>     fix doc
>     remove survivability info and use mode to display information
>     use separate function for logging survivability information
>     for critical error (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>  6 files changed, 302 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..fb1cb98ce891 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..0f5a052150c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> +#include "xe_survivability_mode_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -341,6 +342,9 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  	} info;
>  
> +	/** @survivability: survivability information for device */
> +	struct xe_survivability survivability;
> +
>  	/** @irq: device interrupt state */
>  	struct {
>  		/** @irq.lock: lock for processing irq's on this device */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index f153ce96f69a..4e373b8199ca 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,20 @@
>  /* Domain IDs (param2) */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> +/* PCODE_SCRATCH0 */
> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> +#define   HISTORY_TRACKING		REG_BIT(11)
> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> +#define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> +#define      CRITICAL_FAILURE		4
> +#define      NON_CRITICAL_FAILURE	7
> +
> +/* Auxillary info bits */
> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> new file mode 100644
> index 000000000000..077422ae009d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_survivability_mode.h"
> +#include "xe_survivability_mode_types.h"
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +
> +#define MAX_SCRATCH_MMIO 8
> +
> +/**
> + * DOC: Xe Boot Survivability
> + *
> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> + *
> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
> + * survivability mode and provides additional information required for debug
> + *
> + * KMD exposes below admin-only readable sysfs in survivability mode
> + *
> + * device/survivability_mode: The presence of this file indicates that the card is in survivability
> + *			      mode. Also, provides additional information on why the driver entered
> + *			      survivability mode.
> + *
> + *			      Capability Information - Provides boot status
> + *			      Postcode Information   - Provides information about the failure
> + *			      Overflow Information   - Provides history of previous failures
> + *			      Auxillary Information  - Certain failures may have information in
> + *						       addition to postcode information
> + */
> +
> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> +				   int id, char *name)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	strscpy(info[id].name, name, sizeof(info[id].name));
> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> +}
> +
> +static int populate_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	u32 capability_info;
> +	int id = 0;
> +
> +	set_survivability_info(xe, info, id, "Capability Info");
> +	capability_info = info[id].value;
> +
> +	if (capability_info & HISTORY_TRACKING) {
> +		id++;
> +		set_survivability_info(xe, info, id, "Postcode Info");
> +
> +		if (capability_info & OVERFLOW_SUPPORT) {
> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> +			/* ID should be within MAX_SCRATCH_MMIO */
> +			if (id >= MAX_SCRATCH_MMIO)
> +				return -EINVAL;
> +			set_survivability_info(xe, info, id, "Overflow Info");
> +		}
> +	}
> +
> +	if (capability_info & AUXINFO_SUPPORT) {
> +		u32 aux_info;
> +		int index = 0;
> +		char name[NAME_MAX];
> +
> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> +		if (id >= MAX_SCRATCH_MMIO)
> +			return -EINVAL;
> +
> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> +		set_survivability_info(xe, info, id, name);
> +		aux_info = info[id].value;
> +
> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> +		       (id < MAX_SCRATCH_MMIO)) {

This is a clear case where 'for' is better. But also, generally here we
try to limit while usages...

> +			index++;
> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> +			set_survivability_info(xe, info, id, name);
> +			aux_info = info[id].value;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void log_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int id;
> +
> +	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
> +		 survivability->boot_status);

hmm, since we are avoiding the drm, should we really use drm variants here?
or the pci/dev ones?!

> +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> +		if (info[id].reg)
> +			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> +				 info[id].reg, info[id].value);
> +	}
> +}
> +
> +static ssize_t survivability_mode_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int index = 0, count = 0;
> +
> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> +		if (info[index].reg)
> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> +					       info[index].reg, info[index].value);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +
> +static void enable_survivability_mode(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct device *dev = xe->drm.dev;

do we really have this pointer valid at this point?!

> +	int ret = 0;
> +
> +	/* set survivability mode */
> +	survivability->mode = true;
> +	drm_info(&xe->drm, "In Survivability Mode\n");

same here...

> +
> +	/* create survivability mode sysfs */
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> +		return;
> +	}
> +}
> +
> +/**
> + * xe_survivability_mode_required- checks if survivability mode is required
> + * @xe: xe device instance
> + *
> + * This function reads the boot status of Pcode capability register
> + *
> + * Return: true if boot status indicates failure, false otherwise
> + */
> +bool xe_survivability_mode_required(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 data;
> +
> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> +
> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE);
> +}
> +
> +/**
> + * xe_survivability_mode_remove - remove survivability mode
> + * @xe: xe device instance
> + *
> + * clean up sysfs entries of survivability mode
> + */
> +void xe_survivability_mode_remove(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
> +	kfree(survivability->info);
> +	pci_set_drvdata(pdev, NULL);
> +}
> +
> +/**
> + * xe_survivability_mode_init - Initialize the survivability mode
> + * @xe: xe device instance
> + *
> + * Initializes the sysfs and required actions to enter survivability mode
> + */
> +void xe_survivability_mode_init(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info;
> +	int ret = 0;
> +
> +	survivability->size = MAX_SCRATCH_MMIO;
> +
> +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	survivability->info = info;
> +
> +	ret = populate_survivability_info(xe);
> +	if (ret)
> +		goto err;
> +
> +	/* Only log debug information and exit if it is a critical failure */
> +	if (survivability->boot_status == CRITICAL_FAILURE) {
> +		log_survivability_info(xe);
> +		kfree(survivability->info);
> +		return;
> +	}
> +
> +	enable_survivability_mode(xe);
> +err:
> +	if (ret)
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);

same...

> +}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> new file mode 100644
> index 000000000000..410e3ee5f5d1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_H_
> +#define _XE_SURVIVABILITY_MODE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +void xe_survivability_mode_init(struct xe_device *xe);
> +void xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_required(struct xe_device *xe);
> +
> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> new file mode 100644
> index 000000000000..19d433e253df
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> +
> +#include <linux/limits.h>
> +#include <linux/types.h>
> +
> +struct xe_survivability_info {
> +	char name[NAME_MAX];
> +	u32 reg;
> +	u32 value;
> +};
> +
> +/**
> + * struct xe_survivability: Contains survivability mode information
> + */
> +struct xe_survivability {
> +	/** @info: struct that holds survivability info from scratch registers */
> +	struct xe_survivability_info *info;
> +
> +	/** @size: number of scratch registers */
> +	u32 size;
> +
> +	/** @boot_status: indicates critical/non critical boot failure */
> +	u8 boot_status;
> +
> +	/** @mode: boolean to indicate survivability mode */
> +	bool mode;
> +};
> +

I believe the only blocker is the while-vs-for loop. I believe the 'drm'
could be avoided, but not a big deal if it is really working...

> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
