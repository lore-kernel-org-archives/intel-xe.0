Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF50ED6C285
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 18:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7E10E367;
	Tue, 19 Nov 2024 18:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPRBngMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142110E362
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732041111; x=1763577111;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tDL3Xua4FD8uCZlD2GuxV5NkVZNrMkyFmnFGNawfu9Q=;
 b=OPRBngMem1N1nX8Uf+SmfR0k6eh26aumgZVIILmWkmdk/REsCw3t7M8H
 ZodUq/qzcRVEok2iYoaQGPUSPYWy8mwyJDdyEy/GeUVX79CRTDOWSFzrI
 FVlqEUM9HFmS+mqiRtuIPhz88OkQJpHNOgK+epNlqDhjNaarzX8+5bO3Q
 3tp9g4sLGFU7D8mKbq7vMa4W+ngWtW/rbWrRkDEtfKg4elLBQH/ZX3RXK
 qmxf29nu/Ty0Saxnb5F/sM+H6kI9LtVmSFnsG2xQm6LM7qPvr9y69DQGk
 kaZab3yuNkhSLOdZA/pyGh+8fcQDMVaRssGUhsP7NzLFsy/aISK20Fh03 g==;
X-CSE-ConnectionGUID: sc10LGa6Q/WR5Rp70SIiMw==
X-CSE-MsgGUID: KyFikU/uTSWdFUvAjrM0pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="19669020"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="19669020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 10:31:50 -0800
X-CSE-ConnectionGUID: 4y1wAh8LTdiYtOzzd6MNjQ==
X-CSE-MsgGUID: lorefDXoRrq/RPUqhfiHFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90473518"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 10:31:51 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 10:31:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 10:31:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 10:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USXyzzednVf2MhlvJhGhG+xPz9cclu2mpyB/hRmtDaaRI/C66hKyFV+lkZshFY4i56oifbNGLzSASHWmq+OkZhxdTjpLgaIHY1is7KTuZeZhbaLqnzkXzKtwXbmw3z8OLflZT211AXoKMLXvrBAjdYH8x5e3DxANo59xoQci2NHGTsns4+CjNc5lcG1XLvyeM5ntI+YobVnE5pQfohX7fLwOxjCHGgSEyZThwFwqHM2vOtjh0bpUnsuPa+YwWcpEqEY/x2Iqnzo/hG1CG5Da7B1Dx+q+9eYYNSdArdu28eGNmdt4qluqLeEUo8VRYJjxv5z2C9a0vzO1RwVm0bfqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voievw/KuvO37FdsSmzm/ygQeOpuGvhw/6I/y3lbojE=;
 b=v8qnhAeN9ILwiPN2dZ8sT5rIn+VdzRsla4bqQ9AyV246NQoQ/iE8vAPqGqiGw48wCbamJFy1+sV/V1xB22XFgEcFvL/ks3HytjcgXY3VgvYyHFYVxN6p9bVW3NVDTj9OSSq/vMdnjr1xsDQd/gMk2tjD6qJD+iOGrQElC7/Mo+WMU9InezVAMJw0UYrEJBFsLpET1cQRx7KEi45OBPlGuRkPeXb2Trg2sIbSpB+pmZHaCHGJGP9gN7B31OSP9TbVVnTa2B0dAde9p0h6DQCU7EJZnJW1PumRFcmUw+vPylvcabFNGQ+PNV4XNFzEVcQpNZIdTnj0jcvg6IiKhY6Dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 18:31:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 18:31:45 +0000
