Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B839C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 19:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B68710E4A2;
	Wed, 19 Feb 2025 19:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ON/NLKJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6154810E4A2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 19:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739994207; x=1771530207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9rzvZfkbWIMoApjFND+uc52SC28ga4VQtY0Ko0b0mR0=;
 b=ON/NLKJZEh7KAmqIbYOSF6o33pMlRCZ3LIZnBtsxmGBuT9/uWz58mX/O
 BpxMsF0c+ZL1jibpZKsb3LJW4makWxGwSbGdp21DYW22IoY/l0HLUZeu9
 DrNQeeS5NfcoNjJB8RktsbvuGA1M2g0/4n+XlqsHSUNi+H2lxMVc0jLHO
 EmBwHcOTG0kCtqEFhqrnNhUV8Z39R5s/jGO21jklzgp+fR1t5bRNa6PYK
 XicfNbjfhstiPaWtkAQmHYXSrlTerTwNO/GSP6G1S6Pv+shnhGv2sHFUA
 S9K/dW9MLfxuIfQqQAJEPTgn3TPZ4t8YbTCswOnvxOxycVKK7dDRd62iQ Q==;
X-CSE-ConnectionGUID: /X/6LKkrS9+PZKrPONrFKw==
X-CSE-MsgGUID: qyPxiVMRQHarH5ZfS+P5NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28344516"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="28344516"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:43:27 -0800
X-CSE-ConnectionGUID: /5fdbKydQ/GACG/YlwMMYA==
X-CSE-MsgGUID: IK6lNsFnT1qqWsS/ksfUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145696392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:43:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 11:43:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 11:43:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 11:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZPiJT8CvqZ9mR//A+5SuBcc4peLd5XGjr8qkC6fc4b/zsoZczhArc9Mi/F0QjxEk3nTOZg0IhvrpJMFoxWLeK0oF5oCQHYKKh1qfoO1nMInyXfcACRMZ0yL0s5+aO2bmc8zxfJM9Vv5u+lRQvE+2xJQDlTdJYbFffmYfg/Xflvyfvlrm8Lo/6RfU44+aY9EepmQGagnsaDPH7PBwjbeVLokpe/zc5ZGb25llTKXaXLp99ZeauqHiJk0sE+Z3+0H4dujLy1LQZbcDSJN0ANy9U7w5JPtRC+7OXayE4jtHKsmeRRYYYvpIsYlV0sISgU/vOR1uI/JQjQc2E/963OskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYBg5brwl63J4vJBBh9r7CKeyPaXxqmKeKfYEZ1a9Js=;
 b=WTyzkhwMA/84XzRilAn4jDBgdtqoFQhL0h5ZPE03lD/nqpl/nHBkGBzMv0sLoTGtx45xXl9MBm9W+AWCxu0TPf14+pzEsxnF9TPiewk7RoRU+iTk1J7rk8lRK9ElBbhGM/c7PIzw8wmmV1UMN4fp9q/UnaLbY9R+QyLFD5lSkdNcvSaI/zf8T19XALmquyEpgtJ74gOn4dzoODlWABm2/d1pMs4sQQeSkS1lQ96GWs6xCoKteoB6t3gWfHH3bAXL1ZJmWRRHY6ZYHok70iCqKEnWXV15tbypswABwtGioXAG5ShxR0TRh3PRV+4hnkDoEO7BBEbmvBkzYUDI9NPOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 19:43:23 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 19:43:22 +0000
