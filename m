Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F0AD2CDF6
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 00:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1FD10E32F;
	Wed, 23 Oct 2024 00:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3ALaQHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E173710E082
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 00:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729641655; x=1761177655;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o2zXiVQK6p4/GO2A2/EXlVPTSDvEhw5Te6PvNa9jk1c=;
 b=k3ALaQHl8YD7Hx/I17Vlt4JuEs0Ne59JA3yKn0P8aSejhiK9eV7b/NYQ
 Tr+XJAFLFHYWrJHRM40NkmK6+noFkLrinLe5XmKifhjVpnImtCDOeyZV7
 stei65R/vebATt46upw6m5WXw0UESeEGoSnW2GBaEjn+cV5TMqmjpaElL
 L0GjumQ0dzn1RwI1Ig7dEKZg2zTIUyNUNuoRwGo8iROlCwfg3yDxal206
 yGUavn/61HTNOJo3jSBc0RMNlaPeQ4CbeZjx9VxBU/fbuTK10z5b1uGIS
 6jGPCCubIra3kx+ydrD/mR7hknIr0d5Jt6Yxwhc4itOtzIfA0EPkJQ6ur w==;
X-CSE-ConnectionGUID: RDO3D4MMTwOfp7dKHDe1Nw==
X-CSE-MsgGUID: XvwXdpymS9qSifzazhIWdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29105212"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29105212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 17:00:54 -0700
X-CSE-ConnectionGUID: L9U4vmeVT6aSNuI7VbM6Lw==
X-CSE-MsgGUID: im2BH2kKRUuw1O7lLNvRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110855025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 17:00:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 17:00:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 17:00:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 17:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzngmgsG+GITsT2tzGLmkAM8FHntSKAGjcdN16KaEfxQm5ZmhVMqIA6ahittf7KIL69ifD/bvr53t9NeIRuSkZBzkPZQ4yjdii1tqZyuVdnlxFK4rp5Qv6YFuRGaoXmG3y3S6DDt41k5sqrbEmzKt4OlijY8TF3kPu/4OXKUZskALSoA05dqOOkivdUPVeE+AtxJnVC/VTE0BFEauKncPbZ6RSQSoo7WN5mBZrOW+EwHJkPz86Dn6+uY5/banlSj5wYFrfBb68K4h3VbxxLVlX2Pm+2gCk4AnxIfqiiZI2KaXMllexnHR6kWzZLJDfK6E6qPH1c4R2x9dWVocwHjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcxxJEJmYyPt6qEl2QE/VI2Cfu3CCK5POX3nX0xYFY8=;
 b=HnNHG5PknFSVw/SagbC4VkXZVXR5QPi0VBIHTcYgZuyV13AYgi+/L2gMxH0UW5Qhzx5VZnpuBqwoRu2s40RzTjdoB8kjSSFIKGSEHECZHH56ucHwB7ZoppIGCiTMsswDX1nNBS5WoFmEqfq2x5zZ5c2o/wWCHuGrb1doU0ZtTuZWHDOZnRU+p0qyeiKJs/wF+5jJYp4RkQ7KUm9ph/qRlVu1u4DctToVaHryz8QIBFTVucmjxyKi6TF5cG4/fClryLuHiG5cRkJc4bt3txUui4AyVRCe8b0IR9FP4x94L2PfSSuLxsIZGKSKHtHbaB/ERcPrzlLErcKjS4p+Eem/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 00:00:49 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 00:00:47 +0000
