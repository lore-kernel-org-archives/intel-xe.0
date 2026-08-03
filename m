Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC873C55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 19:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B32910E058;
	Mon,  3 Aug 2026 19:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlB0jdu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868CD10E058
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785785181; x=1817321181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KY0Kj2YsSqaqgsXIid7wFbmnhrClSLOa93tSffnWbS8=;
 b=JlB0jdu6vP6ruZikA3YLsuYYf1MFbhILDi+bkgn7vwpCcBjHj/Z8EOVb
 Panrtp/7VPRnRxbEALX4GIUqH39x4qrDUgIQhUDcyWopiwP1r9mxkBCHK
 SwEwM1xWEbI9DwpcywAyrYBzFKY+usd8241maUd18PTvx/NzcUe7tO9AL
 vJQvXRP3RUB3eoDVT46QeUeaSfxUj94RxfSUbbpRFt+mqjVPxC9QlG5lQ
 6yRXYmMnU4ElWgidzHZDYVfG/hqIK52eOwBt5IsrClruhjsZnUk0lEMUR
 rohuFLybiUHGnH8dv558JQ2sqbNw03Bwk8MgSkX3lNnf9QkYsqKrNaF40 Q==;
X-CSE-ConnectionGUID: PtBdjV2fQpCSAkYPGFIV1g==
X-CSE-MsgGUID: ICUrSwWmS/OMQIo/GjGXWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85308516"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="85308516"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:26:21 -0700
X-CSE-ConnectionGUID: 0nPCsIDYRYOmC0qp86ZNCQ==
X-CSE-MsgGUID: uwsJcJFbQ3KDdjcP3S7G3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291242011"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:26:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:26:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 12:26:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVt1Z3NFl1f5oniDGthbHlcSG0g0E8305uRgEqMKsTeAPniSB/dl9tTlRXsYJo9Kq2DHA5su++cGHw/8NcRWQ7PXtwSh6tpQytSVQtGv8y/0dHFzu7R3Q59WerRAYEIuB8R/SHuT2FQ//Ponv+O2JGR6uD+u3XQM43S5gezuvLxnx1mKehMxKzeU/G/IljxIUvYn0WQzDjAH+KeSzOoMcZTMTXHQYBZg56/seUi4sw6KvuZtXsQxgKZvH6RkGid0/l3BwCg0i3x1JSPLnkYAun/ABVsY51WNsLxYBOWPpeE0ZStSlu4x83hEX5mWyzi7chFdcD2ogAocxMi6YCfATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlMCy8TnOLPJfuKDuG333hRzUPXAgPMpYPu7UCWiysM=;
 b=TudbEhgx53pYCKu9kiwyZrLpN4GNUnhNtuAgYAxm78o0nH6exI99qmWE+6FYvDssNAN6GrV5yyF8YoyiIxsP3ilWHSla2TNKNvHPmqK/jEBh+CNRYSLcAvh4WoxmXKpuWjm3DnMdCtpQnNOXSoTKJxzC6aTh4shbmVf/7sp1QF6m6CBt9gsQSPz/ktCRg9TNq0U5IPZc4O0dmoXxHPUNdxalwSHRKrlxICZFPDPNOY6Lyn1R75yUxMD8PriEO7Rjt6z0T8mOLAxPIq+KzZavSnlY5kXgz+sZVnzJDKsRDwPSZMUEyfLiWhfMtQ18UD1zaMziZHYofq2+Dp34P7F0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 19:26:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 19:26:16 +0000
