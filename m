Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F077F46C78
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B410E02C;
	Mon,  6 Apr 2026 20:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPTagX0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C83110E02C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775506121; x=1807042121;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wXcqasuBH7xjjZhbnJCJawddLCczFogvHtiaXvaqjfo=;
 b=dPTagX0Up8j3DiuPkq4BLL3Fc2tZGnug/w5f8Mm0pXkRf0f58hGqQIdl
 aFMVNFimU43R0D4vUkIaRgphzS2SYSYq9qMQF0vLRs1FTKVupA07WHIH+
 e8HFVzfWpqMhmhDdosEl5bbpVMSQyqT+m3ta3NLjLo4S7ixUKHHVN6JWQ
 h5pjgIXNrTTHDfPaRLy+HMb/iaQFUQNh665tV1YVlvJI7EMHMJHzJ0Fbo
 7dqAC69FPHTXRlNyMpqmOo2YShg8u6DnCYY3hwTldAwmdEWajc5RpAi1Q
 6mI684cUU6st294hwGY9LjpbJbYYNHtWeWygxPwlbRx2QEvhl01TOO2Zo w==;
X-CSE-ConnectionGUID: Mgh0j2PxSF6uZV57CGb18g==
X-CSE-MsgGUID: pulpVMU3Qnmxvp6zbHe0Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87085335"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87085335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:08:41 -0700
X-CSE-ConnectionGUID: tpEGC1h+RF6tn4B9JnR1Fw==
X-CSE-MsgGUID: iiCKWxcaSzu2a5QQoRpwlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="224741078"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:08:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:08:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 13:08:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gez3xbnN1mBz+OgreoOWyOKJD5dHT/wfb06zehe3ncKpiSKsmNxaNdnOBroDEsaXbgDgmGLqTWBqKHlV22rerApDO6blswBVHfqvlvezHaA13Yge6dhHnu8HsjITgNHs0ClMEEC7TalvvvXsE6vopXkUyEU7ExBWzu2TxNlhvw2ISv6yPYFFGUycgpEAmP+ZvXN2oLZGQljHUD/jFQ6Z8jm5Oa6Vn7AFgElYJRl0O7E9Oc/JTsGzgBHUZdt5i4l6zw3cPwvsBg3n6x8b/0CrLsFfl1ySYz7p5Rvb24Q8kg+uLupdK3/aGgpBoLXRJNsWq87+b1y+iFbwH8m/ECpdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkeTmnsKLJJ9DWAx7D5q3uwL5+Doages82TWCEPqGpg=;
 b=MTCzvM92537U1UBpt2ukGA8+FDQ0HJ7XpxA1z9GOr/r4232MnP5/Uza2ft6i5lLEGAPeO7ewL5VukHt0m9cVTxUzEJbqv+Dt6RfvM2YJMqH0w63M0yAgv+OpHOSJkH1WryeV+FKAQzgtx/wHs262Wd9TZK3aYQ0I82/BuqxAOUYb/P0G6wrIuXg/8TryEJRkZo89+4m5cxrPvoGnF8sBkjIdel6O8FZTU/4Wf/GSOBieEJccgD+HKIdtM4X2ojLKvWyhC7Pw9INfj/lV2v0hYHK//PZ2X9v7m2yl5w7SYEdDd83/VliKOF6dDzsC0ImwNq2P6aTdlWWyP9y43vc/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 6 Apr
 2026 20:08:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 20:08:37 +0000