Message-ID: <da1914c6-40f8-4dd2-b9c9-009a41487a3e@intel.com>
Date: Tue, 22 Oct 2024 17:00:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/lnl: Enable GuC SLPC DCC task
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241009183648.36948-1-rodrigo.vivi@intel.com>
 <20241009183648.36948-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20241009183648.36948-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: fda731b0-bb3d-4ac6-784a-08dcf2f5bfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MENVNEkvajVJY3NnOGZTM0FVbEJJU3ZleEpQY1puZkRjUWVxVWJNWjg0M3Ex?=
 =?utf-8?B?UW1aTVprRFFOTWd1b2J0OUQrUXBhS21FbFoxcTk2TXIrMm4wNlR0TWlKQXZs?=
 =?utf-8?B?WUZjWWpaSVMvVk95dCt2Q1JJemJsTVVSUTFlY0I0RnQxMzNWK3kxV0k3Z2lX?=
 =?utf-8?B?b3ZJZXBvcENtSExGeitYdEYyTHkzY0tUTzhwa1AxalFhbTN5dFJDeVc4OElq?=
 =?utf-8?B?eTYyYVJ3QWJFeTZ3Uml0UUJPN0N4Q0tTRVFKbFNJcldHd3BKam1vNFhMelV5?=
 =?utf-8?B?ekM5UTNOa0NMYlBpSzE1NHlGcTd4VU9kYVNnUlhHOVN2QUhoRE5PY3ZOWFRp?=
 =?utf-8?B?Z1dWTXZ6Q1NFZ2xGRHFsWDY1R3d5QWVUeG1VTzduLzhvVW8yc2o0SVBSenZ3?=
 =?utf-8?B?R2JLcU10aDNhSEE3OWViZDB2Z0VJL3Y5SzFwYk1ENHZ0dlZFTzBOSTZQVUxT?=
 =?utf-8?B?UFdkSGhqR2t3L2FmV2FLUldrcEhWdHdZaUY5MjlIV1RScXg1WmhjV1VRbFBZ?=
 =?utf-8?B?RXpnMXFqZmt5MlcxL29rTDhnMWgvNytaL2xVMjVRNGVYaHluL2VkbFQydkVu?=
 =?utf-8?B?ZEZrT0RJaHFRSzhkdllzZlNiU2N5Tm90Z2h2SVVoWHNDVTFCQTlQNklaT2U5?=
 =?utf-8?B?N0NLQU83anR1cjRNRjRIcmdWbk1TVys1cmU1TTRCK0VIcUJUM2tQVzZuY0hJ?=
 =?utf-8?B?K3d0QTI2RmVDdmtJSFk3cW9pZVdMYitQVms1eUFBTllwL2dZNGI0WVNkYzZr?=
 =?utf-8?B?UHRobUFJaXBxZ1V2QTZnb0Q1Nk9UbkwxUDlIdjZoN1d1QWYrZU1OSFJRZ0RI?=
 =?utf-8?B?TEE5dkpaSEl4dzRmcWNVc3JiZnpEcnJRRkYzTURXaDdWNTRKaDI1NWI5WWdB?=
 =?utf-8?B?RGdmRnVjR2h2YlpqcGt5WUQ2TS96WFNiQ3JIM2hUNGpmRlVpNzU3d3JXNUhC?=
 =?utf-8?B?MHFxWXN2ei81VFRXUDRpOUV6YjJFL3F2bUZzVFZ0bVVETTdmMThzN282MXNN?=
 =?utf-8?B?V25uTVF5bTR6cFMvYy9UMndDZ1FybFNveXFpc2haUWdXWitRWTJWSmZJMzJn?=
 =?utf-8?B?YnJHUHIzNWRnOUFSTjdzUzZHbWJZalBIaVZtandIR0lqRFVaMXlreUp3ZXJN?=
 =?utf-8?B?S0pNM1AzbVNuS3lMSFQxNDFBck52b0JWelgzZkFPVDJueUthZmJDOFRFSHcz?=
 =?utf-8?B?bEJya1ltNDE3NGZxVGJJbjA0Sk9EK2djaWZvZ3FYdXByN1BNUGkxRTdHR2Vq?=
 =?utf-8?B?NzRzaWduSmJUUjNPWGZRWXpqVWt0ZHYzQUJZa1pySWFzb2hRWEhUWk1qMXds?=
 =?utf-8?B?YXBHQUp0QTg2V0RGSTFjSmRmb0x1UFhXdkdMeVpNZDltS2NiYlJBTDM1UUNh?=
 =?utf-8?B?OWQ1MVF6bFBLRGNKQ1NFNmN2M2E1WmdqdUhaSXRBWVc0aloxVkprNU1Ha0dK?=
 =?utf-8?B?YjBONDd5bFFMVGxTM3BtdnhnbW9IZ3JORHp5UHRqV09sZzVGTEgyaW5ZekIv?=
 =?utf-8?B?N0tRR0pyeXN4R1k2UXd6MndlOU95L0ZSeFNsQXBoc3JraU1LaG1OQ2RWTnF6?=
 =?utf-8?B?djA5ZU1oU21pUnNqbGRyQzlmeEp6QnB6SHZ2VXg2MFRkK1p0WGFhdjBmQkla?=
 =?utf-8?B?ZHVidDIrSTlzWEZCVFpNWTJod1BMaWp2MHJjejYxWVhFeU1WbWtQVFpENjgy?=
 =?utf-8?B?ZG9qK2thVDhrNUdsNjJiL2ZuNCtETG8xRys2c01KczdTVEcrVGVvTXd1c2xV?=
 =?utf-8?Q?xVcOcJ8D527epDcbn7VfQvfoRpPTQhPnLRIQWTb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFaa0x4ZEhBaFl3RWpKVFVNam9WZ3RLVnpKR1JUNGQ0THFydkF1dFBtTVRS?=
 =?utf-8?B?dXJPM2E3bE80b3lUWWVjTVcrMGlFbnA2Zm1LNjh0a2ErSTBld1pkTkk2K0Qw?=
 =?utf-8?B?NzBCZm0yRjlSZis0akZ6ei8renhSOC94eElSVUtUWDdrc2FGMGtVd0dYZnYy?=
 =?utf-8?B?NUxUUkMyZnVtZDlVUTJIU2NEYW41cGxpRGNiTm5SbGV6M3VYOHlaT25SMTRW?=
 =?utf-8?B?dkFoTmRrOUFFcEJLQXpnakpWZ1hmcUZQWDFmRWdHSDJPZGU2N1gxYitSTGRi?=
 =?utf-8?B?MDR0WUdoL1J2TXlZWVowM2RkUW41S2lLRUw1cm9ialBqKytlam1UYW85d1Ev?=
 =?utf-8?B?ZUxSNDBjNUJabkZTSUVPRUdobFVzTEtxZEdxcW5neVJmazhPTTJMdm9nZkVX?=
 =?utf-8?B?anViNGl6TnlBcTEzUndUUXpObTZVTlZYbVFpQkhxd0lLK3oxck93bndRc2Rs?=
 =?utf-8?B?M2RXZ0NKaCtyL0pJYW9hWXdYck5XcU1jNGdwdDVMY3pBeWwrTSsraThlMTBk?=
 =?utf-8?B?SVdOVFMzKzNYdHBHSWxZTFpsRStXZDN1dHA1dlorMmlidmtFeGo2OHFGY0Zw?=
 =?utf-8?B?Q3lSTzZVZnRUSENnUlJpSnNVRmVxRm9SanJ2ZFNUc1FJaTdGV1BDZG9wT254?=
 =?utf-8?B?VU1meUo5cWF2MFgwM2lSMjRGU2JETWtPYWE3UkwxYmhEakVBa04zYUpZYlAv?=
 =?utf-8?B?Q2hLb1RYanRVQUpqZ2NncnRhY3J1dExoVWpoRTRzK2hBME9uODN0TlBoOTRZ?=
 =?utf-8?B?ZzJoMHZPdER1TExuTzhKRDFHQ1JPMDdHbXJMWnVzSVFYN0dYcXpra05ZTzZ1?=
 =?utf-8?B?QTU1RXdPMS9aV09FMlltMTV4TUZ1SUlUd244U2dTMWZFQTBOWGh5bThJYkV0?=
 =?utf-8?B?MnZ3eElLZG5jS3hwbmFMZHNoSVlTWjJYcFpuWVFXd2krTjNKcGRJd0FBZVVq?=
 =?utf-8?B?alc5MWRqWWxqQXd6bU5EODFOWXV1SW1jOThSSW85ZGtKanN6MHlwSGRnTEd5?=
 =?utf-8?B?ckwrY0RRMzJ0eXdVR1V5Y0tKMDIwN2F6Y1lVNzdra1N0cElmRkVJRVBLeFJ5?=
 =?utf-8?B?RDg4cmdWMy9pNnZxYjV6VEpjWksxYUZZaHQ4K3AyM3JrNTQzVDdrQmJJOWJQ?=
 =?utf-8?B?eUFFcGJWU0FFbktJaWU0NGhGSUJGc2RjT1Z6SEFNSFVVaVI5cnJhY1MrRHhz?=
 =?utf-8?B?M1RHMHpsYXlGQm81b0xYeEFBSUk5cHVrRXZpZlM1aHlVZ2diQTdhNjVaejNZ?=
 =?utf-8?B?VWhyWmdrL1A1eDUxWENZVWtvVjBZRGNYVmtQRVd6VzgwakFMWXUxazlOZmJo?=
 =?utf-8?B?R2EwcERXSndXcWxEbi9RU2dFUnpFZUpzTVJiUFFnS1BjTFc3ZXYyYjREMC9W?=
 =?utf-8?B?VjhjbXI0MzRyckYxZGY5ekUrV09kd3J4M21xVm5uR2xwaVg5R0lYRlRPQzdT?=
 =?utf-8?B?clhmeVZuZ1plN2duWTBMc3BsWXVhRnpLYXN4N2d5dHdlOHdsdkhabTM0T0py?=
 =?utf-8?B?YzlyUWZaWnpXKzNLdTE3aE9mNzJla2dzUjIvdEhqZ1NIM0psZ1FVcnJabkZa?=
 =?utf-8?B?eWx2MEpva3ZsalpnLzgrWlN4TVhvc3dZRkJOaVZnNXAyeUtCeU4yR2dtdGZq?=
 =?utf-8?B?VzlvOEIyWUtkcWxqWEVDdlBkYVhkRUZ2VDZDZENucElLcFYvMHZjMDQ3TUNY?=
 =?utf-8?B?ZGlCTlVmRzIrQURYcEhqQ2ZYREJ2RW45c0FUdmJjTFd3RGxXRi9WcVJHbVVT?=
 =?utf-8?B?bWovNnBiblUwSWlVSmVubWZ4UmlwaTB3TE1xcE1MSTM1Y2NLRDhJWmxlTTN2?=
 =?utf-8?B?em1PTTlFbHIwc1ZQdHNmdkhNZkZ0d0lqaktvWlpwNTZCaWtremQ2RmlxT2JO?=
 =?utf-8?B?a0dCZTI2b1BQVEJhb2F4a0t5bTJ6TXhjSS9mVVo5WERHS1V1T01sc0JkcWo1?=
 =?utf-8?B?Nko4WGpERlo5cjFSOWdiaExUaDF6KzhIVWtiVFhlZnl0bCtKT0Y5bE5sUHgv?=
 =?utf-8?B?Um5BY3IwWFRrTnk0TjZYa00vODRTdjJreGJYRG9YSUxLM00yWGRETW9lS1Jl?=
 =?utf-8?B?c2Foa1FDclZIMTZ1QU1HdVNZMURSdThSUGFFL0tDVnZiY3h1L08yZkdPNlQ3?=
 =?utf-8?B?RXR6cXNOWUNVZnh4Titaa2hZTzZLRVVaUis0aXZlaTI1UWpyWVRCOGdTM0lw?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda731b0-bb3d-4ac6-784a-08dcf2f5bfaf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 00:00:47.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kUkqxX1MDGxlewuxfMz5fUwib9NbgAYEdYq9ui7GHQLoANYvUyHPRUcNt4/KxEOzo8G0duS8BT/94x3mUdBXvYFvOd1BW/A/ssB13vRKDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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


