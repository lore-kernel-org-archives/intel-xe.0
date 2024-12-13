Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72787E77183
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 20:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB9310F0CB;
	Fri, 13 Dec 2024 20:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEDx+vm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBEE10F0CB
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734121603; x=1765657603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dbPZFjpPOL8YrMohod36m4mvOhehuELrof4+wBWd0mA=;
 b=MEDx+vm3oWauHiX1PnzS+MGvvpodtpYT3TRKMNG21CLInVj/mPaxAuWI
 SVq2UoDibUNeAdEO98LaL8pHOriWuq2K/oit7LkQkoOwFtzrwvBpiTc42
 /6RNEe3zKILmxwPtO6eaJJokfPy0SuI56pNc4GsfYL7iZoLU+TzM5LqTc
 CyMuLA5M0EJKclYhFHhXBvIqhbnY2n+rogPTc8hswTsKqkgRLeQrJk3Dv
 JirXVdJs+ZN0QX0c7PujVAEn7MYjuEJ9/hd/1mwLMstmGFPbh0pQLpbN8
 FryqrYumApPAlKsD23a7Slxsk7VzRIm9gk0aC/aA3hWeS6gJ3w79NJKia A==;
X-CSE-ConnectionGUID: Cq4swTKFSAq6VMxF8EvB0g==
X-CSE-MsgGUID: NCxiUYDqRuCSB1rK0cjmnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="37431244"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="37431244"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:26:42 -0800
X-CSE-ConnectionGUID: SNUIgZ5eRkGxu9NwQUReBw==
X-CSE-MsgGUID: ZqPoeUD3QaOU/jN0kBhjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101714005"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:26:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:26:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:26:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:26:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn5+3gmCMom/HCQ8ulh6RlwMo85MYjB8zd3Cd1OE/UFb3MA4/6RgnUXyF5YsGb6U/m1splj162vtbf0mozDwB6uwmUkCgHkAQx3x6MYz5barfizath6ds3QhTJfSlpRmIXbaQwKGuhqbv5/io0Ilj6MV9V6own+KWnrhdgX3sJ7CjE46ksf+DDmLrsxNmNy+fTVVP2Z5CzBh1r1OTHGu64mywARNkNxOIUWv1+BXeldoi98JWi7+nl/E6SImH045ChyB2cwCB/MS9834QgTRxBRx4kpJ2osob6O6KFRrnL70eWikni/eKntikjekz3KkGz8KKSdB7+TDjohcYgMLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU3ZaoYTGznuh6OoXDlfgzqMbxgH2NfdR2+aeqVPTmA=;
 b=v863PWBqmZD2U1C03MRiNjmaxFcWfV8ZwTbxiT1u97Xs+8GOSJjPURJiWrdIuJ83p1FcTR9C4TPOZubh+hyy3Zq/DC2hhD+ixeElL94PoEdle4HjAYtOw54Jr1uglCC3zkyAf3W874/TTdqEbugIcANHVRtZXWjCUvmH8fIhJKqeea0GTGv/ZX4DOafOoj7kCzUdcxD7f1Zxze07au5S/2dzC2CFT2GVhl9+GZXCuVkrlSMbKdQ4+tDCoXaBRR+jyTYrsHID2nUjLAPQgmBASx3IJc8BzIoHnuFKnZAeJrM1iCKPW+vQ4Z65Q0IuYenIMz02PhXtonbVfiztMiug6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 13 Dec
 2024 20:26:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 20:26:26 +0000
