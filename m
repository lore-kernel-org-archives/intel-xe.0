Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4FCD6E57
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 22:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B57810F643;
	Tue,  2 Jun 2026 22:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4WNLoPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73E10F642
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780440485; x=1811976485;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kbwkqaDSYu5fSo8Z1eYoPzbNtBVk3P7Doa4CPlM8wME=;
 b=T4WNLoPuRQRdHRB4JUQo6BhwAmaeNMFAf8U9IFzUkAdugQJgS3NRZUNM
 Hzfqmp6xLRgc34/w4/ZqWH02scHx4+p4U5mxJe+A1qqwDraAexMKYzTGS
 sLOZUud+99nKQ6ZWlVvnb91GO9z/jCNv7y9PVRRpiqvs5KINlbaqhtRR9
 2bt4ipJfCkPJlKfIwtd/mglIIPL49XtRwSotH/VzhutRhOtbMPauHxy2l
 ZFPhh0bCPPQDKcdst9JAvZg+7cfQImBD1XgsDQfL5NuNk+vthBkLAKOxO
 nxiZUcXLIVcP1PIo2FaIwSIp8G/Si1dwphVD8TEq6nrrWWnF/M+hEsB39 Q==;
X-CSE-ConnectionGUID: SYp13opiTOeyr+oahSLabQ==
X-CSE-MsgGUID: PBQHjc2ZSaaaG/E+7y16Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84864439"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="84864439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:48:05 -0700
X-CSE-ConnectionGUID: bccCjdUtSvuMKNzLBx19Ow==
X-CSE-MsgGUID: sWq+Xl9KRz+8Bo3DDjFy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="241557437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:48:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 15:48:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 15:48:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 15:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlcDbs73GSzqIRYKlvB9wmoYaUEGrZt5I0AWFpfyPuX6/MBRNhtcDOtO/LHULwDScu6L229Q46ZzKDB2b9pPGv3T4Lc2vQzVQ+DJbE3tXKRQaPWwawPfBuBcDZeVoTHQe4xUbyZIk9hLF2c6TW/kAJXKmloaMATKStKs2mLdJKrf4P7c2HFnP6efHsJHChJRZeI2DpYUDhGHhLn2d6UuKi43MCMQcTgw/4Fxd+VwQnf9IuD4vfo3cp6fZlrWPA3tfFZBZalOYDj1c6WO7NiUhH50GUxZS5J5L3HDjjM+B08zIHdoFLgcOL+OXz3SpIwgHyQDTSKFTDRV9cyA7GxexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPm00PqXTVXOBmBQMN/xi/+pqVuRPqH9chsDYODMwIE=;
 b=jgsvK2gkCoNlNsrlYIqILnNVuLPhQcNHaUwsoZYuTIgFrvr+n8NvvniF/rVxKapG2g8Zz5Vsmx4hj6H/EEzchAuqecWN4dWaZVZ43eDxwq4Mb1B+3MmupwFWKP9LCrgPn6Lwsh6EL60RH38xg1r9vJ1lso7vKEZmRJcGZDKyTxkhT9Gou/+5sgXB5/uTWXdyWbcktxYDJaoJiBDXSobrauzaMc+iXowz2QAi8AJqHgoigOTnMvzoIlmTzoas0aVXZnJs2gLWwggUjPc0gCS6ZB6hdIVKwK5xG0YtjVkWoRdJX4f6GcZYZnG0fwyoZV/QXei/SX7I8u+wBkh4Yd1mqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 22:47:55 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 22:47:55 +0000
Date: Tue, 2 Jun 2026 15:47:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe/rtp: (De-)whitelist OA registers for all
 hwe's for a gt
