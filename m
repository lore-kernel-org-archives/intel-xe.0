Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3122DC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 21:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CC110E259;
	Wed, 26 Feb 2025 21:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eh+sSCSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA610E259
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740606263; x=1772142263;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7rJ2qty42uStu9xU+Rd1mrrwIGQaNWXDzUkQ+MxgWDQ=;
 b=eh+sSCSYWhqHtfh25ZJlO9Ot3RDRtXgqJ9xD/f0NtqjnhXatjseJivHB
 kXPVoeeoY66T9UYGeZE2tsuZLvqgf5/zybw0s360Y67HqPW4EroCF+rUr
 3Mdo1tBfrg5110WMfdYmVb6iY5x4xoscyWeyDD0M2MLQhxXKl3SYb8JGS
 ApUbC1w+j+JDKYYy4Pe0gy0gtdO9b9eh3rHnnx0WFjq91vRAaivzUXl65
 /XIwXt/MBW1IkX2lGSeVqe3zz554zazopb5hg+FAqGno+misOV75g084H
 MTBsUSewNfVzPTBCweadGUAykqqfIQEGMlkZD0hf3wFqeYXA5y6bUB6Cu w==;
X-CSE-ConnectionGUID: rUYxBK2/T22ViadaiVLZlw==
X-CSE-MsgGUID: nzzVFQLhSR+03TC1MY8bog==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41325531"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41325531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:44:22 -0800
X-CSE-ConnectionGUID: eRCurRYCT9mrE3YivhNXWw==
X-CSE-MsgGUID: bMW/zc+rSPqD45xi+a3ZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="121938352"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:44:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 13:44:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 13:44:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 13:44:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwBxWRex9g/Vb3aBIm37zE/3vqI7lxIuwLc5mcdZVfN1ge7x5jI8iQjZyqESCKCijX47+oWor7w0aKuF2qM/LpnuxDal2U6/qFZz3NsqWVFMk8MjKmh9MuPhs+02ILRqWNN8JQ+8vg+1hQzYz7sFxH7Uj1cP0dhRDh+c9ebogUDN26S7zVvE0eT9lGiqiQ8C/LoJpDyB2YizWLRQlygIw0zkUAfCuzcSTrxGnEYFUQn2miTJwRPLcbFSX+OKFUefAGPP5oGoYrqHXQ5sj7L+qtNVS1scZCC+SzKyQD4hvfpIVpDaWC2zgzpSVzdvfSK0IRyJm4NSR/hBGRoq0d761w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGzFEqZHgSGsRyXZF+7VkacC+wk6/7s9s0snaloI2C8=;
 b=IeVd3TBoDbhh7DF3XacAGNaDOrLK9iKn9TZxla9hTOAgXLm4iTk/nGsQM9k8Rrl0cEHXG/QiZY/giC8jgIlYkykii92YS/qKz02bG9rnCKb8/gNOMlhD9nAg0Ygf1tk+gLxa3w3o2oJ4NSSefkSyYHRgZXvuGnZcufc82afZnZTziM1Tq0iCzR/w2CgB0WHFzGiD9vo03zE27NhWliK8dwaVeHFjnK5vi4tPFX1gy0KhaoMKinZOMSVCF/RcY0ILLT/avvJu40YjEw6ZU/8AdPjbgSF8jPpyZI3mTZjKZa8w+5ogZLs+SuohETGKgSZZOVstI2ZywGNEDUGoSA3pXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 21:43:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 21:43:30 +0000