Date: Mon, 6 Apr 2026 13:08:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Suppress reset log for destroyed queues
Message-ID: <adQSwo+SkbQc4goC@gsse-cloud1.jf.intel.com>
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
 <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
 <38565bd9-47e9-4727-aa00-f49962250fee@intel.com>
 <ac8NoEXghE1XbfbE@gsse-cloud1.jf.intel.com>
 <c06619c4-59ea-4ed1-a76b-4d0a70fc8900@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c06619c4-59ea-4ed1-a76b-4d0a70fc8900@intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: a07a489b-aa89-44c7-4710-08de94184a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: wI5RLKOJX9jMuKTmhw0aLdbmMopHWg71UZuHclh/iU90m4nqeWgJhB1gAAyWJxzVZicoLu+jqG5vI+eb/Mn29Kfl289lqcNN9xtdRVqMHT6s8HpKM1c83KB7H9PGhvr1r2lJG8ZvJtamS0E/83CdGPP+G8MmQrNZh6rGzj9GAISuW9NQghuCisdmzYjRv/RqiGOBpIjbiXLK4fqTD/5kSseACgGHAYw7Msq5Hy2cZr33HOWEgC2CnbH/mGskGe/iHmpdABrFrnT0Qzr0rNNDTaEbvzC1T6LQaxELBVfvcKk3iPGfYFIOqh6vdl5985MmNo4bBJddzM+1N2tc3agdhabjQZDPnYajj/bRPPoOporXhENxKNWDfV1W7OsM/eDH8gXalSUrDJLeVqSvPGpCGyOR7D+6vqmhiPD1zLQHHSX4FWbAPPxDo7GXilMddz3MMjIo9HFRoAvEQSV7p3WaWNDJGkHJ3pxGePaNbb+6B1m+6uytJQ6Smtqi49rel4qzA7TqHopURLhBpJYyM8KXIZDufCM7ouDaQFmYtDaURkBsM0UBkdCeI8FSv2DYluVZyKocmtkQNIkIQ+JykDJZawI8b8rtw9A0BddM6P8peadq9IL1JugFBjwyipAdobJIQiXS+62v61s1oDocFuxuKSwv6oxNbwZqTkgS4HlYyumhnhE85vK0tZzkurZdmjnNhoGmX6r7PpqH9ywgkdDTai5kexwW7ye47ZarkY+tVLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0tmZFBDN0xET3l2Y2FKTXJPVk84NG9NTUNkUW00WHgvbDBTYU1Uck96a3Ny?=
 =?utf-8?B?bUtZYWNZNXQ3MzNiMEhhTVdESVR3SlFwYVdUUy9QNUtaWG04TjdIWTBnYVht?=
 =?utf-8?B?R2NIWWxsZDBBckVzWHVaZUlDRks2amVvUmw1UTlWcUhZL2Rxd1hHUjU1NkNH?=
 =?utf-8?B?bFF3REJaeERUT0t2NjI1eERtdEVSN0xoZVRQdmZDM2ZIVVVPMHZ0S1lDcWFj?=
 =?utf-8?B?UTllcjNJVzRiYmJXRmlRR1ovZDBVbERzaDVjUzR2L1pacXB1RHlaTU5TUzNY?=
 =?utf-8?B?NGRsWC85Y3VjbCsxM2ZYNlV5MVZQbWtaNkhMaFNOOUh6QkZOL1lWL3hoY1JD?=
 =?utf-8?B?bUQzV1BxQm1QY1B1QSsvY2hTaGloV0lwcE1kdXhOLzRnZzI2UFJiNXJKQ2NF?=
 =?utf-8?B?T1JXWnpnSG1sYmNrRXY0bTlucGNXZzVJUE5qeHdYNUpnbW9tUVliWWtrSFdY?=
 =?utf-8?B?OUNVc3p1UzByMEhaUUg5RzlCU09vRHlvTVNwVGRvRVNNN0JHRWxpamFYTFBk?=
 =?utf-8?B?RExRQXhKQnJCaFZzbFBkb3NSaituU1hqSGVBM21IVXFMNnIzTS85WExSNWxp?=
 =?utf-8?B?Y0EyaS84RUdpZEVLZnlvQjZHRnVxemVRMG5IWnhrTVlhNDVZeVBzS21ZRFdl?=
 =?utf-8?B?Sm45TWlUODZ4aCs5bS9lZlJPeHRUbHVSNVQvZTd2aSsvdjBHbDQrblcxT1lD?=
 =?utf-8?B?aDJKOVdFclZCTFg3VVhPRm0yZFpza1FmOGJKTXlLOGRiaWF5cVR5L0VaTlJt?=
 =?utf-8?B?U1J2OW90ZTQvVS81QVljVFV2cnJQWU1wcGd1cDFTd0s5U1dJSEtlcVM1V1NH?=
 =?utf-8?B?bnZaTXFBcHBScEN3L0tBNCtlT3dqY29waTJZV3JXejBReWRNeWU4djArOHFz?=
 =?utf-8?B?WU1nRmphdUkvczdHcXpYMHRKRE16dlByaW1Wcm8vTjFqdnowcFRGUjVQcmdU?=
 =?utf-8?B?Y1lsZmVqaXh0anU5MHd5VEFESnp2dng3Ylk2TFFGNjZJYmtOOTNYdEoxSW12?=
 =?utf-8?B?SzlIbjd1aktESVpvckhzUUVDZGo3RmxVaHVKTzM1YVRZVTBnNC9ZTWdLQWlq?=
 =?utf-8?B?dlcvSmYzNGxtVDk3RGZod0JqUUhZbDNCeXJtcnh1cEVGVHdzeE1BU3I5UU54?=
 =?utf-8?B?TlAxSy9BcC95SlZpZEZFWHR4WGhoU3d2SWFaSHpzaytienhtbi8wcWtjR0NX?=
 =?utf-8?B?Mkx5S1IrbFcvV3p1RWVseCs3U29VZUsxdVVvajhLYURCM3FPTjBEcUh6elZQ?=
 =?utf-8?B?ajltaUdjYzJuVWdUSlE4bjh0ZG8xNTRCNERZWDhCdzI3Y1VqdUlDVGtyS2t4?=
 =?utf-8?B?c0p5dVIydDBnY2E3T0s2emVPMmltNFZxenE2aEt4T0RDb2l0TEhBbndyVlU3?=
 =?utf-8?B?SHg1UVVoOTAzRDFKdDBhTkdub0pJenpyTWdZa0tYRFRndng4RUN5QjNyZUJv?=
 =?utf-8?B?UVNyUDdJODRodWFrMURmY2s0a01ySWNBVnR4RnNSTVZMa3crTkxYU1lXOCtM?=
 =?utf-8?B?K1Blek5xZWdQL1AxZ2tPSHN2R3hmMCtnMjJ1Nm9jRHlPRHplcFdWZ3A0Vk1n?=
 =?utf-8?B?QXczaUgxU1VZckRWTTFiWGJyajgwR3ZXcjlqRVhCcm9QWEFyQmo4dGpPeFBU?=
 =?utf-8?B?MDBuelM2UTMzQ21nM0dOTkVyKy9YajFydjNEWjVjeG9oU3FEcFFoQkZNTE5N?=
 =?utf-8?B?bkZleGNPTllkSnQxa1A0RncwV1k4Rld3K0QrRDRKMExwTGhLSGRBRHhMSTdI?=
 =?utf-8?B?bkdHZ20rWHNkby9BK2ZDTVoxYjA4SXBpa0ZqdW5hNi9zSEVXbHFDeEs4Qyta?=
 =?utf-8?B?bXA5SlJrdnlOR0piSTlVOVZpSWVQZHVnVkRVTFZzc2JhbmRZU1IvT2VkZ0hu?=
 =?utf-8?B?N2haWC90cmlsMjBHSGNjcUZBSkoxK1VTblNTMUhmMkM3US9hdXN0N0RXeFpI?=
 =?utf-8?B?cnU5NitwTkFqNXQ5dFBwaGFQMFZCK09qeER0MDh0Wk1DZTBvSUVVWmEycy9V?=
 =?utf-8?B?cXBEbHgrNm95NmlHSnh0a2E3Q2JGK3p0Z2J0NmVsVmszNDlqdElXamVWNjVi?=
 =?utf-8?B?bTVZSUtmVDZLQktKTWs5OGNBeU9QUlhwc0FlYWNqZ2N4V09oakE2d1FvRVhu?=
 =?utf-8?B?cjVRa3R5WGFwcm95aTdFaHhUZkFoUUxMYnhsaW41Uy80SmZNT01qRFJVNmVU?=
 =?utf-8?B?bFNtYU1EMFA3Nm8zd2FrMFIyNkkxVTdmcjI0VG1RRmdXVEtLb21XeXVwM2lB?=
 =?utf-8?B?RnQ3RGQ1U3RCdWI2aEdjdDJkQy9iNHNpbEkwSjFwcXFsV1p3ek5oZnpXaWYz?=
 =?utf-8?B?YlpGM1hneHl3WkFZcmI4dE9tQzcxUGVRaUVwT3ZMQTBrTlFiM2hSdURRRFhT?=
 =?utf-8?Q?6aa3PYi2BaUWl358=3D?=
