Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A288CC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716610F22C;
	Wed,  2 Sep 2026 14:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrpxM6Sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7BD10F22C
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360333; x=1819896333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4tXczy0Z4ep3OaZlVLM0hCqkUxLkwNq4i71QZXsaqJY=;
 b=BrpxM6SlU+0+TcdAdkMurBCpTV2MviZrW4rdl2alfrmEp0lymXVrWNiv
 M85zhY7cRLsEB0mHEIVXC6DQHp/KJWclKG53EyXiYq59nyLa04Tf5/Ypj
 LpxEz+Ey2EvV4WzwawM9eZCijSsh7tPxUe30tGVJvSKQuTjZqEUZCFxd8
 dOTuvBTyfX0/5JHzYQ74IWvh5QyQtvE1L3Iz8VGDKU+6Qns9ZzRqHF7LX
 oYTKK/fDiLEwGvvgXAN/Ft4xzVSDsZ2js+xXe1u50Uv+7Z53HM1QqKWFv
 N0VbsHxL1qU5JO1Yx5e957vxSHwAx6eaKQSmiulrha28R/droNuxruRJr g==;
X-CSE-ConnectionGUID: eMF15v+8TEmHeZlajx3Ksg==
X-CSE-MsgGUID: hO26SFC+QBiXh4ZZ3VzMsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106188624"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106188624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:45:33 -0700
X-CSE-ConnectionGUID: agk5L0BzRjmi3C6JzJqr6A==
X-CSE-MsgGUID: rQ3xR/PsQqCk5r8/rA1AOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="272935093"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:45:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:45:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 07:45:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6f8DYQQfMmS730kT9fCJeCkKdI09tSZ2TrXMVrJX1GPhFRdG+AOyPhinliKd3PuAVfAFLCufkQ49+UmenAifR0jcJ/n5i8HVo38je7CkggimgSExRWKbKXP8z/klN1500iXtlPtsVGcQ2h2Zl+ZLbStMHWsvM8ipfK58LCa+9Anr+CzaabemqvTMD8PvSaRTiSN+yqD/lJuZVEhaJj5AZ+V0GLCrhHxWgvb389QQ4M3P6SZ9q0hU0z/SPuU1ABqiz3uOQXmZ5QSHP9KykgyPLtjNjXwjY0nWCIqKua7Y9UYEJPIJ5KunC/DtHoYs5vUWsqngsbpidAlTnJ2oH+G/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a3zW7Y5MQwsvs/u3TssZT+zseE6vUnOzJB2RVjBvcE=;
 b=WLsyfSg12lwupxvQcPc3v2+mZ0OSqCPVtpVvxJZjfj2GiNHhL6F31YdvEgWZsMZRghFW5CaYx5j1d0mOFBE4pWsIbVYQcjgGWNz5W719Gdu9h/9txG/mIRIDzriZPlo9BxvBeOWR30VucNCG638G8dbGB1AfNf6AIPMFxM7MLcX8mEX8ZXfbmAus+TsB5bRDp7EF72cFz3KOfPV0FPdgsvO73IdQyUGIQKp3V4AugRt6Lu/4sEFqB5+aKZlxIuE0y4io5/OFXDgpSzsaYuHERAmAajdeJXacKiQSorFGxFd+1DAJ0+rIRkkdkotW+Nh2xi81X34aavbBfqD1MAiDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 14:45:29 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:45:28 +0000