Date: Mon, 3 Aug 2026 12:26:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <kamil.konieczny@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] [PATCH] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Message-ID: <anDrVM3/dfZQw0uZ@soc-5CG1426VCC.clients.intel.com>
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
 <20260731040004.1345502-6-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260731040004.1345502-6-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3d7fde-95e1-4532-ccda-08def1951625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Vo8fhSyo4AcRRtj4RaRnf/xr6NnUSD6JoiVh4cTPy02se+TZ1PfldfxBRZL3pQfE/Kj8T1+9hABCNjaWb0ramaI9TaSIZ/ZW8Ca1lyxk/La6lG+6O0R/xBbwiqK3e4J2KvyRXIbeSr7eZ9M9XVXEjhr6+WiaAJ0xKr709E/jREs6iz1akgKCgis6Gp0yE4wcwaFGmjDi/1v0QsnnPwMLFqu4NtJAeRCPKO5UJeEArcC7Sc0jveua20+kzyjKF3gFE42OCxh6ZkKWIGxyBY6nb4OrHCesclrA5LXV/sfUwYHjhQKUc5koP4zCiwzkkEBELs7nipGoB8I9Db5qTQN8FqhtJ7QivDkzV+I1ewRuoxzLlaPl1tOzkSwkuPxNMDK+jhGpueQuQGdWcPfCNOplMXN64dtDi7Sow6YGtKSd1NUvIa2ICVUaHknG6fRe7hjlZRZJe0nMuI4JrJtnJbakGSusglEvoH4HD4+kR9iZbJUqNxELEkW6FbV5xBXv4ohuuCOBwTLuf/CycVFBHRpe61MA6dp1aNfTmhojqYl072u4pCvR1MSTp4qMSIITScywpoajpunEftvF0LAJZdjh5cRbVEIoIlooSQ1YYH+cYRTU5IAnSp9Z53E8WicioBWlq5mYvwO1IRTXMnhdusieJy6u6Sxq6+YhQgAMk3cUTek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFUamY0dW1zcitzc0FrRXNvUGlpSHJtM0N2RmpIRkpIMzJYUmZCaVdlQzVG?=
 =?utf-8?B?WTVvQUNvb2FsTm1PbitnZWtZL2h0NDBabjdSVXB1OTR2bC9qNVM4V1VXOGVL?=
 =?utf-8?B?dTN6Wk5pbmxqY1R0ZTRCclA5NnE4bzU1M3Z1cXhqN003VmtleGovMTNTOEFB?=
 =?utf-8?B?SHdNYUpCbitwdTVzWGU2L3N0RTV1K3duOE8xbWpmcXNmYVNZaWVBUEZ2ajB2?=
 =?utf-8?B?bU5mSEpjN3c2VGJMaEY0dWNWUXl2UXk4VENqSUgxeTdVVGtkYThES0Fvd00v?=
 =?utf-8?B?NTlFNUx5L0N1QnRWMmVFRmRlWVoybmg4anpxelJaL0o0cUV5c0JYZGgybGx6?=
 =?utf-8?B?d2JUQnVWbFR6UHlkNHJMKzlnZXdLWFhCcHlWa3QzeE1GYUhiV04rZ3F5WmF3?=
 =?utf-8?B?MjMwR1lhRXRRNXkyUWordk1yR2Jhd3dudVlsOTA4eDFvOGFKcEdISmlDYXBB?=
 =?utf-8?B?WktBV2xadmhadUxiU0NLWnNremdGOHZLU3U2Z1R6RTRDTTZiQVlKSEM1dEpF?=
 =?utf-8?B?eENCUTRoMGlOeGFDd0dHZE04YkJYb1FCQkh2VGd2WC81SlFTTjVKaGdIZ3lC?=
 =?utf-8?B?ZWMwcFlpYUgrZjBzc2gzZENuTkRYYWtURFlJbzErZW5WaGxzTWt5MDdHa1Ri?=
 =?utf-8?B?azVSa29JTWFwT1JDblpiK2JTRFhmUEZsVEpxZGpya29xQ0RNVjZMbWNabUhU?=
 =?utf-8?B?a2paOVBQNlVDbFoySkZPYTJiZjBBVTR0ZExqejBPQjl2YTZ1YXVzSzhMbVkr?=
 =?utf-8?B?eVRYY21yK3Npc0VnNVR3TTBHN242TlFtc3Rmd1RnUGdqUCttTUVxbFJvWC9I?=
 =?utf-8?B?NThZL0RXVkpURHFkMVNPbEJWNDRyMTdYT21aLzNUMlBZTzY2d2NNZVJ5Si9h?=
 =?utf-8?B?U01yanIycks1OVJLSmFVV3dTSjlNREJkQmVEWGY3M3hkbFZ3QSthREFrVkMx?=
 =?utf-8?B?dzlnSXg4L2dKZzgvZ1NPM2ptZHl5c29sd3RhOExjMFV3bVV4bzludTViaGJx?=
 =?utf-8?B?TC9RajNEMjlFaEZvWjZ5Nzd2endkNGttS0hmSjNqZGhEb2RlZzN5Z01oL3hM?=
 =?utf-8?B?NExtS0tEbkFHK210S2lNTFpCbGtTYk5yRWNUNTV5ZnoxdVFvTys2R1R4N1Ft?=
 =?utf-8?B?bnJEN3JXeWh4RnplRW90Q0MvcHRpMklyWkU2V1NKaUFkMmxXeC9lTHowdERC?=
 =?utf-8?B?anVXb014TEFVNUZvbVJBSjhKOWhKOG53ZFdXUjBldFNqclNhaVJveDZtTitF?=
 =?utf-8?B?eHUvWlJGSmcwVmxoU1Bxd2UzUFQ5d2U5QzRaQVlCV1NWS2NqUkJIcVk0WkxH?=
 =?utf-8?B?NW1WbS9PNGwza3JGSm02dWVSbGR4QlllcGtUS1JjR2xOWjd3R1FzRnpiN1B5?=
 =?utf-8?B?NVpSQ0N1Z1I0aXc3WnkrbE9MVjYzaFRuc3hLM1hpRW1RbVFXY2lDbjJNN0xM?=
 =?utf-8?B?R1NCbEF0UE1zV20xUlNvYWxrYUZ5WVZkVkw4U1ZvaHlZbGxSQ3pHRExUL3Rw?=
 =?utf-8?B?SGxGM3d5YUdwanBtZVV0MW9aVVlnMU5OWFFqWVpYQi9FYVcyMnVmeTNYckVX?=
 =?utf-8?B?Smc3M1YxMTAxNkFHanplUytzcWNTVXZCMG16Y1NNQ1A4am9XNGgrN0RMZlB4?=
 =?utf-8?B?YkZpd29ERVBiT1hKdXZBYVBpcmgzMzVMZklLMXVDL1RUM09QbXhIMHZvRTVJ?=
 =?utf-8?B?MWZLczF6Z20vYTg4Ym05Mkd1WldndTJZd0doVGIvYjJSVXFEWE9MTEtmaTcx?=
 =?utf-8?B?WG82dnZrSUl0YkQyK0tyT0QvMlltNU1VRnA0NFNYeFRQMGhyNWFiMk5DbEFj?=
 =?utf-8?B?c2I4dHVhbzFhRHkySFVVWEdtdTBTNHNQd1NheURITEV6eGpldkM3NUtlL2lP?=
 =?utf-8?B?cGh0WWYyUklTS2hvRWd0RStYZXoxQW41bngyUmo1RktGdmtoejNzTjRtSXli?=
 =?utf-8?B?L3Evdmd6YW9kekU3YnNRR0Jzelh6S3BxT2VRUjg3ejdvZGpWWWJ2bG55TkJG?=
 =?utf-8?B?eVFHY05CQk02bzYweC80QW9kTTlqcmdLWDd2RzdiUkVjTDFrYmZPN2lkQ1RY?=
 =?utf-8?B?Q3VReFQ0dDNIMzAvQmlmcVBYeXY3UG0zYTE3WU43SEpwTnRUV1ZITnM4T0tp?=
 =?utf-8?B?cWwzem4wM01JUWpldEptZm9xNjZuckdnSTE2ZTRCUDR0cE8yUnVrbDNGQk91?=
 =?utf-8?B?S0dINUFDR3RlNzZaeGJadzlNai96UjFqWjl0ODZDcGhGM3pEendsZy9aM3lp?=
 =?utf-8?B?cmpKZzh1UXdkVlc2cGZNZ2RIODF4eHJlOGhlVGk2MDBGSDVUTWUyYXZzbHd5?=
 =?utf-8?B?Y3ZheXQ4NDJlOUExNVFvN0xnQ2h5bFMzM20wOVU4OXEybGdQZDhUaCtZVkFM?=
 =?utf-8?Q?tG1EKguKyX8m/L5uYvneahioGlTgP4s/PSQ4R?=
