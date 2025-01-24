Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EE4C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 14:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2010E956;
	Fri, 24 Jan 2025 14:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTfeVw2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036A10E956
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737730687; x=1769266687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pd3pNxAJeMhzDpWH+kNOmAiXaaevDSYvkgEDwRRqWsY=;
 b=DTfeVw2FCoXU3Aze1i/NtPnq/aY1RdPMTSceycvTGgD0RWUEso8QNApS
 F9uSU4vVnUabG8LseVSjUrH/rqUenL63KqNWAg3AcLg1DOl3DQ0BV5qcp
 a0MCReo7XzdnWHkI7WmT12I0YOzjWpgrX7El/LuZKgEjC7fEHYJuQtA/h
 nQtVUsNeTvaAdg/CcYv6mP1V/N9UdAShKt5WsS9151kRk1BNm7cpcoM9+
 lrWLpI9JnpTBvpRFMMFzcy2zHZblL5g4m8r1bNEBWzE3CJq8j1C+UWeMV
 2qCuts3PFBHVEHRqAw/G+AyJ4oclzqkF1DLpfe/B2nhRiF/OO3iunmRcT A==;
X-CSE-ConnectionGUID: VQa5uJwxR6GLvsXXg4inNA==
X-CSE-MsgGUID: mnsfuTsfSb25fVMzS5NqRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55677495"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="55677495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 06:58:06 -0800
X-CSE-ConnectionGUID: s3jL5FloRHiC8QPLeVwcgg==
X-CSE-MsgGUID: SguCvZtfTbmaS91vtdiZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="112792837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 06:58:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 06:58:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 06:58:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 06:58:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiuTyesDBWn07z4dt2KfgHIVY/H/sTWN/wFTuOHoMRCIy5USRnOJMFgoFvD336Y1lfQqqGyLFj1ABpoPyTY8rtNg2EgAfkuSSD4VkYqin1C6BM0IqeNdg4CmU8gVxmDAkP29av6GEyaWyEz5mr3UanTt3no+BW/NQ8aygMS4E9syFaCwATfnO3fGk2f/3yNvxTNVX6ACCnvFsEfVpllTbJ1bV5+V3vLyER0CYhmvTW5DNlEk698yCmGGfOeJROMBVpvbCcIyqxE7tHbDLJ4tI32K7vC7k/ntvoyCyqV/l+eQ+UER92I7fAUm0Gj6e2xIpqt0Tog9eO/t/Q1rYkQy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K1OggWMjwbtZMOACHUh1AL3xEu/f+xWs1s9jSRCjaE=;
 b=odxcFBg/TOYVOXaT2K7B4Mue3RRVPRdM/BD0sdd6cRwH0YZoZtfPyGfXJysEH1MGgvLcUnu2mzGFtJQYKAgUa03eArOWUCmmxRf5BLEw4jg+bQBslJcBdfR4R7bXjwEnVIfbmiAWhHgwI9zbM0xbvoVMDz6PYpVmi+JQXQ+2Ye/udnmxf4QHSRm1FiBMMrq+Vk8HQhqKCpnfp1QHqiXQ7IaRozuSA7f2ZhfywDspCWhTbD1Pr2/Lkaz1YbGxsZpeJ0XDyttLKyv/jGVVPu/3/M8iYhQivMgIj1/TMI6BLwqBOykmhJ/2fIR4RkVb0CAEpVyJUiZ17jrFte5EdXefbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 14:57:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 14:57:21 +0000