Message-ID: <d0872861-940b-4afe-a027-d476372373cf@intel.com>
Date: Wed, 2 Sep 2026 16:45:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901211204.131972-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::12) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c9e5a6-78d7-41d1-24ae-08df0900d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: WQRSGdq+OHImdfGBBh22u/YqZewudGRR57Xk5V9QNlbOVgnXzt1fvRkd562T0wsT9dI4pp2ImjqrzuwnMNMZwueXNn7qHuTRqP7KLH8QL5wvxyu/QbBItJOqbUcy2yb/GO3oT0E7PNkMmaxEiaq+isWLVRhcUvfryqV+AfizQ/KGJNGprMTugIvi2dcvJ+cCCCstc02G0Miv8BtaQu6ftIJyFROWA3vj+dhg0HJCtQ2BvEjUX+TdY3eMaqFVjfFOBH/24oE8qNcF0K7mqvDhMB+lX3K19vqo7OAHTB0+++bJu4RaDS/kpQ5HynDgZtrigdCddAAvso7iQisHddFpEXODOWGZLpaL46S4zRFn6WDBgmRlRU+KsZ5u/ybaG7NN9dvyEDwz+uP2qgSnXw5CZzeMdepUXRvh875M58Dz67wl5I3VpNetCUfR78BY4sbbsQ1xZnZ7RoC/0w0U6v0seMdZfmdZOKLNwrIDTTUsa6uUF1KqVZox9kZa6OZxQ82eCKFv9vHekW/ob2bPzTnIJT30KYkgFh/rYPVCH6HzUjBOLrRN8gpxJaVhnYd3XjPQtUzQnvAeO5scR/wtL0m5XBs//0xVHhSxehzG30r4tBOz13eHZvpmccevCgOCSnhnFlVRG/M3T1reFK0Yygv4BrvhzoQ9th48/ItCmz+qROA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0puOHNXNzNJTDAwRFdzVGYxcFhUaEk1UjFuWEM1Q3pJSnprZHJJOWF4Rm9x?=
 =?utf-8?B?c1RhOXl0TnluMkdISWN4K2tKM1lrbmlUQTYyejBvTDBrY3R4YnFZdzhlcUJk?=
 =?utf-8?B?eHoyQ09WZ1RISTZMc0Y3MkpBeHdiVmcycDF3eVQ1aVVkRllOYis1eHRzNjZk?=
 =?utf-8?B?aVBjdmhQd2ljSE1Qci9lcWtJU3JXK1hVajFsaVRiRnk2QXE1bzZBcUpvQXB3?=
 =?utf-8?B?aE40dXlGZHRQeHpSazdJSHEzQjN1dXdOaXFtbDJWeTJKbXJTc3l5bHppTzFo?=
 =?utf-8?B?L1pUQWNmaG9vZXN4RW0zdWpuVlBJY0pIYzhUaE1heEczeS84TkZEaTI4WU8y?=
 =?utf-8?B?RDFHeWZ5b1kvOHBDZEVLQ05mR2pnRGxCMzl6OExLUldUVW5WakxuaFZpOHVC?=
 =?utf-8?B?L0REemkyeEp0d0xOcVFSRmVoUWRkUFUyNS9GS3YxcWlXdURFQnNCa2RCaGJp?=
 =?utf-8?B?YWc1NmZPN3V6SFJrUG5mV0V1bU1ucCt1alVscjZWZit5VEFhMGd3NHY1cGtT?=
 =?utf-8?B?bEVERStoWWo1ejVINHRCT2JhNThxOCtMSHFHcEovK2tKRnVYOUNJaWZEdWhj?=
 =?utf-8?B?VGJnWnpranJNdVFaSldJNDNnOE9FcUVRS1dhWjZEZUFuK0hkejlWamduMFJa?=
 =?utf-8?B?MEZ2K2R1dkF2OXVzQTBITGxCR2hPYmxWZG5UVVJMdnVSWVlGcGhoNDBFcGZ1?=
 =?utf-8?B?T2Z5Qk1DR3FmUmovMlB1STF6Qy9HR1J2T0pUdXNWNk8zV2lnMXFoMGxON0Jk?=
 =?utf-8?B?WFZ6TXZ0dGczcDJNUG01QTBYajNNZTY5M2U2ejRGVnRBVmxyMGNQMWxFUGds?=
 =?utf-8?B?ay9IS1IwckpONk94ckNSL1VFS0xVSldJdWxiMUtUQmREMXdMTW11aGxzVzhT?=
 =?utf-8?B?Vk5kdkFQOXZ6QWorMU9oM3FHWU56V3hKQ3NvYUZlcmd6cjVkUFRHUWE1OWN4?=
 =?utf-8?B?Q2VTaDIrMGFvUitRMkxCRUVjMndrYjVIT3cyMTVGblo4dlZTcTJsLzFVSjRL?=
 =?utf-8?B?RVZrM1BOTmJBRklHNWxrbXZkdTZ3UmZjNmdNVXpTbEJsOC9zL2tCSlE3TzhJ?=
 =?utf-8?B?T3U0T0c4dGVwRlBMcElaTXJRMGZSUlFFMzdpakMrVHJvWGp2NUlsUjF0czZy?=
 =?utf-8?B?NDRUZDNNL1o3NHdmOWJyd291YlVGcysvRjB1OUFGNkUrZTB5WXdXUDBORHQ1?=
 =?utf-8?B?M0xnOHVCRHY4SVFiZE5RbUNpQ2VmOHhyeFRLaVIwZ0wzNldoZU1WbGNhU2lC?=
 =?utf-8?B?WmdUSldVUFppRkNpTHQ2MG4yQnNYTmVlSDhrNzQ2SnF1by94eFVwalp0UDFS?=
 =?utf-8?B?WU8vYkNvbTlpSUtVb2xXdXBBYkdBc2JOdExRK1V2b0N1ZVN4QUE1djFIVW1L?=
 =?utf-8?B?SW5yQVpvSkYwc1g3ajVSS0Nka0I4RjhBVEV4cDU2dFZKQ05ta29EVnJuQ0gw?=
 =?utf-8?B?U00vZGF3ait2MlVvUVIweUMzYWxjUHArZS9HQjdvdUUrelE2U21QUUd0cWw2?=
 =?utf-8?B?Ty9QbUtnbWlHdnVmbVlZajNwWVpHY3hxMTkvQTRoZmFQTHFXR0diTWkwMXFu?=
 =?utf-8?B?dC80bUMyNWJkRGZMMy9md1BscWVkN1d0cFpXT0Z0bDVmUXp2NEdPUWhWd1o2?=
 =?utf-8?B?UjNXYjNNemFNYnd3Q1g2ZjRDNWZZTmppWlhJS1V4SitVOFU2WDYrT2NjY29H?=
 =?utf-8?B?TjBzemIxL1k0OWxMdGlSOC8yc2RScUFtSVhxdjlQbHlTMjhMNE1uRDBYTDJC?=
 =?utf-8?B?cThMSEM3ZXlSS2hETzRWZFNodytBamxwZHhLWFRWdm9iYUNpY29tWDVqd3JW?=
 =?utf-8?B?MU9va0JZeHpJM09VaFhWbUxUcjU1ZC9sMHMyTXJOU2UxeXJlSFB2ekowWmRh?=
 =?utf-8?B?Um5RTjBpNDVSL05oSDJsVmZ2WGtsa2xCK2VWZXBVYWt4WHc1cWRLYXg5UHhp?=
 =?utf-8?B?K0Npak16bExVTjNnZnkzSDlLMWhGRitMbXlDUkV3NDlwaTdzTlJZSXhYTHhQ?=
 =?utf-8?B?M29taWpPdXFPK0ZFeE1Vd05mRmtnY0hsRGdLNGZZa1VJUklTSStBY3RkbXU3?=
 =?utf-8?B?R3h2b0pKL2k2WmN5OURqYXR4R2ZwNFlGYUwweDQ5V3IwSnM1VjdVcmZhVEFz?=
 =?utf-8?B?V3BNc3c3Q3MyUEFWaGw3dnRuYTd1bm9CV0p3Y2J3Ylh3TlFVaVRET0MzZ2pV?=
 =?utf-8?B?S3JpNmJ4RVZ0eWtjMzQ1MUVNdGZIM3VMcmtaWWFqMEdDcjhaV0xKcnI0WWQ0?=
 =?utf-8?B?MjhxSTVaMFUzUzlmMmZPNjMrQTV4RXRGakdtQStQL2QvS05OMG5Ycm5vM3pV?=
 =?utf-8?B?SnMzblpFd045WG5RVlBBWmt4TzBVNWRyL1NVY2U3Y215U2p1QTFFcHkvdDVB?=
 =?utf-8?Q?omAuJORLweqrixvw=3D?=