X-Exchange-RoutingPolicyChecked: pyMCw6iqi08LDP+Bbcr+reaejhqb/Xazn2OOEv9HeWM79hLOXJJtbrXJHriPOFUzitA3XS3jeNJ6Z7aYpucknsNSCCu9nszbbEK20WdReNlaycgkIFrwjHR2ywdYVeBfzB6Np2/vDhIlpdpe0oEg3RxvdNAEW695FoJ+Us7br0dcpxP5W4fsh4eJ9dA6VWhhx1THOTCRfmGUHxSdA5qi0A/z8sgY31624OLZQKCNkvmEIsHvPWZUI16caI9d35qTWy+LOdV9uDIkEnoU6Vd70OB95/h7MVYTPogC+UzBhZAV9FMQIlfNc6dqLxM4cN1xNp8o3qKR8udwnVDiEWoZsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3d7fde-95e1-4532-ccda-08def1951625
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 19:26:15.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GUlkSEPfoSGLo5C8QyZ4uXmPKbXaJ7LDnxztn3wwstjRxhH0MdLDfR9djJACxHtydx66yhdVqO7ugaFa6mflK3CPLblbR9yjBFhotUQZdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
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

On Fri, Jul 31, 2026 at 04:00:06AM +0000, Gajendra Uttamchand wrote:
>Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
>switched out between check and read; LRC stores a sentinel while
>a context starts that must not be treated as a real timestamp.
>
>Fix: Check the LRC-stored sentinel before and after the MMIO read;
>return the LRC value if the context switched out to avoid TOCTOU.
>
>Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
>canonical sentinel.