Message-ID: <ah9dlDMzFrYQf5sQ@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-8-ashutosh.dixit@intel.com>
 <ahdm2NdnwBwdYnjU@soc-5CG1426VCC.clients.intel.com>
 <874ijpn7im.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <874ijpn7im.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 960ec2b7-e146-42e6-20ee-08dec0f8fc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099006|4143699003|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: pCP7MRRpRYMaBJDE0OHTYEzIRkIiqOObgWNOOsj3vas6UqW2GKF6h/nHH6ypneI5knhH/1HyawT+PB/IWm9IoKTlnkfxWyMZOZtiAT0/2F+2pw3n5TYeNgOBchIUp2qZooHr3nkXQtWJiwDPp/YZ+das+Xx033Dl4N1fnlSMwKHn0uYpDNXEfJ5ZBnZGUQ3YuLwEhwY/fTo2NoiUTSdHusvIZYO1FD6YTt4kC5esu1g2LKWDqf4bC22uSQc1tSa+fVfdcRAE9H7mDBYSbxPZGnbZBVizCtEI6+P/+nUrL6svCfT05EwtLh0CxIZdDdsmezEFZ75DsNsHdOLPdYKVNAy6BDSlbIO6Wkw43KiFAPCh0OVoEnHtgPn74XCx4jVRHVdyZXtIru7VOCtEfjZYm2utv+54MPv/6MHoDwydcCk/uDjMvWlPjn/X8+bBjcrrviJrdc6WcMRYlKRogzXLYL0cqpxaiM+gPAbkUk7fwT7or8yDD913pGHCALFaCta54vAFPWW6MyXRZLokY2Y9e2In+DudhZCyB1GgUyWjT7ndhnguD2d5Dakh55li4uD3OZzUbGpWPVV/dJngcpY7aB3plABPFs4/DyLCVqaUKfCxAtC/h8Ia/dTjdY2I07/cP2nkECMalWITb8wNtUK0urwCRXBLyuiuSo9+7nrD/ePEiuN4+Zg8PRBpxlqe09YC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FXMk9kVExVdVJzcWZ0ZUJIRHhZWmZSZ2RWaGFnQWFYNUwyU3hOZzBuTEdG?=
 =?utf-8?B?Witnc0ZqL2xrejFHaUFEOW5oU2N2MDFiekt0d0V2ZXdlcHJTMWxuQWNqV0Q5?=
 =?utf-8?B?c3hMOVRQR3g5bHBlVngvSmhnQ1hRWFZYd3hFTjFwa05LWERQcjhoaGNDcTgx?=
 =?utf-8?B?OUJ6NEJJY1pFUXc4eWN5bFFpZEVXN0hDMXZuVldXWDFQSW16RUFHU2VxZDZi?=
 =?utf-8?B?MjV2eGwyTkhyMytSQ2lDNllCSWpCMUZMQWxieVJ1dWw3THN5WUdFQXd0V09y?=
 =?utf-8?B?SC9rcE9MTVVJWFR5d25VMmVXbkJCNHYvWCs0UDNtV3FWVU9rZ2g0QjJIa2oz?=
 =?utf-8?B?YktEejcrc21iNHV0TkQ1UlVLK0pFNU1Nb0xwbmVFZmUwQU5JM2tGR2hZTWdz?=
 =?utf-8?B?TUZ2cVlYU0JvTTNnZXBKL3BsSVdERkFNNnNOREM5YUpkMTljMFpNZ1gvQWNz?=
 =?utf-8?B?MTRDQWxGNGxuaVZGa2d3eWVJWnYwWk4raHZZUDhWMFpsWmFVRXh0aVFob09I?=
 =?utf-8?B?NVQvOFRkTTY3V0ZrNS9OeGlUdWlQWTVkSHMvSkdaeW04em5YeHpUNVZhZ1dD?=
 =?utf-8?B?Wm1yMUNEcm5FQy9hU0dmcm50U0t2UkVkeHMybVNZamtmbmQzbDJLQ1B5WlZR?=
 =?utf-8?B?Um9HRjBkWkJub3ZrMzRQQloyaE1RcmZCN2tNcVRQOWs0U3BsQ24rMkpseUxq?=
 =?utf-8?B?WlNYd2c0WVRucnZRejFlcFZoci9rUm4veHFzZHU4Yk5rRDhaM1lDZExZbEs4?=
 =?utf-8?B?cHBGclJJT1NYSUlRUFd2QUJHZCthV2R0bmdOT081ekJQZWc5RmZneDFidDAw?=
 =?utf-8?B?RVNPbnN4d3RKSkV0cWk4OFkvR1Erc1oyeDFISnZGa0NSV3JLZkJ2OFdWUjVh?=
 =?utf-8?B?Z1BUREJZa1J4UENyY09hUDVVZHNkZUhSWU1SQkEvdHJFVVNEWmR6OCtqbVVy?=
 =?utf-8?B?NUxqSW9VMG5qQ0NjampmQVE1U3RLL20yb2prUS9tZDhzbzBvZU53VGx1cjhW?=
 =?utf-8?B?TUdHR2wxRFQvekdXYTJ1WEdDcERNdDNYeHhjelFKQlVLRDUwY0tsOFpFVHZ4?=
 =?utf-8?B?bjE4S1p0TzYvUUVvbE5FcnFkL1h4VSsvVXN6Qjh3YWJ4akFHQi9rNWtVVjdI?=
 =?utf-8?B?YmZaUThCWHRaQmhtM0JaQlFESDBlQmY0SS83R0N3cXN1S1AyY2FTOXpJcFBs?=
 =?utf-8?B?ZnlEVmlRMnV2dWJBQlVOQ2tLOE1vZjlLSVMyeEtqaGJrTFZ1S21XZ0pmdzFO?=
 =?utf-8?B?aXdZNk1Qck5MOGJZMUE3RGlBcmpYSDhCenV1ekhIZW1jZ1RhVHhlcEkxMHVP?=
 =?utf-8?B?REw5S1Z2MlY2QjJ5dndHaHNlQ3NGYklQNkVvc3piVGRmMER2dDB4a1hwN2Fj?=
 =?utf-8?B?RWp1ZDc5RTN6Y0pUT2RtVklFMGZBWkNNVUswLzRxdkg2YUFQOGh6RE9LVHJh?=
 =?utf-8?B?MHZHcys0MndRRUNjRDFLQmxCNjZEUHc2NmRVN215NjNjdGJxSk0rUVhSdzBx?=
 =?utf-8?B?K0VTTlBTOXhYczJnNUxYVTBsekhPTW56TUQvRnF2OXlpU3c3OVBIVXFEVHhr?=
 =?utf-8?B?eFQ3YUpmSkN4Vy9OaWpaVnNsd04vek9maTcwZlFNcGp4dDcwR3VhMVN0cXVy?=
 =?utf-8?B?djNrOUs4V3JuR3d0N3RicjdqZHR0b1p2aVJBc0NyL09TRFVVTytBQU5vY0g3?=
 =?utf-8?B?K1JLcTBxbnQ5YXBhZ1ZsR3RRdS95SUFub0J2UW9QRlV1SHFHZ2EvREsza3hI?=
 =?utf-8?B?MGZUWmdCOVhzb2JqWUZWY1NlOVhsWVYrZG9RUkRaSTB0MTRKZ2FPZk9hY1Rs?=
 =?utf-8?B?VHdKYVlxa04waFhuQ3Vici85TzYrNlluOEh4N0IvaU1STURDYVg2cGZNN1Bl?=
 =?utf-8?B?NUp6MW02aUhzNEdqeElJcGw3d0ZpNmw0ODhiUXRXQzQrRVl4czBuZkJpSmY1?=
 =?utf-8?B?cWs3cXRRNjBNRVp5c2lNaDVtNEtFTitUS0NLVFBWNWhoWFV6aGlxK3lNUVR6?=
 =?utf-8?B?eWJXaXVWNFg5Z1NzYUUybDZZMkhSR2tmK0N5SWZFZjNZTEd3TWhxWjFmLzI2?=
 =?utf-8?B?VjlINnpmSDRYcXYrU3RTa2E2aTZ5a2RyWUNjMk9uczh6THRwTFRNTi9tMjI1?=
 =?utf-8?B?REtsMWJWQWV5eGwyTDhrSmtSTGM2aC80RDN1WXpaZzFyNnoxTFhwZFFGa1Nr?=
 =?utf-8?B?M0lZcDJvRHpTcmxqZ0ZLMFZqNUpNakhXUGhxUDdCaXV5Ykd0YktGY3N6MitO?=
 =?utf-8?B?UUg3Z2g5TzZyU2RvZjFDelVVd01uMHdvOEZESXl5RUhKQVEvTWlBUWJaNmhV?=
 =?utf-8?B?S1JIRUhURy9HVTNrV0dKN3N5b2ltNzREVm9VOXMzbjVxSUh3ZTBwcWpOWERH?=
 =?utf-8?Q?iktQtQ6pC3X8IMrkN0nrCt/Zl9XWAh6Ba64cW?=