Message-ID: <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
Date: Fri, 13 Dec 2024 12:26:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
 <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
 <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cf7964-d929-454f-ea52-08dd1bb46ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU11ZEN2K0JFSWVXNDhBbk0wOVF0akFOTDdkY2MzNGFWMUFoQWVuQXdJajkr?=
 =?utf-8?B?MFphRmVxVXVISU05UmdnRGZQQTBXUVNFS3c5NzJoWTNYdUNxSjdLclFGSDI0?=
 =?utf-8?B?cjJZU2ZGQmZWM0dqL3Z1L21tdk5kRjNpSnZNS1ZZU05DTTZxN1hNSVRhRkh3?=
 =?utf-8?B?eWpQZGxkczE5Q29yR1BLTkQxeThZU1Q1cnYvZmxidjhKazBNWklXN1F0V2h3?=
 =?utf-8?B?SFhXZ0NpVEtWZEdtci9jWGMxTkZneEpYR3VtQUNqTHM0ejU0dTNnanpLNU92?=
 =?utf-8?B?SEc4ZXFKbzBZRmZoL0ZLU282SlZQM3B6MitBMnBlSy9HdzF6S3FWUVpXTG04?=
 =?utf-8?B?emZCMjZwUFdTNjZnWWV0MmVINHFsYjhUM1BsMXR6bjFkMDBUUjV0V1JFTDhr?=
 =?utf-8?B?QS9rWVR5Y0wzSExrWWJ1eWNpNjFtdVZEbTRvK2VYc1NraHZEUWpSVVJXL1Bz?=
 =?utf-8?B?bi9LWTJkbUZGTlNJYWs5NlhaZ2NqRmNvZ3JwYnI4ckk5ZjMrN2ZzWCsxSUNG?=
 =?utf-8?B?eGExWEE0MnBUN3ZCUndkN2x0OVdOOTlRbVhjMjdZKzVFL202Z2NWVzVaTEpJ?=
 =?utf-8?B?OGxiVnh5OWprWElITnBLY0tGSWFicUhjREFVZEVlelJpRzBkT1dUMEhkcUx5?=
 =?utf-8?B?VWEyaWlkZnpaYjJFYTBZS01ManlXN0NDc3JvTk41cENLTm83Ym5KdkVHYlkr?=
 =?utf-8?B?eGhsS2xUUFpqay9CYUtrWmxDT2p6Z3V6SEwwSllqMkJQU2xTTGJSc3VrMzJG?=
 =?utf-8?B?VGdNR01WYTV2bWlRY2poR2NVOHJKVkU2cWpJQTRqREd0M0l3dmIvVWx4SGVl?=
 =?utf-8?B?SlBUNkpUcDVCRmZwN3FmZ2ZzS1dwVnlNVzgyRUg2SGh0T0tjWWRVN0hYQzRm?=
 =?utf-8?B?SFgydnlrb1gvbjYyRnIrSVNiYngzMXEzV3pLZm9uamxBbTU5SU5reDY4OVJO?=
 =?utf-8?B?cjFCSzRjTWUrYUs2UlRVSys1dFc3Zyt3Q282d1psYmYxTURpd2Z4NmFRQmQ5?=
 =?utf-8?B?ZThJcm9zT1lOd25uWWVGNGxZdVRXYVpodHQrbEVZUDFNWmhIcWZVdm1TYUFx?=
 =?utf-8?B?Z0VGOGVvb2RkVlZNSTJWQmFKN1VhMkxPbldOV3FtUGk3NzE2SHFkZWJSVTA3?=
 =?utf-8?B?eHhEaEtqOXZ6RnJXNCtqTFpUK2dTN3dLRENYS2tlL2V6dXVRZlJoc1Z0RXRS?=
 =?utf-8?B?UHY1WGZac09aN3JmK1dZZGI0M1RBL3p1WTU0OUNVWkhNWisyQVZPZzVSOUoy?=
 =?utf-8?B?LzNBTnVGWmoxZTMzRW5GbzhOK2R3K1Y0akN3cjFubkowazYzMFhzQlBacTFr?=
 =?utf-8?B?dEJtdmNNZ3ZTNklkc1BLSndIbUdxc1V1TzFvajZkL2EvMXp6L2pVTFN0dS94?=
 =?utf-8?B?VmJmUysvWEhaSFByQ2kzKzJsNE00RWh0T1N0aW1OTmRsOUVLcGpUR1RXTmFP?=
 =?utf-8?B?UHF6UWpSWTFhdzJSN2w3bG8xZlZuNkhYWWRRUzY4by9MUlliUWNHcml2a2Fs?=
 =?utf-8?B?dmtBQTZ2QXZZUXhFV0ZVbTkyUzcycnMvcnN1akRoWHY1eldDVHBKVWd5UDVN?=
 =?utf-8?B?ZWpFU2g0MHZBOGRxcUYyNlpQRUpjaVRZSVVYdExIMGlPMjIyV1lLdjJHeU0r?=
 =?utf-8?B?TG5EaVRoMVRpeXZHL25nWFFYWHRQTjA4NWRCNlllOFpTc2czbnNhZnF2MEdm?=
 =?utf-8?B?VXFpMHBaSnBya3VkWDYzSE5YZVh3YjZoeFI3c0RsdzI5WnpOL3ZpZmRXY0hq?=
 =?utf-8?B?Z0lqb3ZUK3pOYUhIZitBSVhuQ0RhRE9RQ2thVFNPRzFwR2lwQ2Y5WHhuNmxL?=
 =?utf-8?Q?BHqODkOyIxJ3dHOSv8hKPao40vLQyCaM5e+ds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVRoQ1lmeTRwbDVVeDErR2FQYUxodGJuS0lsQk52ckVkVEtOVTR4ZEEzV1Br?=
 =?utf-8?B?UjZrWEZHZ3g1Mi82R1JFOXJJUks2K1Jva3Q5UjlKTHg3MHFVbUpWa2VyUHd0?=
 =?utf-8?B?UjlKOHE2TU9GM1RYTFBXZVZmOTVQUFlMdm5RMDJRSVlKUWZWWUpmZ3BndkUy?=
 =?utf-8?B?N0MyRDh4andyRXBYOVh0WFdsN0NBVFZsNklKdUpFNUkvbENscm5jOWxCM1Zn?=
 =?utf-8?B?cGZzVUxOTGI0K2M5U0ZpTXZjQm9HbXhvVlIrRkNiTndBTDdWS0tEVnBjcFZ3?=
 =?utf-8?B?TEtxNEtnK1pESEJ3dTZTOWR4RlBNNENNN1pzcWNqaG9ld0VMOHZLWFZaS0NZ?=
 =?utf-8?B?SVJ4VU1ScFpRNDdhV3QzZjkrUkwxKzZ0U0dTTGlJM2xEbTVLTkNlSHNOT1dV?=
 =?utf-8?B?U2QrZE5PT0k5aHd2QUJSOWFIT3ZBWk10VlpaOTRhZm82OGNrV0RwNTlEaTRv?=
 =?utf-8?B?ME1kMGpXY01FYVRYR1g4UU5ZUGFETmlyOVJhcE8yUy9TQlRidVpkbUo2elYw?=
 =?utf-8?B?bTlvOGtOK1Jkb0tpNE9YYzlHK2dXQkY5aUJPWEVlcnZ0ZlZ4Y0NoeURVbXF5?=
 =?utf-8?B?WFhHbk1ibXNmWjBiZXZTbFpCN0h1cDl2MFo4YkJLNlkxWFVRbUdsa3pZMWZL?=
 =?utf-8?B?d2dDai8rTHdvVG5CV3RISEpjSW81M3E2YVRmdUFkS1g2aUI1Z0krUUtLV0h0?=
 =?utf-8?B?ZTFZaG1HRlp3dThEOHl3N3BrSTd4dXZzYTZ6NHdoYmxEY2pSRFc5a3ozUHJS?=
 =?utf-8?B?blV1bGdlOXVQQ2ZIMTBaekdSV3VEa3ZxRFZSS21pd1FZV3BRQ1JaVTd0QUly?=
 =?utf-8?B?Q1drK3E5M2l1d3JrcEw2ZEg3N09lK0dmY3p0NVFyWVdDYmRrMU1nWHhma1hl?=
 =?utf-8?B?NzZLQ1IzQWxEV29hWFVQK2pYK2MzUlFnWWRRcTQ4ZnR5RHFLOHJlM0JZa2RT?=
 =?utf-8?B?bDZHNTdFYUFqWVc4OVdMUkRjK1VZaFB5T2l0MzdjT0JxRVVoVUdxWGVLb1gv?=
 =?utf-8?B?LzNtRHFLcFl3Z2RoWER6NjNXR1VxMFZRVTZLV0txd0tsSVUxVGw2dEVVVFhJ?=
 =?utf-8?B?QXFCNloxT0Z3MjdlaUFQUGFYNHh1V1o1T29QcS96TEtmQW42Y0dua1JLYm5D?=
 =?utf-8?B?U2FIcWtQRStaVmxQT1l6T1VxWG1OeDVJT0tlaUJxbkk4dEp5WGNTZjl4d1Jl?=
 =?utf-8?B?bE96WDlrYjhIVnI2bzg1Z2l2R05BM3FXOEZ3U0hpOWt5cnA0ay9PTytMeTk0?=
 =?utf-8?B?YjlKSm1ybEF4bXBGb0xSeHJjMVBhd21hS2g3VURZU2tsLzJYWENCSmpaQmlN?=
 =?utf-8?B?bGZ3aWJLaTFaSFNlajc0TVNla24zRnR5SGVESnhzcUVGSVllY0Fra1BFTVA4?=
 =?utf-8?B?U251U1lXTUkzN1ovOE16L05waFltdFJrSndPRmhlK2ZIWG5aQ25oTFZNV25Q?=
 =?utf-8?B?bGNuL1RPK0Q5UU1tamZydHp4clUwQm5La25Sa3hGdDEvSFJEUHVhMnV5Y2xH?=
 =?utf-8?B?TWxWZTloQTc5NXhQTHFmQ3dlRnNVckNMUndvK0hlenNtQ0dYZVlRZ0x0dVhi?=
 =?utf-8?B?M2lzcXlkNTIwbm9kVXlwWDZld1dZRDc4TytrUU1FU2Y4Z0V0cWhMemkvVm9Z?=
 =?utf-8?B?bjJSZnUvd0cwMHZ4WDc4cmlPMWZ1cm13T1pmSXRTcWN1MUEwNEhTdGVIdGVJ?=
 =?utf-8?B?ZHZ5bFhQVitiK3Y0SXVCN24zZk5nQkpJV0Z0VGNWcVEyTDdJNmE1eEJXUmkw?=
 =?utf-8?B?RDhDYnNXaS8zcUlyaTY4NXdlOGltZWVGQXVFbGg2Tk1JSGtWaDJJZjdKRXMy?=
 =?utf-8?B?TkgxMjRVNlFZK1dxWlNoK0VjRUhrZVl6aWJpS0I4TmZhbDVYbzhWSnNiWFhK?=
 =?utf-8?B?TkZndGVsTUNtWWJNeVBFTFBTRU40WjllN2IvSzJxZjdXcndDcEkwOFhJYitH?=
 =?utf-8?B?ZzQ4MVQwamtQN0lLeVRONzFqei9YbmZ0WmRwTU55VHJibnE1Um1UaDh3MEd5?=
 =?utf-8?B?WkFoTDFXMi9rVXE4WkRpYnYrU2JTTHNhemtOYUdWSEFndkdtZDNuNG5hN1hl?=
 =?utf-8?B?QVl0VmExNlNiSDdrZXl0SnJ3SnNBS0NhdGk1VjFDRnlNY2hWSHJkVlI4TGNQ?=
 =?utf-8?B?YnZNSW9TcTJjdGVXYzIzQnBaaTdMdGh2aExicC9lVWZ1dW41MkQyTjloTEhu?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cf7964-d929-454f-ea52-08dd1bb46ad6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 20:26:25.9023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlWkCKwnf6HHL2pJ5RMA4d7zoJxfc+FY7K4PLU/cf77Gmu7qmxmXk3MQvFp3ZYxTuM1dc7u+5V0x33AksvRGUmD2Na1mvNFQYHKxiGZwTdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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

