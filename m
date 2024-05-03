Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F244C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172FA10E641;
	Fri,  3 May 2024 19:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBV4plk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3172F1131E9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763613; x=1746299613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ePMtsd3T3r2g+JnG94WRDQABkG1OCB5kZ9IUT+MwTn8=;
 b=LBV4plk6g25xunLJZzgLITBNzs9aKiDpzSZfKSsodGSYJhhixcB6U586
 MW2uJs8o5K+uPMhd8G33+yIOY6OUVYSaFUlM0tteULzt8hYE99W5D8CjW
 IuPqHBdo80cdl+L3T5AZp88WOz+9DAKlOzO8VM4AFj+31uwJgOspTgo7x
 XVmG+Lg+i8HdKYQ3KR6jlokIc1EW7SXZGXVRvAFK5ex863grHEnttiMQB
 5on5k64kPM/RzfjvDAXzIyyfVq1WlpQBlY16gobKXA3hKRf5jl+ZmvbS6
 LN7AINTPBJC09IIR6GzzLyHokHeHEpzzoiSXjC4+cVTJR1IFIhDPp7n61 w==;
X-CSE-ConnectionGUID: Mrh9FPvQRdGGk2g9DlCIrg==
X-CSE-MsgGUID: Ac84hzEUSkmFFp8fmFgO+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708795"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:33 -0700
X-CSE-ConnectionGUID: 8MJ1gmIjTj2Q5ANrJjwAbA==
X-CSE-MsgGUID: 9t9+AdxiQhOX3l0OAtbxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms+dIOYQg0lCo+aL48PXDNHdhEutmVeiiSf7NwhvU3JPKII2Zrwuz78YAZIdZ8fZW3CfRl+elRKCn0AKHUQ+zoUDsS066+Vt8wPlIDUWAZCUNgfWniS3+au3ZlYKdUS2nt3z1OZfMzEHuZFW0Wp3vaxiwPq+iH7SWYMyU9OWjGsAM8RaDMvu2lhEJytF8I42JCJ/gDnYrcsyBw6bqYXBEmsVjvaQ6WczXL9elhRJwo7Xa0nfRLySJ7baJJGtTM73xqwNj3i12BH50f9Uv98mWJILZVaBQ0j02LYwL+UXQK4M5YbU5pdBAVDscJhNTwxCB6jZ2f9rYfuTzjVmKJRw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHCAPpUCXiEK8LddGGmA/VgEWsw0ToVm5/V6XBcTUEc=;
 b=ZMGiqbk/ZqFnClXsGU32R7xZnrTQYLh2quPkv/d2+4JO0rGJjUwC1VRafJES8iP9xD5kM6QRossauTi+XFsMiV+uqKk32EhSduirHIjFGTNoJ9OfY+cV13GmTz1zfoeyH+8mla1LNmjE8trRsxK7LB2wFYNoikKt0BwrJ4OSit1dXZAZIrPqSZcb6xnJe7jxc4tMw/PwIKqh1mQVo26kW5ywZiFiS9wD9+mN9IxVpQExIF2c77hmuar/A+1NewT4p9OTbmwVJfrcczchL0AGEAyf1RUa62Lb1lQZ4txISRlz+ihLAvIJAn22z5wuYks3bbZ0b10B9Lg8PhgYhCfF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Date: Fri, 3 May 2024 15:13:06 -0400
