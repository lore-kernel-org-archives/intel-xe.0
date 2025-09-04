Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67753CA1014
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 04:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D46D10E056;
	Thu,  4 Sep 2025 04:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRzKvD2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E323110E056
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756960590; x=1788496590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ebOWRI7nObmGOCECVwx/MTQUOGqNe7cqyTUJ0AU7BP8=;
 b=iRzKvD2Jx376WYwEBKNfcDc2YLUXvpHIv0COZEcQ1BvLl67tr9LavCqY
 HtDmKJjNNFpgcN/2KUOGNlom00sWARPFEYLrcnlc7IONR+2SvSe+y9wHk
 ajBRC344LiY7YalIjFujP04ixguCwDU2Vr1toUJiBqC+ovNw+dtmm0D4L
 5Dk6WSGw9z1KbP6/4nXx14bvVYSEr2geSwSWrQIw8aKdjGzLvLudeK/aC
 siorYbMfUry0MJmJYWaTIU7j7mBSwQDkGu5m+binW9JwSi4ywm2k0elml
 sOurr0vw/LWzkRd1EFrItGWcFWWThmoqHEoU7eXt7e96YsetuPtyW8nh1 Q==;
X-CSE-ConnectionGUID: wtscTqxfSvKcpg4nlICVyA==
X-CSE-MsgGUID: sFZaE+G8Qf62SH+Pjm1E9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58321319"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="58321319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 21:36:30 -0700
X-CSE-ConnectionGUID: dmk0tyP9SxCYb2MALT00zw==
X-CSE-MsgGUID: /KZZcjnvRZy6Jlfcn6QB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171028318"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 21:36:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 21:36:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 21:36:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 21:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSPpU4Afmh+moPT/+gG7XutAL/6ZjfD9nM9puiwgjDB4BIX3oQDXH6SlPVvgGyrWRacoO2bkUZj8foo+rmoraFYR9PCmMWRBXgmaqnmz3OfjN+9fdKwekwxRIRMaUTbj6EpyWFVYE/GLzQ2LqcadWuAqj6hKqW/IUX5Ad7Pvi8Frt+ITiDFldxBfiw7ZwbNeSjm2I9gtHGRY+5bQvHRNSnWei1ej0wfXkMq/M+sVRJPHUt28tS8d1PxtaEA3Ll1t097+G6pmWqLuJsGyMEtAcLnftYawaQp0Dg5dyevf/doY91TYyYXoR1mctIaebQAIp4+yaKAFCGYanmVNal5llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0fD1XyznVP+SXiWGkdaVyOV26ViDl4xDdL33tmq9Yw=;
 b=ujLHKWUGM7i+u5ib+4tfBNW8fSUmLgxuBMwqkus7bXQN7GSyR7+3Z3/q0GeW+z+QsJq3GNd0zFpIVG8sv2up2LOAonwxDSh1OHETNGiVxO0vi8wbrKTjERkyT6qWwjD+QRRZ9QV8mvrXW7GxFZ1oZLRigFkiyjRL9gmFbqpVf/etttbKsVAQfXkZFRMbZH3oN1bUwE+zGONHLb8GfnpwfpvOBOMvBMQmdXR21EBJ11Ez5lUUdVrvBERYHywF558nZmNZeGOFJAE0VdN649NDj2z+FjwFxr5l3cQgULKgP6DnCgz6WU+Z7QiiVkraO8wrj8htQ9aDLUPYf6vHbuEGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.18; Thu, 4 Sep 2025 04:36:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 04:36:26 +0000