Date: Wed, 26 Feb 2025 13:44:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z7+LQtK3KuEdzobZ@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
 <Z75KJSx/uB3rOg+Q@lstrano-desk.jf.intel.com>
 <MN2PR11MB4728730D26596C5F229CCF8192C22@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR11MB4728730D26596C5F229CCF8192C22@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:907:1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcdfeaa-8a57-4e3f-7cee-08dd56ae9c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG1YL1BNZXJDQURqWExrMDZwRzhFR2wzUllQRFBCRjRBWjhPaExWVXZFemFi?=
 =?utf-8?B?cCtnd04zN05LNHRBQWRGY1FHdy8zNnFTWHVzRU9wbFBoNytQb0xwa2ZldEQx?=
 =?utf-8?B?TC9sTGVlbW96ZVlFWHl5Y0VtNmlqdmt1dTZTaklrOFhCWjd6Q1lPR2RkVHBw?=
 =?utf-8?B?Q3BCRnJiVmkvWWdaTDFuaS9vZmx0M3F5VlFmeHpDcFFoaHU1WWQwbmNaOEwz?=
 =?utf-8?B?NjBpUE4wZFF1NGw5aWExWWcxcEtsMU4wT3Fkb2duTVIzMFRweElpYmJlazl0?=
 =?utf-8?B?NUx3KzB2VENkZUtMRnRtVjc5eUFXKzB0VFc3V3dOSVFLRDFTM0RIQnpEYU5s?=
 =?utf-8?B?ZjQycEVKbzJ0ZSs2Nm5NNUM4blBNby9TVVY0d092UW4ySmF0Rjd2NE9wN1hz?=
 =?utf-8?B?YTBqVHJJRFNjUDBUMytXTy9WeDM2ZXg5NXlIZ1pqTXdEUy9QV2ovN3ovTU5v?=
 =?utf-8?B?cjNPYkJJNm1yS0ZQSFdCdFZuWkpQcUpWdEo2TXIxTDlZRzVWVGxGT3F3aWlS?=
 =?utf-8?B?OGUweXpiK0Z0d3c4b3dra1RsRlk5bWovWE04MHlOMHpLM1JldDdCeWVqV0N1?=
 =?utf-8?B?VVRHSzlwUEU1WE1ZSzZDZ0ZsaXM3U3hHazg0U0JBR2tib2tHNlFjTjhUcVI4?=
 =?utf-8?B?cGZOYUtoUWkyc3RUc3F2OGhHWS9YNHJzRzhHSHNnQ0hKSE9LU0kzREpWUHRO?=
 =?utf-8?B?OWFKVmpxQWpCMzBFZTdsNkEzcTF3T0hwYldveXVvYzdxQlpKMHAySTBub0d0?=
 =?utf-8?B?NGRobmo2dTFwbjJ0MmIzOW9CVmV4Kzk5dVR3VW1xQml5VVVSQmVxNG1oUEdE?=
 =?utf-8?B?aWJveVlZS3NZM01IdFQ3eEFxamdocHVhRUFGeU82TGlhZ2NVaDZBLzNDZTU0?=
 =?utf-8?B?eGhkbmhVNzJQTzBhdWVLMGxwdTNXMTFXY1JhbE9RMFRqalB6SVY3eXhZMHJ3?=
 =?utf-8?B?M1RCRWh0Vklpcm9OL0JON2ZvSE0yendNd1ZzeVRmUDR6Qm5TczU3bnRyRkFE?=
 =?utf-8?B?ZXJxRmU2OC84ak9BTVBmbDVFK3J4Tk9POGg1WkI4WFRYVWVuV2ZCVnl5ZG85?=
 =?utf-8?B?ZkNzRHdYQnF4R0xidUVSeEJISlNienJBRVFBZXNOUU9zSHpvTG5BQ3pRc3Nk?=
 =?utf-8?B?TGZCMVJHT2U5aHllRy9NNkd4WmFFQjJhQmIrOXZ1RTVGOFo2R2NuVHpBWU1S?=
 =?utf-8?B?N2t2SXJqYVZ4VEtncXNydkFtYi9jRlI5STY1Wi91NW4yN0ZtT2JPSXptMWZV?=
 =?utf-8?B?NjgzWXZQVWhTZXdBLzlpOE1HUVh6czllOWFQeDFXcUw1dXp2YWt2UGQrV29t?=
 =?utf-8?B?WkIyWEU5T1FlUGEzUjhhV0VRMUtKR0xlWlpJdW90NTlocTJKZGJxNWJtU1A4?=
 =?utf-8?B?V1lnYWlwaSs1NlZuS3YyYXdmdGtTYmhoSVR2ODA5QnFzL2VWTm5ndHRJQUZQ?=
 =?utf-8?B?OTZHL1FGc2xMV1MrditoTDZ4d0VzTVFTK2JQang0YXFmK0x2Q1M1bitCeUFE?=
 =?utf-8?B?UjJ0dFVDbVFRYlQ5Z0JQOXU0eDFDOVJNWFJxZ2xaYmg5SW41eUJPYTFQUE9Z?=
 =?utf-8?B?dGRaL05jaTNGV1JMMm1UWHFDYnlMeWRjRGEyTitmekk2S05xUHJMSisvTnEy?=
 =?utf-8?B?Uk5yU3MvOTJzb29VYk1RYzd0N0YyL1U3WmlMc0p5RTQ5dFFUUXRoVGNxTDB6?=
 =?utf-8?B?MitxWW1tb0JPdWxKWGlSdU1iRm5YaVAxYnBTWGRyR3cxVTQyekEwVFJ4WWM4?=
 =?utf-8?B?Vkd0bnBRS3kxU3pHYWtZcnBGRzJtajVGNUhIZ25FTjBNVkl0OCtnbzZSN09W?=
 =?utf-8?B?clNOdi9aT3hKaDFlYlFSV01ZNUJnaFBrazJHQStkei8vWWEwUjR4KzhiNjFZ?=
 =?utf-8?Q?9Sy2tmNHev2wn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBwZmpBUkdKWVZiZlQyNllMMXBPL3lpelYwYm94UGhkVjhzSk1vNU11ek5V?=
 =?utf-8?B?UklrbE4wRFVPbVRpWFRoOE5GRDQrM1VLT3JpWWlueVVlWDFWUHdEbUNwdGtZ?=
 =?utf-8?B?Yk9yYUh5TXc4ci9ya1ZZMnpwNmgwUGUydytpdHZSNXA1UWZNNGJtb1RhU3lo?=
 =?utf-8?B?QlJSL1FtOTVackIxbnhXNmRrV3VRNXdJelUvVCtXWDlxZ0ErQkkxTVVPRTZ2?=
 =?utf-8?B?Mm9Bdnd2S0s3RnNncm9mN2htL0Y5SWxxZEhKU3YvMFNwVmN6UytMZnUvaGhO?=
 =?utf-8?B?NXZhU2JNRXlIWHNjU1E1R09UMnJBVEVtVWJzMXJuc2loTVVZNy9JRENxdkhB?=
 =?utf-8?B?MEVRRzRLVTBGUFpxb2dRN1VvREhjVU9kb2Fhbi9YdExBOWlXQmI5bFlyQjc5?=
 =?utf-8?B?UHdJajhIL3lpOXBGMnMxYUI2bUxRdXlLSjFmNHc3QjdjVjR6UjNMdEF1SHVi?=
 =?utf-8?B?MXhOQ3ZobTBtNDVRd1NRU2MzUlUwU0pCRVV2bDFsSUV3SVlHTEJYeWZtK0pr?=
 =?utf-8?B?VUVMU2MyTDZ6WStwRkdUUXFoek5xWEY1bmtscmlCOEpGSUFMUjRrSVdFdnNL?=
 =?utf-8?B?Z0tYNURsQllVcEJ0aXNMSWl3L1MvVWJyYjVVV3ZkeUhXbG5PM2dERDdMbFdz?=
 =?utf-8?B?SkcxT1ZwR09kSkZWRnpidHdUYzNsdnF5MDN1bnB6cWFtRmJrVzNRc1VibHBO?=
 =?utf-8?B?WnRqNGw5OFozbHdxaWsvQis4a0xRaS9QeFVsd0hlaUc3L090clF3ZVh3MWxi?=
 =?utf-8?B?MnJWMDNjMFRSTzE2Rk1LZVcrc013Z2JuUUF2czg0VW83WFRCbmlYdzVqdXRx?=
 =?utf-8?B?c2J2anJNZ1pocW84cWt3cFY2TEJhKzJucnEyQVExNGdxQVNaMFNoN3dnaU1i?=
 =?utf-8?B?UEJaN1B0Rk9wcVF0UW1KUEhvVkxCamEzcE5SbXJFQUU0WU1KazB0emU3dXFk?=
 =?utf-8?B?RVcyME5WOFk3Ymx6R3EvOTc4cWhQYlBJY0xJOXoySU1rOUZXQlhHcVoyN3VZ?=
 =?utf-8?B?VzVCSGFtM3RlTXdjTE4wOGo5ZWtyQ0ZJblhQUk1OOXVkUW5nL3A5VTJvNWlK?=
 =?utf-8?B?QWdMYUVWaHZSRGdJWHJYRStxa1l4QUcvelIzUVBjWEs4UXBRQi9Yd1Z6U2pq?=
 =?utf-8?B?bjVIc1hRVVU3TXJZWGlSbTY5ZEJBZ0h5YkZqMTBGYU1TZnVGc1NzYy8vRE0x?=
 =?utf-8?B?V2xvdVQ3U0VYSHE5b2dUM0IxRE81NzhtbHNnRHdOR2EwTVR1K0xGejFCaU5I?=
 =?utf-8?B?U1lEOG5NMXh1WlIyN1RZZ2xVdHlXd09vOVpSY1BNaFNMOUNYNHdXYkxmakQr?=
 =?utf-8?B?VHp5RzZBSVVueitKY3dhdkI5bDdvQ3d4U2FPRitBQ2lXdCtXcFJabGJmU0hr?=
 =?utf-8?B?TkpZYlI1RVZLS3VIUURhekZJTVA3a2hiVWhEV0lCbU9aNldMWkVlVlhibDhS?=
 =?utf-8?B?SEhhT041QjFweVIrYzlSVnNjajl5bnFpaDU3eEdVcHNSVjkyZUNVOHV4ZWlI?=
 =?utf-8?B?WlhGZndjcWE2eVkrZFpoVXpzNUxrMmdMYTFXaElubUgralQ3UGtlSVV5aStD?=
 =?utf-8?B?Qk5ZY242MW84SWlBM1dQdVBHMGdIaUpXV1hnNm9lVmxDNGFmaWRwb0RDQ20v?=
 =?utf-8?B?R0dtWlJpQW1UYUx3NzJ1Z1ZoL1Qra2pHS1MrRjQzT1pHWWMvT1VNazkrYTBv?=
 =?utf-8?B?VUtWZ2NFdkRKT1liUlNVVlZ0NjZZMDRYNHZYdENYbXBNZWpBVW9KbWpQWmVr?=
 =?utf-8?B?TVFjenJZZXptVGFiMU9NZTRqU2V4Z2tibkp0bGl1ZzRkZ1BGaXA3VjlyN2Jw?=
 =?utf-8?B?OW93ZDQwVEF4cTVLWGtDZkhaSXRlUEdJdVBRT0piT1o0SVh3Z3lRcDlYNit0?=
 =?utf-8?B?OHpNTitQVFphVjZiQTNLMGM3bzR6KzJvOFMwOC9naWt6d3ZSRmNVZzgwcXlD?=
 =?utf-8?B?akRray9LWkI5NHNKSG93ZVdHZ2Vsc3RMUlcySDI1UHo5S2p5NE9nU0hlQVA3?=
 =?utf-8?B?eFZhaXp4bzVlKzl4K1Y2QlNWaTR0VnJ2dklvN05WS3lONWxlWTEwOE13bUw0?=
 =?utf-8?B?TVFjdEpoSmx2d0hicmo0S0RDLzVsamVBeEhIT0tCQkU5L01sdWVWdFBaUTcz?=
 =?utf-8?B?YmlJb1pmR21WSzVVb3krdWQvcW5xOWV5RmhnZGQ1STc2TjRscUt4N0ludm5I?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcdfeaa-8a57-4e3f-7cee-08dd56ae9c1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 21:43:30.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7FpCDWPXspQyC5rHDIyYIAK9PHzt+YUvyMuKUU8GaA0s0l8AWmL5x8O6qyMENVBiZP5ws3WGqcDkV99FiJuBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
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

