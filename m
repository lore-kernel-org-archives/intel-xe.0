Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6985BC5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 22:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9F410E7A3;
	Thu, 29 May 2025 22:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umupf7wJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095810E7A4
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748558560; x=1780094560;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=016lwPvGI7E740p3gj9IuTDWovXcDtMp/E4FsUkqEnI=;
 b=Umupf7wJgsPL6gQHFEjuh8cWrRG56IwEd3QDPxUMgG48mt7NS9+IzOfw
 +w7xw0nT0KPf8hc3q1CRYxDolEMpJLTB860qMPAcqyvkrsEgayyl5398c
 ZyTZZxWduCDqNQ/af8BN66KinB6dWesyreydDJv9mb1Y/XuiNH6iPfAcc
 hkJXJMqGNJ6CC2/3IEgHwkYZi0N+iTDY5x/l5G5JN8A8bqNhmuyNaJv7i
 lhBn9xiQWm4/XmQQcMnYT216p96NRt4uh57AdB7eNI7qaWdZHz6FW8C4B
 zd7yiJD0EAF9Zzxl0GFqhLN/mY+tGBxv9hMNysGW5zC8e5mWOfXkwm6iM A==;
X-CSE-ConnectionGUID: e4fm6tsPRqqrSXy+KtFlwQ==
X-CSE-MsgGUID: P00plUyuSA+D6x/0PbFSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61305286"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="61305286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 15:42:39 -0700
X-CSE-ConnectionGUID: Q3Qd2hM8Si+jZ+6vF+toHw==
X-CSE-MsgGUID: KtZvKRW6QqW8b9b7OoQo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="174590082"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 15:42:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 15:42:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 15:42:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.61) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 15:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2HMPIO+7gRrwRrPrZb1rOTEPLZSNG4NdsbJG2b7ARwfoga5Ol/Tu3iX88W3hVYT3eb4kbtVhueGHf3EaazUfCOQ7C+bg978JeTPeAA1ipvGjSMIydipWYC3jC4W6huuOIY8hMz/qUIIYQRIHZN50g9sci7H0xCep63Cs5l75ZRx2PXyiUpK+levdh5GfQbmWdrMnPQntL7ET6lYa+dar2081roTCQOO8p0tP8iwcGmDgumwFOO90gwLAIIGYoRRJkroVBFQGsoo3JiDCvT6h5HyX52iNsuhCfxTBahkQonJxSSphVcZ9XDF6oQ7fwHJhLODXhKiPJBNkieK0cWOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0ZCMe9LPRD8iNBH7nUdJ3gd+l1bXr3WpLL5twQZZKk=;
 b=pSqutGDSTiQSa+d0g8WHRga/TaTbtN2XuEausMVF8oXuPzDmyC0i8guNJGj+xRN/gcdVh4bVrQU9IpHGhqD9xgDSovuoTme2mOXsaHrwtJzhAxTUa2i2XBhx9HWDIuci3Y3lmXTpOog3cWXTG5uyyRtdyvmY7o1smvpOh/rpwVCkkEt5t/6lOJBbKXYA8ydZdxy7MSEsDzhREYkeTuiWwFRmnoQPvzwnbe6hkLxUeSAF+OnNBZfLzDIsbk1PsrEThzuu+QHZsaUi2eH9Z9kQzwfSVtRLKnFBztHSP13dOKsb3td/wjT3J5xXjjyPfuTT13fstOFeDZMqYwJT+0K0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 22:42:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 22:42:10 +0000