Message-ID: <f36476ea-3de6-4f88-9dd7-b54e83d6f056@intel.com>
Date: Thu, 4 Sep 2025 10:06:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>, 
 <ashwin.kumar.kulkarni@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
 <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
 <2f87bc32-f43b-4880-aae4-bce73778d9a4@intel.com>
 <3iqgbkqltxvairumtb6msmgi7xtrx4iqeq42qt3jql3r54drfd@oldwqas3rct6>
 <cb5df4ae-9c68-4887-a690-ed1cd196bde4@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <cb5df4ae-9c68-4887-a690-ed1cd196bde4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c25e617-3f41-4174-c7d1-08ddeb6c9bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aG8rSVg0VGNsdEpZam5mQ0YyZE5VVmtTQVdhRmpHcExaVXppbXBwT01jWmZq?=
 =?utf-8?B?bkZ0aWJJTHM1ZGFYYU0ySGZvdWorV3dtUkYxU1oxcGFrYlJzbE9GQ1A1aXpG?=
 =?utf-8?B?M09iWnZmdm1rRFJqTitKQ0pNV2xyZE9QbEM1NVRHQXlUM29Uc3FiNG4rejda?=
 =?utf-8?B?QzA1SGZMN0V3TndSSHlUNVNVREFvUHlpRkNNMkZaS1R1YUpuOEU2OUNsOE5K?=
 =?utf-8?B?VHdUdUVqa05ZQmRtRUI0TzFzc0FoSnlTamlmaWxOTGN5NVJORVVlWDZwWXU5?=
 =?utf-8?B?NFVrZjdDN0REVVEwcUdOcy83UFNTSHozOFh3Tit4VDUwNFVKalRoYTNJaGVD?=
 =?utf-8?B?eTNDZEhFV1FVdkh5d09EOGVMZWRVbjJteWlOTjI5YXFxbU5yWnVsY1VkUzZT?=
 =?utf-8?B?R2NzbnJBK1k4SVhOQmVFdzVtWklLR2FEaStVRG8xRkpZanMzeHJJdzRlRUxY?=
 =?utf-8?B?UCtNYVRDZ09wOGpvNDRGVFIwZkhDTVBHaXlOdEJrcFJNZzRCU3IwMjgwMFV1?=
 =?utf-8?B?aXduV3lkTGdpTFNPVlR2cjVpbDFVWXFObjkwQlIvZ2VQaG41WDFwczYyemc1?=
 =?utf-8?B?alE2UzZ1Vm9ibnR0NGtaMEdqcFQvSmtOTzJQOUxhUkdkUXU3aHRvby8ycW5l?=
 =?utf-8?B?WlVIRHplbDUxRDBRNnhJVTVML0xnMm16c3h2TU5UUnkyODdRVnI0TWdLdE8z?=
 =?utf-8?B?dkp2S2Z1R1lsUG1uVXZUdHZsaHczWHZVRm5HV3dMNk5wUXlRZXo1TnRzaFBo?=
 =?utf-8?B?SmlMelZxVXpmUk51MUVtNjdzK0hNOHBka216YW5aQ01vcVU4TkdxZGxyQUd2?=
 =?utf-8?B?VVJNaTVURmV3RlRVV242UXRpcnJBWjc3WW9OZnJFZm8xdXJEWktXbExZTjhQ?=
 =?utf-8?B?VmZqalRGaHlkUGZkQStMZjgybzdoOVdHYTZjUkVmTnd4ZzJrQnNJY1JzQTdV?=
 =?utf-8?B?RzZORitEdHFhUmdVVndXTElNc0YyYlBXK08rQlZ0UGE4bDArL3V5WFBIYzRw?=
 =?utf-8?B?S292OTBDd0R2SjZsSzQ0WFJXYjU4UWx2blZKOTljeGoyZFZqOW9NV3EzSys0?=
 =?utf-8?B?cG95bnBFWC9Xa2V0QUh2bDdIU2tSNWFNVkRYN1FSS1dhRmtscDhDSXJxVEtY?=
 =?utf-8?B?T1prN2R1WkFjbmNDczNSY0ZLL0ZUSGZtNitpcUlVVldTUVhaTURRYjVVRG9O?=
 =?utf-8?B?a1dBR3EvSGlVVnYzd2VKT055ZmlpYmlHb2dSazVaSkIrRCtpRGh5UjNTYlMx?=
 =?utf-8?B?ZUsraDl0a2Fwem96VHhvYmlCVXBHbmszS3BWUTZtcUF4Wk5CdjMxWTFyTTRi?=
 =?utf-8?B?T2VLTHdGYk5YOUhsTnM4eVhpVFJlYjNLaUhKTXlFcTJ2b0lueTZrZUhBZkV6?=
 =?utf-8?B?Mk1yR05nbHZnMGpzSTNLTnlSZkNRc2wyRnN5aDdmaWllbHM2WDlzSSt2eWcv?=
 =?utf-8?B?bXl3U2tvRTB4QjVlREdQRXA0RDFRSy9QTCtQMXQ2SU1DalBvT25rd0s5b29O?=
 =?utf-8?B?cGVIc2JGUUFHdjFGQjJwNFFpZmVhWjJGK0hRU1crNElMbEU5TnVZRkRRRk1H?=
 =?utf-8?B?T3dKNmJoTmJkQStjVHVGeDNpWS9rNTc1ZThJNmIvaHRBOVB6RzBZUFdFaGpD?=
 =?utf-8?B?eDBGTGZTNnRPM0VVMU1uVTM3d1p3K0pIVXhQL3RRSlI3S2FDNDRaaWYzbFlj?=
 =?utf-8?B?RXlndUY0ZlNuZjFwVStUaFNCb1RYd3ZpSVNvdXhyc0JIcFd1bmdaaURUcm9w?=
 =?utf-8?B?ZmM4NjR3VDhSWjY2MW8xU3Y1TjAreTVtWmxVMUlOb04wOW1hUHphYzBoMmJU?=
 =?utf-8?B?UDJpa3V4SDd4SFZtVERTeStZajh1MGVCN0hXVFpDSmZxeXZWVTRNQzVxWTBS?=
 =?utf-8?B?blJnOGxjL3ltODRYb2g2TVRWT2M4ZHh4YXlicS9KK1h2dGt6aXpmdk5wU3Y4?=
 =?utf-8?Q?K95EL2fYLPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dha0x1Z1A0Vk1iZVdKQmxONXdSMkwrVFJ1bHhIUlVXQ0ttQ1ByMUdHUTAw?=
 =?utf-8?B?ZGhxdytxdi9FYnY1eEx4S2U4NEtBVytidU9heVNLNzJsbEhLanpWbEJUZ0pa?=
 =?utf-8?B?Uk5NOWRIY0l0cHVGbmNaYzg4b01NSGZFcDJFK2RuTTFBWHdhZ2FuNFBtOUov?=
 =?utf-8?B?Z3lBR1pvRVFOVHhzR1VSOXF4cEFWc3RvcXYxa0Y3NXVzYUk0OWlLQkNRRWZl?=
 =?utf-8?B?RlU0K0Q4ek1MblUvZ0pYeURvWjlRazB4NWhnMGJnenBkWGREWHY1bEo0NkJC?=
 =?utf-8?B?bU5hcUlYQ08ybFg4VUFqVVBXV3FQQkYzVHhpOUxydGU3dk5IQmV0QzRydVdJ?=
 =?utf-8?B?QVJYeFpscWwyOFhWRnovTlJuZzBkNW8zaXdjL0xKbWZNTFNqTTUwMkNFTW1Y?=
 =?utf-8?B?ZmNXT0RWNTFnQ0ZvRGNTcnp5Syt0UFFpa1hSaFRIeEdoODNqK3hOajZQLzBG?=
 =?utf-8?B?NWhCUXpzSGs5NUk1dDdia2MwUEtQYkJIdXcrMXBwRHdycXhITElWb1g2NjJu?=
 =?utf-8?B?dVdVY3NiaW1wRU0rdXhHbDJhbzMvczYvSnVZNkJzenB3L3phYlJ3dk01Vi9X?=
 =?utf-8?B?Tkt6Qjg3WFpYMFFScVJpcnkvZnh4cHliMkM4SmQ5WXVkSzRaeDAzbkZmQUF6?=
 =?utf-8?B?L2RmLzMvRHdOQ2xaODUrb2dmell6UnhpRmlZeWxMYS9vU2NDOXVBcGdISFdB?=
 =?utf-8?B?RVdOYmduNEFlc083U01oT3JLUHJRamtZYW9mNFVVY3o1N001QldpWlIzMjRP?=
 =?utf-8?B?bjEzREhrUitWWDY0eHJJb3RPclVRMUMwRThRVkc2WDJnemFvWkk5V3NNZkVq?=
 =?utf-8?B?Vk43TGV1NHJPcGp0UW9tMm1MTHM1OEFHa1N2MmxmbEN6UlAwakl0MFNlaTZQ?=
 =?utf-8?B?VU5sbi9FNVdpTzduVWZoTFdZUDNuMkNySDNXS1ZUcUlRT3lCK25SNU9OV1lD?=
 =?utf-8?B?OEw3czI4ZmwvR3BrMWpOWkxnNUhHbUxWM2MxK2I3bGMxempoT2RHa2NRWTM1?=
 =?utf-8?B?Q3VoNjE2Rzc2Q2NBangyR1A4Tmh2bFh1Zkoyc2RiTUMxOWpyRVorL2lURmNN?=
 =?utf-8?B?WVhGalV3WFEwOEoyTEZXcytWSnFWTU1xZHJxUVU3YUxLV3NGNmNXQTZLOWxH?=
 =?utf-8?B?TG9QVjNyczFBeFl6Z25PZjJWR3g0eXlCdXlKSENUZkd2V2NscUptbGdncFlw?=
 =?utf-8?B?a2RSOHFkMks1Sk1uZno0VXIzVk1LTFYwejladTBmMVI5bHBPblpNakI3dCsx?=
 =?utf-8?B?VDJSQnhuM2c0SFF2U001WGF2ZTFjUlc5aWFBdWtESm1NVXl3cGZoUFlxeVVl?=
 =?utf-8?B?NnRvd21JcTJ5bFdtWW9qcTdWWm9LUjY5dUxmR01weldxMzVUR2QxN2I1ZVMr?=
 =?utf-8?B?UEp1K2R0UExkMGdLd05UYVUvNWtXajZnNlhTdGlIVVczM3crKzlYQ3FVcyt2?=
 =?utf-8?B?NUZuZ3ZJUEtXbVZVS3dKWXIzWE1ld3A0V0dia3lQbWt4dmx3enNVK1E5cVoz?=
 =?utf-8?B?QUpBTzJqTlhMRlQ2K0ZVN1hvemlhaGpzUE56bS84VCsya05OdUxlbjNzdlkr?=
 =?utf-8?B?LzBEM3hZbFc5dk1SOUdXbm9DK3VlYmpBRnlOK2V4WU1IbGhGcmFkZGo3WmQ3?=
 =?utf-8?B?WDZ1dmdTUTlrQmlkbVdpQzhZTHRDZ3Exalp2UlkzVTRiUVl2K1hsN1pnaFhI?=
 =?utf-8?B?Y3Q2Z09LUUhaNWVhY05DODdXVDhqbHRKcjZPK1UrdnVQUWozNnJKcEFlell1?=
 =?utf-8?B?Rm1pN282NEI2QTlvU1BicmlxbWZXOEpxMDZaZWhwdWI3STBpTXNXWFhyL29h?=
 =?utf-8?B?dUxPUjlGVG96NFhGTEJjMUI3ZXVZSnFQSFdwUnlremZUNXc5Z3dBSHhZVWUz?=
 =?utf-8?B?S0ExQjR3QXNQcytZVmhGODdtMDVtVmdvL21EQXUvN2xneUtwV0JRMzdlOU5x?=
 =?utf-8?B?MEJwUUZRdWZpT2c1Z01TUFZjMy9kWThDQktlcVgwbE1ycGE4MHdCY2ZxaGlm?=
 =?utf-8?B?b21kVy91KzlndmJNZDJrMG5YL1JyaGViWm5uajh3Z29tTlEzenFvUmU2eS92?=
 =?utf-8?B?OG1Mcm5GYUtGK0VTNjJLZnZKYVZrbDY0NlBwZ1c4NmJsSDFiR1M1c1FEMWJ1?=
 =?utf-8?Q?LjAgsK/Z78VonT/kq0foN1hx/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c25e617-3f41-4174-c7d1-08ddeb6c9bbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 04:36:26.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDUOFuNjFuDRfnJcHHLn3gxvGSRJwDdqWe0FFN4K+aHssbgrwjOzxj/RPkU+bke0jJ6LqiNRAQXZs97CoRpTZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
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



