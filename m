Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDD9C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6653510E393;
	Tue, 15 Apr 2025 22:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJCvSmGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C53010E393
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744754977; x=1776290977;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MAWg59U1QGss/M0iPXV3oLl6fDegBOK390InvWqWc6k=;
 b=AJCvSmGT14IwtiF4r6sOiquYEe+SwgmC2CouRAnq6OSG1JiDVMFuNzUu
 DKEUeoE2UFJbfjKh5yEIWMDRAhr0CQz2XGs2577hJlvEx8zinwn2WpWqj
 kOFoQu0Ga660GB1IkSkli5JkDWLcWVEIkj6BEaC0JduPyxyLvrjyx+hjC
 +Eu+uxNzHEY228QUikCUeRida/lCeZmEk/phw5sCbUoiwNTVdH4gn4SGu
 kuEgScLY7wDMHgr1UD5gN41Sh2YNZ/9JfL1Dtp4GFISYb8cVRp/DwI5DF
 n+mHE7uoqgXtRoaOMLFFHKQ3iogEFEvpQqc06IXRKzq8GhCi8gM7TN7CI Q==;
X-CSE-ConnectionGUID: YBLCS1kESvizlzC2U8Q4hA==
X-CSE-MsgGUID: wkIdIRU+RY+Kz2kmSZduWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45420474"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="45420474"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:26 -0700
X-CSE-ConnectionGUID: ppohJVXwSAW+GX3ZUAhruA==
X-CSE-MsgGUID: yrqTLgnDQPqI6Qtg9uAgOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="161282941"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:09:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 15:09:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 15:09:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 15:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9kOn35zUjJN2z8OiqdCHCjFf+p98SV0YHta/MNU4e14agDRcdZVU13QNE6/9lCxQwvK/qIgYJ3WR//G79JUsbtJAJw6nykNbpdt5wo0UVFlcC4vk96jdZhLcXGr69FIe6+/zW13vrpLLV4TLKSX+eJBUemEUnBOyoSQEd/Re67RBDAUjyFR3EKVVU6YV3xuL1M6LTJjxEGera9bjXMu+zgy3as1CIl5KwssNoT4mOYnHLrHy6GgZl3FfeYq5itP71chmT4QCzIY6eKditEIqZ6YFPikr5F0xxD4QzlRbXR2GrRe7CTDWJ9XudOnzCno/tq9FUkdBvTiJ/m75YHNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMbs088Y4+Y7ee0I3/eflefKO9e+OkMAvbO4h6Sd1Vs=;
 b=ipmiSWAFmAIkvExGyprAPa6lNUIvmIcg3dW7mBArrSIv0dE0kBG7J8f4xfVew+O5OmOjcF8tn9Yspv6mjuuQsV2sB//2sqIrlsextf0eAV6lN3H2q+IsdcHkksuD03dEWv7DoMO8Nw1hqbubfsRX8C2DOhMyM1yOAsh0w8BWMA5gfm2Xlmv9HkiNTmQDgjXm5mcTJY6O96ceZ1OoHkwejV26Y9OFkLDEHH4QhtcT0/TwvAY6TtCPLiAj0cSuLTWv5CqkOVpSi86zJJpIwlVUVmPPI+QwDbkAiBAGk4VRd1qja2PeHgunHDPrQB8CCwKMb6EFRmt8sN66Yej+LBUDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 22:08:41 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Tue, 15 Apr 2025
 22:08:40 +0000
Message-ID: <fb986260-fa2b-4e2b-8774-d9a0e1e0f8fa@intel.com>
Date: Wed, 16 Apr 2025 00:08:35 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v9 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-2-tomasz.lis@intel.com>
 <d4db6abc-745e-4d20-9943-9ed7d3cb86b0@intel.com>