This one needs a fixes tag.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

Thanks,
Umesh

>
>Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Acked-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
> drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
> 2 files changed, 28 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 3e7c995085d0..78d0456cf3c9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1096,7 +1096,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
>  * store it in the PPHSWP.
>  */
>-#define CONTEXT_ACTIVE 1ULL
>+#define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
> static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
> 				    struct xe_hw_engine *hwe,
> 				    u32 *batch,
>@@ -2726,21 +2726,34 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> {
> 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>+	u64 stored;
>
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
> 		return xe_lrc_ctx_timestamp(lrc);
>
>-	if (context_active(lrc) &&
>-	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
>+	/*
>+	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
>+	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
>+	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
>+	 * otherwise accept the MMIO value only if the context remained active.
>+	 */
>+
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>+
>+	/* Context is active: read the live timestamp from the engine's MMIO register. */
>+	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> 		new_ts = reg_ts;
>
>-	/*
>-	 * If context swicthed out while we were here, just return the latest
>-	 * LRC CTX TIMESTAMP value.
>+	/* Re-check the LRC-stored timestamp: if the context switched out while
>+	 * reading MMIO the hardware saved the canonical timestamp into the LRC
>+	 * during context-save, so return that value instead of the MMIO read.
> 	 */
>-	if (!context_active(lrc))
>-		return xe_lrc_ctx_timestamp(lrc);
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>
> 	return new_ts;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 0a3a611391ee..7be5e3da8bc8 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -9,6 +9,13 @@
>
> #include "xe_lrc_types.h"
>
>+/*
>+ * Sentinel value stored in lrc->ctx_timestamp while a context is starting.
>+ * The hardware hasn't yet written the real CTX_TIMESTAMP, so this is not a
>+ * valid elapsed-time sample and must not be used as one.
>+ */
>+#define XE_LRC_CTX_TIMESTAMP_ACTIVE 1ULL
>+
> struct drm_printer;
> struct xe_bb;
> struct xe_device;
>--
>2.43.0
>