Date: Thu, 29 May 2025 15:43:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
Message-ID: <aDjjHAk3xkU4nWOU@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BN9PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:408:f8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 5304215a-3202-4a13-c195-08dd9f020c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW0xRGVqSFF0Zm5QdGFHYysvTEhEV3BXSitCTjd4R3BTa1lTam15U1lDc2w5?=
 =?utf-8?B?OU9hWUsvMVFMVjJNKzhBL29aMk5ZTDdWb2V3UGpsMytqYmJRVm9JZWRPbnNj?=
 =?utf-8?B?OFdtNDZHVlRtMmJvNVdCdm5DRWI2MXJlckdEcDdzL21pTjkwZ2JJaWtjRUJW?=
 =?utf-8?B?a280WGFYWTg5N0RVdWNDNk5wekpXeThKbmliUVYrM3ZWSU0xY2RGRXZlTzJo?=
 =?utf-8?B?UHFaS1B1cDNxa1NOT3lxMkc3cUlQT1VmbjB6b2FRWHZ5Mk9uZUZLNUh4RldB?=
 =?utf-8?B?bldLR3dwM3JMM2ZKWTV3aVd6eE14NDV4QjM0OGhVekZvV1lZM2xxczZxc1JK?=
 =?utf-8?B?dGVzcEtuV2RjMHBTYU5MNmgvNUwyaEF1Z1J2cDM1TC9TWWJ1bGVnRUtlSXpO?=
 =?utf-8?B?eFRHZHl5NExCVWR6TEpBeHhHRjRrQUpuUUxMNGVMR0pxYkJwY1ZLazJUWWsz?=
 =?utf-8?B?VTFmTWVMQ2Rtc0puMUVqQkZjZlRoZERiWFYrclpHcHBNanNCUEFIUy9vSzc0?=
 =?utf-8?B?aXpoUDRGQ0YzUDJ5N0Fwa1NYU3pIMzNhRHRtbVdpR2o0dWxxYjlzN1I4OUVk?=
 =?utf-8?B?REVZNlF4WVMyY0dTOW9lOG5lOUY1ZGlpRitoU1o1TjVwSXA5ZnA2ajJsTGNO?=
 =?utf-8?B?UmZKZExGamlQb09MZEoyUStBdklFTW5DSnc1cFNEZXI1VnllQndtK0NVTm56?=
 =?utf-8?B?MHhOUktxblh3Z29LdEVVUUJTNTUrU1dDQ2UwblEzbXllSDVjbHBueFYvWlF2?=
 =?utf-8?B?OXAydmR4L09uM3U4ZytRL2ZHWXR0ekE1MHUrZDZXY3phSFM5RHRUcHQ0bVR1?=
 =?utf-8?B?TDNMYWw3UmhDMXV6ZDBrSmh6YW1jd2c4Z1lvMHJMRWx2ZmVHeVZzV2ZyQ2xS?=
 =?utf-8?B?QklTZ2tFUHBJaHd6L05ZdTFUd2gzMXQvbDZ4eE5BVVAvdW5reEE1R3FqUEFm?=
 =?utf-8?B?WndCRjArcGNJWWM2V0xYQWNURDJLMGhPeStwRDRUVXo3WUJMUjFzdmJISkpk?=
 =?utf-8?B?OVA1TWZrbDdEK1ZwenZlbTFWUnhGbmdFb0FyRW8vYkJtZGxLSmJNb1p6SkYy?=
 =?utf-8?B?K3dHcm9BY0V3UFBEbzdGUjJHSVBDTGZkWlkxN0llUU5pb2xvNUd4Q3Z3RFY3?=
 =?utf-8?B?MkNJZTFnWVFaYlBreXU2TVhEaTNoaXBjUVRnaHNBdHlPM3JGZmJJZ0dKQ3Vs?=
 =?utf-8?B?RE1ZU1B2RVZxTzQ1OGFDYjFsZ2xSQWhEdDVieEZPZ1VyRUJjandQRHM2akpl?=
 =?utf-8?B?WHlkTlpqZkxweVVSRm54M0VWK1QvT0hFMU9CMEtGSXdZMDRDZEdrOXRzenNj?=
 =?utf-8?B?dzhPV1BVZVpQSFZpeGJUQ3lMY25XenZqOWxYT0Yrb1FZcGRESGYyMDltbUI0?=
 =?utf-8?B?cS90a3l6aWxUcmduZGFtdjJTWjgwQ3VpdWxOTEVWaWxoY3VNS01zNWEzSUMz?=
 =?utf-8?B?Q2lDSjRsVE5TVjBHb3dBTDdPRXFnQlZrQit1Skl6dURGa1ZJR2NlRm92aTB5?=
 =?utf-8?B?QVU1UGsvQ0J3Q1poT3VBdlFmdzhDbDZUQ0pnS1BkZ2xFUkZ6WHRwMDRmYnlk?=
 =?utf-8?B?RTBXc3NTWEllZFhrQ1UrV0M4S1p2M2Jqczc0bHNHN3dHTXJQYXZnUkIxS2xN?=
 =?utf-8?B?VWZYTjRVdC85Y2x1Z1hzNjV4UjExQ0xBQXN0by9LWk9RMlZuZy9kRjRaQ0NY?=
 =?utf-8?B?VTlXQ2JlMEh0aUo2Z2gzRWFQSVk1WW52eEU2Q0JuMXlCd29TQzVLRmRhWmRR?=
 =?utf-8?B?MVJnWE9YWWhvOVJVaGp6RDZtcDlaOHpHMWd3YUtzY2ZEZkRnVjFwZ0Q4Ukh4?=
 =?utf-8?Q?kO6xGszOwIVfOlFJYMlPBwNhZod+WsOWNN6/8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlRNUGNXbFlKRDRweThLQmNwSXlSZ21ML2dNVnpTK3ZBZm1mMUJXYmQrTmVR?=
 =?utf-8?B?bEtqcCtxUVpQQ2RySms2cG9ZRlFvUUptZEg5ZzBxRUFYcEoxRDlHM3Q0R0dp?=
 =?utf-8?B?NytQeXQvTTZpR3JoK3pMYThOZDlrTmE2K3FFdGRRdFZlaE13aXdSbXhvRUk4?=
 =?utf-8?B?T3Y4ZjgzMCtyQWozWkwyRk1XeGV0SmF4TDZ6QWhhY3ZOWVExVFZERmJ4N1lI?=
 =?utf-8?B?RlhNeGw2bi9VMGlSVGR2eDQxVjFIVXlrYjdQL0duRjM3QnZXUldOL3pKOEVR?=
 =?utf-8?B?Zm5WRVprYUtIc2hWTFErWm9wZWVzaU52cEN1SEZRd1QxallGZzAxWXRTUkpy?=
 =?utf-8?B?ei96dUxONHR0R0JDK2hWOTU0MXhURXFBQXRWV0VMWm03dWUzRXB6L0ZuTnh4?=
 =?utf-8?B?THJVbFRSQWJ4VDZPQldVUi9udnBYTEozYWtURklJakR2bkFNMm9BejBBK3J4?=
 =?utf-8?B?dXZ1eGdQQXN0UTB5ZU9QN3RrdXU2MFJBbEtLdWRNbU5TTkRJbGE2bUlZaUdI?=
 =?utf-8?B?OGI0NlB3WXRqdm5zRzhtRTdSbmVxNnZPQWE2dXlYTG12OTRxemFYa2F6TGwr?=
 =?utf-8?B?bHQ4dlZtMVdHdXVwMUkxRUg2T0ltMlc3K3ZDQ3ovVmFTZEdDWHM2R2lVZlFB?=
 =?utf-8?B?U1ZOajFuT0QySEVCeURpSjZMcFBybUI4cHZRS2trNGhDUXp6SlpickJadyt4?=
 =?utf-8?B?NXdVZmQ0R1VOQ05PODR2RndGeVM0eFliOUpIcHU4REEzOThGMzJ6MCt0Uzh6?=
 =?utf-8?B?ekd4NXZUQTVSQlQzVUswZXQ3RVpvbkw4WHRnU0xkYUdpc2cwRVhRelhsM2Rl?=
 =?utf-8?B?a1NGSmVYeGFyRkphS29iRHRZdFkzN3VtV0NmVE90NVRhR2RtTVpSRFpheWlG?=
 =?utf-8?B?MkZncGd5TXloam5raWI4b3QrSXN0aktUcUZuYmU0MXFUUWQxQTk5TEJIbUF1?=
 =?utf-8?B?aUJ0RzBITHUyZ1A2cnJzbE1IQkY0N2RFNnZ6UUtGMWNRL2p6bXA1bkVrTm03?=
 =?utf-8?B?MWdzUTN4VG5zbXRCRjBmTERMbWtFTXV4RUMrMEppZWZtK1J6VzFTTU81SzZ5?=
 =?utf-8?B?cWoxTnhPOTRYRUwvRGFqSjdPa0ZROEhPYkpNUGh4bEx0SHlPTWJ6Nit4Qjdv?=
 =?utf-8?B?NGhGMWpMYXZMVUtqRE94eTNkeGJhYThnY3I3TUNYcGo1ZU00bTQ2enhTUjUz?=
 =?utf-8?B?SDJzSzludmtBSnVHZDcvU1M5TDFtWkRRNjAybnF3WnVZU01ISU1uWG9rb1RG?=
 =?utf-8?B?YURJQXp6SzBzSk11UlpNOXBtY2lPd28vdTU4KzdyMnVlc09OVzdYMUZQemor?=
 =?utf-8?B?dzArNUpOWnFnVTYrbk1YTEhod3dUTVFITGtYc2cxaGRWcjlEQU1nQWtNRlRU?=
 =?utf-8?B?U2luK05QbHpUbnNzRnFGNG1GeHErbkIyV2luRFJDNnlOdzNhdllIMWVDb2dE?=
 =?utf-8?B?TWYyL0k5eDk1VE0rcGh0NkFaQ0YyNHN0N1FtOEFiNy83RXRCb1FWL2Y5UXZ1?=
 =?utf-8?B?TUR4NVB2L0xzNVFBMDIvaWgvQVY1R09qT2xMYXhRSlN3MDdCeVhLVW5yZVBh?=
 =?utf-8?B?TzhtOFVaQTM3OHZQNE1PRzVmVFQ0NUh3RWJ2WDg4cXRyRVhYdWJmYTFLb0xa?=
 =?utf-8?B?MnM2UjhPb2ZHMjNNZGFweXNkYVVuVTA4b3N3QmtwMjh1NDBjWWFsM2FFRHBS?=
 =?utf-8?B?K2l1SnBlV01RWGgxQUVSN0hISkxHT1FFd0VSdHRFZUJKR3o2eG5IWkFLQyt4?=
 =?utf-8?B?alhldnV6RXY4SDMwRGNibTQvRHRTUFFXUXVhZXVmVEhsSFdiQmJiUWluQTNS?=
 =?utf-8?B?am5GWm1IQXJoSVBwSXRJTG1JdmlXUjJ6Vmk1SUJEVXdaQXRQWlVWU25GdG1P?=
 =?utf-8?B?b2o4V3Vad2ZHOW1JUm82cXJ4aUhlSitWSTVWWXNoK3EvdHFrNjQwM0tqcTVH?=
 =?utf-8?B?QjdaRjVWYTdzb3M5UkkxMkpVZU9LRUFybkhiU0RIRTlmQ3NhQWd4eEpjM1Vl?=
 =?utf-8?B?MUJXT21NNDNKSGlDempvSmNzYnAzVUFId2k0M005OFFobXhHR0xiNlhlbGdi?=
 =?utf-8?B?SWJJVlRHTlVtSTg2Z3ZGMWNaN2t0dXBQVng1UWJRUG9VU3RoblBJV05ScXFj?=
 =?utf-8?B?bHIydWFzcGozVXVZdmw1QjJZN1hnWlN6bnpoM29XK3M3R20waTkwRDdzSkVv?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5304215a-3202-4a13-c195-08dd9f020c36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 22:42:10.3107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZVymyx0ClJiFzM7B9/iwc0JXuVa1L+c530lA0D4zIwaBMtg4A2j4N0vaFfnFlX397Ovi8L/ixNVtoC9X18V/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

