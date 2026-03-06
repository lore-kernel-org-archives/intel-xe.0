Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15B0F513E9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 01:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C3E10E03D;
	Fri,  6 Mar 2026 01:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnD7oSlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085E10E03D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 01:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772760002; x=1804296002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h9XIRhOUxdOa+pZgmQNyeMf5ca7RiWU3rbASKF8C15s=;
 b=nnD7oSlD34Xg09DseRSSFUW8xTcwlbkrlqNsX8XGNztlZiRkzAACoO9F
 Vba+cKc4Xjq6oCfNeGPgjVkMvYkK/m/M9h2WYGtZNq95N7w4GuspW16MH
 BwfqdBD5Co/ShCQjnDs4v+jrijIrvKEyD7bdk5qrQylQkfhMIaqyKaSab
 LXovpDyBEZeewzpKrX7qQjEnduFfQllC3EnAQRKNo6nitewbrYCfXR7h2
 HA/2llHtkDmee02cBbAdkiiUVXn6naqkXO1qo2nCAgT2BZrbz65MI5Quk
 T0HSZrjBfk1Np5SnCZSEgnhn9LRZRANvF+dkvo5KeS5FYDF2qTJtDrqCs w==;
X-CSE-ConnectionGUID: QA5LQS7URxi2rSVP5+3msg==
X-CSE-MsgGUID: gQp/aBEqRby8UdwByoR9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85213006"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85213006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 17:20:00 -0800
X-CSE-ConnectionGUID: pjEMjFcoS5WZH9CCD3pZ9A==
X-CSE-MsgGUID: KiHjHBb2QuqWwKfmF7jc+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256759543"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 17:19:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 17:19:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 17:19:58 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 17:19:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWg3Kc4XTNuRss63cKFpZPuXA0K34VukohH+IhkuguUM0TYA+nQj5egvSqHhWUhPB+pcDM/cudfZ/gyJn02ggMRkuT1eh/iskKLGjcuoT+ErEIPWePv8PstFPiPz5Pengyf3oFGdoVe2znGfL6diYvClmq8nvTO6Rii3V3gK0wdZGYgcTTb9VERRf57aznSoB7cqClEuwNRAX+CbvyV0j/myhAzhfMYy96GkoSFR6swndZJesGd45Ecza9PGdGlqxV731ZE2yDw7CyvgBh++8w7PuMLB5FOraXsTxTFdk3m5rR/F6fAqnF8svyTaGzHsqQcZQv1K87aoQnTH/UmhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N3/25FPuUsCuPTVVf37E4gdlkX8WUdF0V/4Mupb7ps=;
 b=Q437nnzOLOY8BWUq/+ODk2Ux8d3UGGSAjXA8EVttRXHjPgNAGyeB10CrMBlusk2xuFH734PaaSndXEtGpX5Q1ZSpFNacEEjcu8HxxLxwkJunOhWibwmcNy3nWQTy2TaBDkaEjm8VqC9fosRt32KNL4y6Sqm2lT4UDuRsOtJySvAYhw5zbyT+Q5u1Peq3syOiAZfbP0JoFygIDCcLTR9Tk66VFcy3+nmMb9x1tCyDslfaQ47nciRyoQS4zX6oKWexyc+67uIsIUo1MC6gPN2sZQr80pYOzegST06a8PG0PQvLpi38e3FMvD06lYywUgmh7MvSMW5uArpl9Mh8HiAtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:19:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 01:19:54 +0000