Content-Language: en-US
In-Reply-To: <d4db6abc-745e-4d20-9943-9ed7d3cb86b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c772eb-77a3-4d75-9111-08dd7c6a142e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWQ5OFhHUXhtZzVVQTROWFkrbml3TnVHRHd4dGRlMy9NMXdMZGpMY1VsWjVT?=
 =?utf-8?B?bU5wWnRmdmc3WmFHdWdRNkhPT2luVS9RY2xYaXpKc3VTVXZER0t6dEcwUjJu?=
 =?utf-8?B?ODBEdjZRL05MTXdiVXJhUjdBN0dTWE9IRlJrRk5rd04xT1RJVEQ4N3BjUmNx?=
 =?utf-8?B?Y1UvYlFQRzVqeTdKQURteUszVHl4TUxWeEdyeE5hc3BuQjQ4aXNLWkFHS2Vl?=
 =?utf-8?B?NUUvZWtwM1VLZmdzRXNsaElHYmcwdDNoelRUL1U4eXVDaFVMSDZvZkoyWXZI?=
 =?utf-8?B?MUd4VnJuWTdDTk9XM3ZZUU1pTTNOMGxpZ2EzM2h6dm9USDkxSGM1SzFlNjRS?=
 =?utf-8?B?SmpIN25EY2diZitYVjZLNW55T1VZd2JoQW10OFU3VURHUVlNVEg4a2JUU2s5?=
 =?utf-8?B?c3FXWStwbVhGQkNtd0FrbmY0UFF0Sm5IbkJFMnpGQUFQWm5aNk8veTFpaXJq?=
 =?utf-8?B?TGFvZDZMZ0FLNE9xYWhHSGhDeGJkY0dMTWdtQ1BMMnVobG9sRVVTRU5pdlMx?=
 =?utf-8?B?T2dCTXJkOHF4SjBkUlRTN0pWM2hjTHlJMTNpejBqYUVjVkx5WlA5YzMrdWNF?=
 =?utf-8?B?a05hYmdScklxUGxtd2V3RTlpWFVqQVZBTElJUXBaY0ZLK2lrUkNpNDBhc0Vh?=
 =?utf-8?B?QVoraE8yNjYwUlAzWklGMGtGZEUySHkzQ1B0a1dseVJPNWZWbFFzUzNCTDRu?=
 =?utf-8?B?V2NVYmZzT2VRWE9STklrY2VPakt0ejlaMlN4WG1EZ2lLRUt0bUhYQTVHM2RX?=
 =?utf-8?B?alJjbzJ4TzlnRm9CemNEZkRlQldtM1kxVFdSbEtBdytsSUd6U0h0TGNKVGE5?=
 =?utf-8?B?Snh0N1hWU3hjNHJuKzJyQ3lmd0xuNkRZdlVyYm9ocHE5ZWFkZ2lqSVgzWVFh?=
 =?utf-8?B?dTlTdFhDKy9uY2RhRXRHZ1lNcFRCaFAvSURDUCtoMjBaV0wrL2x3K1NrcC9C?=
 =?utf-8?B?Q1U4VkkyQW44SHFMWldoVlQwb3QyRXdFQ3JNYjBuM0c2ZUpxVklJVEJ1djc2?=
 =?utf-8?B?K0F0UER4aXpRTnp4OHdsQVFCVW1iYmpjdlI5ejlFUTNzRGZGRjJEb21Dd0VL?=
 =?utf-8?B?UTN5ZFJtRTlBbVVDS1EyMEdoTG9DZm9ndGFKTTdFSENjaUVxZDlHNThDTmhQ?=
 =?utf-8?B?RUxGZjVJcGxsTDBGRVF2U1Y2ZUtSQ0dwSHpzVW9nTlMvNGY2bDlxQ01UaXZl?=
 =?utf-8?B?K01pWXdpU1pSVnN2M2NJUXFNWnBxOHV6YVhncEliakdCMjk3S2c2VnN5Smlx?=
 =?utf-8?B?Sk5Ha2syUDZsbElMckdVU25kNTBaRW84ZXRpMi9PamFRVjZ3Y3JrbStRSG5n?=
 =?utf-8?B?T1MrUXI0ZHZ6SERWaFFTY3N0ZUV5cDVodDdvdEhZT1FMT21jeDEyNGk3WVpS?=
 =?utf-8?B?SzEzYUxaTHVlT1Vob1hnRlROWnh1M1o5T3QxOEZKT1VWc3haNDFUQWdPNy9K?=
 =?utf-8?B?bWs0UVcyWWJyS3Z4WjlJZU5kRXJhQ3dIKytPL09KOGE4azlsU2dPN2grWnU5?=
 =?utf-8?B?a0kzOGw0b250WWQ3MVBvanVpM29YSEx6TGdDNmlNNzhXeENFdTU3RXpmcWVU?=
 =?utf-8?B?K2xBOTQwMC9URzdKelhWSEs3VjBXUllCTUxjY0FsNUVRMXJnNFJkSGNmTkRz?=
 =?utf-8?B?R3FPbzdjbmE3QUFLQXZBbS9tTTJ1M2FQdzM2Nys4WSs5U0lBQmNzWEJtZzhR?=
 =?utf-8?B?MkpRa3FBeWc0a3EwcUUvTnpkcUxUS20yNG9uQUlPMXVUWUpiTmhlTDlTVFY3?=
 =?utf-8?B?ZjMxZWJJS0d4cjFhcW0zK1gzbThkSzZuZ3Z4V2kzMFJSSEdDUkhzbGcrdDZQ?=
 =?utf-8?Q?vVdQcNpSHQtTS+DpXcXr2+IpxcLgmV6fvKUzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVBqRDNqU0lPa0owVDRjdzhwYVlrTHYwU1Yvemx6ZHphd1FHd1VNRmgxQXli?=
 =?utf-8?B?OSttbHhEUzZKZ05EQ3owajdjVW9NNFVTNnlCeE94dDJCUThONVk1aklBVGVH?=
 =?utf-8?B?bzFQcWFwQTdDVmRGQlNPOXc1NXFRQk8wZ0UvWUVKRVMxWjVoaEtUVHB4ZEl1?=
 =?utf-8?B?a3ZMckE2bGd0enp4emJ3THdKZWpjR0grYjNmd3ljRytLUVBnWG1oUG5VL3RX?=
 =?utf-8?B?aWhXTkV6QU9LNjNqZjRqLzFJSCtndDYvZlVGdlo1Qi9Sc1dZMDhHTjFjZ3d0?=
 =?utf-8?B?L09VQnJibWdHeXVNTzBtN2I4WFU1MnFRQmRKZVlYd1J6eWc3VjlybkRUNGV4?=
 =?utf-8?B?U2hjRXA5NFdJMVo2NUd3V2pyaVVsSHh4cW43bjFoQVZVbk1rTFdjeGVvMis1?=
 =?utf-8?B?R3ZhaSttSklxS0V4bnJ3QXlJeElJRzlzaDJBa0FVak5WczVaSmdGUzlrbkpX?=
 =?utf-8?B?YXEwT3RGZ0dMMzJuUXpTcUhXUDJkY01zdE9GY2FML05DL0VaWjdldklxdFRu?=
 =?utf-8?B?dGRqVmdkTkplUWVpMmY4bUMwTDBreFJCaHNaazlSZXhHOG1ERXYxWVRTTGlz?=
 =?utf-8?B?TzUybnVhc21qTUVwbk5TTUpEWmhHRENpT2cwZjhFY1QyWk93MWlxWitZTG1N?=
 =?utf-8?B?L28rZmFNbUZRK0lXcUZwd1JKbzh2bGRteE4rQkhQQkI0L1FVWllrZDhoWEhs?=
 =?utf-8?B?MjNWVGk1L041Tmk3NkdLdm9sRzg2akhyMWZ6eHptN3FZcURTdGdwb2hlUnVr?=
 =?utf-8?B?djFJRE9EZFNPVDMyVkpRWGVycHlMQ09XZ2N1WGo0WG1EYzU4em81V0FuMGho?=
 =?utf-8?B?dVZ2cklGZTRSeDlzYzNYcVNsVE1Kdm9rZVYvNVZBMithRk9xMEg1N2t1Z09H?=
 =?utf-8?B?MUk2ZW5mb2FEY2ZEN0FSVlN2OHgyRHBBaEZCR3NJVWE2WVZrUVFFYkxOSzJN?=
 =?utf-8?B?RXVMRHFTc3UyWS9UWG40VGI2UEhFbVR3NUpvdnBreENrK0JRRWtmWVAyZ24y?=
 =?utf-8?B?Y3RrQmxLdVhpN0toWUFYNEFCYTJ3OUdvRVpmNlBHbFduM0k1UURBalR3VWtH?=
 =?utf-8?B?UC9WOC9yTHNYMG5jQzdSQzU3RndDQm9JbkVnQUhNYk0wSitpOHlRV3RXa1lR?=
 =?utf-8?B?R2VoQ2VmVzByV0ttWDV4YW1qQ0pBNnBhN0NMR1dhZ1Q5cUVEVHdaVUVpekc3?=
 =?utf-8?B?M0pyNUJsd3RQQVNhYUtjWFhaQzc5NXFDMjU5QmNaZlpDVzVHWndtM2pKN21G?=
 =?utf-8?B?cTV0ajA2YlVKdFFrVUd5aGtDSmVwV1NIWUtVckxIbUEzRmhJblBaYmM5UW9t?=
 =?utf-8?B?aVNrY2h5ZHZzY094R3c2OFhFSlJzNDRlaWpCSHp3SmU4c0tPMjduZXU5UmJ4?=
 =?utf-8?B?clVtelEzR05WVnIxbHk4QVRteVZJbUw1Vi85ditDWUZKQU1LYkN0L1ZoNUpq?=
 =?utf-8?B?WU52Y0NyKzRLM1laaXQyVnJDOWxadXJleHlxT2kyc0UrenVPbHRidVBOUWlo?=
 =?utf-8?B?bXNreXQ4RUJ1WnU0YUFsTVJEZVIwTlAwSUZ2VWE2a2o0ZEVuUWRCSE05QTJD?=
 =?utf-8?B?QnFsMFUvQ24yenltTVZSd0FnQktFOExZUEczNGJjNTE1aFZKU3loYWtMWDQy?=
 =?utf-8?B?b3Zjc24wdElqRi82dVJvTzJEcXFJSERJcVFPaTVxejQyWU00RHlXNTQwc1c3?=
 =?utf-8?B?OTR6SDYyN0R1SmhyR3prTjdza0ViS1FNZzFOcFh4U0V4R1prRmtXNUl4ai9C?=
 =?utf-8?B?ZW50ZHRmTGZ0cmRsYU5QOGVyNlpxUkYrSFJ3WFNiKzhGSEd6aDI3aXdRbW9s?=
 =?utf-8?B?bUplNlFwYzRWMno1MEpVR05XdkQ2MnRqQ2IwSWMrYWN5M0w0MGp3b05DOEdP?=
 =?utf-8?B?ZDBpNkNqZEFlQTRVWDZEejY1ajFyL1doTzNMa3ZqeWtYemZ1b3o5cENLbzgv?=
 =?utf-8?B?RTA1d28ra1BSWHNqNEFTQTZpcjlqWVU4QTNMZk9tbGp3YjZTdzdBYTdQWGVp?=
 =?utf-8?B?L1gwTlZuMTRYNk5VOVdCRE9LNkhnVWRScS9pblVtM1c0ekVtQUs3b09WSGhC?=
 =?utf-8?B?RmRHRkhibmNEZ2ZoRUtHaEgybnBOdkF1Z2JScDVPSkNCeTN3SkJidGxIeHFO?=
 =?utf-8?Q?Xrbk2NU6Wl1uraO5rnkj8/Bj0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c772eb-77a3-4d75-9111-08dd7c6a142e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 22:08:40.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbsgPcG5SirGizUrZRr1Y0GhDQ9zeJeIKAnAODVtD35MG6rM9dl8dxO5FyKBtkQR2VN1dDScdk6vJ5+5t94tTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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


