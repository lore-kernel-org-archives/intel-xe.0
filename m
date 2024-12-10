Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18325E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 17:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A4910E935;
	Tue, 10 Dec 2024 17:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQZJgPO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA010E935
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733850560; x=1765386560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=LkZDqWbRgjNfM3CF9BCZQ2Uy3lII4uf4eUfOIuqP6ok=;
 b=PQZJgPO4oXVdhbM8djDKF1LkSbAte7hGLUMyk217afaqekOg4iW/ks/D
 5idK2ojb0ung9W72fBW/jnawhYV67kdFnVcU2UOkZmQNX7dIT96TO7syd
 1Du1Yat84SXoa5F3prRsuLRP5HU+khlQXAqmgwgR05ZoIgc9tQ0uElB80
 z417QDJxvPhuMk4CtrcOum1/ojCUnyf+9nCZIy0vGu3aNmfrqnzEcRmg+
 CjDM4VVtfPMgQZV5HfppeJuxBcg7ZA3f6HhpykNuawfEoa3GalZXOEiUr
 CTF5igw8bb1muLK2rGZg0+Q8761murmiAT1zzZlbURykbETgtzLLRaJP0 g==;
X-CSE-ConnectionGUID: ZcszMb6YTLuUiqDukG8rHQ==
X-CSE-MsgGUID: 39TABVT+QC2H3RS+mj7NqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37891490"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208,217";a="37891490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 09:09:18 -0800
X-CSE-ConnectionGUID: INsv6cMRRpavuJApoA/xKQ==
X-CSE-MsgGUID: mtpWrbeNTSWJp2Mtd/nplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208,217";a="95939682"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 09:09:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 09:09:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 09:09:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 09:09:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InhIXoc1L5CKEdsPO1ZSHdreJtDUXEW6ZBcieBat9bFEXLG00GYYhonioORJ3zpnTKsvklmQedbMxSOPbIIe8T2IcsE9AbqZVA20aKCUtoxRGy8Deoy6/ILLzypuw3qdjSgDEYsEsrv8VoAC4dUFv7rftzoyYHt5rjfsgSNSy0ojQ1sTWgd8nqTbXE23hRIDD1cm8p3pcgs7jRQyzzjviH5VMd3ZsVbndQdSaZRq2jataEzqUTafFoDRUHwVt+Rn23S1V6uD63BKsUXqFFFTkdM1gfOs+xL7aK0QsTnlOdl/AxSEdYMAx0tFNEMiid3mKEE7vjZP6uHtzsMZpbn+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LOS+hRGvNGvQ41DQLxlmr7NjZ4bzCQ48f5AOSun6zM=;
 b=tf2duMIICo4MmVqywHNCkLyemBcl+qR8JivJF9e+JJj7lpHVaflGWUvvvgxLJ8o2LvaYB6CtMHuj7GVFZHlhSVSKw0kikuTYlsXZeCpoZXxOPk8EtqbMBkqc0XuUgo/1wcTIoI4w+nPki8qw9AE+ZdsX0Aizk4zsGYRgkWVTBF3CsxS0YvMYUsSriNQCEHXSoT/npsM4/u3XYaABwme4URZZTx4hWcuVCm0H73Llxgh0GaUrOSVTJnhhZoSRKsKiTCQQLyKCN95CtryvRuJiShIJtHwPuCQmgQ+SfI49LwCkSajpEwY/KKnUu+ZTOH9yDSVyKv7junVT/Igxg6c9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 17:09:10 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 17:09:10 +0000
Content-Type: multipart/alternative;
 boundary="------------vEb5furNd0xGg5NXFVm00J4Y"
Message-ID: <8783603f-df20-4e34-9250-1523be67519d@intel.com>
Date: Tue, 10 Dec 2024 18:09:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Wait for migration job before unmapping
 pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <stable@vger.kernel.org>, Matthew Auld
 <matthew.auld@intel.com>