Date: Thu, 5 Mar 2026 20:19:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v5] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <aaortyfm2POr6F78@intel.com>
References: <20260304075529.1250065-1-lionel.g.landwerlin@intel.com>
 <aanXT8gDwVQOXt2I@intel.com>
 <016f76b2-568e-4136-9a6b-b2be903c7ca9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <016f76b2-568e-4136-9a6b-b2be903c7ca9@intel.com>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2a2961-ddad-45da-2f0f-08de7b1e7905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: bXXSz6tboxh3917kWIoLd4GAN5T/KNFurMmNWiPnoRpj1e4xzEcl2z0yN9rGQVNlMmUiygJTBr4Vb9VTRPQIdNDduMR3dM8NVo8F+mm9wfH5tutTG8X0vxrU7Pnjn0SX1S4qytFcoU9HQoiLKutzpVkqmJl1Mr83N71ngSLB3bbSM0RdQ8tdvmGt/8cxQz4vMdFdaUm+k2RpjCFaDouelzr3LpOC0TkrTA0egFVQTB0X2uMGSieVAYptJCeoVcmHvBIcJYnVmKQ7TFHlWRbUsTPbWyiSwZlqSsM3Bhw+0yMemJXBfDZ/XxUm2Rv0uzHQM4ZH4hMhFTEIYQtDrZqwjLV9BQ5rYJMkKhWlj3FltXxZg0aG7GCXtpiLDQFPbmo7TyBRRodcBOfOoxiu8Hte0WgeirH7MRUMQDqdjmUSuMdBcOTHCXG1SNKGPJkjZ1IIxEAj2J5V5NapGEGBOFRR1IZ7Xmqh8tp0Q2s6iYqumrfj3KpqKYRRejrQC1f0K6qyuiQiCuFP3ouWHfTrnN7x2em2Pn/ebW96XtITvPFyBH4MvInkGf44+VfpCPfd1IZleO16zpNDMZth2dGPlUOLapoEk1W39PYXX3jdO7JYRTakP+uscRxIJgFTuFb+bUZ2FJkmJs/Lcicpp8jECDhx84ZramuzR+iwyOFDJE/KOyyho3j+wCptwf9m6oeXldEr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZySjNQeWJkQkxOZWs1UDg5bk5xQ0RqTGZ6aFpPdjUweFZiSm4zOGJ3eCta?=
 =?utf-8?B?SzdOR2J1RXRxSnBHd0d4WHlRanJub0VGWVR2a3lYUm9jcWdLU3pZRkE3YkZE?=
 =?utf-8?B?S1pLUDM0RDA3a080eU5mZWRnQ0hVaklQb282cU9YNDVnR2c5cmNhV1dHQUhN?=
 =?utf-8?B?eEgrSE5BU1ZPbVlmeWQ3bUdLQlpjUmdYRHQzZWdPWjRCSkYvSGFNWkQ5SElD?=
 =?utf-8?B?bWVxcnUyOW1WZFIvQkZMcGNPbFFMTzJzNXVVQ0l6Y2gwZTRPRWRBQXJ1MlEv?=
 =?utf-8?B?MWtvdk1acWYxY2RqeCtXWjh0TWc2cXRSMW9wc05QYzlRS0hIaGk5SHN0V3lE?=
 =?utf-8?B?VFlXZ1hEVHozVG9yQUJKT0cxR2VCaTFMalFBbndUYlpQV3piSnk1OEQ2RWQx?=
 =?utf-8?B?SzUvNjUvMmlWY2hEaFdFRnZST0ZHemRwNmtIME44YzZub2lNZ1AwK2ZhczFj?=
 =?utf-8?B?Qk54WnFpcll5eUs2aDZQOW5jMXgxdldmVXdHdFE4VXBON0RLdm00NWkwd2Uz?=
 =?utf-8?B?L2FNTk50SjdHUVhHeWJMbWhPVWN6bTBLdTMxY1hlUUxNdzdsUFd3am53cWNl?=
 =?utf-8?B?SFBCdXUvMmVjaHZiR1NGT3p1c29oYklPeUsxR3VhQ1RxQ0FRSFk3MWRnTjcr?=
 =?utf-8?B?RUlsaTkraG8wOGNlcytyVHBWVVhCcDFLVGY4Umx3aFV1RHB5QzlhUTkvR1hZ?=
 =?utf-8?B?b3JFVFp1UTRWdVJZR2lmNWswS2N2QXIzNU9vYVdYdjFkSlhvWFdUWFFBMmNh?=
 =?utf-8?B?ejEwRmg1bGk3VTBxT05NakgrczZ3MkNpN3M1NTR3ZlJjYkZLNFI3ZTF3VkNV?=
 =?utf-8?B?MldEcmN6eUFFZVJ6NDJQYis5VTJMc2NKTzlFb0Jablc0UFRlbEtiWWk5VjI3?=
 =?utf-8?B?cnlycDJoSE9LbnZMMVBBYjJ2ZmFQdXVUZXUza2FSaXc1VXZiNFhCYkFobktj?=
 =?utf-8?B?L2dqcGp6NlFLdmIzSlJ3NlBTMzYvbllNenZncnB1cDVvenp2Q0J6Y284Vldy?=
 =?utf-8?B?WnF5OTEyUGpHWEp3cHhXSVp6OHFDaGxHbjdaOXNML0lMeEd2Z2xublRqZElu?=
 =?utf-8?B?ZG1IWGpNRmZYUlBYSVNicm9iSHVrazZzVUl3UHU0VnRFdkxJOGJtNkdDcDQx?=
 =?utf-8?B?Uk5rSUZNcVovaVZ0UkFqRHVmdHk2bldjME1YSGx0T0dYUGFUVDlXWkpaZkNX?=
 =?utf-8?B?a3QxQ0xUWkI5SERsOE5PSTY4eDR3VnJ4cEtZSWNlUStrcGpmTzVNNnpRQXh0?=
 =?utf-8?B?OWxHYmZjUkYvKytyK25WMlhoY2JEOFJnd3Vpbi90a0JnMXoxR3k4a2lNalVw?=
 =?utf-8?B?b1V6eGppRFo0WnFVL2ZKWXUram5OVFAvN2Y4Zk9NcGlYV0xpYnhhaUh6aTRU?=
 =?utf-8?B?OTR1UnRuOFVPRGV0NXg2bXFOSTNqWk5rOGh3ejQ3OTRWTnNaQmcrblRZZFA0?=
 =?utf-8?B?b0ZOWEVRT1MxMHpVKzRHUXBoVFdUNVppN0JSN2lMWEJBUktwcE42ZmxObGJ5?=
 =?utf-8?B?SUh1NjliVG1kQkV3UDVBU1F5bWZZUWs3cHoyTndPd0F5WHRsU0ZFNFUrRzcz?=
 =?utf-8?B?SC92WUVSanUzUHlubk9tOFVKYmNpc2piSG11cVQwNjdxdThCNSt0aFc4OUsr?=
 =?utf-8?B?dVRiK1BJMmhHOUJaYkJWZm9UeUtzK0xDbEp6cWVLYlZGdktqbmNINDB0dmZm?=
 =?utf-8?B?clQzYlpsdENMRkhNdkgwTjBKUDd0NUdkbXF6SEhTNCtiRGlsZUMzWjdBdkQz?=
 =?utf-8?B?V0Y5QXVzOFIrUXVCdUpXUnp4UmwvbWdFRjhhSWlXQ2R0QThJNUlJZGpFOFdh?=
 =?utf-8?B?ajJqa0ZmYkJjc0FkbWRHaTRUc0lCOEo3MFZhTzQxaVVWRmxxZ295MFFOelFL?=
 =?utf-8?B?VVJleWswcG5uaHJoQkNZbm52cnVSLzlaNnNNZFZjVllZeCs1bHZGUXZYTkhC?=
 =?utf-8?B?WEk1TXh3ZGFqNFBUUTRpWXcwQVVHWVVCQUJHODlsaXJ4ZWF5bFlXb3NLenhm?=
 =?utf-8?B?MEErL2hxblFVWTQxRlZuMGVrNnVBTUN5cVhaQmZ6VU9RNnV1VFZRaUFqTE51?=
 =?utf-8?B?MHg3RzlDNXNPbGxFYXArM3YrSjhSSGFUWFFuS0I1YWVKOTZTVUZWZ01Ba3pq?=
 =?utf-8?B?RFpOVDRqVDVVaGIwMXYwUy9YQTBvdTR4Y1NWbFk1cU1QZXcrKzEzaWtrQUta?=
 =?utf-8?B?RExKZ25FSFd6NnZmYXhmWmVNajMwNXBRYkNQdWREL3hJN3ZrVEl6eFVpZlZj?=
 =?utf-8?B?UXFsUlowcWNtcUtuSTBWSWJINDBnMjBkQ2c2YmxBOUFHODF6L0VuZ1pzSzI2?=
 =?utf-8?B?c3JlRWFzTHQ1dDhyMXJCT1JLdGJGZWRBVFVZQUZWN1YrazNlcjBlUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2a2961-ddad-45da-2f0f-08de7b1e7905
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:19:54.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEgDdWAazV4ttW2du47tNogJ6Q3uzItxJ9SgMn19TH51KZjuMN6kM8H3nhoJs9X4k6NrCp3Ha9HEWeJq67kMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
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