Message-ID: <fba28165-eea6-41dd-938d-9db749eb9f60@intel.com>
Date: Fri, 24 Jan 2025 20:27:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, Karthik Poosa <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <anvesh.bakwad@intel.com>, <saikishore.konda@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
 <a79e18b1-49da-4f14-bd7d-06bc497fa004@intel.com>
 <Z5OImvYNno8VDci5@black.fi.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Z5OImvYNno8VDci5@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d50518e-3f01-4b1a-5e3b-08dd3c876768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEd4cVdtRDh5c3VWdlo1MVMwRUovN1V1ZUhmVU1EbS9DR3orOVNxNVJpTDFY?=
 =?utf-8?B?WTF6cUt1QlJDRWk5dGtlQ3BZcWEzWjMzTGtwZXIvTHUxM0w1cll6QXYvV1cv?=
 =?utf-8?B?ZUNEQ3ZxbEJiOW9GbVdyL1lndW92RXFERHgrRVVlZEc2T3JCd1QveE03dXU2?=
 =?utf-8?B?Q1lJWTVwVWwxSHNBTXVPZW9aYnJUZHBoNnQ5bTJ5VHdtQVYwOHYrbEJPRWRz?=
 =?utf-8?B?eXdqM0U4ZFYzd0ZTQ1dMZ0cweU1MYi83YkNaMjlNeUpMamgyQXBNVFRtWi9Z?=
 =?utf-8?B?OWYvTkVpaDRQQndHcUtSY1VvNGx0MG5JcnBBa0VnZnRPZ21jeVRXWnRYLzZ3?=
 =?utf-8?B?bEdRanpLTURTbzBEVzBzV21BaWloallNYlgxQmQ5ZWIzb3o5bGxRTFJlQWd5?=
 =?utf-8?B?bDQ2YUtzTHRLV0hjWGRoMk51WmhTaDV0NnZkT2ZPOHM4UTFlZmNGcWpjOWE3?=
 =?utf-8?B?a1ZtRkwydExpb3hicFN0dFhOU3phVFk5Q3lUSXlmS29kVE9xek40Tzh5NnNv?=
 =?utf-8?B?TWJHQmo5YkhOTGtNNDBnTGtjeWt4NkwrckxJaU1xYzRJWjlUZHM0RWZDOWhw?=
 =?utf-8?B?QVJrNE1YUFR6OUU1ZDIzaHJSV2w5dUd4Q2doS1paWFhHU3pmRFdxUjdsWS9O?=
 =?utf-8?B?ejBxcFZ6UnBhNFBYelJ4WEtzNGxRRUV1V09pVENOMVBrMEZWdmFjQnJqaGJa?=
 =?utf-8?B?Z3R5SmpmUEpEcGk0eFc5Vmd3QlhuNmxzdFpLU2ZROE81RlB6bDQ1T0lMV2dE?=
 =?utf-8?B?OHhNSlhwb1g2aWFUZ2lSMTAybis5bVp1SlFXb2NCN2NkTEJnMnk1WFBLMnll?=
 =?utf-8?B?MUQ1c0lHNUlHcWUrNHhWWkpIeFc0c3h4UkI4MnVEVEJxNTM4VHdQM1FQN2VL?=
 =?utf-8?B?ZkorSWxEbEVkek1XVmovRWIvaXpXU1QwOGp4SzZkWUF2UXByRzhCeVk3bTFS?=
 =?utf-8?B?V0hUYWhGR1IyU0FxOFM1WFpqbHRKNTNhVGpjYklvZUpLcEVqd3NTSm5SQnZW?=
 =?utf-8?B?Z1crVFhmY1pFQVNSMEdKbDg2Mmhuc29LNUNkMUYyMDUwdWYrL1VQU1JiQ0Vu?=
 =?utf-8?B?VU5adjBkellHUVlxYXd2VENJcG82RGNnK2Q3Yyt0RTNMd0hyT3ZFOC9iNEJq?=
 =?utf-8?B?aW5yT2ZNVFlKWjQrbWJhcndtUEpjYlVxcHhGaUw1eWx1QVRCKzBUdm9EREtu?=
 =?utf-8?B?cUVJbUdQS2xaTHVoNGZFdzg3TGRuM0lZQW9PUnloWXZXNTFpU2JRMFRkaTVZ?=
 =?utf-8?B?TXUyOForQ3hXUkZvVFIrTTdKU1hXMElHVElvZ3dOcGYvSGIrWXdQQVlqbVdV?=
 =?utf-8?B?My9MUURjVXNpVEQ3a0MzVFhiUG83VmhoY2cwY2lQQndzYlpPbGdXQlJKU3F3?=
 =?utf-8?B?T1dNbFJDaDlBeWEzV3RhTnN1SGhVeDVYd3I0bGVPWHBvOHl4Qm82djZvajJq?=
 =?utf-8?B?c05tVjVhbEFsaTlOQm9Pb2JCYjFDOUQxUGkwdVRza3M1VFJTUGVzenZRWVox?=
 =?utf-8?B?bnpYZnlUSVJ3MXVyQjZHOVBBLzhGT2tBVkM1eWEwVXBQSEVpZFFNSExldW42?=
 =?utf-8?B?QXR0TmMzMGVnZWx6aUtuM3cvVUZVUHlqMEVNKy91T05lSUNJN1BDVUtFc2sr?=
 =?utf-8?B?eGtsRjhPZmNvUlNSUEdmcHFpQlRMN1F2bld1RThuV3JVVzNsLzJnemkwTERH?=
 =?utf-8?B?eXh5OUg1K3NDMDJMNjRqYjNuQlNEMDNJbE1Pb3pLR0xTcFdPT2w5Z3NvWTNp?=
 =?utf-8?B?Q0lKc0t1cEFVS1ArZ29nblpiUWhyVHAyVkFWZFpkL29WYXJtRXUzd3M1NSs5?=
 =?utf-8?B?b244LzdSQUJ2NEFiYWhpVmZkVTk4WHArN2hyTUxIYkcvejV0cldMa3MwMThT?=
 =?utf-8?Q?lgEyYZ5MC08mW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGcxQ2NtRFlpSGhzcDAyWWVVOERpVFBLSytuSmhrUTJSeGpyUU0xRm5KR2xQ?=
 =?utf-8?B?UFB0SzIwL0F5dm00VmoxTHZINENNSzBFOUUxWTIzZHE5bmY0cFowU1I4MHdk?=
 =?utf-8?B?OHBIRE1SaytRcS8ybk9SLzVnTnNBZkk4cURpQldBem4yWGJRSURTVktQUC9V?=
 =?utf-8?B?MUhxaThsWExqd1RzcWxZR1dZQUNobTF2RzFubWNncmU1d1VtL01HK2cxamF6?=
 =?utf-8?B?VGtwQkx0ekpORm1aYlAwMnRWcnFnSjIrckx6OUFad1M0SGVLVGZUSzA3RDlG?=
 =?utf-8?B?Qlg0eFJxWVhsWkNTdUxvbzFGZlVQNWRQN2x6TlM2bWQwL1FsU2twRXRVQ1J1?=
 =?utf-8?B?RE9reVB3NCtoY0ttT3E0amliVkZPWFRmK3FjdmlQZkNQalI2bFJSNUNZSXdH?=
 =?utf-8?B?bzF2MzVuUjRLbncxTEtITFVQRDFrMWV0eVpsQjJoYXdjR3lSWHJLZUIvcGNT?=
 =?utf-8?B?ZE9UWGt3L2x2SEFjNEhNLzNGazh1MHg4OFlVbUVUWTVyRTZRTGxsQmNpMFZU?=
 =?utf-8?B?Vk0wTjNnOWRDcFhLV0QxUzNld3BVcFBTUW90MjBKbDBpVHVKc1NJM1JIS2Vy?=
 =?utf-8?B?RG81cnJuL05uRFArWW9kRVR2ZUFLRWNoL0tpNmF5NXBsVFQwdHorMytlOWk5?=
 =?utf-8?B?aFFEOFd2eXVKK1ZoOUdXTndOUlJJc09yT2RGNU9sS2l4VTJrWUZaaGF1ckk4?=
 =?utf-8?B?cmt2Q3oxa1U2SDVjcE5nMEx3Ym1IM3RVbXQyMU43RzJKSUZRbU1qOVgrSG5N?=
 =?utf-8?B?WjM0LzlVdmlYYlkxNHArOGUvcmp2bmswdWZpWWJCK2xLQnRBQUZ6elhZdTBG?=
 =?utf-8?B?dERtdE0wZDEwUTliQUtrV3hsVVI2VFg4RllTQW93dGUxaDZKL2xZYzZMVE04?=
 =?utf-8?B?a2lCUW9PUS9UQUhYSU1iMjU5U3k1L2dTclVHOUJjWEtkYS93NmtQenpxOFZW?=
 =?utf-8?B?L0VPWitBYk53R0E0Qjl6RzR2NjNwYW84OGdOY1pHVC9HbDV0Qk5hUUdSQ0RG?=
 =?utf-8?B?bWU2bVpiM2FlNEtxdFlJVGQxRFBXak93WU9kU1ZkdG5JeHBad2xVZmJaNnQz?=
 =?utf-8?B?MFJzSXo3bVlNRXh2TTFWNk9WRFora0tqc3BuUzh5Q0JVUUViMG9QQlNmYWpN?=
 =?utf-8?B?QVNXa0M0TE4zMmRVNjRaNG8xVVcyb0MxajZtWURta0lsMU12M3F3L1FBQ2Zm?=
 =?utf-8?B?RWk1eUhCK28wNnZtSjdDL25uaGViTkpkMlJKZTROdTIvMzFGQlBwWFRkcVBp?=
 =?utf-8?B?QXRsVVhJN3Z2LzRQTEVhTFI5WmxneHJvT0t0WUFoMjFTYUxHOEJCWE9sc0Zv?=
 =?utf-8?B?MVpRTU1tbEVxblJxVUY0NUR6OHBVZVYrNkxjbmFpSEZBREowK2dOT254OEM0?=
 =?utf-8?B?L2JDcURDSFZyZlBNeXN0Qm94Mmp6eHZtUlZPdzBHaDRMQm1OdzJ3RFJWOXg4?=
 =?utf-8?B?NHdERFhRRHZoU1hUME91UFlsN1ZjMU84eXkxK2t5Y0RxUVFBR1psSWhkK0Vs?=
 =?utf-8?B?aklNTGlwZDl4UEdyWFBUVlBJMkNZV0JHTzNsYzdmdWNQUDg0NXVHSW14TEdy?=
 =?utf-8?B?MEVtSDU4cm95TmNNWXhsZzI0cFBCbWUydXE4U1dZajMwZ1Ayd0tkRndWRkJU?=
 =?utf-8?B?N0xqYmR4YlFoNDBXdzNrRGM4WFFJU3JMZnJBanFBRng3MGRkdGRhVmFtTjdV?=
 =?utf-8?B?Zk9Nemp0a0xKN3NseHQ5THZIQVZYMHR2NkVld2ZhdTkrcFF0aDE2eC9CL1U4?=
 =?utf-8?B?OHN3Rm5oSlJrN1QxMXIzRG9mbWZobXkzUU0wQzhQdGxnK1V6WWlmTk5VVk5u?=
 =?utf-8?B?bHNsYXBWRnh5UlV2cHRkSzBpWElvZlF4enF0dnd1eWJOMy9yMGxCWXBQWWpy?=
 =?utf-8?B?SEF6ZnM0S1RQeFdyVUNneXprc1RjOE12djZFVmVqNzBhUEhZWFU2M3lKTGVy?=
 =?utf-8?B?VlBrQ3VFMGlEUFc5YnBIV3ZQemJuWFVrOHJHdmo2WFBMbXRjYTJaV3NhYU4y?=
 =?utf-8?B?ZEtMeUFJN0p5VER5WGZERU5tdnZOdVdpL0RpTFpVcDhFajRKRU1ZSmdSYnJt?=
 =?utf-8?B?ek1nQXZhbUlDYnlsNXl5RGIvWnNnZVdza2xCL2VUbTZCWHRwOFBHZUxjUmtK?=
 =?utf-8?B?RmV5TlZWOUZNTGpEVytBSDNuRHBhMklnWnJtcEJXZ2NPZkRuaG1xSEt3RVJT?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d50518e-3f01-4b1a-5e3b-08dd3c876768
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 14:57:21.3006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+ACLfPYYyGtSodjsIkoloBTd9kD9Zg2mmO9zCMLNJ/WdiUduRsUyLRreAlNytfJKdGJGQ8/9yI0SfbJTeFwiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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


