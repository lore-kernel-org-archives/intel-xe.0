Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301D5C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 17:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006BD10E42E;
	Mon, 29 Jul 2024 17:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhfquCla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E2810E42E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722272621; x=1753808621;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=uJ5AkcZoaAdQ4kXDpivozWioIb2xdMEICRMwLQ6xn88=;
 b=GhfquClaroG10iLpm4SJWzJsZOJ/iy4rpzIwCOSAXXpHYt8NdIhqhokQ
 heOgMcvEGeEncys8gFTWOxv7bKaTRngwT1rVFuuemD2YspFndbEVjRoWO
 Sa3Qx/7Tj7HczRjybe4LrVNlqLPcs+/IDqzjTTu3jUlav6zIOtPYQEq6U
 CVZ82EgdGgJ5ZMXSE+CICJhN7gV347IJy4LXN5N7KXioyM7cKRJj4GYSg
 X94K158nEeEtk3SX6dofg5fz/bDJOO0vj73DCotUJMEtp/pujoCCIwUj4
 J5AZsPpkKRY0DpvFXILfc8FZwOb9d4mhsZq7gOCC0ItJ/pt/+CRbu+CCE Q==;
X-CSE-ConnectionGUID: E4ZUiKSXR26V1f2hXPJafg==
X-CSE-MsgGUID: Dpk/KR+jSiWxDSRpm0+QyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="42567649"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="42567649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:03:41 -0700
X-CSE-ConnectionGUID: 5KXavOJrTzeit74LrIJrDA==
X-CSE-MsgGUID: oHbnvFF3SMyMdO0IFLSS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58366164"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 10:03:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 10:03:39 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 10:03:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 10:03:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 10:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jH/GhT51tb8bAZDFOnZHuGcuLdTG4Jce+BMrW+/M4L9o6w80Ij/Ex26p0jNXWY1AEgGRgRkbWF5zHw1+84uFwDOW73pqXf2iPkotMW6fYEoB6IdArFZ+GjqDWPnsfn9Fb0hOtV+A3h7U6SyTO5ca0BtEe8zMy20lKtM0Pvan/HOYmCT6uupL3T66ouAlf8wj4m4XrsG390mlpjTMPKF3aaZ6KCU07WmUfao1D0qUBlmxkaYy21hErRKlfJTwRhiy37WQyAXXZgvQX1cvjJ91HouD/UF0F2QqWjyBoeKgX0QH+4XnvtnXX879bSGsIg28n83JFHexqkOdwHPuCKTEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOiMEvFeJxK9gCZzuWldjR/I+dtDDtQ6xfkkAB+7snQ=;
 b=obXYG0bw9H83t1DhLDTPgKMmPspNOSmdv+LCH8t2nMJczYZJy/tgJ6l7qMP6nG249yMdmUWIN0b8427msVmM4rf4I7fGFLdwQjnFEMjElIDNQtQXHeC7cPwk1lm3dao7bqm7GNGT0336LbplNARxWe9RAgVOT+eKWkVX0FxIlSuu7XGtrzIy3FGrV9IolkD9YuPTG5RAR/Q+xVdlJK5DLQYP8pO4yn6Dnna2fr2+4mB2Rtp4DnBbONOA4VLcrp40TiohlR1MB2dKLnWuEV3aqvQM21MvdCqeImPm9gUxOOuAScVPW2eKg08TIjeaufNICYmUHIdh7f711j/6zN3/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 17:03:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 17:03:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240727015907.899192-9-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
 <20240727015907.899192-9-lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 8/8] drm/xe: Migrate OOB WAs to OR rules
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 29 Jul 2024 14:03:27 -0300
Message-ID: <172227260759.1863.13306677247280246364@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW6PR11MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e9f9dc-8bb1-4c0f-e834-08dcaff06141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGhWNm9XUFlKWGlUenlwVjJoQlAxaTV2QzMzL0w5Vm41K0ZJL0FIMWxZUnBI?=
 =?utf-8?B?WkhrT0Iwd1hpRmZWUGRKS3lHc0h1K2NRQkJHLzUrbDlnRGZkTXhDai8vc1NR?=
 =?utf-8?B?cmxQaU1hem5NaGJRSnlWdVBSd3RXSkhJMktXMXBkNnFZMGNrOUZZRlFkQWlP?=
 =?utf-8?B?ZWlzUkhtNWhPRDgwdE9XMEc2OFAzUUwrOXJhWklvTWtYTWM3TmZxRFFucFVL?=
 =?utf-8?B?K1p6WHBId2YrOWRzR3ZLakc0eU9LUlNkajJRdnNMYkZOSmp6VkxyUW5vbzFK?=
 =?utf-8?B?QmFFbDJtTWIxQkdCdUs3Qy9NQmxHSjEzZTg0UDk1b0JTWFpwWlMzeFZSVUR1?=
 =?utf-8?B?b0tuMjhxT0hZQWlwczhKVjR3c05jREZESUF6NVh1SE1jRFcyS24xNjVjN3pk?=
 =?utf-8?B?YzQycmlwaVkwUEplODgwd29DWnVmYUdHSkRBdUNTOFd3UTU0aUJKbnBsOE9X?=
 =?utf-8?B?a1hZUktuM0lBZDRReXZmTGNzSTJPSHNsLzBnOFNDbGhqWkNzWjU0WjFzSTN3?=
 =?utf-8?B?OGFDdTRidXJCUHVkR2dqTkc5RFo5c0JlUXEzTk1yRGM3NVVUaWpBSzFVSlU1?=
 =?utf-8?B?NkRSQWtTczZLRU1odXdZS0pCa29hd09rNmp6ZG5ibzV4WXBJNHJqWnJFNldp?=
 =?utf-8?B?UXNVU1dERUlTZTEzQzNxZ0k1RXV2dU1vY2JxUmRkay9XZUxBZENVN2dGN3k0?=
 =?utf-8?B?aXZXWDVmMFRDM2F3WlFKckFqejhtcGQzdTZBcFV1NWVoYXZuOEdyNndXVGlE?=
 =?utf-8?B?V0JHZ2ZPSVdhR1NreTR0L2p2Zng4VSt0ZUsyRi9OQmpSSkZXUWZoLzlGaDBi?=
 =?utf-8?B?YUl2RmNyVHl0NDFPL0xzOVJ3dHhQSGx2bW0vV0llcmlsb1pMUjBjMDl4bWR1?=
 =?utf-8?B?Y1Nnamp4MzBaN1RQWDNCZGNDRngrSVQ5TmxqUzZDV052R0kyWFlCR1VDWkJE?=
 =?utf-8?B?ZmZkeUM4cTZjbWwzdm1KVm01N0tKZ3A1N3ZrUlZ0a1pnVGd1TzNVUldwemhZ?=
 =?utf-8?B?NW9CMWl6M1N0QjJFT2JLSHNBWEVUc2ova1Z0OUl5eGFuNEx6ZEM0eUN3bnZF?=
 =?utf-8?B?UjJSZXY1QytXcFh5MjFoQVFjOXg0SDhOZUQyY2NOMmxWRmo2TDlzT2pES0lY?=
 =?utf-8?B?RUVJcmI3VFg4VHVTOUJxcXdydVhYdi9wMDVNbTdad2ZPNEdnT0xIbkI3NjZP?=
 =?utf-8?B?SWZXdUV6MzYvS3lPRDM3b2RMeWN5Ni9MME5icWxNWDM5QW9UMk14MURMazlS?=
 =?utf-8?B?eWhTcC80SHZEaUVOS290cVZCcmVGa1hob3YvL1hwTGE4Ync1T01SQzdLaTN5?=
 =?utf-8?B?amhlVkZpSGdlbjFQUy9JcXFtV1o1L2UycGlZdGJlbTk1Zm55VGhqOUxpaVBt?=
 =?utf-8?B?Nk5DRWpaaEVtK1JVYlhGMndLVDJ0eGVlYTg2aFFFbWVYY2RRNDM0cXN4M1RZ?=
 =?utf-8?B?ak5CVFB5L1prNExEK2U0ZVA2R0piMGRTSUZORTc4T1VRQnF2UVBzdkNrQUEw?=
 =?utf-8?B?VFdCSGhIWndDTHI0eUp3eVBTMzE1UjVBenpGQlpNTEhLRm1TekEyVlJCeW5R?=
 =?utf-8?B?bXpwdnZGN0xLNTlTS2lqZHdWVWlnSFJSVUJmcndoZUs3R2pyZkljZGE3d29C?=
 =?utf-8?B?QWF5czBtVUZNMHdJZXAwREZLMklzb1JvclhtTVRoTFRDbi9LMEpJRStmNzY5?=
 =?utf-8?B?dXBHeklCS2pVRGhEZ1lNMGRRTSs1YlNoc3ZwRG1uY3ZzSG1qbUNmQUljMENs?=
 =?utf-8?B?U0pwVm9MckV1MHVSaXRYVzJRb2o3V3BoeUw3dHFHejA2SWtoT3VSeExkc0Rn?=
 =?utf-8?B?aW8yMEp5RENiZVo3SHJydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVCN3YvT1NsSW94ZDRSYjBzLzNqTkVCbVRPUyttZ29kRmFoU1kwQ2c4WUwv?=
 =?utf-8?B?bXZ1TVVaNURKRHJDY2o1NWVxM2JvWmNOc3poTmwxdjZZVDhvKzJrWVRzYndS?=
 =?utf-8?B?Z09KVHlSSE5RVjRpaDJxR0RWZDdrSFhJQnRtQm5zbnJCMndqWkhzQlNQdEVX?=
 =?utf-8?B?aWxxOGRwMEd6cGtFWGVUYWxRODlTTkREbWM3R1A0bXN0OFp2MStYaDRBZlhU?=
 =?utf-8?B?UkFwRWpnOFlQODB4eTZJczRwSG5DbTRtK0creHFDRnJSNUxjU3c4RHJwUm9M?=
 =?utf-8?B?Z1E1aFV3U3NaSjRpTlFSOVVvTmVnbmVEc2tqaXBMTGZwVmFhelFRaFh5aEJO?=
 =?utf-8?B?amdjOUM5dE56VEh4WHVNU3JXaTlyMlVTK3RoL29YZG8zQzVzcGt5TFZwTk4y?=
 =?utf-8?B?V1lyYVFYOFJkSmhjQXV3Nk1PSEJhdEhxUHd0OHVCSXJ5eU1CRzAvck9PTWFm?=
 =?utf-8?B?Z3VRSDFLYVBsYmc3MTUvdjgxUTc0ald6Ym5reVdmODBQVW14NUdSWjVyVVE4?=
 =?utf-8?B?bXVlc0pKaXcxcUlGY0EzMU1taVJ6U082TGFlWmtIaXIrZFVxUlBEbVZYQVEw?=
 =?utf-8?B?TmMxMG5XNUV5SU56U0tCM2NUdjFJTmJ1T2hYaHF5YW51akxEeWpFcnZIZXVF?=
 =?utf-8?B?R3lsL3hFYm82SGtlak1CNDVpWEh1Q1czblNnYXdhVWI3QnF4R0thZHpYeEds?=
 =?utf-8?B?TzZPdFdZNXk1eU5QeWp4SEhHMlEyWnNNMzlMQlFuT3JDVmhuZnJZME5PRTJa?=
 =?utf-8?B?cXN0M2s0aU1ZUzlYZXU4Njc3SVp6UUFybi9aMXNsRm9qSGxiQzI5Yml4a1pV?=
 =?utf-8?B?cy9JcGI5TGFXQkx0UGMxblIwcHo1WWovK2tLSlpLUktDelJkU0J2UG43MnNi?=
 =?utf-8?B?cmxmMkQvSWJwb2dyQTJhcHpTalQ3Z0VPeWtjWCt0Ky9kdFl5cExXZDIxOUk0?=
 =?utf-8?B?cmVRSFJtL0xjWm42MlVXcVh0ZHFDcTdlbndDNzg1KzRNVkpMVTdsUk43NU1H?=
 =?utf-8?B?VUF0Z0ltZ0pFRVJjU1JoZk1leUE0OWlXeXB6L2Q0UU1qaWFzN2NpdVlCekc4?=
 =?utf-8?B?czVjaXhRck9nODFWRlNiMlVsaGR6Z2FjZlMwMFg2dnZTTjk3SnBpVzBDdEdF?=
 =?utf-8?B?OUF0MkhTMU5RNmZsMWVmVVI0bGQvL0NRbkIxYzZ3V1VDc0xlZWtpZEcxdVYx?=
 =?utf-8?B?U0ZiYzVGTFc5RjVMTm9wNWFlclRNODV6WHd2SXowZGtmQXhjTHV0OEd6a3Ir?=
 =?utf-8?B?S3E4c0NnWXRPb2p3THQwOGFOWndxRVR2TitNK1VwZXFhTTNJU2hDeW02WVMz?=
 =?utf-8?B?bXozV1QwNkZPZnZMSG1zV0tqK0xEZUdEMkE2TzRZbEtIMStZQ280MGZhY09s?=
 =?utf-8?B?NTVMeXZ1c1BqWkVENmI3Z2dabno0WElET1luaE03cTVUV3Z0dElkRFpEYnNl?=
 =?utf-8?B?TlBPNWlhR09zaFYwSnc1azBVcHExdC9JZEZFeW11TG45WHBYZkFZU25leGxF?=
 =?utf-8?B?NDZiSUlVbkZ3OGc2YXNVcVVmbGhHTUFlSUJ2TUl1dTROakxTK3JKZEJ6TWd6?=
 =?utf-8?B?aUVwRE9DcUpMd09GS3RvUzVpdEVmWTdVaVFPUElCNXU3ZzJ6R0FIekw0OGFx?=
 =?utf-8?B?NFNPbmVYQnZQQWF1WDVac1JtdTF6RngwTWNZeXpqK1RtZzhBclEvTWZhTzdS?=
 =?utf-8?B?TGJLNkZZYzhCYzlPbUFiZXR5eGt2Z3dNaXVKSUJVZTBKOGxTR3dibFdDcGZI?=
 =?utf-8?B?amF4TXVTN3RBNzh4YzlHYjRQeUlwNmxQbEJHM0Nlb2VuTWZTT1FtTUxRTTVJ?=
 =?utf-8?B?ekVXc2JJWGNaSzZORFdJZWFXZjltRnJUMGZOMnQ4VFRHWnQ1bDUzVXQxMEJK?=
 =?utf-8?B?R1BPRlVZK2NIYXNMclp2alpMeFhleGYrMlZkYTJVVTdmY0dLNmkvVk10a0lm?=
 =?utf-8?B?VjkxRzNyLzdrUk1xU3lyeUVXU1VjTUE0b2lxb05zZUdBaUFMM0FkZVpCb0xH?=
 =?utf-8?B?dHM3U0JHSDFySmFVMmgzWWhSVjVuWUI5VzF4SUErUWdZMU1oTTVFc1AyTWV1?=
 =?utf-8?B?bENFNmpuTTN0UW0vQldsWEVKQXE2MGR5OVY1VzFlUUpuWWRhSVhCTTc2NmFH?=
 =?utf-8?B?SXNGb2FwbWpwQUxvSXpoY3MrUHNPbmFoa0x4YW9obkVnUjdiTUJ1bW1uT3pH?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e9f9dc-8bb1-4c0f-e834-08dcaff06141
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 17:03:33.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 509qsj0RUxixfqBV2n5Df8O/2pmpE/Z3095vHtAXu3dfpZQcTGJYHGKlUC4AVI8D42mZ/+BftF7lDCv1C7dNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
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