Message-ID: <20240503191309.7022-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 076b25c5-fc3c-4e5c-badb-08dc6ba51e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzN2cGNKUE1EdU1KMUVIU05CK2xPREZkRy9DanFYd2RGT0ptMDVNWUczQWJh?=
 =?utf-8?B?WU14Z1RvQy93b3Y4SGJUZ09rS2IxOVZSVjRRQ2tTTzhkWkJPbzNBV1gyb211?=
 =?utf-8?B?UXhJQWRwNDQvREJFOHNlUUdIRklSMS85a3F6WDRKRXFDa0U5aTNjUjVSN1Ax?=
 =?utf-8?B?NUc4bmlsa1lIVW1ja1h0WVJ3R3FKalR6VFBSMlovMldkdmtiSVhpWUdjZGl5?=
 =?utf-8?B?UUZpNG83NTJ2QlhjamhiYjlOc1daY3dpOGxNODkyMFkvNTVKbG15QzBWczBi?=
 =?utf-8?B?cEVrZ09UNTV3YldaenEvaXlMa0F1Tzg5NUJneElnKzIzZVRpcyszcjBrS29t?=
 =?utf-8?B?TWRGOWpBbWFjYVJyaVpPc2tHM3R2Vlcvcy9IVTUrOHE2aTNOZkxsMTJhUGxQ?=
 =?utf-8?B?WVAzRWs0emJaSFNkU3hBQnZIMkhJeHVaSmx2OWpHczZvYUpuTUdIZ1IrMmRY?=
 =?utf-8?B?NkkySHdUVnZ3VS9Bb3R5em9kR0FlZDhXN0hNRHFLSlREbTA3YmpNMUYxR1BX?=
 =?utf-8?B?VTBNNUdPTTlxTWtTYzdmUWU1dzNOZ1A0WWQrTHFmT0REeVBhYUViTmc2U0t2?=
 =?utf-8?B?bXRpOEFmSGo5dGVtc3B5MHNPbFZBcDZHdkkyTHVwRzNrdk02Mm1TR0F6VklS?=
 =?utf-8?B?K2wzL0Q2NFJaa25XSXJYb1p2d1UrMjYrY1ptek9QSVJvVW9HRmt1Q05OeWo0?=
 =?utf-8?B?U2NZT0FWQTlvWmE2V004NjVPbVpLM3dJekIzV3hYQnNaL1VvQUwvL1BiZ1Bo?=
 =?utf-8?B?VHFxNDYxMXE2b2dmSDRKNTVGMDFuSkR2Q0FWQ3ZRcHNKZ3BFSHY0WUprNnRI?=
 =?utf-8?B?RU9PUjZDcGZLMXFQMEE0aEp0bGd1UlpMdWxSZlFOK3p1clVPbG9odWhCUmto?=
 =?utf-8?B?ZmhWMzVYeFNaVDlzRk12UFVhTUt1RmxnRDd5YjRNem1Rb3ZNQnpIT2RUUHVM?=
 =?utf-8?B?dFl5UTVENVNnWXVlVG1Yd0lKZXE5a1daTFhkN3ZKREp6OVJyekdKQS9rMU9S?=
 =?utf-8?B?NGV1eUk3dnl2Kzl0cFgwQU9XL3U2c1BWSXRuRHorSmY4cEpoMUxQaGNDck1F?=
 =?utf-8?B?ckxuc0dwZGREUnJoM1hJKzhuK2R6dlBXcm1IdzRMamk2Wm5ZVEpobmJLVFND?=
 =?utf-8?B?am9yNkxVY0YvdU1ib1p5QVpmYmlvK1pYUERkQ1ZoUWxsTk9ZemEvbzI5eVFZ?=
 =?utf-8?B?aWhVSXZOaVBsQUFtanRpWGswenlDcWw5VFZRTmZEbGhjZGFqckNVYmVtVkxh?=
 =?utf-8?B?b2FCdUV0UFFGR2gwWk9GRkJ3WjN0SXpCZWF2SzNqdUdDKzVQeGJaLzdSTFNI?=
 =?utf-8?B?Y0VPbHZZRXgxWVM1eGhRQmNiMFAwZmxHSWhWWUNjQytYMGdOZm9NYWkxcEQw?=
 =?utf-8?B?b0tEdWpBL1R2KzdYcytLSGFIcFBHUDhxbjRrUTdGcTd2aHE4VHZhd1JHZ2I4?=
 =?utf-8?B?VHhBU0hHK2FyQmI4Z1hldzBpRFlGNFA0MFQrYVlvUyswUURDUWFmWTZUM2ZX?=
 =?utf-8?B?VXFLRGJoMzUyaTZmNzJNL2h5UlRrN2ZPQVVMMnBQeHEvT2lKdHdnenBuMCtH?=
 =?utf-8?B?UmJzSTUrYnVxcjJhSFhEcStSV1RZUEhJc01rWmlMU3NkWmh6bWNZbVpQYTVo?=
 =?utf-8?B?NTBrNXoyNHBsRERKQ2FRd0tHM3ROU0I3UWxXSXhwM3VQYmlJNUQ0WDV1Ri9B?=
 =?utf-8?B?L0VCY2lOOVpYVHo2RU1pRC9YcFBGRU5zaWVmYUVldFNTWGQ4a0UvOGdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aURNSzZtNmgvMHFCU1RJS245N2taeVJKT3RXejRiSHhualVKc0MzZ0tiQ2Jr?=
 =?utf-8?B?dmhuWE5CTUFzRVJ2MmxBNlFsWTVHSEFJNk02bzJzdnNEeTl6WE16WVFuMUFG?=
 =?utf-8?B?U3dGWU40d2ZiY3dFNzhrRmgxOXpiazk0ekRpSjRjTTl3L0tERXdWU3d3d0Nl?=
 =?utf-8?B?MEJWNTMzenJDYjlwQ0tPcmRoSHp0SitxUE0rTUNVOTJxdjgyQWVkYzl3OW1W?=
 =?utf-8?B?OEJaNUdKYU1tUnIyNEt2dkRjVWZNYzZjSUpFLzZWbkw1SDJ6S2RiaGJtRmVx?=
 =?utf-8?B?NmF6b0NIaVE0cCtmNi8zS29xOGNsTy8wV1c3dlhzdGlHeWNmbjY1ZTJ5eUpD?=
 =?utf-8?B?Rk9uTVdjbDd3b1VNZ0tlS1l4N2oxM3UzZ0dSRng0NlJzWXV6SFNGR24zQnFl?=
 =?utf-8?B?MTFhYkNzVmNGWHJWR24vYUVPY1dObHZDRWxMdTh6aUtsTTBiNHo2WDZaUzRN?=
 =?utf-8?B?ZkdHaW5jdEhxWXorRnZMcnVKaER0MVBORHdrL2JQZEdNSTFhOGxwZktRbVdx?=
 =?utf-8?B?NGhTelZUQVM2OXEyaDFJWGJDNTAzTDV5SGFvOFNTdXdxRDZ5QlRSdUtkd3lY?=
 =?utf-8?B?dVJ5dWZiT1F3MW9zYmFENmpQZlNkVHRhTkNwTENSQW5scGxlbjF3c0ZpNUJ2?=
 =?utf-8?B?U3lra096MnFDRnRzK3o0RXBsSGt3a0hiTFY4cHpVK2RaYWNPOE82bGUzbFhH?=
 =?utf-8?B?T2ttZWpHWTlndkJsVDlBYVFVQ1hEa0dUQlNzRGQxUmNOV0RHMmZlRzkwaWZO?=
 =?utf-8?B?ZWltZXZqUnZzQXdRVnh2cGt2VE41VTVUenhIbThVcFpCdkdLcSt3OVpSQzRm?=
 =?utf-8?B?Sk1JS3UwV1Q0TEwwL1ZPS3RLVWlkUFMvSHJaWWxiblJZRjRTYlBpWVpvVjZn?=
 =?utf-8?B?NEVXeGF5L1JhOHlLaWJya0RoZ1I5aFhPMzRyU1JWUldhb3MvMTVnZC9KK1ZJ?=
 =?utf-8?B?OFB0enM4MlRJK0ZCQnM0MDRKQ2ZiOVBkc0o0bkRsOEp5dGxYb3hsRnFvcXhj?=
 =?utf-8?B?YjlCSXQvL0duUWxwU3lyQjMxekRKSSs0allnQVlmclFzcTBWUUVYTVA5MnpM?=
 =?utf-8?B?K1FRaFNkWndKZ0R3SU9GZ3VrU0JQdzNkZ2NJMnJzTEt5YkUzZXlUY2cya0gy?=
 =?utf-8?B?c2xwM0dXMVdlZkNiVm9uSTlyQVFqQnpHaHJhckdzUGZ2Q1pMVmE2cEgwVlI5?=
 =?utf-8?B?NllWbXE4WDdaUVBTMi93R1lGNUZScXU4VXM0QXpYcFVlaEhMbmFHNlF1YXp6?=
 =?utf-8?B?TFlmL1loY1VYZUZBQnVYZGpmQXBjR0JmbFlqOUtZQ3VDOU0xZU5Fc3FKd0Vz?=
 =?utf-8?B?ZW1IZXcyNjJ6TGVhbU9ac2JidDZzVEFPMU9odEJReUpuQk9oL1B1bEVvUk5D?=
 =?utf-8?B?QUpkbUc2ZFlXZHFSVGk1NlBrRGlqV0M2czl1MjVOSmlReWNCSGcyOHZIYmZ2?=
 =?utf-8?B?YURudlJFZWVJdWErRkY3TjYrUURJczJhYnhlR2l0ZGdGUVorRFZFeHl3bW9P?=
 =?utf-8?B?eW90R2oraXVnZDlDeEJnb1dUQXR2UGkvUk9ja3RWSFNNVmVXdzVaeGRYaHFu?=
 =?utf-8?B?UklpaG1UN0E4c2gydTNrLzhaMGVESDNZdkpPNmlqWkNuZ1h6UzJNcEhKdDZj?=
 =?utf-8?B?eTNXRjRNUU91SmhzNHlERWhUOVRDTGVkclFJZVVrV095bCs4VmFOM3h4dXcw?=
 =?utf-8?B?Umo2V00rOUR1UEYyNGNnNTFoLzdDU2ZGNmE3RHZjcFU5Z1ZpaGJQclVYazlq?=
 =?utf-8?B?MUNqNDZvL0hJMElSSzhOVUU4cmJmSWdES1orS0JTQzdpTldvbEt2dC9wNHFK?=
 =?utf-8?B?NTI3bmIxVjFxc25tTVVVMWxwT2lESUQwd0pYeEFMU1B0UzhJTktlZGxWWHZN?=
 =?utf-8?B?cWRUT3dsMEpmUUpqSm9uQUh3NW83UUZVTmNyV3RJcGFCbWpCNHJCZEx1Mk43?=
 =?utf-8?B?NUZuRk1CZUluNlRWTXNidDRzN0NUc3lkaHFvNWRNUnFQRVdrMVhYWHFZWi95?=
 =?utf-8?B?c1IwbWJMRUVIMDZxbmVYVTgwdW91VTFMWkNuTEJtS3JycytNRzNYNzBvbi93?=
 =?utf-8?B?UXM4Szc5OXhBMVZvYlp0MGlNUEwyNnVKVUg1bGRSL2lPdDU2RTRwTytoWFcz?=
 =?utf-8?Q?d+aKh7escSiRy6FWrasewu5fF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 076b25c5-fc3c-4e5c-badb-08dc6ba51e14
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:30.1005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIk2ssbWwYe5WIihb6QvLUFXuT4s3f5GrrsEZWImDEniZzq2L8yMYHH3sgEl+oRSQqsHUuoGYOCGhl2S7td8CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

In the regular use case scenario, user space will create a
VM, and keep it alive for the entire duration of its workload.

For the regular desktop cases, it means that the VM
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

So, let's limit the protection only for the long running workloads,
which memory might be mapped and accessed during this entire
workload.

This indeed opens up a risk of use case without display, and
without long-running workload, where memory might be mapped
and accessed with direct read and write operations without
any gpu execution involved. Because of this, we are also
adding here, the extra protection for the special vm_op access
callback.

In the ideal case of the mmapped scenario of vm_ops, we would
also get references in the 'open' and 'mmap' callbacks, and
put it back on the 'close' callback, for a balanced case.
However, this would also block the regular desktop case, so
we are not doing this.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c |  6 +++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 52a16cb4e736..48eca9f2651a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1157,11 +1157,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static int xe_vm_access(struct vm_area_struct *vma, unsigned long addr,
+			void *buf, int len, int write)
+{
+	struct ttm_buffer_object *tbo = vma->vm_private_data;
+	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = xe_vm_access
 };
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dfd31b346021..aa298b768620 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1347,7 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
@@ -1457,7 +1457,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
@@ -1592,7 +1592,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	mutex_destroy(&vm->snap_mutex);
 
-	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
-- 
2.44.0