On Wed, Feb 26, 2025 at 11:49:38AM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: February 25, 2025 5:54 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org;
> > Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
> > 
> > On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > need
> > > to clear the scratch page mapping on vm_bind for the vm_bind
> > address
> > > range. Under fault mode, we depend on recoverable page fault to
> > > establish mapping in page table. If scratch page is not cleared, GPU
> > > access of address won't cause page fault because it always hits the
> > > existing scratch page mapping.
> > >
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > >
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > page
> > > under fault mode. On other platform we don't allow scratch page
> > under
> > > fault mode, so no need of such clearing.
> > >
> > > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> > similar
> > > to a map operation, with the exception that PTEs are cleared
> > instead of
> > > pointing to valid physical pages. (Matt, Thomas)
> > >
> > > TLB invalidation is needed after clear scratch page mapping as larger
> > > scratch page mapping could be backed by physical page and cached
> > in
> > > TLB. (Matt, Thomas)
> > >
> > > v3: Fix the case of clearing huge pte (Thomas)
> > >
> > > Improve commit message (Thomas)
> > >
> > > v4: TLB invalidation on all LR cases, not only the clear on bind
> > > cases (Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c       | 53
> > ++++++++++++++++++++++++--------
> > >  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> > >  4 files changed, 70 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..319769056893 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > >  	 * granularity.
> > >  	 */
> > >  	bool needs_64K;
> > > +	/* @clear_pt: clear page table entries during the bind walk */
> > > +	bool clear_pt;
> > >  	/**
> > >  	 * @vma: VMA being mapped
> > >  	 */
> > > @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64
> > addr, u64 next, unsigned int level,
> > >  	if (xe_vma_is_null(xe_walk->vma))
> > >  		return true;
> > >
> > > +	/* if we are clearing page table, no dma addresses*/
> > > +	if (xe_walk->clear_pt)
> > > +		return true;
> > > +
> > >  	/* Is the DMA address huge PTE size aligned? */
> > >  	size = next - addr;
> > >  	dma = addr - xe_walk->va_curs_start +
> > xe_res_dma(xe_walk->curs);
> > > @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >
> > > -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > > -						 xe_res_dma(curs) +
> > xe_walk->dma_offset,
> > > -						 xe_walk->vma,
> > pat_index, level);
> > > +		pte = vm->pt_ops->pte_encode_vma(is_null ||
> > xe_walk->clear_pt ?
> > 
> > The alignment is wrong now, and the flow control is also strange.
> > 
> > You check xe_walk->clear_pt as an argument and then check it again
> > later, which overrides the result of the function.
> > 
> > A possible fix could be:
> > 
> > if (xe_walk->clear_pt)
> > 	pte = 0;
> > else
> > 	pte = vm->pt_ops->pte_encode_vma(...
> > 
> > > +				0 : xe_res_dma(curs) + xe_walk-
> > >dma_offset,
> > > +				xe_walk->vma, pat_index, level);
> > >  		pte |= xe_walk->default_pte;
> > >
> > > +		if (xe_walk->clear_pt)
> > > +			pte = 0;
> > > +
> > >  		/*
> > >  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> > >  		 * this device *requires* 64K PTE size for VRAM, fail.
> > >  		 */
> > > -		if (level == 0 && !xe_parent->is_compact) {
> > > +		if (level == 0 && !xe_parent->is_compact
> > && !xe_walk->clear_pt) {
> > >  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> > {
> > >  				xe_walk->vma->gpuva.flags |=
> > XE_VMA_PTE_64K;
> > >  				pte |= XE_PTE_PS64;
> > > @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >  		if (unlikely(ret))
> > >  			return ret;
> > >
> > > -		if (!is_null)
> > > +		if (!is_null && !xe_walk->clear_pt)
> > >  			xe_res_next(curs, next - addr);
> > >  		xe_walk->va_curs_start = next;
> > >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
> > level);
> > > @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   * @vma: The vma indicating the address range.
> > >   * @entries: Storage for the update entries used for connecting the
> > tree to
> > >   * the main tree at commit time.
> > > + * @clear_pt: Clear the page table entries.
> > >   * @num_entries: On output contains the number of @entries
> > used.
> > >   *
> > >   * This function builds a disconnected page-table tree for a given
> > address
> > > @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   */
> > >  static int
> > >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		 struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		 struct xe_vm_pgtable_update *entries,
> > > +		 bool clear_pt, u32 *num_entries)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> > struct xe_vma *vma,
> > >  		.vma = vma,
> > >  		.wupd.entries = entries,
> > >  		.needs_64K = (xe_vma_vm(vma)->flags &
> > XE_VM_FLAG_64K) && is_devmem,
> > > +		.clear_pt = clear_pt,
> > >  	};
> > >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > >  	int ret;
> > >
> > > +	if (clear_pt) {
> > > +		ret = xe_pt_walk_range(&pt->base, pt->level,
> > xe_vma_start(vma),
> > > +				       xe_vma_end(vma),
> > &xe_walk.base);
> > > +
> > > +		*num_entries = xe_walk.wupd.num_used_entries;
> > > +		return ret;
> > 
> > If possible, avoid short-circuiting this function and instead call
> > xe_pt_walk_range only once. Perhaps use a goto or conditionally skip
> > the
> > statements below that cause a NULL pointer dereference.
> > 
> > > +	}
> > > +
> > >  	/**
> > >  	 * Default atomic expectations for different allocation
> > scenarios are as follows:
> > >  	 *
> > > @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct
> > xe_vm_pgtable_update *entries,
> > >
> > >  static int
> > >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		   struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		   struct xe_vm_pgtable_update *entries,
> > > +		   bool invalidate_on_bind, u32 *num_entries)
> > 
> > I’d avoid using a bool if possible (one bool is meh, but two are
> > definitely a no-go). However, if you do add a bool, I’d place it as the
> > last argument.
> > 
> > >  {
> > >  	int err;
> > >
> > >  	*num_entries = 0;
> > > -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> > > +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > > +			       num_entries);
> > >  	if (!err)
> > >  		xe_tile_assert(tile, *num_entries);
> > >
> > > @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  		return err;
> > >
> > >  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > +				 pt_update_ops->invalidate_on_bind,
> > 
> > See below — I think this needs to be wired in from op-
> > >map.invalidate_on_bind.
> 
> Did you mean pass an extra parameter struct xe_vma_op *op to bind_op_prepare?
> 

No, bind_op_prepare is meant to have the arguments extracted from a
xe_vma_op as it called from multiples op (e.g. DRM_GPUVA_OP_MAP,
DRM_GPUVA_OP_REMAP, or DRM_GPUVA_OP_PREFETCH).

> With the existing function parameters, I didn't see a way to access op
> 

Right, you need a new parameter and input for a DRM_GPUVA_OP_MAP is
op->map.invalidate_on_bind. So either a bool or a flag.

> > 
> > >  				 &pt_op->num_entries);
> > >  	if (!err) {
> > >  		xe_tile_assert(tile, pt_op->num_entries <=
> > > @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct
> > xe_vm *vm, struct xe_tile *tile,
> > >  		 * If !rebind, and scratch enabled VMs, there is a
> > chance the scratch
> > >  		 * PTE is already cached in the TLB so it needs to be
> > invalidated.
> > >  		 * On !LR VMs this is done in the ring ops preceding a
> > batch, but on
> > > -		 * non-faulting LR, in particular on user-space batch
> > buffer chaining,
> > > -		 * it needs to be done here.
> > > +		 * LR, in particular on user-space batch buffer chaining,
> > it needs to
> > > +		 * be done here.
> > >  		 */
> > >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > > -		     xe_vm_in_preempt_fence_mode(vm)))
> > > +		     xe_vm_in_lr_mode(vm)))
> > >  			pt_update_ops->needs_invalidation = true;
> > >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > >  			/* We bump also if batch_invalidate_tlb is
> > true */
> > > @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm))
> > > +		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm) &&
> > > +		    !op->map.invalidate_on_bind)
> > >  			break;
> > >
> > > +		if (op->map.invalidate_on_bind)
> > > +			pt_update_ops->invalidate_on_bind = true;
> > 
> > Wrong place, see below.
> > 
> > > +
> > >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > >map.vma);
> > >  		pt_update_ops->wait_vm_kernel = true;
> > >  		break;
> > > @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  	}
> > >  	vma->tile_present |= BIT(tile->id);
> > >  	vma->tile_staged &= ~BIT(tile->id);
> > > +	if (pt_update_ops->invalidate_on_bind)
> > 
> > I think you need to wire in op->map.invalidate_on_bind here. See
> > below
> > again.
> 
> Same query as above. Did you mean pass extra parameter to function bind_op_commit?
> We right now don't have access to op in this function
>