Message-ID: <abb27c81-2a13-4a3f-aeb1-aa993723296e@intel.com>
Date: Tue, 19 Nov 2024 10:31:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ptl: Update PTL GuC revision
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241118213713.71017-1-matthew.s.atwood@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241118213713.71017-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c8d2b4-78a7-4011-e7dd-08dd08c86c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhlYTQ4RkR2aDN3bFZldkpOZ2xURXlSL3phaUpWM1JwUjJqanhZaDlqSmt1?=
 =?utf-8?B?Z2Y3ZHAvc3A2SlpabzRGQ3lRM0lhUU9lWFZ1cG9iUWM3V1oyc003TUU0VFpv?=
 =?utf-8?B?dGNEdU0rNkk2MjZuK2syUG5YZVZndlE0ekJGQm1rbUtPTnVZSVJWZExqZkJC?=
 =?utf-8?B?bFFWZW53UlVka3U1bk02TWhHUmFKZ0FZVWhzZXNmMng1V0Uxb3RVZjkveVpS?=
 =?utf-8?B?bWgyMnQxdkk2U0ptVkhhQkM5WlVTdWMvWEp6RXlCU0MvZmFpb3FiMUhzcFdq?=
 =?utf-8?B?ZmhBSERBT2pJdS9qZ1pGS0duU2xabkp2N2kwd0pUU2hCSUhkT0xKaFllSjJp?=
 =?utf-8?B?bzF6WXFQWHYvZGhYajVHTGhsa0ZreXM4WDg5RnBTakJtRVZGWVJxdzdrWGhI?=
 =?utf-8?B?Yy96M1FUYkFGc3Bpd01pL3NhVlRBVVVIMFIvTmluZHMzVlYrQXBacWgySm9w?=
 =?utf-8?B?ZVkvSHFESkVwRnMwWE1PZi9lVWdOSHRnaXI4eThTcUtRYXcvYWhzdnFWZ0dW?=
 =?utf-8?B?a3huM1RSeFhhbFA0ZCs3OVZnM0Z3YlV0bXVxby9VankrZDQ1TUVheUFpM2Vm?=
 =?utf-8?B?ZE1aeHlsUGZ6VFkybVJadE5Sa0l6ZDBlSW4vRWVTRk9zSlpIZFc2UitiZFRr?=
 =?utf-8?B?bDM0SkJkdVBIK2svQXhGcjdMay9WRUo1dk44czAvYkJXTE91VndCajl3UUxv?=
 =?utf-8?B?by9NMDVrbkV5Q3dNVjlxN1RGU3d0MG9nMkJ0QU9iOVBiUnRYS0cyY2l2QUdk?=
 =?utf-8?B?OWdBUVlwbzEva0lJMTVTTjRES1hMTk1lQ1N3QTQzWkdqQWt0aDVnNGhBcnlH?=
 =?utf-8?B?NjFMWDUxRSs4eFFTdEd1UFZyZ1FYWFJUN3Y4L2VHaytMbGtpZU96K3c5c3pi?=
 =?utf-8?B?ZGJyYnk2THB4YzJxZmZRdW4xbzg2SXFLS2R3akxlb1Rrczl3TG1kUHNkSmNZ?=
 =?utf-8?B?dkxNS2x0TjlDL1E0RXdaNlBBUTBaNXllbUUvOHdMNHFmTXlBUXFzTTNCMHdB?=
 =?utf-8?B?TWxJSEFOZU01SmNjRVJBZjErY1E3eXVGY2cxc0tUQXFSZ2RJWGVVby9aLzh5?=
 =?utf-8?B?eWwwemFVRysrdnpMRGhpd1NsU0NEVnVwand1UW1uMUMzMCthV3pmS1EzMUxv?=
 =?utf-8?B?aXZMd2lSbjkraW9tVzBhYlVQTGIrZlBlOTlWM0xIblNQTjlBR09rWnBOa2NI?=
 =?utf-8?B?VlAvcC9ZWmpVeFB0YUFmQmpmRjZSa1BVUFZwUkM4czIveVBaNDF6d1ZTVDI0?=
 =?utf-8?B?Smdkc1o3Z0t3TjBZWkxGWFEwZllQNlJ4VzUydFYyVlY2Tlkyb3MwNDBmM0ZH?=
 =?utf-8?B?Ulh4TU1TWndBOEdQalVPbkhFTTdZMGtjUXo2NDE3VFoyRVhEa3V5ZGdYUi9i?=
 =?utf-8?B?VGhBTHRmVWdVUmoxVThoRVJvVTBXVkpBYytXNVdtbyt0TFBoeGh0TGx3cFBB?=
 =?utf-8?B?eTNmN0hJQVN0NW82Nkl1VklJeW5qNkgxQWVDMmFTWE5sVHprbHUwMWxmcEk1?=
 =?utf-8?B?T1lJWiswTWJBek5MaE8xSnFRWmZLVk5GK2xabENpSlpIMDllbEY3aEFjRndy?=
 =?utf-8?B?d3RjRlp1TEY2bkxlWGhIS2FVeFlpVmNBUFZmUnFmbjRhazIyeVlQZjcvQzRn?=
 =?utf-8?B?OTFyekpic1psUkd4ZlRBZVVZbU1jaWg0Q1BXbWVtZjE5ZFc1b0lKbkJ3TFNW?=
 =?utf-8?B?eHJrSktScDBXWmRpRjJ2dEJTbmZmSURZVGhHei9HVWtyZU9hT241MFpRaUYr?=
 =?utf-8?Q?o3DU0EvvrFPcF/onwH6lIlX/3v+tH8WSksiWbeh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3o5Z3VtZldjd0c2VjM4MXZNejJtWTFBMitrOXRlNnRzenVCTFNFV3hYZ1k3?=
 =?utf-8?B?UnpmRVZFN0FUS3BkZW1GdVYyUUdLdVdlQ25HSUlhSGVNbW5ib3VzQ2NsM1V1?=
 =?utf-8?B?dzg5Y3ZySHNqRGIybGxlSGM3dTk1YU12Y1NwRnZIYXFuRXB4L095cnZFRzVv?=
 =?utf-8?B?SXFBaytwOFd4cC9uSU1nU3pRcnljNDkxVExrem9FdXBCa3JmOGwwekhVaEZC?=
 =?utf-8?B?SGJZNndqT2JEUkhDODRiR21SOGF6THc2OHNJZ002dlBGekhTUTBpR0lwL2p5?=
 =?utf-8?B?MEloV1JPQkRDdExHTDhISE04c2dtTUpxSndJSFlWajVZMzd2TGtRSkt0Wnpa?=
 =?utf-8?B?NW56VHBxYnNGRDhCenZXcWhOdmZhcHR5RVBiZHpWbnBVR0tvaS92ajFERWtu?=
 =?utf-8?B?STRBeGU5NFQ2ZHozQy9JTkZMTS9NOGFQWldNVGdKaXhvdUZSQ0d0clcwY2ts?=
 =?utf-8?B?MG9NS3htY0Y1bmdOQnJRZ2VpalVFRjBpK1kzVkxaUUYyMi9mbFRrcXE2QmxC?=
 =?utf-8?B?WFRWTSt1TmhKTjlMamFCNTlxZGs2RmlTMkJkWjU4dnFxVlFKRDFndHRNTHpU?=
 =?utf-8?B?NkRubmVtTExuZ0x4VnpEakl2VGdEa3hJRHM4TmFYQXlHMmJnVmJ3M0xLK2tj?=
 =?utf-8?B?b3RnOG1xN2YxNUFqV2k2ZTNndDRwQUpCaGdMSGQ3UE5qVmRPMVN5V3BsSFhl?=
 =?utf-8?B?YTZkMzV5YTVFVEpJSHkwUENJYTVoN1dxdEplN2FEZjRQMUdnQmtBNVIxOGZp?=
 =?utf-8?B?dzZldEwrSlhpSXdJVzc2Y3RNV2xBL0U4YWl2OXphYjdWN1VxQkozNzhSMU8z?=
 =?utf-8?B?VVF3NDFFc0VJdjNGQ0tkSFVoaXk4OFlvNmkyYWJncVM4eUk1blRVNEdjR0Zy?=
 =?utf-8?B?K3dyOHoxL1htTmVUZHRYRklkb0ptU3pqS3lyQytEVHBGSUMzM0UzNWVQMUpV?=
 =?utf-8?B?UFExYWQzTDRWN2IrVVJGWS9pRlcrbDIxa21pZU9qMUE4UFljM0J1MXhmN1Zm?=
 =?utf-8?B?NzdMYmttdGU1enVNQ1Q4MDhYS09mY1FJQXgxc0lra3Z4OEIrUndJWWdCVjRy?=
 =?utf-8?B?VzBUSXkrVWhqelhYN2gzNHordEpvTm9JZ0owM3JFc20weEtkSmRzZ3NaOU90?=
 =?utf-8?B?aWh5OFJBTnNyMktveCtJVXNjZTRDRVgreFdyTmlZSHRNQlZPSkFlT3cwckFQ?=
 =?utf-8?B?QmlUVDNMYlJvRGVUenRBMnBucUtSc1JMa3N5eGp3b0tuRmNoNTFFakt1ZDZx?=
 =?utf-8?B?MXZ2R2dtUzhzQS9qWDJRemRGaEUxSHEyNHFYSy9RNzVnK2h1Sy9HMC9Sb2NL?=
 =?utf-8?B?SGoyN1NjQ09CM0RpNUhNeitXRUp1SFk2MHNhVnl2WSthNUp0cy9FYytMT2s0?=
 =?utf-8?B?VHVobUw0MFZrQnVYUE9jN0MxeUZ0MERYSjZ4SEJ4Wk96d2pESjY2ams4WWNM?=
 =?utf-8?B?ZDh2aWlHMFU4OHF6NmJXMFp0Mk84ZVRGNFYvbHo1dnczZHZ5Wm9ORmhrUk1k?=
 =?utf-8?B?dWNTYlRpRmJLYVpndGk4TkhteHNqcHZza3U2QkpVVHBzbkJDSU9CT3hidFV4?=
 =?utf-8?B?YTBQenRGc3RDeVdlREQwbDBLYmp2RUlZWTlmNm4vak1UcGdRaU9tQTJSVWxE?=
 =?utf-8?B?QTNxMisySFVzd2hkUmhPa2lRMVlRd0Y4NEI2MjMrOGhqV1YzZlh5ODlVV2Vs?=
 =?utf-8?B?UU5mdjJEUzBpVndWaGRQQXZLUnVkRnBqRjJXNERFdERlZWNhMk5zZGJXVDh1?=
 =?utf-8?B?MHNJaGVIYnVCRUg0azd2WGtFT2ZkNlczbVB3d1JMRXFVNUw4TzBuQ25LbHNN?=
 =?utf-8?B?TVRuNmN5djd5bHprMW1VL0piOVA0b0ZQbm1KdkNVZFBYbXVSZDhtL1VPdUMw?=
 =?utf-8?B?ZWwxNDByOXQ2MkN6ci9jMW1xUVREN21jMjc2N0pnNFcvak9TY0E0SzlJV255?=
 =?utf-8?B?WFRST2VsZGpXWXUxUHdRVXR2bVlUTnlsZlFGNytoVXZsV1FOVm8rN1R6U3Q3?=
 =?utf-8?B?TStxRHc1cDNlV1RUOFN1TUNiM29QRG9idVNFVkw5eTNiV0I0eVFxUFVpdUtG?=
 =?utf-8?B?MXJlOWxyZzN3SDZBeFVJTmE5TDUydjRqekozZndhenFRR1hoT1FqQS9BeU1s?=
 =?utf-8?B?NUxDUE9pUFR1K0pQZlQ0WUdiUGhRc1dTdWF2RnlwclVvb1dSVmprL0J6cDVm?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c8d2b4-78a7-4011-e7dd-08dd08c86c19
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 18:31:45.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qk/mSVQEQj/hB0+6Mio2nJlFNjc1avZcuIj04mMvdCPP9Ljw0fSCxVQokQHCIfW6jGk8UJJqdxlCAAHBnz7PIXJO/STOXmT8QPIFb8TU+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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

On 11/18/2024 13:37, Matt Atwood wrote:
> Update PTL guc version to 7.36.0.
Not quite the right version number. But with that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

And note that PTL only exists in the for-ci topic branch at the moment, 
so the patch will need to be applied there rather than intel-next.

John.

>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b0deb082ab2b..9c14b0adad0c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
>   	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\