On Tue, May 27, 2025 at 10:09:54PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> v2(Matthew brost)
> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> fault mode too
> - fix tlb invalidation skip for same ranges in multiple op
> - use helper for tlb invalidation
> - use xe_svm_notifier_lock/unlock helper
> - s/lockdep_assert_held/lockdep_assert_held_write
> - Add kernel-doc
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_device.c     |   2 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  4 files changed, 282 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c5d6681645ed..dc64bdcddfdc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..b9791c614749 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_vram.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..f7edefe5f6cf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
> +				u64 addr, u64 range)
> +{
> +	struct xe_vma **vmas, **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	*num_vmas = 0;
> +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
> +	if (!vmas)
> +		return NULL;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (*num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(vmas);
> +				return NULL;
> +			}
> +			vmas = __vmas;
> +		}
> +
> +		vmas[*num_vmas] = vma;
> +		(*num_vmas)++;
> +	}
> +
> +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
> +
> +	if (!*num_vmas) {
> +		kfree(vmas);
> +		return NULL;
> +	}
> +
> +	return vmas;
> +}
> +
> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				     struct xe_vma **vmas, int num_vmas,
> +				     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			  struct xe_vma **vmas, int num_vmas,
> +			  struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
> +				   struct xe_vma **vmas, int num_vmas,
> +				   struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
> +