Same answer as above.
 
> > 
> > > +		vma->tile_invalidated |= BIT(tile->id);
> > >  	if (xe_vma_is_userptr(vma)) {
> > >  		lockdep_assert_held_read(&vm-
> > >userptr.notifier_lock);
> > >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 384cc04de719..3d0aa2a5102e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > >  	bool needs_userptr_lock;
> > >  	/** @needs_invalidation: Needs invalidation */
> > >  	bool needs_invalidation;
> > > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > > +	bool invalidate_on_bind;
> > 
> > This is the wrong place for this. It is a collection of
> > xe_vm_pgtable_update_op, and each individual
> > xe_vm_pgtable_update_op
> > should set or clear invalidate_on_bind. I think you can wire this
> > directly from op->map.invalidate_on_bind in all cases without
> > needing to
> > store it.
> 
> Same query as above. How do you access op from all those functions
>

See above.

Matt
 
> Oak
> 
> > 
> > >  	/**
> > >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> > is idle
> > >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> > activity
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index d664f2e418b2..813d893d9b63 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> > struct drm_gpuva_op *op)
> > >  }
> > >  #endif
> > >
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> > *vm, u32 bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!NEEDS_SCRATCH(vm->xe))
> > 
> > As mentioned in other patches, I'd drop this macro.
> > 
> > Matt
> > 
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /*
> > >   * Create operations list from IOCTL arguments, setup operations
> > fields so parse
> > >   * and commit steps are decoupled from IOCTL arguments. This
> > step can fail.
> > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> > *vm, struct xe_bo *bo,
> > >  			op->map.is_null = flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> > >  			op->map.dumpable = flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > >  			op->map.pat_index = pat_index;
> > > +			op->map.invalidate_on_bind =
> > > +
> > 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> > >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > >  			op->prefetch.region = prefetch_region;
> > >  		}
> > > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > >  				return PTR_ERR(vma);
> > >
> > >  			op->map.vma = vma;
> > > -			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm))
> > > +			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm) ||
> > > +			    op->map.invalidate_on_bind)
> > >
> > 	xe_vma_ops_incr_pt_update_ops(vops,
> > >  							      op-
> > >tile_mask);
> > >  			break;
> > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> > drm_exec *exec, struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err = vma_lock_and_validate(exec, op->map.vma,
> > > -					    !xe_vm_in_fault_mode(vm)
> > ||
> > > -					    op->map.immediate);
> > > +		if (!op->map.invalidate_on_bind)
> > > +			err = vma_lock_and_validate(exec, op-
> > >map.vma,
> > > +
> > 	    !xe_vm_in_fault_mode(vm) ||
> > > +						    op-
> > >map.immediate);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  		err = check_ufence(gpuva_to_vma(op-
> > >base.remap.unmap->va));
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 52467b9b5348..dace04f4ea5e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > >  	bool is_null;
> > >  	/** @dumpable: whether BO is dumped on GPU hang */
> > >  	bool dumpable;
> > > +	/** @invalidate: invalidate the VMA before bind */
> > > +	bool invalidate_on_bind;
> > >  	/** @pat_index: The pat index to use for this operation. */
> > >  	u16 pat_index;
> > >  };
> > > --
> > > 2.26.3
> > >