X-Exchange-RoutingPolicyChecked: dynXbaIf9MxuPj3kApnh3Bssu9pud5/dofJxVAZkyZJ52SgdnoIo6t2suEyY20VFHCqnyOV5XGFZXYGG5xweI8wnWTnNlGijq/j50v6161uMuAWqWqaJJRn85WP+qW10PeJrkk5d2Plc7JPqo1Jdw26+HqpiMQc8gDqeWGtg02K3WjcmsTD+8I3zD1G0GZd68DKbi6oIzNaGORYcO3lGGMAS2oZi4lbOt3wfnQF7CYBLCXqTdqF4FL/GDrJeiOteUuYbrWRPDnYsdaIbEO+7i6iIF9FH/5QHuG/cEKH4sVCeSqwXnNfY9U12t+tCo7NDZKPILbxpQdrG5hCUcDyKlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c9e5a6-78d7-41d1-24ae-08df0900d4a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:45:28.4683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgZmUejIYtgHja67laja8JgY0dQu2RUOos4Lk+HNHu3Z/qs4cgp8Fpx6sz+Adze3whUyCMEcmM3pmGeU2CDkqqmCDBYE3RR3Gg8XFGNEFN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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



On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Convert any errors that can cause the CT to be declared as dead to
> use the xe_log_err() helper. Errors that are escalated to the callers
> are left for the caller to report with SIGID if needed.
> While at it, update some of the error messages to make what went wrong
> clearer.
> 
> v2: use different error codes for different errors, better messages (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 89 +++++++++++++++++++---------------
>  1 file changed, 49 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dcd457f38b89..cf347f960166 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -30,6 +30,7 @@
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
> +#include "xe_log.h"
>  #include "xe_map.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pm.h"
> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	return 0;
>  
>  err_out:
> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> +	xe_log_err(gt, GUC, err, "Failed to enable CT\n");

just wondering, if maybe we should add new component

	define(DRIVER, 8, GUCCT, RUNTIME_FW, "GuC CTB communication")		\
or	define(DRIVER, 8, CTB, RUNTIME_FW, "GuC CTB communication")		\

so the messages will look like:

	[drm] *ERROR* SIGID=104 (-EXXXX) Tile0: GT1: CTB: Initialization error
	[drm] *ERROR* SIGID=104 (-EPIPE) Tile0: GT1: CTB: invalid head offset ...


>  	CT_DEAD(ct, NULL, SETUP);
>  
>  	return err;
> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  
> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
> -				  h2g->info.head, h2g->info.size);
> +			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
> +				   "CT: invalid head offset %u >= %u)\n",
> +				   h2g->info.head, h2g->info.size);
>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>  			return false;
>  		}
> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  	bad |= !ct->g2h_outstanding;
>  
>  	if (bad) {
> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> -			  ct->ctbs.g2h.info.space, g2h_len,
> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> -			  ct->ctbs.g2h.info.space + g2h_len,
> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> -			  ct->g2h_outstanding);
> +		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
> +			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> +			   ct->ctbs.g2h.info.space, g2h_len,
> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> +			   ct->ctbs.g2h.info.space + g2h_len,
> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> +			   ct->g2h_outstanding);
>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>  		return;
>  	}
> @@ -963,23 +966,26 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		desc_status = desc_read(xe, h2g, status);
>  		if (desc_status) {
>  			err = -EPROTO;
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, err,
> +				   "CT write: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPROTO;
> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> -				  tail, h2g->info.size);
> +			xe_log_err(gt, GUC, err,
> +				   "CT write: tail out of range: %u vs %u\n",
> +				   tail, h2g->info.size);
>  			goto corrupted;
>  		}
>  
>  		if (desc_head >= h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> -				  desc_head, h2g->info.size);
> +			xe_log_err(gt, GUC, err,
> +				   "CT write: invalid head offset %u >= %u)\n",
> +				   desc_head, h2g->info.size);
>  			goto corrupted;
>  		}
>  	}
> @@ -1224,7 +1230,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  
>  broken:
> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
> +	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>  
>  	return -EDEADLK;
> @@ -1562,11 +1568,12 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
> +		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Crash dump notification\n");
>  	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> +		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Exception notification\n");
>  	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +		xe_log_err(gt, GUC, -EHOSTDOWN,
> +			   "Unknown GuC crash notification: 0x%04X\n", action);