Quoting Lucas De Marchi (2024-07-26 22:59:07-03:00)
>Now that rtp has OR rules, it's not needed to extend it to process OOB
>WAs. Previously if an entry had no name, it was considered as "a set of
>rules OR'ed with the last named entry".
>
>Instead of generating new entries, add OR rules. The syntax for
>xe_wa_oob.rules remains the same, with xe_gen_wa_oob generating the
>slightly different table. Object sizes delta are negligible, but having
>just one logic makes it easier to maintain:
>
>        add/remove: 0/0 grow/shrink: 1/2 up/down: 160/-269 (-109)
>        Function                                     old     new   delta
>        __compound_literal                          6104    6264    +160
>        xe_wa_dump                                  1839    1810     -29
>        oob_was                                      816     576    -240
>        Total: Before=3D17257, After=3D17148, chg -0.63%
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 34 +++++++++++-------------
> drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 16 +++++++++---
> drivers/gpu/drm/xe/xe_rtp.c            | 36 +++++++-------------------
> 3 files changed, 37 insertions(+), 49 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index 9ab3d5950d59..36a3b5420fef 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -401,16 +401,15 @@ static const struct rtp_test_case rtp_cases[] =3D {
>         },
>         {
>                 .name =3D "inactive-1st_or_active-inactive",
>-                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .expected_active =3D BIT(1),
>                 .entries =3D (const struct xe_rtp_entry[]) {
>                         { XE_RTP_NAME("r1"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>                         { XE_RTP_NAME("r2_or_conditions"),
>-                          XE_RTP_RULES(FUNC(match_yes)),
>-                        },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>+                          XE_RTP_RULES(FUNC(match_yes), OR,
>+                                       FUNC(match_no), OR,
>+                                       FUNC(match_no)) },
>                         { XE_RTP_NAME("r3"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>@@ -419,16 +418,15 @@ static const struct rtp_test_case rtp_cases[] =3D {
>         },
>         {
>                 .name =3D "inactive-2nd_or_active-inactive",
>-                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .expected_active =3D BIT(1),
>                 .entries =3D (const struct xe_rtp_entry[]) {
>                         { XE_RTP_NAME("r1"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>                         { XE_RTP_NAME("r2_or_conditions"),
>-                          XE_RTP_RULES(FUNC(match_no)),
>-                        },
>-                        { XE_RTP_RULES(FUNC(match_yes)) },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>+                          XE_RTP_RULES(FUNC(match_no), OR,
>+                                       FUNC(match_yes), OR,
>+                                       FUNC(match_no)) },
>                         { XE_RTP_NAME("r3"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>@@ -437,16 +435,15 @@ static const struct rtp_test_case rtp_cases[] =3D {
>         },
>         {
>                 .name =3D "inactive-last_or_active-inactive",
>-                .expected_active =3D BIT(1) | BIT(2) | BIT(3),
>+                .expected_active =3D BIT(1),
>                 .entries =3D (const struct xe_rtp_entry[]) {
>                         { XE_RTP_NAME("r1"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>                         { XE_RTP_NAME("r2_or_conditions"),
>-                          XE_RTP_RULES(FUNC(match_no)),
>-                        },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>-                        { XE_RTP_RULES(FUNC(match_yes)) },
>+                          XE_RTP_RULES(FUNC(match_no), OR,
>+                                       FUNC(match_no), OR,
>+                                       FUNC(match_yes)) },
>                         { XE_RTP_NAME("r3"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>@@ -461,10 +458,9 @@ static const struct rtp_test_case rtp_cases[] =3D {
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>                         { XE_RTP_NAME("r2_or_conditions"),
>-                          XE_RTP_RULES(FUNC(match_no)),
>-                        },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>-                        { XE_RTP_RULES(FUNC(match_no)) },
>+                          XE_RTP_RULES(FUNC(match_no), OR,
>+                                       FUNC(match_no), OR,
>+                                       FUNC(match_no)) },
>                         { XE_RTP_NAME("r3"),
>                           XE_RTP_RULES(FUNC(match_no)),
>                         },
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_ge=
n_wa_oob.c
>index 106ee2b027f0..904cf47925aa 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -97,19 +97,27 @@ static int parse(FILE *input, FILE *csource, FILE *che=
ader)
>=20
>                 if (name) {
>                         fprintf(cheader, "\tXE_WA_OOB_%s =3D %u,\n", name=
, idx);
>-                        fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_R=
ULES(%s) },\n",
>+
>+                        /* Close previous entry before starting a new one=
 */
>+                        if (idx)
>+                                fprintf(csource, ") },\n");
>+
>+                        fprintf(csource, "{ XE_RTP_NAME(\"%s\"),\n  XE_RT=
P_RULES(%s",
>                                 name, rules);
>+                        idx++;
>                 } else {
>-                        fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RUL=
ES(%s) },\n",
>-                                rules);
>+                        fprintf(csource, ", OR,\n\t%s", rules);
>                 }
>=20
>-                idx++;
>                 lineno++;
>                 if (!is_continuation)
>                         prev_name =3D name;
>         }
>=20
>+        /* Close last entry */
>+        if (idx)
>+                fprintf(csource, ") },\n");
>+
>         fprintf(cheader, "\t_XE_WA_OOB_COUNT =3D %u\n", idx);
>=20
>         return 0;
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 86727f34ca25..e78ba324dd18 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -221,15 +221,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_act=
ive_tracking);
>=20
> static void rtp_mark_active(struct xe_device *xe,
>                             struct xe_rtp_process_ctx *ctx,
>-                            unsigned int first, unsigned int n_entries)
>+                            unsigned int idx)
> {
>         if (!ctx->active_entries)
>                 return;
>=20
>-        if (drm_WARN_ON(&xe->drm, first + n_entries > ctx->n_entries))
>+        if (drm_WARN_ON(&xe->drm, idx >=3D ctx->n_entries))
>                 return;
>=20
>-        bitmap_set(ctx->active_entries, first, n_entries);
>+        bitmap_set(ctx->active_entries, idx, 1);
> }
>=20
> /**
>@@ -274,7 +274,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *c=
tx,
>                 }
>=20
>                 if (match)
>-                        rtp_mark_active(xe, ctx, entry - entries, 1);
>+                        rtp_mark_active(xe, ctx, entry - entries);
>         }
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>@@ -285,42 +285,26 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>  * @entries: Table with RTP definitions
>  *
>  * Walk the table pointed by @entries (with an empty sentinel), executing=
 the
>- * rules. A few differences from xe_rtp_process_to_sr():
>- *
>- * 1. There is no action associated with each entry since this uses
>- *    struct xe_rtp_entry. Its main use is for marking active workarounds=
 via
>- *    xe_rtp_process_ctx_enable_active_tracking().
>- * 2. There is support for OR operations by having entries with no name.
>+ * rules. One difference from xe_rtp_process_to_sr(): there is no action
>+ * associated with each entry since this uses struct xe_rtp_entry. Its ma=
in use
>+ * is for marking active workarounds via
>+ * xe_rtp_process_ctx_enable_active_tracking().
>  */
> void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>                     const struct xe_rtp_entry *entries)
> {
>-        const struct xe_rtp_entry *entry, *first_entry;
>+        const struct xe_rtp_entry *entry;
>         struct xe_hw_engine *hwe;
>         struct xe_gt *gt;
>         struct xe_device *xe;
>=20
>         rtp_get_context(ctx, &hwe, &gt, &xe);
>=20
>-        first_entry =3D entries;
>-        if (drm_WARN_ON(&xe->drm, !first_entry->name))
>-                return;
>-
>         for (entry =3D entries; entry && entry->rules; entry++) {
>-                if (entry->name)
>-                        first_entry =3D entry;
>-
>                 if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rul=
es))
>                         continue;
>=20
>-                /* Fast-forward entry, eliminating the OR'ed entries */
>-                for (entry++; entry && entry->rules; entry++)
>-                        if (entry->name)
>-                                break;
>-                entry--;
>-
>-                rtp_mark_active(xe, ctx, first_entry - entries,
>-                                entry - first_entry + 1);
>+                rtp_mark_active(xe, ctx, entry - entries);
>         }
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>--=20
>2.43.0
>