On 24-01-2025 18:03, Raag Jadav wrote:
> On Fri, Jan 24, 2025 at 05:29:16PM +0530, Nilawar, Badal wrote:
>> On 24-01-2025 11:46, Riana Tauro wrote:
>>> Hi Raag
>>>
>>> On 1/23/2025 8:21 AM, Raag Jadav wrote:
>>>> On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
>>>>> Hi Raag
>>>>>
>>>>> On 1/8/2025 2:54 PM, Raag Jadav wrote:
>>>>>> Add hwmon support for temp1_input and temp2_input
>>>>>> attributes, which will
>>>>>> expose package and vram temperature in millidegree Celsius.
>>>>>> With this in
>>>>>> place we can monitor temperature using lm-sensors tool.
>>>>>>
>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>> ---
>>>>>>     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>>>>     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>>>>     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>>>>     drivers/gpu/drm/xe/xe_hwmon.c                 | 63
>>>>>> +++++++++++++++++++
>>>>>>     4 files changed, 84 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>> index d792a56f59ac..998cfb0ee1a6 100644
>>>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>> @@ -108,3 +108,19 @@ Contact: intel-xe@lists.freedesktop.org
>>>>>>     Description:    RO. Package current voltage in millivolt.
>>>>>>             Only supported for particular Intel Xe graphics platforms.
>>>>>> +
>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
>>>>>> +Date:        April 2025
>>>>>> +KernelVersion:    6.15
>>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>>> +Description:    RO. Package temperature in millidegree Celsius.
>>>>>> +
>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>> +
>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>>>>> +Date:        April 2025
>>>>>> +KernelVersion:    6.15
>>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>>> +Description:    RO. VRAM temperature in millidegree Celsius.
>>>>>> +
>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>> index 519dd1067a19..f5e5234857c1 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>> @@ -34,6 +34,9 @@
>>>>>>     #define PCU_CR_PACKAGE_ENERGY_STATUS
>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>>>>> +#define PCU_CR_PACKAGE_TEMPERATURE
>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>>>>> +#define   TEMP_MASK                REG_GENMASK(7, 0)
>>>>>> +
>>>>>>     #define PCU_CR_PACKAGE_RAPL_LIMIT
>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>>>>     #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>>>>>     #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>> @@ -21,6 +21,8 @@
>>>>>>     #define BMG_PACKAGE_POWER_SKU            XE_REG(0x138098)
>>>>>>     #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
>>>>>>     #define BMG_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>>>>>> +#define BMG_VRAM_TEMPERATURE            XE_REG(0x1382c0)
>>>>>> +#define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>>>> indentation.
>>>> It's a git quirk, you won't see it in file.
>>>>
>>>>> Also you are using the same for DG2. Should have a common name
>>>> Just following the conventions.
>>> Did not find this convention in the file.
>>> BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
>>> Doesn't seem right
>>>>>>     #define BMG_PACKAGE_RAPL_LIMIT            XE_REG(0x138440)
>>>>>>     #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
>>>>>>     #define BMG_PLATFORM_POWER_LIMIT        XE_REG(0x138460)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>> index fde56dad3ab7..5b5c844adf4a 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>>     #include <linux/hwmon-sysfs.h>
>>>>>>     #include <linux/hwmon.h>
>>>>>>     #include <linux/types.h>
>>>>>> +#include <linux/units.h>
>>>>>>     #include <drm/drm_managed.h>
>>>>>>     #include "regs/xe_gt_regs.h"
>>>>>> @@ -20,6 +21,7 @@
>>>>>>     #include "xe_pm.h"
>>>>>>     enum xe_hwmon_reg {
>>>>>> +    REG_TEMP,
>>>>> add to the end
>>>>>>         REG_PKG_RAPL_LIMIT,
>>>>>>         REG_PKG_POWER_SKU,
>>>>>>         REG_PKG_POWER_SKU_UNIT,
>>>>>> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>>>>>>         CHANNEL_MAX,
>>>>>>     };
>>>>>> +enum xe_hwmon_temp {
>>>>>> +    TEMP_PKG,
>>>>>> +    TEMP_VRAM,
>>>>>> +};
>>>>> Can't the existing channel enum be used here?
>>>> Nope, that'd break the indexes.
>>> @badal/@karthik Are multiple indexes for the same channel okay?
>>>
>>> In the current code, for dg2 only channel 1 is exposed for power and
>>> channel 0 skipped. Something like that needs to be done here too?
>>
>> Thanks for looping me in this. Yes, Channel 0 represent card specific
>> attributes and Channel 1 represent package specific attributes. That's how
>> it should be followed.
>> With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For
>> BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum
>> xe_hwmon_channel.
> And how does that work with hwmon_channel_info?

Check curr_crit implementation.
HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL)

Regards,
Badal

>
> Raag