X-Exchange-RoutingPolicyChecked: Ll+mZTVbo5p5RWGnEyueZXcLaHrGNjoVOGmykDCxl5ulPwQdpHXm7yqHXbClNetmHq68msv60UDbIdFEL6OukCeAi/y/aj3qb4BdHAMaMOBDM0090OrGNVr8xHWIcxHrBOAgemJp6QccOTbGozcuH2qsk7VwiZodxC3cGW3SiZorcBeoG/ylWgMo66KTRmcGWk5ubIHqDNlUIXu4bmbI12mKInQ3tLYZL9tBbcT46ICKVJuWWRp+R3l/nGlZMnbKM3+urtmNHU8YFlqyW7ZUDNMkzsIjSEiyYjwEguSibuUrUsrG0KbN7V81Ztxvb5T0u53oab8+OnwJqlm0A0ON5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 960ec2b7-e146-42e6-20ee-08dec0f8fc33
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 22:47:55.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bx9vbFsRU+KGqLM4wyDk1ToQIP5JipmPV46aXVQrrIoEDdM5JnZNT7Jikxbfen1QWBYGIOR4ceu+bqNeyyY0yR1BsewBttt8FGzL6FfaGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On Fri, May 29, 2026 at 04:03:13PM -0700, Dixit, Ashutosh wrote:
>On Wed, 27 May 2026 14:49:12 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Mon, May 18, 2026 at 04:47:14PM -0700, Ashutosh Dixit wrote:
>> > Whitelist or de-whitelist OA registers for all hwe's on the gt on which the
>> > OA stream is opened. This simplifies the case where an oa unit has 0
>> > attached hwe's (but which monitors OA events on the associated GT).
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_reg_whitelist.c | 32 ++++++++++++++++++++++++++-
>> > drivers/gpu/drm/xe/xe_reg_whitelist.h |  4 ++++
>> > 2 files changed, 35 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > index 0d2cf3d964a51..50b34c5008df7 100644
>> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> > @@ -229,7 +229,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>> >	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
>> > }
>> >
>> > -__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
>> > +static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
>> > {
>> >	struct xe_reg_sr_entry *entry;
>> >	unsigned long reg;
>> > @@ -244,6 +244,36 @@ __maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool wh
>> >	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
>> > }
>> >
>> > +/**
>> > + * xe_reg_whitelist_oa_regs - whitelist oa registers for gt
>> > + * @gt: gt to whitelist oa registers for
>> > + *
>> > + * Whitelist OA registers by resetting RING_FORCE_TO_NONPRIV_DENY
>> > + */
>> > +void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
>> > +{
>> > +	struct xe_hw_engine *hwe;
>> > +	enum xe_hw_engine_id id;
>> > +
>> > +	for_each_hw_engine(hwe, gt, id)
>> > +		__whitelist_oa_regs(hwe, true);
>>
>> I think we should only apply the whitelist to the hwe that will use this
>> specific OA unit. That will help do away with the ref counting in patch 9
>> here.
>
>No, if we do this we will need to introduce per hwe refcounts (instead of
>per gt refcounts, as done in Patch 9).
>
>Each OA unit has a set of attached hwe's. Then there are OA units such as
>oam-sag and mertoa, which don't have any attached hwe's. For these we allow
>mmio triggers to be submitted on any hwe's attached to that gt. Also some
>hwe's like copy engines are common between OA units. Since multiple OA
>streams might be open simultaneously, because of these reasons, we'd have
>to introduce per hwe refcounts.
>
>Also, if the concern is that we are opening up all hwe's on a gt, rather
>than hwe's attached to the OA unit on which an OA stream is opened, I do
>not consider this a serious issue, because after all registers are being
>whitlisted by an explicit permission from root. The root, e.g. is free to
>load up a custom module which can whitelist whatever they want.
>
>So, if we want to implement whitelisting only hwe's attached to the an OA
>unit (including OA units which don't have any hwe's attached, so would
>include all hwe's on a gt), this is substantial increase in code
>complexity, that will need a separate series of patches, over and above the
>current series.
>
>So if we do this, that's a separate set of patches. Since the current
>series is already a big improvement in closing down unconditional OA
>register whitelisting, I'd say let's get this reviewed and merged first and
>then we debate if we at all need to restrict the whitelisting further and
>then do that if we need to, but I really don't think it is needed.

I see what you are saying w.r.t. simplicity and reference tracking. At 
the same time I think it's wasteful to whitelist OAM_TRIGGER from 
ccs/rcs or and OAG register from media CS.

My intention is to use the NONPRIV slots sparingly. If not, we should 
have some sort of fallback for UMDs if we run out of NONPRIV slots (like 
provide a query that tells them whether whitelist is supported on an OA 
unit or not).

We can discuss after this series is concluded.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
>
>> > +}
>> > +
>> > +/**
>> > + * xe_reg_dewhitelist_oa_regs - dewhitelist oa registers for gt
>> > + * @gt: gt to dewhitelist oa registers for
>> > + *
>> > + * Dewhitelist OA registers by setting RING_FORCE_TO_NONPRIV_DENY
>> > + */
>> > +void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
>> > +{
>> > +	struct xe_hw_engine *hwe;
>> > +	enum xe_hw_engine_id id;
>> > +
>> > +	for_each_hw_engine(hwe, gt, id)
>> > +		__whitelist_oa_regs(hwe, false);
>> > +}
>> > +
>> > /**
>> >  * xe_reg_whitelist_print_entry - print one whitelist entry
>> >  * @p: DRM printer
>> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>> > index 3b64b42fe96e9..e1eb1b7d5480b 100644
>> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
>> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
>> > @@ -9,12 +9,16 @@
>> > #include <linux/types.h>
>> >
>> > struct drm_printer;
>> > +struct xe_gt;
>> > struct xe_hw_engine;
>> > struct xe_reg_sr;
>> > struct xe_reg_sr_entry;
>> >
>> > void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>> >
>> > +void xe_reg_whitelist_oa_regs(struct xe_gt *gt);
>> > +void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt);
>> > +
>> > void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
>> >				  u32 reg, struct xe_reg_sr_entry *entry);
>> >
>> > --
>> > 2.54.0
>> >