References: <20241210161552.998242-1-nirmoy.das@intel.com>
 <20241210161552.998242-2-nirmoy.das@intel.com>
 <41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com>
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd05d81-4963-4c5a-bd98-08dd193d5d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnJVaWdPV2EyK2NpOWE4eWZqZVpxTndvRitYQ1dWNC9lcGROWnd2eEI4WldY?=
 =?utf-8?B?Q01hcXd5cEdXS0lCbXo0YXZqdTNmckZwblgvdXFvRFdXK2p3WmIzQmlxQXlQ?=
 =?utf-8?B?cGRIZXREWEpoczVvR3YyeDM4YTA5dUNMVnk4YlJCRDFYSlRtaUkxTmEwVnRP?=
 =?utf-8?B?b1RNc0xYYjBoVk96MTlBWHUvTDBsUFMrZFRHdkxTNmxCY29uTERaUkJnekNI?=
 =?utf-8?B?c280ck4vMHBsYWU4Nko1VDRuUURLRGFRdlhlaVFNbnlYcmlKVnBhZWtzUUpD?=
 =?utf-8?B?VDV3blNabkl3S0RzckxqazA1cC9BTmdOUitjMWd5a3YvS1o5RUIycmdEYi9R?=
 =?utf-8?B?dDRDQnhUd0NiSHhzeEwxNmpYY3h0Si9rSzlTbUxGSkV3ZG04b3I1RkFEYngx?=
 =?utf-8?B?bzZBckdqOVZrQnlGTGJCQlk1YkJ3VmtTcHhwRFdDamxOUHZuSEFYczBlNUZK?=
 =?utf-8?B?WjIzQzVzc2dTUU9FblgvakUxZDllZjdTVVNHdlJ4UkFFS1U3UG5oZUZGUm1N?=
 =?utf-8?B?bTBrc0ljRzhjTDF4THRjN04wVUFyRjQvVnMvSFB3T1pXaThYaU5LSGQ2SGFq?=
 =?utf-8?B?ZzNKSmYyR3V1bGlEbU1OcGNxTjd4YitRd3BETEkxdFVDTHNRaVl6WmtBQXha?=
 =?utf-8?B?ekZQT3FXMlFkd2NleXJvVCt3d3RYVnllQTEvOVUyem1NcTNWK3FBM0NoU1JB?=
 =?utf-8?B?cFNRd2VhRlZ3NUJONm1LRU85bmFabVNncmVBc2M2OEkzT1FIUWdoRVVBbE1j?=
 =?utf-8?B?L2xCTXliaG84SXlJb2xYdzJBUXprUFo0Y1BSQ1ptc1hpTitLNkxpbzRBaUdD?=
 =?utf-8?B?Yzl0NkdzaDJXdGNVRnpGUUdsR1hLQkMwdCt4NFg1OFEvVWdmRUhsNnJSN28r?=
 =?utf-8?B?ZGFDZEhDczl1OHRJem93bThzR2ROVmtTZlphcjIvYzFFWE9ab05JRjNXMXI3?=
 =?utf-8?B?OFhvRjN1Vmo5MWNGQW15U2FnUUt2Smt6QkZtZDJaU1lsd29YUVdyZ2plY2Z6?=
 =?utf-8?B?STBiZVF2TzJUQVphTUdGQ2xsNmtuYUUwNEc1M3djd3htL25QVDFrVnhwcXhN?=
 =?utf-8?B?b1JTcWUxbHRMM3FuTVI4TGZrTUhsZDVPZXA2Qm16Vm0ybndrOVhtQzM4aHdH?=
 =?utf-8?B?Mk5iVU4rR1V6eU5USWVlMW5wYkt3TFdjVmZBRGpFVGVMeW1TM2JGTTJmYzgy?=
 =?utf-8?B?Mkd3MEtxdStKa2VNT08wcTJXM25iUGM5aTViSytyM1dqVTVwRmFDdjZZUWo2?=
 =?utf-8?B?eVdNaWhuN2p1Ri92bHBYSEdhajB0blY2eEZ6bkNMVU4wZENjeE5UMWJKL1B3?=
 =?utf-8?B?TzlxUmE4YVBVY2lQMjVGWm83SGRvYzJQdFlhMlhvNTQwdnZyODRhVklKOTkv?=
 =?utf-8?B?bjhnTW5vMW8zQ2pJdnA5K2xmWW5yYk1yRTA1MGxEZU1wT2Y2ZWwwdWYyY3Ax?=
 =?utf-8?B?RnBLTzhVUlpEcGRuc1VzQ2ZYMkRzTTh0UlQ3eHcraE11RWVlRkl5Tm04Ymlu?=
 =?utf-8?B?L1l4RDRseWNXNFhLdjM1T0FxOXA2UTE5SEMwL0l5elpmNjdmQ0VVdjduaG1a?=
 =?utf-8?B?TTBiQlVHVnhYekFPQ21leHFCK3N2cm9wZnBsQytOb0Z5ZzlPUXpHeHdvU0Iw?=
 =?utf-8?B?eE5PZHlVMSttYTVvVy9JYlNpN1BqTjNVbEdxWStydW94enJ2ZXBxVzBHVW5u?=
 =?utf-8?B?QmtlOEJCU2Ewak5UZkRSK3RwKzJTNnBXamhpQ3RJN2ZhTS9lQjdGQWg0dmJN?=
 =?utf-8?Q?mTAV5x6e60WEdg6/2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGozZTlHUWNpV3NpVWVoQU0zK2VzNXAwbUxsM1hXT1NPYlBSekxuY1FQU0VO?=
 =?utf-8?B?UC9RMTF3SG5vdCs3SU5kVFVpUW50Yjd0YTVNMWJ6OERtSTRlVnFXeUtrSFFU?=
 =?utf-8?B?YUZCbWp6WldWd3dTVERhMnJBNkRIdEJqOExOVGkrSjU1TkhDK3ZoR0xVVVVY?=
 =?utf-8?B?RVo1d1ZZK2FOc0EvMDBDRnQyZzljVnBOc0Q2U0k0UWM2SGZ0TEtyRlpON09Y?=
 =?utf-8?B?ejVXQTh2Sk9lSWRqdFRsTldiTTZaTVF5WFl6T0VtVWRSZFhIL01ad3ZYYjNF?=
 =?utf-8?B?b1NKb3FGcnhUbndEUmhRbnlHT1FncmYrT3FqZUdYUU4rY1RDblRrMlE1dnRy?=
 =?utf-8?B?RlUyZ2RyZ3lEd2JMbFEyZmx2WTFDNllzd05CYWJpS3JKclZZWUx3WEFJRmg0?=
 =?utf-8?B?KzFaWWpiNHNGdzBpcFhZTlZMeGZGdWUyQU9lenBwUmt4N2x3RlRaWktEcmVZ?=
 =?utf-8?B?YlQzZVgvWHdva3hQdFZxMzdzYjdsN0tPU3hmOEVNdlZQZklnWG1FRzNMVnRt?=
 =?utf-8?B?TEpCS2t4Q0ZYZ0pVYnpZR0pvRk1VT01xVkM2UktobjVad2wvMCtsR3AxRzVC?=
 =?utf-8?B?ZHRzeFhyRExZa096L3k3QlJBYWVYWXpuRGFPbm0xdVgvcTd6QzhMRTBKSUlC?=
 =?utf-8?B?RCtRdVF1Z09qQUYyZlNEbW9xbEZtcjlYVkxHZTkwcTlhblhldjFIYXY5YlY2?=
 =?utf-8?B?MHlXRExqNmMyL2NBTEwzdy9yTmJoMW9lQ0hKUmZLNnprLy9PTElaV0RaUzlk?=
 =?utf-8?B?UEUyVldXWGdwRldWMG9jMkZMUnRUcnVRdVJ0S1lGTlV1K1dlZE1tQUhtbEp3?=
 =?utf-8?B?dU1aNTJEZ1JPWUdZaUIza1RiLzFzbnhOcUNuNCtMMHMzTkFwRmVyakhYa0I3?=
 =?utf-8?B?ZGl2MW9iV29EK2N0czlobUo1RmJ4SlRnOGR3ai9OYW92cU0rV0lyWmFQVm5z?=
 =?utf-8?B?K3RrWmN3V3NIWXRXRFVaZ2wxWU1PRy9aSDg2VTgvVEtKdXE4MXQ3VmkzeHZv?=
 =?utf-8?B?NEQ4MERSQUJRcS9wZlhjdEVYbGlTY0ErQk9UeXlEa1QvRjZ1YkNsdkVtL0RZ?=
 =?utf-8?B?QVJyaFZKU0pVRCt2bFhWRGwxc3FuQlNwWi85R2FNWE95TFJXNm5HbjE1bnk1?=
 =?utf-8?B?NDFxbzExcy9raGY4QjBjOEtQNUlKQmhOdlBTZUFjeS9xdDhqMDF2U1VzRHNS?=
 =?utf-8?B?aWhvTW4xckxCSnk0SmdreStQdFlldkVDRXlQTWw5QnBzQUF6NVhmbXMrT1pZ?=
 =?utf-8?B?TGJnUUhTNXd3TWduT2UxZ2RkQXdDUGlodERDT3FDQUlwdGM4TG9TY214RXFH?=
 =?utf-8?B?QmREQXlDTUpYd1NyWFZpQUZrSnY0VWY1cmpEd2lPOHJIUnpqdVRvYm1ZOEF0?=
 =?utf-8?B?L1RQalVFS0VHd0JtajI5dmVnNW56M1k4QjF0Vk1SZ21OaExuVUk3emVNTXB1?=
 =?utf-8?B?czZCbjZWYlZ6RHVwTzFpZmIwMDVTbmhKa3lEUVI4cGwvRVgzWTF4OVdNYU1I?=
 =?utf-8?B?L1JtZmtEUTV1eXdYU0g1TWttM3RsQzJWbE43eGFvNGhSaDZVbnVCWFJLN3p3?=
 =?utf-8?B?RkNRenhiT0hsQnZGc0V5WHVaVVRTbzQxUXhTSy94WG5HaStHUVBNR2NWR0N2?=
 =?utf-8?B?MHU3dzY0ZExYMndTcENSWkU3T3ByNERCWEFabTEyQUtQNk5Ld2FYY0hIMDJT?=
 =?utf-8?B?Y3RNTG5TR3Q4MDJHRGs2Vm1RZFRmV3JMbDNsM05CQTRyRDVPdTZkcFZPVVFo?=
 =?utf-8?B?SFo4QnhtaWh3QlI5NWdiSnI1UHhpQjkxRjFxQ0kreTJnL0ZjWTd5ZWgyVUMv?=
 =?utf-8?B?NFBkcFBDRTc5KzUxdTU1R3JYSnRIL0pUTmZISXZyd045cFl1RnJ4Ky9XVXNE?=
 =?utf-8?B?TnNKR1VLd1I2ZitNVXZad1QwRmdZMFpUT3FtMVZlenZ2anpwSklTK2o4S0Q4?=
 =?utf-8?B?OGVUMmpzZHJzYjRtWEdjM0dDMWRQSlRqb3hXTTR3bHd4OE13cGpMdjdPam16?=
 =?utf-8?B?RkMraThUZkIzUTB3aGlqYUN3UFRVTGhXMWtsQVVGUnhXMzNMQkREZUl2dXVn?=
 =?utf-8?B?ZXhFcGFmVXMwM3RZZnhJb3hGclpSQ0tKTFlLd2NXc1hpN0VyUkhlM2tWUlo4?=
 =?utf-8?Q?nAKcvV/FMeCgzk5DY4pCGP/yY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd05d81-4963-4c5a-bd98-08dd193d5d04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 17:09:10.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /43P7psMF/t7HBWnl9UozqJIV7pvEiyxmyL1iiOeC25eXF4khE0XFylkL961shGn1/AbGVfDH47fOf+9OQUNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
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