On Thu, Mar 05, 2026 at 10:36:59PM +0200, Lionel Landwerlin wrote:
> On 05/03/2026 21:19, Rodrigo Vivi wrote:
> > On Wed, Mar 04, 2026 at 09:55:27AM +0200, Lionel Landwerlin wrote:
> > > Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> > > ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> > > that instead of putting the register on the allowlist for UMD to
> > > program, the KMD is doing the programming at context initialization
> > > based on a queue creation flag.
> > > 
> > > This is a recommended tuning setting for both gen12 and Xe_HP
> > > platforms.
> > > 
> > > If a render queue is created with
> > > DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> > > be programmed at initialization to enable the render color cache to
> > > key with BTP+BTI (binding table pool + binding table entry) instead of
> > > just BTI (binding table entry). This enables the UMD to avoid emitting
> > > render-target-cache-flush + stall-at-pixel-scoreboard every time a
> > > binding table entry pointing to a render target is changed.
> > > 
> > > v2: Use xe_lrc_write_ring()
> > > 
> > > v3: Update xe_query.c to report availability
> > > 
> > > v4: Rename defines to add DISABLE_
> > > 
> > > v5: update commit message
> > > 
> > > Bspec: 73993, 73994, 72161, 31870, 68331
> > > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > could you please share the Mesa gitlab PR using this?
> > 
> > Thanks,
> > Rodrigo.
> 
> 
> Sure,
> 
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39982