See my latest replies in patch #19, if possible, making these functions
so they can't fail would be best.

> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
> +};
> +
> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
> +{
> +	struct drm_gpuva *gpuva;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		if (xe_vma_is_userptr(vma)) {
> +			WARN_ON_ONCE(!mmu_interval_check_retry
> +				    (&to_userptr_vma(vma)->userptr.notifier,
> +				     to_userptr_vma(vma)->userptr.notifier_seq));
> +
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +							     DMA_RESV_USAGE_BOOKKEEP));
> +		}
> +

I think the similar code in xe_vm_invalidate_vma is a bit stale and
contains remnants from when we issued the userptr TLB invalidation
outside of the notifier lock in the MMU notifier. There, it should be:

if (xe_vma_is_userptr())
	lockdep_assert(userptr notifier lock held);
	extra sanity checks

So with that, you need the userptr notifier lock in read mode here.

Also, I think the first WARN_ON is likely to always trigger here, as the
CPU pages are likely valid, so that one should be removed.

In xe_vm_invalidate_vma, the extra tests are protected by the
PROVE_LOCKING Kconfig option. So if you keep the dma-resv check, I’d
recommend hiding it behind PROVE_LOCKING.

Note: speaking of the userptr notifier lock, Matt Auld has a patch
series [1] to unify this with the GPU SVM notifier lock. If that lands
before your changes, then you should use the SVM notifier lock in read
mode for userptr here.