Date: Wed, 19 Feb 2025 11:43:19 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matthew.olson@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v10 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <Z7Y0V0ArAEaTerzj@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
 <c55e994b413f069b4ffb60cd30e749caf3bb7223.1739906138.git.harish.chegondi@intel.com>
 <85tt8pol5z.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85tt8pol5z.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca6a7c8-d889-4e0b-6a45-08dd511dab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmU4Z04za1BVdlhCMXBiaG42cEdvMTF0Tm5vejJlbnpwaHY0dmJ4MmRGQVN3?=
 =?utf-8?B?NGZ2cmw1WGo2ajhMMVlUMkluTkVNSWFFRUc0cnIwdmhtQ09BMzRPS2hJT1BG?=
 =?utf-8?B?NWxrdm9yUnRqamRPdWRyR0ErSWh0eEdNeVhtV1MzWlhHd1dMeXorZEVQT1lt?=
 =?utf-8?B?SnNVSEpBYkM3WjZEUCtWYWxvSkJmdyt0aTBDbEdXeGpLb2F6NTRNOEIzbThm?=
 =?utf-8?B?aTQ4RmpPNlQ1SWdPOSt5RXRJTjNhaEJLOVM3Q0xqSW52eFlUN1A1aVdoODBQ?=
 =?utf-8?B?NHJHbkNjTmh2ZEY1N3dSR3VKd2Z2dElTUng2Tm4rYkJ3Y0NmN2ZhczJ5bkly?=
 =?utf-8?B?OFdlUmtYdkUxOTdpTHpNWGMxLzF3YzJHWkFaUUN4eUNxdDFUNHlGTkt0aWxw?=
 =?utf-8?B?Y3ZPMVVrVGx2L3pJbXI1L29YUXJWUmhlV1BUMi9DTmg3cy81dHpEaHowakUz?=
 =?utf-8?B?YjdacG8wR0FGVXZENzNCL2drMVZnTkVSV3owMU9pYngvZ29CVTFOaUtIN3ps?=
 =?utf-8?B?ZGovd2RPQ0R5SVcwa2NNTDlLWVJMOTEzRHFlbEpObjlRM2dncVdSdzFma0Zv?=
 =?utf-8?B?c096OW40SStkZHM3Q0pIdExWbVZ3QzJhTE5oQzA2STlqRDE5c25JU1VOV2gx?=
 =?utf-8?B?amtOK29kVlRRVUl4RWh0MEN0RzBGbm8rQkRSdWhSYm96NVJvRzBqOGNFRFg4?=
 =?utf-8?B?VTd1YTYzcVhDMWxITzltQlFNenVEeXdqbDlsTGxOUzVXdUZkQ1hiQXdPVkJN?=
 =?utf-8?B?Mko1S1FtdGM5Zkd0YWp2Wk5vTXFuNEhjZG1TUnhhYURNNkpHSGhTZENoOGdq?=
 =?utf-8?B?ZlpRa0xnL1JOMHFqUW9QQVhKRUVKQjFlY0kvUmRqZlNOTkIzaW5aL2lyS0Zu?=
 =?utf-8?B?M3ptZDNHdE1aY0NPZlNVdDh4eUp6ajlNdFdUWitKTG0vcEJUVnRYVUtyVm9o?=
 =?utf-8?B?bmN5bUxHN3dRdXdYWmRJekR3VEtBUlNMUk9FSjJwT1J0OFNvNkx3M0VQWUov?=
 =?utf-8?B?QlVOTThlbnlCbWs4ejZROGRaMzhvUU52RTFjQmVPL3QzTGoydktucG41dS81?=
 =?utf-8?B?NjF3ZVZSMmpTS2tTcHd1ODhFN29ieURQNVBETS90TmZ4UUxhb0NRd1BJa2xX?=
 =?utf-8?B?SnN6T2FpQ3lXSG1vVTM5YWg3WkE3UzExUVZJZGZOakZlM2swWDRkS3VQbjlI?=
 =?utf-8?B?MGdWNEx3aEZkck1QQW5OQmduNytVOVpZbFlNRGJDcmtRVUlyUjF4UWZXQzRa?=
 =?utf-8?B?UldsV2VPK21NQTV2bDNvc3duOWVudG55dHNjV2Y2a0FkdklNMWN1REUzY3J2?=
 =?utf-8?B?dW80Q1VFNmc1cmRjSkVIakZnSVRTZ2pvQ1pyUU0vUE9aQi9ETUhCTW40eHFm?=
 =?utf-8?B?UzZmVGJaaHBCVXFqS0lMYWdCbUlvdmhvU08wb0hSZFNZVS9MUFREZDZwUHZE?=
 =?utf-8?B?c2VYa1l4VVVhanNkRU9hN2dEK1NCemUrZ3VVKzN2eEYrb0ZVaDJXSmFsRzZZ?=
 =?utf-8?B?b1VKdTBFQ0YvMmI3ZytSTHp0R3NGMlV5UkhJdEl4Q29HeEg5cFlXWEJIdmhS?=
 =?utf-8?B?ejV2akd6MEFWTVlCNk02N2dlM2tHM0RNVXVSRWVoTnlWdXlUeC90RkFYbjNP?=
 =?utf-8?B?MExxNHFnNXhhWXJFQVhLb3dzRUR6aThZdWxPTUlCZDJ3UmtDRkhmdjcxQ3Ur?=
 =?utf-8?B?bm9ncGw0L3RXdE9KQ1N4L0RrajNMWWNxUjJPQmYrNVREQWlrOGZMUkxTVVBS?=
 =?utf-8?B?ZGRNYTB2RFJDbW82NUNUdGhYeG41TXZJNDdpa29HQk5SbVhSeEJQZ1hyNnZ0?=
 =?utf-8?B?NHR4NmJaZlY3VFdGV1pycTh4dlJERVhTd3dXVytNVzFqdXVQMXBIVDl5L2Vm?=
 =?utf-8?Q?ZX8b4jr5LFQhu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVwZlF5aTBYUnU2WFMzdk1LcytYMUxFK2J4UmZaeGZpUy9KZityT04rSWh0?=
 =?utf-8?B?Sy9SbEVkQWNkcjdmNHIwaElCUnMzaExyVlVDQlFMRUhwY1p2dVJtWE96MzVM?=
 =?utf-8?B?MXlXd3VKMk1ydmtiM0IzR1RjRW9kZDdIY3M0dXN4VFo3cXhuTUNKaWJWZ20r?=
 =?utf-8?B?T2ViNFNiZnFFcWtpSGdldmROYzl1Z0tQcTlZMVJKOC9oMmNZQVlza1YxM2xX?=
 =?utf-8?B?YUZaTGZBZU1OQkIvOU9zdjVEa2hzRTB0Tk1qRDhjM3QvU0YzYkNmMEd0TW80?=
 =?utf-8?B?clBkWmZqeUpybm0yQXhCNGRsMEZRUG5UbitndzVndlBBVGhQUFYxcXgvQVla?=
 =?utf-8?B?M0tqVS8vTU5OK1JvN0tMVjNRZmRjTU5lb0ovQlpPRTBkeVBkSDZiUGNVUXY3?=
 =?utf-8?B?TTdKbHBIWWJkSy94VGkxNUlNZG1nVFdJMGhFbEZNcU80MHM5MXdRV0R5U05q?=
 =?utf-8?B?NVlKUWxKL3dWVkFmSGxMZGNzYlJCejk1a0crTkhaYXIxWmFuNEZYa05VbkZv?=
 =?utf-8?B?YjZxVmdjaVVlZU5USVBUSkw5YWdiSGVCZExBUTdSM1lRSmpLWGtVUUlXVW5Z?=
 =?utf-8?B?azN3L2REK2MydGxkRThyTlpHMDJKb0tSY1I4SFE2MTJmSDEyUFNJcitUTVFO?=
 =?utf-8?B?ZjNyY2lpVE9LRmJUZis3OXNSYWNJbzg4VDVBVXVrdUZMZGVSYWRtcEF0QkFO?=
 =?utf-8?B?bWZsTE9GQzVuOFgrVzFZRzY0THVTZDJKY0xTK01QVlVrZVZ1K1g1a0NpY1Fs?=
 =?utf-8?B?cFZPb3lJaURkVFduUFZzVWI0bWxjL3g5MTRWUDNuWk80bStZSU1XRk9jN1lL?=
 =?utf-8?B?QlJYakFCZ2NPRkZWNUltbTNvY3krOGQ3MHJmZVI5T2hUSUtnRzc4azZOMUxZ?=
 =?utf-8?B?L1ArUUxxdWtma0NMV0pENjFGTEFLbnE2ZG1wY0djZ0o1RDdsR1g3RjBQSnFH?=
 =?utf-8?B?WmdTZXJQR0Zkay9FblQyN3VDaHVWNEFOR0dYM1FIYVA5T0RLWHJPSVFraUZR?=
 =?utf-8?B?Z0s0VmdhaG1GVGlRWUZnZERnbDhtMHBPeG5VVURCVVBqYXZlZWdUU0c3WU9P?=
 =?utf-8?B?UnU5SEVISlhxMWJVeEtaR0MyOXlWUWNLbmkzN294ajNDcVdpWktNbTg5c1hn?=
 =?utf-8?B?OHAvZVdOVzdnUFYzaWxuR0E4OHFnRDdEcE9rZGMxcnJOMFloVE1GZU0xbkkr?=
 =?utf-8?B?dko1enk4Vm96ekE0S0lmZ2t6N2VTY3dpb0ozb2dla21IRXFjUUcwSlpOTkVZ?=
 =?utf-8?B?d3hud1dSbjBoSC9MeTRlVjZvVGliWnhsejV5VVExeEgyeGh2TUhWOVhwb2F5?=
 =?utf-8?B?YjVvd1JzYk9OZ1BWbHhDTUNQL21yMm95M3hzb3FPV3hORCs5VkZDVjF3WVBC?=
 =?utf-8?B?czhGbWJvdytmMzNWUzhKRWQ3WTJUQlpoNEt4N2VrTktsL2d0S0VTcUhTb3B6?=
 =?utf-8?B?bDArMkNGMkJueVJwVXNjc09yd2hDVEYyaFpKSFYrZkFRK2drclQ2VUUrUDda?=
 =?utf-8?B?VFF0SGtXMGxlZFFSTytkaS9kdVBHMXVaYm9IWmxpeUE3YXJ2NVppaEFNQkNn?=
 =?utf-8?B?WVcvTVBQZ1BvMlN6R2tFTFdGUTFMa0VvQ1NHWkFHOVNpcWR5QkpVdG9CY0pW?=
 =?utf-8?B?ZVlvNlVXSVFuNEdSMXJFQVNtVVNSVi9ZTWlkKzZuZkJMandNWG5SRWZaZFZj?=
 =?utf-8?B?RnVTbHZlV3VZdGw4Tjh4WjlmQVg4NjZlTXRBd3pZWTArenI4VE9Rc2Fub1lO?=
 =?utf-8?B?K0hiL1o1V2tjZHBjWCt3ZFhXRGRacWxuNHZaRE5IU1MyOGNKaEtkYWFGNHR5?=
 =?utf-8?B?cXJ5QVFQMUMyTk1hOE16SU5RSnhaZ2ZmOTE1RFErbTRrbTlUZktzL2xIL0U3?=
 =?utf-8?B?d0hpdGp0K1dYQVB2UkUxeCtXUkpZQ2RoTVk2V2tvNjA0YzhMZTZ4VCtaa3o3?=
 =?utf-8?B?ZjRBUlpSU2pTbzl2Ti91VE9CSENXb21RQmdaa1hGbFpWZ3ZtcG80ZWhjSzd2?=
 =?utf-8?B?Y0lWdE5LZkRTT1c4a2doaHVpQTV6UmtPdW13U1pXbElES1luKzdYRndRcmtE?=
 =?utf-8?B?M0lmOURHbmpvRnd3REVNenpudG9EOW4vTG1vbVYyRWNIbmh0Qm84aWtWNWVW?=
 =?utf-8?B?UThsdFJiVVRpVUd5eUc2MnJlMFRlZ3I5Y0JIcGs0NEtzZDJ5R1F2ZVozT0Vy?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca6a7c8-d889-4e0b-6a45-08dd511dab3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 19:43:22.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7PyqR4bMsQTemz+AUjcYuYEemW+enAZheOlVzaSjnBpcRRly6s7//2CkB9C3rg//EIYo+PIjn2w90HkVtPjSTUoBETJTLZ/H7V/C9okN14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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