note that for the GUC component there will be "GUC: " prefix added by the xe_log()

	"Crash dump notification\n"
	"Exception notification\n"
	"Unknown crash notification\n"


>  
>  	CT_DEAD(ct, NULL, CRASH);
>  
> @@ -1599,14 +1606,16 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  			err = -EBADE;
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> -				  fence,
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> +			xe_log_err(gt, GUC, err,
> +				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> +				   fence,
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>  		} else {
>  			err = -EPROTO;
> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> -				  type, fence);
> +			xe_log_err(gt, GUC, err,
> +				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> +				    type, fence);
>  		}
>  
>  		fast_req_report(ct, fence);
> @@ -1683,8 +1692,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> -			  origin);
> +		xe_log_err(gt, GUC, -EBADMSG, "Invalid G2H origin=%u, reset required\n", origin);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>  
>  		return -EPROTO;
> @@ -1702,8 +1710,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> -			  type);
> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
> +			   "Unexpected G2H message type %u, reset required\n",
> +			   type);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>  
>  		ret = -EOPNOTSUPP;
> @@ -1801,8 +1810,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
> +		xe_log_err(gt, GUC, ret, "G2H action %#04x failed len %u msg %*ph\n",
> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}
>  
> @@ -1852,7 +1861,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (desc_status) {
>  			err = -EIO;
> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, err, "CT read: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  	}
> @@ -1884,16 +1893,16 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		if (g2h->info.head > g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -ERANGE;
> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> -				  g2h->info.head, g2h->info.size);
> +			xe_log_err(gt, GUC, err, "CT read: head out of range: %u vs %u\n",
> +				   g2h->info.head, g2h->info.size);
>  			goto corrupted;
>  		}
>  
>  		if (desc_tail >= g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -ERANGE;
> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> -				  desc_tail, g2h->info.size);
> +			xe_log_err(gt, GUC, err, "CT read: invalid tail offset %u >= %u)\n",
> +				   desc_tail, g2h->info.size);
>  			goto corrupted;
>  		}
>  	}
> @@ -1913,8 +1922,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
>  		err = -EBADMSG;
> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			  avail, len);
> +		xe_log_err(gt, GUC, err,
> +			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> +			   avail, len);
>  		goto corrupted;
>  	}
>  
> @@ -1996,8 +2006,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> -			  action, ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed\n", action);
>  		CT_DEAD(ct, NULL, FAST_G2H);
>  	}
>  }
> @@ -2116,7 +2125,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		mutex_unlock(&ct->lock);
>  
>  		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed, forcing GT reset\n");
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}