Thanks for your patience. I was going to merge it right now, but
it fails to apply.

Could you please rebase it on drm-tip and resend?

Thanks,
Rodrigo.

> 
> 
> > 
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       | 19 ++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
> > >   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
> > >   drivers/gpu/drm/xe/xe_query.c            |  2 ++
> > >   include/uapi/drm/xe_drm.h                |  8 ++++++++
> > >   7 files changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 66ddad767ad44..aa6dd6885fbee 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -180,6 +180,7 @@
> > >   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
> > >   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> > > +#define   DISABLE_STATE_CACHE_PERF_FIX			REG_BIT(13)
> > >   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> > >   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
> > >   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 2d0e73a6a6eee..546f920ba8af8 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -353,6 +353,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > >   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> > >   		flags |= XE_LRC_CREATE_USER_CTX;
> > > +	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
> > > +		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
> > > +
> > >   	err = q->ops->init(q);
> > >   	if (err)
> > >   		return err;
> > > @@ -910,6 +913,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
> > >   	return q->ops->set_multi_queue_priority(q, value);
> > >   }
> > > +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> > > +					       u64 value)
> > > +{
> > > +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX : 0;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> > >   					     struct xe_exec_queue *q,
> > >   					     u64 value);
> > > @@ -922,6 +936,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> > >   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> > >   							exec_queue_set_multi_queue_priority,
> > > +	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
> > > +							exec_queue_set_state_cache_perf_fix,
> > >   };
> > >   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> > > @@ -1006,7 +1022,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
> > >   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> > > -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> > > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
> > >   		return -EINVAL;
> > >   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index a1f3938f4173b..8ce78e0b1d502 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -134,6 +134,8 @@ struct xe_exec_queue {
> > >   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > >   /* for migration (kernel copy, clear, bind) jobs */
> > >   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> > > +/* for programming COMMON_SLICE_CHICKEN3 on first submission */
> > > +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
> > >   	/**
> > >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index fcdbd403fa3c6..73a503d88217e 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -14,6 +14,7 @@
> > >   #include "instructions/xe_gfxpipe_commands.h"
> > >   #include "instructions/xe_gfx_state_commands.h"
> > >   #include "regs/xe_engine_regs.h"
> > > +#include "regs/xe_gt_regs.h"
> > >   #include "regs/xe_lrc_layout.h"
> > >   #include "xe_bb.h"
> > >   #include "xe_bo.h"
> > > @@ -1446,6 +1447,7 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > >   	struct iosys_map map;
> > >   	u32 arb_enable;
> > > +	u32 state_cache_perf_fix[3];
> > >   	int err;
> > >   	/*
> > > @@ -1546,6 +1548,13 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> > >   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> > >   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
> > > +	if (init_flags & XE_LRC_DISABLE_STATE_CACHE_PERF_FIX) {
> > > +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> > > +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> > > +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> > > +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> > > +	}
> > > +
> > >   	map = __xe_lrc_seqno_map(lrc);
> > >   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > index 48f7c26cf1298..e7c975f9e2d97 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
> > >   #define XE_LRC_CREATE_RUNALONE		BIT(0)
> > >   #define XE_LRC_CREATE_PXP		BIT(1)
> > >   #define XE_LRC_CREATE_USER_CTX		BIT(2)
> > > +#define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
> > >   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> > >   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 34db266b723fa..4852fdcb4b959 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
> > >   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > +		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
> > >   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > >   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> > >   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index ef2565048bdf1..df1dc6b9cbc8c 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
> > >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
> > >    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
> > >    *      This is exposed only on Xe2+.
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
> > > + *      if a queue can be creaed with
> > > + *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
> > >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> > >    *    required by this device, typically SZ_4K or SZ_64K
> > >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > > @@ -425,6 +428,7 @@ struct drm_xe_query_config {
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
> > >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1285,6 +1289,9 @@ struct drm_xe_vm_bind {
> > >    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> > >    *    priority within the multi-queue group. Current valid priority values are 0–2
> > >    *    (default is 1), with higher values indicating higher priority.
> > > + *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
> > > + *    enable render color cache keying on BTP+BTI instead of just BTI
> > > + *    (only valid for render queues).
> > >    *
> > >    * The example below shows how to use @drm_xe_exec_queue_create to create
> > >    * a simple exec_queue (no parallel submission) of class
> > > @@ -1329,6 +1336,7 @@ struct drm_xe_exec_queue_create {
> > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
> > >   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> > >   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> > > +#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
> > >   	/** @extensions: Pointer to the first extension struct, if any */
> > >   	__u64 extensions;
> > > -- 
> > > 2.43.0
> > > 
> 