[1] https://patchwork.freedesktop.org/series/146553/

> +		if (xe_vma_bo(vma))
> +			xe_bo_lock(xe_vma_bo(vma), false);
> +

Ah yes, you do need the BO lock here to prevent races from BO moves
issuing a zap. Maybe we can update the xe_pt_zap_ptes lockdep assertions
for userptr/BOs, along with some comments? We could do that
independently of this series. I suggest this because I had forgotten how
this worked in the previous revision. Maybe I can post this
independently.

> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma))
> +				*tile_mask |= BIT(id);
> +		}
> +
> +		if (xe_vma_bo(vma))
> +			xe_bo_unlock(xe_vma_bo(vma));
> +	}
> +}
> +
> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u8 tile_mask = 0;
> +
> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> +	if (!tile_mask)
> +		return 0;
> +
> +	xe_device_wmb(vm->xe);
> +
> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> +}
> +
> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
> +			     struct drm_xe_madvise_ops *new)
> +{
> +	return (new->start == old->start && new->range == old->range);
> +}
> +
> +/**
> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * @dev: DRM device pointer
> + * @data: Pointer to ioctl data (drm_xe_madvise*)
> + * @file: DRM file pointer
> + *
> + * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * input range.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise_ops *advs_ops;
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vm *vm;
> +	struct xe_vma **vmas = NULL;
> +	int num_vmas, err = 0;
> +	int i, j, attr_type;
> +	bool needs_invalidation;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_write(&vm->lock);
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	if (args->num_ops > 1) {
> +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
> +
> +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
> +					  GFP_KERNEL | __GFP_ACCOUNT |
> +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +		if (!advs_ops) {
> +			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
> +			goto unlock_vm;
> +		}
> +
> +		err = __copy_from_user(advs_ops, madvise_user,
> +				       sizeof(struct drm_xe_madvise_ops) *
> +				       args->num_ops);
> +		if (XE_IOCTL_DBG(xe, err)) {
> +			err = -EFAULT;
> +			goto free_advs_ops;
> +		}
> +	} else {
> +		advs_ops = &args->ops;
> +	}
> +

See my reply in patch #19, I think we should validate user input ahead
of the below loop rather than failing mid-loop on bad user input.

> +	for (i = 0; i < args->num_ops; i++) {
> +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> +
> +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> +		if (!vmas) {
> +			err = -ENOMEM;
> +			goto free_advs_ops;
> +		}
> +
> +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> +
> +		kfree(vmas);
> +		vmas = NULL;
> +
> +		if (err)
> +			goto free_advs_ops;
> +	}
> +
> +	for (i = 0; i < args->num_ops; i++) {
> +		needs_invalidation = true;
> +		for (j = i + 1; j < args->num_ops; ++j) {
> +			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
> +				needs_invalidation = false;
> +				break;
> +			}
> +		}

I'd drop this extra check. The invalidation code already short ciruits
on the tile_present / tile_invalidated bits in the range or VMA so I
don't think an extra short circuit here buys us a ton.

Matt

> +		if (needs_invalidation) {
> +			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
> +							     advs_ops[i].start + advs_ops[i].range);
> +			if (err)
> +				goto free_advs_ops;
> +		}
> +	}
> +
> +free_advs_ops:
> +	if (args->num_ops > 1)
> +		kvfree(advs_ops);
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..c5cdd058c322
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