X-Exchange-RoutingPolicyChecked: G/peliR2ZMYuPOkiyGxmOLRH2RBlgB3JKEfIMJguk+hSk4/Jv7Pr+F8mHvOjxqy35RFpvD3WsrLUxHtjj/5liDVD54880gcCWpwDvtD3EP6aHF+76B53CCIoqZW7KtEvCLWE+lcc5o/1wPdbdDQTPGgimOciu2kz0m9415+SlIyshjuyFF1KiYRXsQcrMeisko0z+i1HYDF6/qbe7x74f+jCpNa6g+T3rSZ7cvGvxU1wnFwsPE7zwdPXDpVTOeq4blt+E51MAzttNiiybsX8bfiFjRGAUqBJO9n+1cRKzSJ/5GRaUpITbadCV58n4gTvRx3DaSY4cNVzpnyWAQeZtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a07a489b-aa89-44c7-4710-08de94184a12
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 20:08:37.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmTBxnRpsPg9gs4mriXMLBhF1HlrGQ0LkNnt6bCZFsA91IELUODWANMUzqJg4t1a1/ggv9OOezhSG8GUyh5K4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
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

On Fri, Apr 03, 2026 at 10:33:55AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 4/2/2026 5:45 PM, Matthew Brost wrote:
> > On Thu, Apr 02, 2026 at 03:51:36PM -0700, Daniele Ceraolo Spurio wrote:
> > > 
> > > On 4/2/2026 2:37 PM, Matthew Brost wrote:
> > > > On Thu, Apr 02, 2026 at 02:30:30PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > When a queue is destroyed while still active on the HW (for example
> > > > > because the app owning it is exiting abruptly), the driver tells the GuC
> > > > > to preempt it off the HW immediately and to reset it if it doesn't
> > > > > preempt. This can cause a reset log to be printed to dmesg, which can
> > > > > be confusing to users as resets are commonly tied to errors, while in
> > > > > this case the reset is just done to speed up the cleanup.
> > > > > Given that a queue is only destroyed once all refs on it have been
> > > > > released (i.e., no one cares about it anymore), the log of it being
> > > > > reset is not useful and therefore we can simply suppress it to avoid
> > > > > confusion.
> > > > > 
> > > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> > > > >    1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 10556156eaad..e6702bd99309 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > >    	if (unlikely(!q))
> > > > >    		return -EPROTO;
> > > > > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> > > > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > > > -		   atomic_read(&q->guc->state));
> > > > > +	if (!exec_queue_destroyed(q))
> > > > I think you want killed here—right? Destroyed is tied to the refcount,
> > > I actually wanted destroyed here. I was thinking that a queue can be killed
> > > outside of the user control while the user is still using it (e.g. PXP
> > > queues are killed when the PXP session is invalidated), in which case it
> > > might be useful to keep the log.
> > > I have been pinged multiple times about engine reset logs on destroyed
> > > queues and I kind of got tired of having to explain that it was irrelevant,
> > > which is why I'd like to just suppress the log in that scenario. Maybe I can
> > > rework the commit message to be clearer on where I am coming from?
> > This was my mistake—I didn’t read your commit message closely enough.
> > 
> > However, destroyed can only be set once the queue is off the hardware
> > due to the reference counting between jobs and the queue (job hold a ref
> > to the queue). Note that disable_scheduling_deregister, which sets
> > set_exec_queue_destroyed, is called from __guc_exec_queue_process_msg_cleanup,
> > which only happens when the queue refcount reaches zero.
> > 
> > We can only reach a refcount of zero once all jobs have naturally
> > completed, or after we time out jobs, disable scheduling (a one-way
> > transition), and then signal the job fences.
> > 
> > So we should likely assert !destroyed in
> > xe_guc_exec_queue_reset_handler, since reaching that state afterward
> > really shouldn’t be possible.
> > 
> > Compare this to a user pressing Ctrl-C on an app (which sets kill). We
> > can trivially trigger this message while the queue is still on the GPU
> > because the TDR (immediated kicked) sets the preemption timeout to the
> > minimum value, disables scheduling, making an engine reset highly
> > likely. I think this is the case you’re trying to fix, unless I’m
> > misunderstanding the problem.
> > 
> > I haven't looked at the PXP cases so can't comment but will look in bit
> > if we to discuss further.
> > 
> > Matt
> 
> mmm, in the logs I've seen the queue was marked as both killed and destroyed