On 9/4/2025 1:17 AM, Michal Wajdeczko wrote:
> 
> 
> On 9/3/2025 7:50 PM, Lucas De Marchi wrote:
>> On Wed, Sep 03, 2025 at 07:49:39AM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 9/3/2025 7:39 AM, Riana Tauro wrote:
>>>>
>>>>
>>>> On 9/2/2025 11:34 PM, Lucas De Marchi wrote:
>>>>> On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>>>>>> This is a user controlled configfs attribute, we should not
>>>>>> modify that outside the configfs attr.store() implementation.
>>>>>
>>>>> agreed... this was the first user of configfs and I don't think it was
>>>>> the right to do it. However for such a change we should propagate it to
> 
> should I add then:
> 
> Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")
> 
>>>>> stable too. Riana, any possible issue in userspace? With this change
>>>>> userspace should do a rmdir() before proceeding so it drops the
>>>>> configuration.
>>>>
>>>> Survivability mode is enabled in early probe and is used for firmware flashing by admin. If this is not cleared while exiting the mode the driver keeps entering survivability mode on every unbind/bind till admin clears the mode in configfs.
>>>
>>> hmm, but shouldn't driver enter survivability_mode *only* when there were some issues?
>>
>> entering survivability_mode via configfs was a user-initiated action. We
>> shouldn't clear it on unbind.
> 
> I get that as Acked-by, right?
> 
>>
>>>
>>>>
>>>> rmdir is general and can affect other entries. For survivability mode,
>>>> it's better to retain this clear.
>>>
>>> but it doesn't have to be rmdir
>>>
>>> mode could be cleared in similar way like it was enabled:
>>>
>>> # echo 0 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>>
>>> and since this user controlled config entry, I would let the user decide when to turn it off
>>
>> correct. It's even worse if there are other configs needed for that
>> platform, because then the user will play whac-a-mole if he has to
>> unbind to set additional stuff example:
>>
>> echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>> bind 0000:03:00.0
>> # ... oops, forgot to set some additional things
>> unbind 0000:03:00.0
>> echo foobar > /sys/kernel/config/xe/0000:03:00.0/something_else
>> bind 0000:03:00.0
>> # ... oops, now it's not in survivability_mode anymore
>>
>> Doing it the other way is very simple:
>> 1) if all settings should be lost:  rmdir
>> 2) if just survivability_mode should be lost, echo 0


++

Hmm, then documentation needs a update in survivability mode along with 
the patch.

"It is the responsibility of the user to clear the
mode once firmware flash is complete."

Currently do not think fwupd is explicitly creating configfs. They
only check survivability mode on pcode failure. This is an option for 
admin incase pcode fails to detect or they need to manually enter the mode.

Thanks
Riana

>>
>> Lucas De Marchi
>>
>>>
>>>>
>>>> Thanks
>>>> Riana
>>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>> ---
>>>>>> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>>>>>> 1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ drm/xe/xe_survivability_mode.c
>>>>>> index 53c5af4b810c..79426ea46861 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> @@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
>>>>>>      struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>>      struct device *dev = &pdev->dev;
>>>>>>
>>>>>> -    xe_configfs_clear_survivability_mode(pdev);
>>>>>>      sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>>>>> }
>>>>>>
>>>>>> -- 
>>>>>> 2.47.1
>>>>>>
>>>>
>>>
> 