--------------vEb5furNd0xGg5NXFVm00J4Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


On 12/10/2024 5:39 PM, Thomas Hellström wrote:
> On Tue, 2024-12-10 at 17:15 +0100, Nirmoy Das wrote:
>> Fix a potential GPU page fault during tt -> system moves by waiting
>> for
>> migration jobs to complete before unmapping SG. This ensures that
>> IOMMU
>> mappings are not prematurely torn down while a migration job is still
>> in
>> progress.
>>
>> v2: Use intr=false(Matt A)
>> v3: Update commit message(Matt A)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
>> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system
>> buffer objects to TT")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 06931df876ab..0a41b6c0583a 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>  
>>  out:
>>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type ==
>> XE_PL_SYSTEM) &&
>> -	    ttm_bo->ttm)
>> +	    ttm_bo->ttm) {
>> +		long timeout = dma_resv_wait_timeout(ttm_bo-
>>> base.resv,
>> +						    
>> DMA_RESV_USAGE_BOOKKEEP,
>> +						     false,
>> +						    
>> MAX_SCHEDULE_TIMEOUT);
>> +		if (timeout < 0)
>> +			ret = timeout;
>> +
>>  		xe_tt_unmap_sg(ttm_bo->ttm);
>> +	}
>>  
>>  	return ret;
>>  }
> I assume here we're waiting for the move fence, right? 
Yes
> However if
> @evict is true, we should hit the ttm_bo_wait_free_node() path. In what
> cases do we hit this without evict being true?
evict is false here. It is coming from xe_bo_evict() rather than ttm_mem_evict_*