On Wed, Feb 19, 2025 at 10:15:52AM -0800, Dixit, Ashutosh wrote:
Hi Ashutosh,

> On Tue, 18 Feb 2025 11:53:54 -0800, Harish Chegondi wrote:
> >
> > @@ -39,7 +40,9 @@ struct per_xecore_buf {
> >  };
> >
> >  struct xe_eu_stall_data_stream {
> > +	bool pollin;
> >	bool enabled;
> > +	wait_queue_head_t poll_wq;
> >	size_t data_record_size;
> >	size_t per_xecore_buf_size;
> >	unsigned int wait_num_reports;
> > @@ -47,7 +50,11 @@ struct xe_eu_stall_data_stream {
> >
> >	struct xe_gt *gt;
> >	struct xe_bo *bo;
> > +	/* Lock to protect xecore_buf */
> > +	struct mutex buf_lock;
> 
> Why do we need this new lock? I thought we would just be able to use
> gt->eu_stall->stream_lock? stream_lock is already taken for read(), so we
> just need to take it for eu_stall_data_buf_poll()?

I started off with using the gt->eu_stall->stream_lock. But I have seen
warnings in the dmesg log while testing indicating possible circular
locking dependency leading to a deadlock. Maybe I can spend more time
later to investigate further and eliminate the possible circular locking
dependency. But for now, I decided to use a new lock to eliminate the
per subslice lock. Here is the dmesg log that I saved from my testing to
investigate later.

[17606.848776] ======================================================
[17606.848781] WARNING: possible circular locking dependency detected
[17606.848786] 6.13.0-upstream #3 Not tainted
[17606.848791] ------------------------------------------------------
[17606.848796] xe_eu_stall/21899 is trying to acquire lock:
[17606.848801] ffff88810daad948 ((wq_completion)xe_eu_stall){+.+.}-{0:0}, at: touch_wq_lockdep_map+0x21/0x80
[17606.848822]
               but task is already holding lock:
[17606.848827] ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
[17606.848903]
               which lock already depends on the new lock.

[17606.848909]
               the existing dependency chain (in reverse order) is:
[17606.848915]
               -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
[17606.848915]
               -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
[17606.848925]        __mutex_lock+0xb4/0xeb0
[17606.848934]        eu_stall_data_buf_poll+0x42/0x180 [xe]
[17606.848989]        eu_stall_data_buf_poll_work_fn+0x15/0x60 [xe]
[17606.849042]        process_one_work+0x207/0x640
[17606.849051]        worker_thread+0x18c/0x330
[17606.849058]        kthread+0xeb/0x120
[17606.849065]        ret_from_fork+0x2c/0x50
[17606.849073]        ret_from_fork_asm+0x1a/0x30
[17606.849081]
               -> #1 ((work_completion)(&(&stream->buf_poll_work)->work)){+.+.}-{0:0}:
[17606.849092]        process_one_work+0x1e3/0x640
[17606.849100]        worker_thread+0x18c/0x330
[17606.849107]        kthread+0xeb/0x120
[17606.849113]        ret_from_fork+0x2c/0x50
[17606.849120]        ret_from_fork_asm+0x1a/0x30
[17606.849126]
               -> #0 ((wq_completion)xe_eu_stall){+.+.}-{0:0}:
[17606.849134]        __lock_acquire+0x167c/0x27d0
[17606.849141]        lock_acquire+0xd5/0x300
[17606.849148]        touch_wq_lockdep_map+0x36/0x80
[17606.849155]        __flush_workqueue+0x7e/0x4a0
[17606.849163]        drain_workqueue+0x92/0x130
[17606.849170]        destroy_workqueue+0x55/0x380
[17606.849177]        xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
[17606.849220]        xe_eu_stall_stream_close+0x37/0x70 [xe]
[17606.849259]        __fput+0xed/0x2b0
[17606.849264]        __x64_sys_close+0x37/0x80
[17606.849271]        do_syscall_64+0x68/0x140
[17606.849276]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[17606.849286]
               other info that might help us debug this:

[17606.849294] Chain exists of:
                 (wq_completion)xe_eu_stall --> (work_completion)(&(&stream->buf_poll_work)->work) --> &gt->eu_stall->stream_lock

[17606.849312]  Possible unsafe locking scenario:

[17606.849318]        CPU0                    CPU1
[17606.849323]        ----                    ----
[17606.849328]   lock(&gt->eu_stall->stream_lock);
[17606.849334]                                lock((work_completion)(&(&stream->buf_poll_work)->work));
[17606.849344]                                lock(&gt->eu_stall->stream_lock);
[17606.849352]   lock((wq_completion)xe_eu_stall);
[17606.849359]
                *** DEADLOCK ***

[17606.849365] 1 lock held by xe_eu_stall/21899:
[17606.849371]  #0: ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
[17606.849430]
               stack backtrace:
[17606.849435] CPU: 3 UID: 0 PID: 21899 Comm: xe_eu_stall Not tainted 6.13.0-upstream #3
[17606.849445] Hardware name: Intel Corporation Lunar Lake Client Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3220.D89.2407012051 07/01/2024
[17606.849457] Call Trace:
[17606.849461]  <TASK>
[17606.849465]  dump_stack_lvl+0x82/0xd0
[17606.849473]  print_circular_bug+0x2d2/0x410
[17606.849473]  print_circular_bug+0x2d2/0x410
[17606.849482]  check_noncircular+0x15d/0x180
[17606.849492]  __lock_acquire+0x167c/0x27d0
[17606.849500]  lock_acquire+0xd5/0x300
[17606.849507]  ? touch_wq_lockdep_map+0x21/0x80
[17606.849515]  ? lockdep_init_map_type+0x4b/0x260
[17606.849522]  ? touch_wq_lockdep_map+0x21/0x80
[17606.849529]  touch_wq_lockdep_map+0x36/0x80
[17606.849536]  ? touch_wq_lockdep_map+0x21/0x80
[17606.849544]  __flush_workqueue+0x7e/0x4a0
[17606.849551]  ? find_held_lock+0x2b/0x80
[17606.849561]  drain_workqueue+0x92/0x130
[17606.849569]  destroy_workqueue+0x55/0x380
[17606.849577]  xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
[17606.849627]  xe_eu_stall_stream_close+0x37/0x70 [xe]
[17606.849678]  __fput+0xed/0x2b0
[17606.849683]  __x64_sys_close+0x37/0x80
[17606.849691]  do_syscall_64+0x68/0x140
[17606.849698]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[17606.849706] RIP: 0033:0x7fdc81b14f67
[17606.849712] Code: ff e8 0d 16 02 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 73 ba f7 ff
[17606.849728] RSP: 002b:00007fffd2bd7e58 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[17606.849738] RAX: ffffffffffffffda RBX: 0000559f7fa08100 RCX: 00007fdc81b14f67
[17606.849746] RDX: 0000000000000000 RSI: 0000000000006901 RDI: 0000000000000004
[17606.849754] RBP: 00007fdc7d40bc90 R08: 0000000000000000 R09: 000000007fffffff
[17606.849762] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[17606.849770] R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
[17606.849783]  </TASK>


> 
> > @@ -357,16 +580,26 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >			  max_wait_num_reports);
> >		return -EINVAL;
> >	}
> > +
> > +	init_waitqueue_head(&stream->poll_wq);
> > +	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
> > +	mutex_init(&stream->buf_lock);
> > +	stream->buf_poll_wq = alloc_ordered_workqueue("xe_eu_stall", 0);
> > +	if (!stream->buf_poll_wq)
> > +		return -ENOMEM;
> >	stream->per_xecore_buf_size = per_xecore_buf_size;
> >	stream->sampling_rate_mult = props->sampling_rate_mult;
> >	stream->wait_num_reports = props->wait_num_reports;
> >	stream->data_record_size = xe_eu_stall_data_record_size(gt_to_xe(gt));
> >	stream->xecore_buf = kcalloc(last_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
> > -	if (!stream->xecore_buf)
> > +	if (!stream->xecore_buf) {
> > +		destroy_workqueue(stream->buf_poll_wq);
> >		return -ENOMEM;
> > +	}
> >
> >	ret = xe_eu_stall_data_buf_alloc(stream, last_xecore);
> >	if (ret) {
> > +		destroy_workqueue(stream->buf_poll_wq);
> >		kfree(stream->xecore_buf);
> 
> OK, won't block on this, but error unwinding is cleaner with label's and
> goto's.
> 
> Also, if stream->buf_lock is needed, mutex_destroy is also needed for error
> unwinding and also during stream close.
Okay. But, before we do a free(stream), does it really matter to call
mutex_destroy on stream->buf_lock ?
> 
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index d5281de04d54..1cc6bfc34ccb 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -427,6 +427,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> >	     TP_ARGS(xe, caller)
> >  );
> >
> > +TRACE_EVENT(xe_eu_stall_data_read,
> > +	    TP_PROTO(u8 slice, u8 subslice,
> > +		     u32 read_ptr, u32 write_ptr,
> > +		     u32 read_offset, u32 write_offset,
> > +		     size_t total_size),
> > +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> > +		    read_offset, write_offset, total_size),
> > +
> > +	    TP_STRUCT__entry(__field(u8, slice)
> > +			     __field(u8, subslice)
> > +			     __field(u32, read_ptr)
> > +			     __field(u32, write_ptr)
> > +			     __field(u32, read_offset)
> > +			     __field(u32, write_offset)
> > +			     __field(size_t, total_size)
> > +			     ),
> > +
> > +	    TP_fast_assign(__entry->slice = slice;
> > +			   __entry->subslice = subslice;
> > +			   __entry->read_ptr = read_ptr;
> > +			   __entry->write_ptr = write_ptr;
> > +			   __entry->read_offset = read_offset;
> > +			   __entry->write_offset = write_offset;
> 
> Keep it if we need it, but do we need both the read/write ptr's and
> offset's? Since offset's are the same as ptr's, but without the ms bit.
True offsets are just pointers without the overflow bit. Maybe I can
remove the offsets, but add old read pointer (since read pointer changes
during read).

Thank You
Harish.

> 
> > +			   __entry->total_size = total_size;
> > +			   ),
> > +
> > +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> > +		      __entry->slice, __entry->subslice,
> > +		      __entry->read_ptr, __entry->write_ptr,
> > +		      __entry->read_offset, __entry->write_offset,
> > +		      __entry->total_size)
> > +);
> > +
> >  #endif
> >
> >  /* This part must be outside protection */
> > --
> > 2.48.1
> >