On 10/9/2024 11:36 AM, Rodrigo Vivi wrote:
> Enable DCC (Duty Cycle Control) in Lunar Lake.
>
> DCC is the SLPC task that tries to keep
> the GT from operating inefficiently when thermally constrained.
>
> Although the recommendation is to enable it, LNL GuC is leaving
> it disabled by default on LNL.
>
> It would minimize the GT frequency oscilation on throttled
> scenarios, what could potentially reduce latencies.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 4b38523c49e9..d141165e016b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -948,6 +948,16 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +static int slpc_set_policies(struct xe_guc_pc *pc)
> +{
> +	struct xe_device *xe = pc_to_xe(pc);
> +
> +	if (xe->info.platform == XE_LUNARLAKE)
> +		return pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_pc_start - Start GuC's Power Conservation component
>    * @pc: Xe_GuC_PC instance
> @@ -983,6 +993,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		goto out;
>   
> +	ret = slpc_set_policies(pc);
> +	if (ret)
> +		goto out;
> +

Might be better to call set_policies after the wait_for_pc_state below? 
Since we just did a reset. Although, pc_action_set_param() also does a 
wait for running state, so we have some redundancy here.

Thanks,

Vinay,

>   	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
>   		xe_gt_err(gt, "GuC PC Start failed\n");
>   		ret = -EIO;