Call flow looks like: ccs_test_migrate()->xe_bo_evict()->ttm_bo_validate()->ttm_bo_handle_move_mem()->xe_bo_move()



>
> Also, shouldn't it be sufficient to wait for DMA_RESV_USAGE_KERNEL
> here? 

Yes, DMA_RESV_USAGE_KERNEL should be enough as we are waiting for the migration fence.


Regards,

Nirmoy

>
> Thanks,
> Thomas
>
>
>
--------------vEb5furNd0xGg5NXFVm00J4Y
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/10/2024 5:39 PM, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 2024-12-10 at 17:15 +0100, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Fix a potential GPU page fault during tt -&gt; system moves by waiting
for
migration jobs to complete before unmapping SG. This ensures that
IOMMU
mappings are not prematurely torn down while a migration job is still
in
progress.

v2: Use intr=false(Matt A)
v3: Update commit message(Matt A)

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466</a>
Fixes: 75521e8b56e8 (&quot;drm/xe: Perform dma_map when moving system
buffer objects to TT&quot;)
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.11+
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
---
&nbsp;drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
&nbsp;1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 06931df876ab..0a41b6c0583a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object
*ttm_bo, bool evict,
&nbsp;
&nbsp;out:
&nbsp;	if ((!ttm_bo-&gt;resource || ttm_bo-&gt;resource-&gt;mem_type ==
XE_PL_SYSTEM) &amp;&amp;
-	&nbsp;&nbsp;&nbsp; ttm_bo-&gt;ttm)
+	&nbsp;&nbsp;&nbsp; ttm_bo-&gt;ttm) {
+		long timeout = dma_resv_wait_timeout(ttm_bo-
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">base.resv,
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+						&nbsp;&nbsp;&nbsp;&nbsp;
DMA_RESV_USAGE_BOOKKEEP,
+						&nbsp;&nbsp;&nbsp;&nbsp; false,
+						&nbsp;&nbsp;&nbsp;&nbsp;
MAX_SCHEDULE_TIMEOUT);
+		if (timeout &lt; 0)
+			ret = timeout;
+
&nbsp;		xe_tt_unmap_sg(ttm_bo-&gt;ttm);
+	}
&nbsp;
&nbsp;	return ret;
&nbsp;}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I assume here we're waiting for the move fence, right? </pre>
    </blockquote>
    Yes<br>
    <blockquote type="cite" cite="mid:41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">However if
@evict is true, we should hit the ttm_bo_wait_free_node() path. In what
cases do we hit this without evict being true?</pre>
    </blockquote>
    evict is false here. It is coming from xe_bo_evict() rather than
    ttm_mem_evict_*<br>
    <p>Call flow looks like:
ccs_test_migrate()-&gt;xe_bo_evict()-&gt;ttm_bo_validate()-&gt;ttm_bo_handle_move_mem()-&gt;xe_bo_move()</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">

Also, shouldn't it be sufficient to wait for DMA_RESV_USAGE_KERNEL
here? </pre>
    </blockquote>
    <p>Yes, <span style="white-space: pre-wrap">DMA_RESV_USAGE_KERNEL</span>
      should be enough as we are waiting for the migration fence.<br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:41de753b03bb5e86be011277429649d6d644687f.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Thomas



</pre>
    </blockquote>
  </body>
</html>

--------------vEb5furNd0xGg5NXFVm00J4Y--