On 12/13/2024 11:43, Souza, Jose wrote:
> On Fri, 2024-12-13 at 09:38 -0800, John Harrison wrote:
>> On 12/13/2024 09:25, Souza, Jose wrote:
>>> On Fri, 2024-12-13 at 08:56 -0800, John Harrison wrote:
>>>> On 12/13/2024 08:48, Lucas De Marchi wrote:
>>>>> On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>>>>>> On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>>>>>>> On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>>>>>>>> On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>>>>>>>>> On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>>>>>>>>>> On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>>>>>>>>>>> We do not break userspace.
>>>>>>>>> There is other patch that also breaks Mesa parser:
>>>>>>>>>
>>>>>>>>> drm/xe/devcoredump: Improve section headings and add tile info
>>>>>>>>>
>>>>>>>>>>> This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>>>>>>>>> But we have users calling this function.... the revert is not
>>>>>>> so simple.
>>>>>>>>>> I think we need to revert the functionality rather than
>>>>>>> reverting all
>>>>>>>>>> the patches, otherwise it will cause a lot of headaches.
>>>>>>>>>>
>>>>>>>>>> I propose we go with:
>>>>>>>>>>
>>>>>>>>>> a) drop the \n that broke mesa and merge that with cc stable.
>>>>>>>>>>
>>>>>>>>>> b) move back the entry to the previous section that broke mesa
>>>>>>> and cc
>>>>>>>>>>        stable.
>>>>>>>>>>
>>>>>>>>>>        José, would it be ok to merge a patch in mesa and port that
>>>>>>>>>>        to mesa stable that simply looks at 2 possible sections?
>>>>>>> Or even
>>>>>>>>>>        drop the section checks... ?
>>>>>>>> But if Xe KMD is reverting the patch that changed the hwctx
>>>>>>> section why would Mesa need to also parse the new(future to be
>>>>>>> reverted) section?
>>>>>>>
>>>>>>> first is to undo the damage, with 0 changes in mesa. We do that
>>>>>>> first and
>>>>>>> *then* we agree on what's possible to do to accomodate the 2 parsers we
>>>>>>> have.
>>>>>>>
>>>>>>> If we can get something in mesa to work that is backward compatible
>>>>>>> (i.e. the
>>>>>>> changed parser is able to parse both before and after the kernel
>>>>>>> change),
>>>>>>> then it could be considered to a mesa stable and the kernel side
>>>>>>> changed.
>>>>>> Okay, reasonable plan. But the ascii85 encoder with \n will not be
>>>>>> brought back right?
>>>>> maybe let's agree on how to possibly bring it back? I suggested using a
>>>>> space as continuation line char. This way you can just check the last
>>>>> char
>>>>> returned by getline() you are calling and see if you can go ahead and
>>>>> proceed or if you still need to get more data. Neither space nor newline
>>>>> are part of the ascii85 character set, so it's safe and you can handle
>>>>> continuation in one place in your loop.
>>>>>
>>>>> if you are just ignoring any ascii85, then I believe it's even simpler:
>>>>> you check sections and keys with a space since both keys and section
>>>>> titles contain space, which is not part of the ascii85 char set.
>>>>>
>>>>> Lucas De Marchi
>>>> Yes, I would strongly prefer to use line wrapped ASCII85 data for all
>>>> blobs in the devcoredump. Including things like batch buffers and other
>>>> VM entries that the mesa tool is presumably wanting to decode.
>>>>
>>>> If adding a <space> character to the end of each line is an acceptable
>>>> fix then I have no problems with that. But not line wrapping at all
>>>> means having to carry that change as a non-upstream patch in either the
>>>> internal tree or in individual developer's local trees. Either that or
>>>> we just cannot debug a lot of hard to repro problems.
>>> Can't Xe KMD use the line wrapped version of ASCII85 when printing to dmesg and keep the regular encoder when devcoredump file is read?
>> Apparently not. Even when not deliberately line wrapping the output, I
>> am still seeing it being wrapped when dumping very large buffers such as
>> the GuC log. It looks like something in a lower layer is also forcing
>> line wrapping of super long lines. So either we can't add full size GuC
>> logs to the devcoredump or we need to support line wrapped data in the
>> mesa tool.
> It is probably some implementation detail of __drm_printfn_coredump(). That could be replaced to something like i915 error dump write functions to not
> have any limit at least when the target is a file descriptor, for dmesg you are free to add any line wrapping.
Rather than re-writing the entire drm printer infrastructure, could we 
not just update the mesa decoder tool?

Note that the existing VM dumps are using the same drm_puts printer 
function. So if a very large user buffer was included in the dump, it 
seems like that would also break the mesa parser. And that is not 
something under the control of the KMD.

John.

>
>> John.
>>
>>>> John.
>>>>