Ah, yes—I probably missed a race involving the final fence signal. The
queue is closed, we issue a scheduling disable with a preempt timeout of
0, and the hardware context switch-off is still running. Perhaps in
disable_scheduling_deregister we should be a bit more forgiving with the
preempt timeout in that function. I suspect the GuC having to issue a
reset when the context is switching off, just wastes cycles. Somewhat of
a separate issue, though. 

> when the reset occurred (state = 0x99), but the job also seemed to have
> completed naturally (i.e., the engine reset happens during the context
> switch out).
> However, your reasoning makes sense and my case is not what usually happens
> on ctrl+c, so it might be easier to just check for killed here and put an
> explicit log in the PXP code to cover that use-case (which AFAICT is the
> only case where a user queue can be killed while the fd is still in use).
> Let me think about it a bit more.
> 

Yes, I think this is the way to go. The Ctrl-C skipping timeout jobs,
messages, and devcoredumps was the reason for checking killed in the
TDR—we received feedback from Mesa along the lines of, “Why are messages
popping up?” or “Why do I get a devcoredump?” when we force an
application to close,

Matt

> Thanks for the feedback!
> Daniele
> 
> > > > whereas killed is tied to either a user closing an exec_queue or the DRM
> > > > render FD being closed. There may also be a multi-queue case that needs
> > > > slightly different logic. I forget the exact multi-queue teardown flow,
> > > > but IIRC it is slightly different. Niranjana would likely know that
> > > > offhand; otherwise, I’d have to reverse-engineer those flows again.
> > > I'll check that out.
> > > 
> > > Thanks,
> > > Daniele
> > > 
> > > > Matt
> > > > 
> > > > > +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> > > > > +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > > > +			   atomic_read(&q->guc->state));
> > > > >    	trace_xe_exec_queue_reset(q);
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> 