On 14.04.2025 10:53, Michal Wajdeczko wrote:
> On 11.04.2025 22:36, Tomasz Lis wrote:
>> The balloon nodes, which are used to fill areas of GGTT inaccessible
>> for a specific VF, were allocated and inserted into GGTT within one
>> function. To be able to re-use that insertion code during VF
>> migration recovery, we need to split it.
>>
>> This patch separates allocation (init/fini functs) from the insertion
>> of balloons (balloon/deballoon functs). Locks are also moved to ensure
>> calls from post-migration recovery worker will not cause a deadlock.
>>
>> v2: Moved declarations to proper header
>> v3: Rephrased description, introduced "_locked" versions of some
>>    functs, more lockdep checks, some functions renamed, altered error
>>    handling, added missing kerneldocs.
>> v4: Suffixed more functs with `_locked`, moved lockdep asserts,
>>    fixed finalization in error path, added asserts
>> v5: Renamed another few functs, used xe_ggtt_node_allocated(),
>>    moved lockdep back again to avoid null dereference, added
>>    asserts, improved comments
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c        |  35 ++++-----
>>   drivers/gpu/drm/xe/xe_ggtt.h        |   6 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 114 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
>>   4 files changed, 107 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 7062115909f2..5a37233f2420 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -429,16 +429,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>>   }
>>   
>>   /**
>> - * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
>> + * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
>>    * @node: the &xe_ggtt_node to hold reserved GGTT node
>>    * @start: the starting GGTT address of the reserved region
>>    * @end: then end GGTT address of the reserved region
>>    *
>> - * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
>> + * To be used in cases where ggtt->lock is already taken.
>> + * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
>>    *
>>    * Return: 0 on success or a negative error code on failure.
>>    */
>> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
>>   {
>>   	struct xe_ggtt *ggtt = node->ggtt;
>>   	int err;
>> @@ -447,14 +448,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
>> +	lockdep_assert_held(&ggtt->lock);
>>   
>>   	node->base.color = 0;
>>   	node->base.start = start;
>>   	node->base.size = end - start;
>>   
>> -	mutex_lock(&ggtt->lock);
>>   	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>> -	mutex_unlock(&ggtt->lock);
>>   
>>   	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>>   		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> @@ -466,27 +466,22 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   }
>>   
>>   /**
>> - * xe_ggtt_node_remove_balloon - release a reserved GGTT region
>> + * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
>>    * @node: the &xe_ggtt_node with reserved GGTT region
>>    *
>> - * See xe_ggtt_node_insert_balloon() for details.
>> + * To be used in cases where ggtt->lock is already taken.
>> + * See xe_ggtt_node_insert_balloon_locked() for details.
>>    */
>> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>>   {
>> -	if (!node || !node->ggtt)
>> +	if (!xe_ggtt_node_allocated(node))
>>   		return;
>>   
>> -	if (!drm_mm_node_allocated(&node->base))
>> -		goto free_node;
>> +	lockdep_assert_held(&node->ggtt->lock);
>>   
>>   	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>>   
>> -	mutex_lock(&node->ggtt->lock);
>>   	drm_mm_remove_node(&node->base);
>> -	mutex_unlock(&node->ggtt->lock);
>> -
>> -free_node:
>> -	xe_ggtt_node_fini(node);
>>   }
>>   
>>   /**
>> @@ -537,12 +532,12 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>>    * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
>>    * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
>>    *
>> - * This function will allocated the struct %xe_ggtt_node and return it's pointer.
>> + * This function will allocate the struct %xe_ggtt_node and return its pointer.
>>    * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
>> - * or xe_ggtt_node_remove_balloon().
>> + * or xe_ggtt_node_remove_balloon_locked().
>>    * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
>>    * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
>> - * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
>> + * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
>>    *
>>    * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>>    **/
>> @@ -564,7 +559,7 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>>    * @node: the &xe_ggtt_node to be freed
>>    *
>>    * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
>> - * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
>> + * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
>>    * this function needs to be called to free the %xe_ggtt_node struct
>>    **/
>>   void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..d468af96b465 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -15,9 +15,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>>   
>>   struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>>   void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>> -				u64 start, u64 size);
>> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>> +				       u64 start, u64 size);
>> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..fa299da08684 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -560,35 +560,43 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   
>> -static struct xe_ggtt_node *
>> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
>> +static int vf_init_ggtt_balloons(struct xe_gt *gt)
>>   {
>> -	struct xe_ggtt_node *node;
>> -	int err;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   
>> -	node = xe_ggtt_node_init(ggtt);
>> -	if (IS_ERR(node))
>> -		return node;
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>>   
>> -	err = xe_ggtt_node_insert_balloon(node, start, end);
>> -	if (err) {
>> -		xe_ggtt_node_fini(node);
>> -		return ERR_PTR(err);
>> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>> +
>> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>> +		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>>   	}
>>   
>> -	return node;
>> +	return 0;
>>   }
>>   
>> -static int vf_balloon_ggtt(struct xe_gt *gt)
>> +/**
>> + * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
>> + * @gt: the &xe_gt struct instance
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u64 start, end;
>> +	int err;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>>   
>>   	if (!config->ggtt_size)
>>   		return -ENODATA;
>> @@ -611,31 +619,77 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	start = xe_wopcm_size(xe);
>>   	end = config->ggtt_base;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
>> +							 start, end);
>> +		if (err)
>> +			return err;
>>   	}
>>   
>>   	start = config->ggtt_base + config->ggtt_size;
>>   	end = GUC_GGTT_TOP;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>> -			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
>> +							 start, end);
>> +		if (err) {
>> +			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
>> +			return err;
>>   		}
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
>> +static int vf_balloon_ggtt(struct xe_gt *gt)
>>   {
>> -	struct xe_tile *tile = arg;
>> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
>> +	int err;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	mutex_unlock(&ggtt->lock);
> btw, this explicit locking done by the caller seems to conflict with
> another patch in flight [1] what's the plan if it would be accepted earlier?
>
> [1]https://patchwork.freedesktop.org/patch/647204/?series=147326&rev=2

Then the lockdep asserts from `xe_gt_sriov_vf.c` would get dropped 
(because the same asserts are also done in sub-functions within 
`xe_ggtt.c`).

What would remain is lock/unlock calls. Related vf_* functions would 
either be moved to `xe_ggtt.c`, or ggtt_lock(gt) / ggtt_unlock(gt) 
helpers would be added there and then used in `xe_gt_sriov_vf.c`. A 
third solution is that private xe_ggtt patch could just be reverted.

I'd opt for the helpers solution.

>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
>> + * @gt: the &xe_gt struct instance
>> + */
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>>   
>>   	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
>> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void vf_deballoon_ggtt(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	mutex_lock(&tile->mem.ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +	mutex_unlock(&tile->mem.ggtt->lock);
>> +}
>> +
>> +static void vf_fini_ggtt_balloons(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void cleanup_ggtt(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_tile *tile = arg;
> looks that after refactor a better argument here could be "gt" instead
> "tile" as then it could be passed as-is to below functions
>
> or some day in the future we can try how it would look if some of the
> static vf_ helper functions will take "tile" instead of "gt" ;)

right, makes sense. will switch.

If/when mapping between tiles and gts will get more convoluted in the 
future, we might want to alter that.

>> +
>> +	vf_deballoon_ggtt(tile->primary_gt);
>> +	vf_fini_ggtt_balloons(tile->primary_gt);
>>   }
>>   
>>   /**
>> @@ -655,11 +709,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>>   	if (xe_gt_is_media_type(gt))
>>   		return 0;
>>   
>> -	err = vf_balloon_ggtt(gt);
>> +	err = vf_init_ggtt_balloons(gt);
>>   	if (err)
>>   		return err;
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
>> +	err = vf_balloon_ggtt(gt);
>> +	if (err) {
>> +		vf_fini_ggtt_balloons(gt);
>> +		return err;
>> +	}
>> +
>> +	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> pass "gt" here to avoid reverse tile to gt dance in the action

ok

-Tomasz

>>   }
>>   
>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..d717deb8af91 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
> otherwise LGTM
>
