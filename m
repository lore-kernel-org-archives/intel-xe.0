Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72981F364BD
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3403910E0B4;
	Thu,  9 Apr 2026 21:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+10DW7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E110E0B4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775768404; x=1807304404;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tizUBkv+Ci5V1Yr/RsMeBg60Pyc9/UG4HA9vMNsTKzM=;
 b=V+10DW7kQubWcEjH5JscMJ/szE1AfYCcPJkI3ijISSrH7+g8tGdomtvs
 6N2e5sQ36VDL9mV+8HY0hfFWekoM2bEJOTJBTCVp/VhYUytKbAFw/AICo
 Epj/p9/Tc0YLyiST315SsmQ6M4yluIp8sWiYw4Vv5ok+2JZnjPQ8cGPFK
 xW6hYsyM0Kd0xAJXCuWJ3j536bBOpaYk74iwlWP2E/tXmerlRRkmbJrzS
 XNgJytb2J2D70DgLZFTwSQTPqfOlC1iN93DcwSQFe/TujbzWbX7iiu4d4
 5znQOGSVU9nUivGElNPjSwK7svp9mVFcmtlRoSCvUoEF9at9jhnpKMhmy g==;
X-CSE-ConnectionGUID: q5qT8oMxQ2Oke6nJyKYnzA==
X-CSE-MsgGUID: hme79B4DSneflqvLWJ+/XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76661430"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76661430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:00:03 -0700
X-CSE-ConnectionGUID: 9zRnrwV+SsSqZc7sYSGZ+A==
X-CSE-MsgGUID: jQfhPXOtRQyjQXDNPTjqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="228058759"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:00:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:00:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 14:00:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 14:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFphREU6R+JONOH7HFiXaItfXezXWngtXs36fDfNJ9Zv1GeGsohxbsKWEapGW8MkyakwqO8Bbvbk4pjVbbkKi/9CXVueJI6CQqWBWoo1uDJXrhem8T0euWmBH3FTlzjjoz5mP90qbbk6NXvptfwK3ufYr/awqyJvhbywZojbp99x5Y9lCmbcBLSC6obuWsIwRMpRNrgf2xRCFAICfxHUN4F61/TwxtKM8BCZzoa8a/eu0UpcQvTTjXznYwX32r3/kQtdDQ1WthSVFdXZpO3rETNT1CohplGcFCT9bSM4FxlQMt6vQXR/t+XlPbxMCgYS/rw2EBJAFapTuLP+XpVjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMfJNesI1EWp73z1xeNOoIq1S9DKZX/2sfDNfsisJl4=;
 b=f2Fy7V56jQA6sjuLgqKJQ95lmuqz0Reu3ek9OFYkeBhg6mndpV4hxQMqm0GUJghtTZARfbopaX1yVH4iEFYZMuEbMDkbhpLSHPfLA9CtFyvAsdM4ACnBFeasz4PiJymZMriSs/IRyUDiGTq6rSu8eIp9/R/2sXz5DtCXnxsWd8Kf6kylwnaH96T33Bqez9YaMc5iTxnRxlRSfk7usXKbJpDyjk2pOJ+qaQMiEqEhMrthGYPAqik/YxuEDAh+adqsl4tdULD1RBjxjep7h1/+edMCbjVBvJTQ1Ay+KMc7GpBbTvI5Jvn76kQUHZfimS6XUYHRj90KK4cV4oEbwCDC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB8026.namprd11.prod.outlook.com (2603:10b6:806:2dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 20:59:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 20:59:58 +0000
Date: Thu, 9 Apr 2026 13:59:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/multi_queue: Store primary queue and position
 info in LRC
Message-ID: <adgTS+djMkyIh/8h@gsse-cloud1.jf.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 72af438c-ad9c-4aa7-bd01-08de967af582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 65iHaEjcwsJrPZ8WM6sPIudSNVPSvGRyHV4oeM3HoSCeaLjBaDz+ykz0MJtd8NpFqLJp2U1arXUtrBR7OZlNa/VG7Gk6mgF7Js6zi/8ci05VgQpjFMRg9ESTZcpBR+SaQUNQ8RRisbsk2FC1RxlvZlDsuMmewdcLW5shCAVhQ+tnApUQnxaxf8j3olrxTFh4sOrxE3jGVC5nCHvxbc9GBv3PeyBA258XOybvrv0WJ0PT6sBvzZTfnBoaASOElh773PQfH6SBdw0MYhTY4C+P5x/LVOoHmT+3ag8FfLW+TXwOn3n1RMNBcTCHfG0UX/W7U5iNboisFRx2rzh3JncsuJ3M9n6iq/CAI1kWjS8FL+5XueJwx5iOTWmgTyJPDawzD9dskSvQIqfPGpYWq9TbBGK1ZOmxyq6Jfwb8ZlqenFtK2JIbuGc8qZDtPzGnXeKppQCI3iHgFy+icK/9DZ1EaGclJ3LGiZInlSqY8xPS8Lry0rtFJ00wA3qz9eDQ10WKuySb6zBxlDwqMbRcw32584vbs+A3J3uuAcwXzDv9kOuE8qRM3bIJ4q3sC64skzpCcXT/VrOVJ/+WQZjZ+Olz+spjozi+F2EuXUqcpYPQbU1ZrSQH0tTXPCN8AGMkewpdDZpKrEUVqG76erCTjjoy92vX7a3tpNPPIdxHW4ovkhF7K7RoCuNrwX9A+Sy/JgYSz//sHSicSKPz1gvDsZ2TC12nZcd58IL+xWfO+Ei3iJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTlsS2FIY0tKV1N2T0tFRlhvRC9PV0NIZ1BOTTRjenYrTmxaTzZpV2d5eFhD?=
 =?utf-8?B?T2huODlGWnhoTHNlTDNWMk9RSE4rUWh2bXB3Q1BlTHk5SlFDSDMzaDhLQ1dK?=
 =?utf-8?B?OVR1Q1FlSG5LeUpoSDZzQ1lLckorUytWZndaNXprT0xVUHVWQzA4OXBoNWUy?=
 =?utf-8?B?QTF4L2UwYmFUY0IzMTFBNEdhSjRpV2t1dlV0U2RNZUw3QzVGT1lGRjloRnNm?=
 =?utf-8?B?ZDFxUS9wdVNNM3dYQjd2VTROSC9LcG0wRU0xa3VOdWxqVlBINStGd0wrcS92?=
 =?utf-8?B?Q1l1VjVQK20wSHp2REUveS9OYVFTSzJXeGVidjJWV2dwUWR1WktlZ25lWFdU?=
 =?utf-8?B?SkUvSDdwY1JFSVJOU25KTXFmN1dPcTkzQ25QUUNFODViVEhEY1Z1OHFwSjNZ?=
 =?utf-8?B?SmcvejNyblJFVTdoVzg4em51SHlxZWhlUExWZEhnTWdQcFArUzRRcXpkTHlT?=
 =?utf-8?B?cVlUYSsrOGFIN1ZWQS9sb1NGb0dLRXU1QnNheVBDTFUvUGljbTF5QVQ5ME8v?=
 =?utf-8?B?VkxySWdNaEpodk1nOW5ZMVdZYWFuU3FnYzFqWFdkYmVDTU1lVjc2NERHZWor?=
 =?utf-8?B?OFZReEROV2pDR1pVZkFJUVFsdmcxb3lXNEFydTBxcWwwTjNnRHJaZDZoam5n?=
 =?utf-8?B?ZnZzNkxiMkhKWjNlbXhNb2pNSyt4eEdHWTg0bXk4bmc3L2tLS2Nka3hoQllq?=
 =?utf-8?B?VEtZQ25TRXdQZTdqUlR0aEVScXUwYVMvY1RVdEpPUEVZVzJlTHFxaFBwdSth?=
 =?utf-8?B?eTFOS2NUbk9md0ZxYlZvaDhNbVR1WXVNdUs0U3pYK2hWODRMcXk1eEFOb2NT?=
 =?utf-8?B?MmYxYmNKOTVsREg2WnJYZDhpVVdkRWFIdmYyUCt6amZmZlRtOU02SUpJYWcy?=
 =?utf-8?B?MkwxWnBlR0NqSFlMcld5UElwcU43c0NSTkh3ZGJMbXA0YytYclFvVWNyS3JW?=
 =?utf-8?B?RGtxYVlkUDlIdVUyZ0VOd1Y2L2Vhb2NVQVAxMTBsbWRNWkJlT0FNRVRCdWpT?=
 =?utf-8?B?Mk1rQWlyakx5N2F1ZVk0a0JFMHVSQU52Z294b0ExRmpoKys2U1RQMG8zTVJz?=
 =?utf-8?B?aDZuSlpJNXRGQTkzUGR6eWViSWxVNXp4NG54b0pta01hSlBWeFNKZUZiZGFw?=
 =?utf-8?B?ZlE4Y1I3K0FISDF4WjBULzlKdWFSbmIzL0Q2WHpwcnZDakRRL3FaY1R3QTZ4?=
 =?utf-8?B?cTdEK0dSa0x2QTUvQlRMUTVDSFBkRHRuREZtZ3QvTnFRbklMYTc1K2p3c0Vv?=
 =?utf-8?B?enlHc3YzL2F3dldFQVpiSzJ2S0ZjVGx6R28vWlVDb2M4RThZbG9GWTJoNzFZ?=
 =?utf-8?B?QkhBd0lFa2VqSmxsUytNUDRoNWlyWWhldlVhc2ZsUzNSZzJaMG9VRkJmdTlv?=
 =?utf-8?B?RlpXTkhQdWE2TDJiSk9WVXhwdHlwUU44NWN6ZFRscEZ6ZExrTUVXUWJhTHFQ?=
 =?utf-8?B?dXFreW5WbFdSam9IVjM1bjZCUktETTNhTnhIWHpwc0d4NCtnYTFsd2RnM0Iz?=
 =?utf-8?B?Z1pkdngrNEZWNzMxUkdidGdPWnZ6enA5VHluR2hQZ09od3QzMlVoRjV4b1Vw?=
 =?utf-8?B?S3V3WmgrcWdmTUc0ODVuT3pRcnp4eWJnQXNFNFE4R2RLWlcwNkgyQjBjWm5F?=
 =?utf-8?B?RDkyTjdmRDZTanNkUEx2dit6ekR6eHpUdUREeU5ueGJoUTMyd1NUcUZST2ZN?=
 =?utf-8?B?R0lHYWhodC9Ca0hEdXd4SFAvanFYa3B4dmdlc0NlWW9uUTZ3VzBwamthMTRU?=
 =?utf-8?B?TDBBbzRVRlcrWlZ5U1RsZmtlMGh3eGQwaFVuYytLcktSeDFaRjJ2ODlLQ0I4?=
 =?utf-8?B?MjhsOUZRbTdmVXBORSszUlFWN0NsNm5oZHBIV2JjMlYrNEtDZW10WXNqRlNQ?=
 =?utf-8?B?alMybytDRlRIS2x2eFYrUXNnZ1F2WWRHNVpDbk43aHJCOXpiVXV3dVhvYTlm?=
 =?utf-8?B?M0o2b0ZUY01Hd00vVlMyRVpqQTVXTHBUYjBTVDI3dWlmRFFQcmJOZ3FwWUlx?=
 =?utf-8?B?cHBJT0NTc1FaM2E1d0tiaHJvUzN1U20yM3RBKzcwOExaUVBXcTYrMEI0cEJN?=
 =?utf-8?B?VmJnemNkd1BqZ21jVUtBZ2h6U3FaUGhnSDYvaVkxSEY4QWU2aHkzWWl2c3JF?=
 =?utf-8?B?T0hGbUw5Wks3UWFvQlhveXE5eTF1OVQzdzU2eTErWVFQaFdtdXpzM08rSzRt?=
 =?utf-8?B?UmVIZVIrY0lub3l6T2NRbWR5a0lRRnQwek5IUkV3cmZ4TFRudkJ6YzBNdUJm?=
 =?utf-8?B?T3Q1cERnWTh1eVNTcHFGand6Ykw2US9JVi9MQ05pdEwrTWh2T3hJL0UyblA4?=
 =?utf-8?B?Qyt1a2Vramk1RUduMTVDYXFzMGVKM2JnYVBaVzU1cHRuRk9tRkwyUT09?=
X-Exchange-RoutingPolicyChecked: miWR76jpstXm8OgMRT4jSmTUBHJH1YrMoa0arN9i2HxxbpIwwJ+w+6Kaoc3rS19m3EqWziDKyA55fsYtjmM2X0Zrbu3W617uC5l+ppG7vHLZ7KNEOOEZdaAe5vjDv6M37qzyD0TbmjChmtXo7sFwlmm647S7Rn2JhPgZE7hVzAK4J4mFjgVKJGKnprcTcl3A5qGkOOyqjEHI+ntXGIIIvC7kF2lwCghTddROEastukkICI10UajX9asCDBvfKlqrFN1aCVxrsbAjLe0nE6kDQpK6I93Q9JfF0nmDBuvaXdMgQekwvLHQB/4DrcsHalz9Fb3cIYARWyDsqAnx6s+g0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72af438c-ad9c-4aa7-bd01-08de967af582
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 20:59:58.6885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oIXE51s5/ookYGZZlo5n5cWWIbjrZudOg+ysFL8QNHlTh9EIyZ2QcTVIw9bsBkk4hfT0D3pjqphLNtWUajcaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8026
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

On Thu, Apr 09, 2026 at 01:37:16PM -0700, Umesh Nerlige Ramappa wrote:
> Given an LRC belonging to the secondary queue, in order to check if its
> context group is active, we need to check the LRC of the primary queue.
> In addition to that we want to compare the secondary queue position to
> CSMQDEBUG register to check if the queue itself is active.
> 
> To do so, store primary queue and position information int the LRC.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++++++-
>  drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
>  drivers/gpu/drm/xe/xe_lrc_types.h  | 10 ++++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b287d0e0e60a..4fb02eda77b4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -275,8 +275,14 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>  {
>  	xe_assert(gt_to_xe(q->gt), idx < q->width);
>  
> -	scoped_guard(spinlock, &q->lrc_lookup_lock)
> +	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>  		q->lrc[idx] = lrc;
> +		if (xe_exec_queue_is_multi_queue(q)) {
> +			lrc->multi_queue.primary = q->multi_queue.group->primary;

Can you add a brief explanation of why this is memory‑safe? For example,
why is it OK and correct not to take a reference? This kind of thing
tends to trip up human reviewers in code reviews, and apparently AI
reviewers as well—I’ve seen a couple of AI reviews suggest that a
reference was missing when, in fact, omitting it was intentional to
avoid taking a reference.

Also, if we want to be really paranoid: in xe_exec_queue_group_cleanup,
before the primary drops the secondary references, it clears out these
fields in the LRC.

Overall, this looks sane enough, though.

Matt

> +			lrc->multi_queue.pos = q->multi_queue.pos;
> +			lrc->multi_queue.valid = 1;
> +		}
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7c975f9e2d9..b544c8169967 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -90,6 +90,11 @@ static inline size_t xe_lrc_ring_size(void)
>  	return SZ_16K;
>  }
>  
> +static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
> +{
> +	return lrc->multi_queue.valid;
> +}
> +
>  size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 5a718f759ed6..93972536214a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -63,6 +63,16 @@ struct xe_lrc {
>  
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>  	u64 ctx_timestamp;
> +
> +	/** @multi_queue: Multi queue LRC related information */
> +	struct {
> +		/** @multi_queue.primary: Primary queue corresponding to this LRC */
> +		struct xe_exec_queue *primary;
> +		/** @multi_queue.valid: LRC belongs to a multi queue group */
> +		u8 valid;
> +		/** @multi_queue.pos: Position of LRC within the multi-queue group */
> +		u8 pos;
> +	} multi_queue;
>  };
>  
>  struct xe_lrc_snapshot;
> -- 
> 2.43.0
> 
