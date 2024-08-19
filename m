Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F50C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 08:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3A310E1E3;
	Mon, 19 Aug 2024 08:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlejU+oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B58810E1E3
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724054574; x=1755590574;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HAWIwpHExBtOhTh11FSUvAqRMmOUMrGJrq2ZdpNmjUM=;
 b=HlejU+oi6OpvJU0f4DlxcDkMN9rQKfEUtTpcXbspuaYOvIF4TmEgtNJ1
 o+vWFDDaEC0pJM140DolGug9kvjO0q+1f5jPh4g1ffkVPql5kVKpreZEa
 8F43G5HYnzdgfpZfo2TvE3hocqMjjee8LLvsimdCjNQcEYcrkLHGacYcf
 RWr5n60FJ18W/W28LsODd48UxW0AmKHQgiytnvcYC8EOAqmPmrmKzRdsj
 rpDCBG+NpPVfYT9UhfOmqAcQiipmnpiilCtqAxoD+Jy3/xvlzA/OIwGz0
 Hfbki8pzmrr3ErqR+OuBsvokpaVeIHF74YB50/xNLQuOaWRgtAKjG/AeU w==;
X-CSE-ConnectionGUID: 7JQE6wDiSYieznoohhxVUQ==
X-CSE-MsgGUID: zu0P939dQcynVmiToUPwaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32860509"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="32860509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:02:54 -0700
X-CSE-ConnectionGUID: QpaPQVpATwOzeGDLLsqj5Q==
X-CSE-MsgGUID: ivPzyO7TRF+psHdV11ZSuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="91066306"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 01:02:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 01:02:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 01:02:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 01:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7mBXePQpq91Q0GQcCp/ooBVZSZd4n7WBU0je+R+fOMUUz45/6fPM1ZXgilG1TvE5e1Vys0G0XAl34//Gh2UrXvrPEryLge5aGURAFZzsE165v0bRLrfzOcMfiXJFJtpx3BBAdFresydwJ2wm017skc50SQABu4bg+mnoDPvf7323lQUwbf8fMG0wp+1xcZOXA2UxQMHBmeXP63SjmzzUXlE8MwtjRgHhhW6I8Uq/dxeOBZnDxUpRmobH7xt5q804esgXaKJTYk6dyPgeeITkVbsj+q6B6RpQcCt4/NxprH4yctwbyufUg6oM1s+H4mPK39+CEVu81xkW4gf4+c3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxcHjCSO7QOLn1/iOpiy3M55uC/0bGC4tVwD84ppFTU=;
 b=KlmTYRpxt+SrW0qIVhqrEKPoh+FfBleQSwIocJ1aF2g2fSD5+W45yBHr0lgVsyWbx6ulAqDI8ln6zNbs8UI4f0ZNCXn+VTI/tqR7hAN6DJDAnXcOlE+H7F7vrM2VW/tpxky84Um23DEK1QlvobTK5XF0YekRNb90isO774TT0uw81E2lWAgLu9MDMke+VEtMs/smSakpyHyxVejsVZThA/iXKVaVLsfgvmlARsUK1OVu9KGN5JvRqUb+pjlj/2Dsb2y170fdwYXwJeyS3/MbqwcCrwLkrue1aYLV9l1aOom1wnOIcPUsup7vcFxa0pmVd9PYVsbNEg6gV3l7ayQtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:02:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:02:51 +0000
Message-ID: <054ef733-3678-4696-952a-6dec02d91dba@intel.com>
Date: Mon, 19 Aug 2024 13:32:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Invalidate media_gt TLBs in PT code
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240818005055.357593-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240818005055.357593-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fc34e5-ec09-4afe-8c78-08dcc0255259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkR0Y00vZS9NSHJYQlRESjBLUVdmeEdHUXljSlJQUDdKN0xLYUNSY2czRzFE?=
 =?utf-8?B?dGducUo0SE9WQzBKbG05UngvTHAxditSa2Rxa3NiNmtHaGdQcWFtejRhWjli?=
 =?utf-8?B?dFp0VUdVOU1IT0w2QVFzc2VQVlNNeXlLZ1R6TjBlWnMvVTFNY045WjdWVzRZ?=
 =?utf-8?B?eW9XZWpRVGJiKzQxVVc3SGVYdWtzOWlScmcwZ2sybWJqY0M3NW1BZ29QNElj?=
 =?utf-8?B?UTZWVmhHcUdQR284ekJBYjFLeWpWVzVPcVFVV2l4QWt2aWk4WW8vMndSZjgx?=
 =?utf-8?B?dkc4QjFZV3hFUk5aR1d6YVI3c3JwSG9jdTg0Wk4rY3ZYUHJNUE94WVR4dnUw?=
 =?utf-8?B?Mzhwei9RTEJiSWF1WERRTTZZUmZvTXN1WHMvdUtoZm9DeWlBbkl1RW1OSGdj?=
 =?utf-8?B?WU9TQ0Zua21HZjBjb29FbUtzdGhWMjEwZVNERFZMYi9LOENoNmkrZFJEMm9B?=
 =?utf-8?B?eldLVENtZ0gwRTBOcTRDWm96dXZFT1ZFWFB1ckdRZ0VrbTQwUE1DWEY0cUc3?=
 =?utf-8?B?N1ZFVkNZeTY5N3RQSFY2dHluVFVCRWVxM3VRSlV6dXFpaFNWRCtRTnBxUDJr?=
 =?utf-8?B?UHZxUjRTaFpRcUovSUgzbHg2Mldvck4xVWxBdVhtZi9LamJrcWlSaDd1M2pv?=
 =?utf-8?B?eWdMNDBqSWVjRkxzZWJzbSsvMGEyemdDVitPNTNCdFpZV1BkcGplaERrTnQ2?=
 =?utf-8?B?ekdaMjc1VXpEaEU0TjVlNVpRc3MvdWloL0l1SkJCam5MUFdQNUk4WENwQWY2?=
 =?utf-8?B?S05aelgvT0lvYzljRmxMTlZPUHNzNUo1MnBTNjRCQTEybmF5MysrNlBPa2dQ?=
 =?utf-8?B?aUFrTGV4M28vYVVrQXU5WUdselVkLysvSmpkZzRTbFVubEw2WVc5eGVyamxj?=
 =?utf-8?B?NlpQc1E5a2tlS0Y2VjgxbUxRb3pTK0VqeUR0TURhQXJIeXA3Tm9QdndRME91?=
 =?utf-8?B?TStFYnN4RjJCV0FKOEprSzFiVDNHRVZiUHU1c1dCOGFnaDNwNHdra2RCUndF?=
 =?utf-8?B?eFplSFcyc1ZIc0poNW11eFdiMFg3aFVFZHlvSzMrVEhubGFYZjliV1pIeTV2?=
 =?utf-8?B?cHRiOGVsc29xdjRweEJsb2JLMTZWNkR4RWlxYjQ5elkzNkpTbXlvQXJ6bUZY?=
 =?utf-8?B?b2lYMmRFUlZIdExvY1RRV1VZbGVGc0gwakpZaGZpUkRZRXVxeUFEYlp6RTRV?=
 =?utf-8?B?azlDdWtLQnBybzZuOEY2RXBxcFlsZmVoYnIxUHcyemMwWnkvVXY5N1hFeXpX?=
 =?utf-8?B?cVZYMUV0VTdLMksrdkxJOHo0eGZyZ1c4K05HWHlmb3FoK3lJRksvMmhkN3NF?=
 =?utf-8?B?ajRRclY0NjdaY0x1blZHRFFacVhvRGhxQnVpUThWTDZSU0x1UFp1UHVVcE5T?=
 =?utf-8?B?TWdScW9qQkpubHRJYkpMeFBKUEYxeHNob2JyYzhCb3pKejBLMjNUTDh4ejJC?=
 =?utf-8?B?cDNoMzZLMUJSbXhwVmFDTi9yL0pQb1Fad21KdGtYK1FubWU4ZjdadVBmc0NK?=
 =?utf-8?B?ZklQcUZzd01tQ29CUFk5MDJ6MWZDa3YyL0FoT2Rkb09FVXJsT0Z1QnozdWhs?=
 =?utf-8?B?eldxZW9IWDIya0xkRHpzWmRDZWoxak9rOFNzQ3VwWXNaN1ZIcDFRS3JEM1V6?=
 =?utf-8?B?WFY2TTgrWWt0OEtvaXdFUjZRWWhtbi81bEFwTk9KS2Y1T0kyWTgxeWF4eUl4?=
 =?utf-8?B?RmFYejE4aW9VS0s2cVUxdnpyTTIraFQ2ZFBqZEN0RkcvN3U0WHUrU2JxdGhB?=
 =?utf-8?B?eFJpNG5ISWszNjR0VG9mTGhicHM0bUJEdlJRcU9jalozT2lGRDdCbFRtcEMr?=
 =?utf-8?B?d1Vvcmx3N2ZGcFlGY29lZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDd1d1JRQWcyZUtTK1hBNGdteStFVVFnRmpkaXJyZ1o0eWdJRFVNNlorNWdR?=
 =?utf-8?B?QTkxZmVCVkVzRUkvSzJoMDluR1Fqc3NFM2xWenpSZklGYjMzWXJnVFZDeExY?=
 =?utf-8?B?YmpjQWNVQlNTWG8rd2FoK3NDWSt5ZmJCZms5T2FBL0k0WWpzQ3dlWUhFcVhE?=
 =?utf-8?B?R1lkbVc1TUVpdHFHanQ3Q0xrSFBISmNnYVY1WVhubjJWQWdvbzREdlBGbWhj?=
 =?utf-8?B?WXM5VzFUTXI4OXRFa3pQWUlkOWpYc0pSU2xmbkEvKy9XUG9EQzZWNFhLaytF?=
 =?utf-8?B?K1dWU0V3YkRKb1hNTGRkdm1tUElvUXlXNmZxeW9lWjN0V1k1aU9kbFEyUTYw?=
 =?utf-8?B?SjBLZ01wQUs2V1NNU1p4SnlVWm1YS25lSHk1dzlWVDN6c1VyQTBsdjI5UGcr?=
 =?utf-8?B?WnZSVDhwUUt5d1BUTVhiajdCM3RXQW9JczdMdmE5bTZPRmIxakhQZWltUGo1?=
 =?utf-8?B?U2hMVFBGVmVuaVgyUkhISGpCUmZLZHdqaGlkaXhrc1pWNVI1aTdyQk50dHFU?=
 =?utf-8?B?R3pSZ1NENjEvZ0doN2JLblNWcjkwdzEycVFkMFNBV1JsVjRkQ3Y1TFg4bnJU?=
 =?utf-8?B?eVVDL3N4L21ncGVwVjlTRi9GQkMxb0RkeGdDekhpSWlrMldKem1zZnNPRXRp?=
 =?utf-8?B?cEY1ajZBWnA4eVg3c0YwK1lnMXpRTjBjMmpORU4rT2FPM04waHhCZWFielNM?=
 =?utf-8?B?ZnhxVkY3OXA3NjVGMmI5bTNGcFUxemhKdWRrWGRtUTdlL1pVeWtpVkN0UUs0?=
 =?utf-8?B?YWpIRk1Rd3RtZXRzQUNISEM1V2VhcGh5TGtJZE8vUlRQUkJvV0taTmZMVmk3?=
 =?utf-8?B?Q0hWUGh1VUFRQmRSYU9wZjgxUEI1d01Wc0VKcy9yNndQcEo0OWpUVStJVXUy?=
 =?utf-8?B?UXB4WG5abnVDcGdyWUljWnF3d3BoZGNMTFdIZ0p6WWxYeWozT1M5NHlhR0pz?=
 =?utf-8?B?eDBMT1dYWWQ4dEYybEluTlV2ZnQxc0YwWVlMRzR1N3Z3RDNBU2NxY05vcTVl?=
 =?utf-8?B?ZFRZUk91NDM4US9rSDVNeXZzbFk1bFJxNEhoS0UvK2VQNnR0R3JtR1ZDMHA0?=
 =?utf-8?B?a2ZMd01TWUlHKzR0RVVCcDM0bmtIMDJ4cVk3OW9aWGVLYkRkSGtZK2RadVBI?=
 =?utf-8?B?V1FVQy82NW1KN1FHc1RuMjJIWk9oelU4K3dLdGtzQjFTaE14cUFNSDQyWEJs?=
 =?utf-8?B?N0lHTjB5cU9SVWJBT2ZUMTV0eVpTWkZRa1RRYkZ2L0E1WGFSUFd6NUlGL21I?=
 =?utf-8?B?Z2hrUGZDaG9ISHJRN2ZYRWRrVWhoUThVQXdwRjYvVGUvVENnNXlPcERkd1Fy?=
 =?utf-8?B?TVRVdm9McFdHSkhrYStXRzBIZUJ5eFdPNHRnZURyRHFjZmc2QXk0Vmh0Znln?=
 =?utf-8?B?UG9QWS9sRSt0d2c3MGZHQ1ZJOHkyeEpURTJudzY1Z0RMc1lHRUs0SVQrUjNr?=
 =?utf-8?B?Q2t0UkhPaEdmZ3ZxMStDYTNNQVJsU0g4cWs1eXVBZGNCVUFGMnRPV0JqS2p4?=
 =?utf-8?B?MHpRVE5MSlIwQzFja2RIMDcybWROeFlNVjEwd3lWLzhzRHFmbEgvR3V6dU1V?=
 =?utf-8?B?T0s1cnFETm1uelNCYm9jemIxWUdncVlWRXBVbFlOajVqWkxjK0w0VHZCRGVO?=
 =?utf-8?B?QndWeU5BeFVsQjhucjJnSXBrdGNmUS9SMmVYd1lEdkl0VUxvdGV6OWY3WTdj?=
 =?utf-8?B?N2JTMnZoaHFGbTkyWjBYZG1mVkJOYjNKOVZoYkFmSDdwbEFWdjlRdlFhTmFp?=
 =?utf-8?B?SzFLTWV6N09VaHFKb2dmbE5SOUZCdDNTcC95UTJ2bzd5b2dKWFA3Nmc2ekgz?=
 =?utf-8?B?NE9kSWxBam55alJPaVJhNG8vVVFrL3JmODZQVURvOXYxbjN6eFZ5bVFUMmZD?=
 =?utf-8?B?a3BZdnpyMUNYWUkrcHRtR09NQUlnek15QTFsNFZOS1NZV242cFhZemZFN3VV?=
 =?utf-8?B?OTZ5c25LNE9VZ1l3RjRvR3pCOUxDSHh6ZW9Namwrandia2RwVjRzTnJIby9I?=
 =?utf-8?B?cTcyYWhsdm1wNS93MElEMitaNGxGYjIyYlVYdTFHZVBYc1lBUHRDa0pLV2cx?=
 =?utf-8?B?QzAwdHp0STdiY3FZL252bkt6WVRCRGRaNmM5L1FTNnlLNEZEK2xLQmptWVpz?=
 =?utf-8?B?VS9RUWdFclM2bWQ0MExOcTBtUk5UY3l3V0lkTjhreHVCWUFyblAzcEpXb1U3?=
 =?utf-8?Q?rclWUYN6s00aRPQrXvpgIhA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fc34e5-ec09-4afe-8c78-08dcc0255259
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:02:51.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeoKCp0s6TwO8v+L/UISO4+6oIQIavjnkMlqMWw74DXS1Ddh11QpQ633fOj9/EcFlQwNwYlh3HGL/5fbKi39Tfzis193L+F/hnSzzL+Pa9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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



On 18-08-2024 06:20, Matthew Brost wrote:
> Testing on LNL has shown media GT's TLBs need to be invalidated via the
> GuC, update PT code appropriately.
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++++++++++++++++++++++++--------
>   1 file changed, 80 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 579ed31b46db..9d16e5772464 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <linux/dma-fence-chain.h>
> +
>   #include "xe_pt.h"
>   
>   #include "regs/xe_gtt_defs.h"
> @@ -1849,13 +1851,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma, struct dma_fence *fence)
> +			   struct xe_vma *vma, struct dma_fence *fence,
> +			   struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present |= BIT(tile->id);
>   	vma->tile_staged &= ~BIT(tile->id);
>   	if (xe_vma_is_userptr(vma)) {
> @@ -1875,13 +1884,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   
>   static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			     struct xe_vma *vma, struct dma_fence *fence)
> +			     struct xe_vma *vma, struct dma_fence *fence,
> +			     struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present &= ~BIT(tile->id);
>   	if (!vma->tile_present) {
>   		list_del_init(&vma->combined_links.rebind);
> @@ -1898,7 +1914,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   static void op_commit(struct xe_vm *vm,
>   		      struct xe_tile *tile,
>   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> -		      struct xe_vma_op *op, struct dma_fence *fence)
> +		      struct xe_vma_op *op, struct dma_fence *fence,
> +		      struct dma_fence *fence2)
>   {
>   	xe_vm_assert_held(vm);
>   
> @@ -1907,26 +1924,28 @@ static void op_commit(struct xe_vm *vm,
>   		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
>   			break;
>   
> -		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> +			       fence2);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> +				 gpuva_to_vma(op->base.remap.unmap->va), fence,
> +				 fence2);
>   
>   		if (op->remap.prev)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence);
> +				       fence, fence2);
>   		if (op->remap.next)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence);
> +				       fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_UNMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va), fence);
> +				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_PREFETCH:
>   		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence);
> +			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
>   		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -1963,7 +1982,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
>   	struct dma_fence *fence;
> -	struct invalidation_fence *ifence = NULL;
> +	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> +	struct dma_fence_chain *chain_fence = NULL;
>   	struct xe_range_fence *rfence;
>   	struct xe_vma_op *op;
>   	int err = 0, i;
> @@ -1996,6 +2016,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   			err = -ENOMEM;
>   			goto kill_vm_tile1;
>   		}
> +		if (tile->media_gt) {
> +			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +			if (!mfence) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +			chain_fence = dma_fence_chain_alloc();
> +			if (!chain_fence) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +		}
>   	}
>   
>   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> @@ -2030,16 +2062,42 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   		invalidation_fence_init(tile->primary_gt, ifence, fence,
>   					pt_update_ops->start,
>   					pt_update_ops->last, vm->usm.asid);
> -		fence = &ifence->base.base;
> +		if (mfence) {
> +			dma_fence_get(fence);


It seems that dma_fence_get should be called within the if (mfence) 
before initializing ifenc. If the fence has already been signaled, the 
fence for ifence would have been released by this point in the code.

(ret == -ENOENT) inside invalidation_fence_init.


> +			invalidation_fence_init(tile->media_gt, mfence, fence,
> +						pt_update_ops->start,
> +						pt_update_ops->last, vm->usm.asid);
> +			dma_fence_chain_init(chain_fence, &ifence->base.base,
> +					     &mfence->base.base, 0);
> +			fence = &chain_fence->base;
> +		} else {
> +			fence = &ifence->base.base;
> +		}
>   	}
>   
> -	dma_resv_add_fence(xe_vm_resv(vm), fence,
> -			   pt_update_ops->wait_vm_bookkeep ?
> -			   DMA_RESV_USAGE_KERNEL :
> -			   DMA_RESV_USAGE_BOOKKEEP);
> +	if (!mfence) {
> +		dma_resv_add_fence(xe_vm_resv(vm), fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
> +	} else {
> +		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
>   
> -	list_for_each_entry(op, &vops->list, link)
> -		op_commit(vops->vm, tile, pt_update_ops, op, fence);
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op,
> +				  &ifence->base.base, &mfence->base.base);
> +	}
>   
>   	if (pt_update_ops->needs_userptr_lock)
>   		up_read(&vm->userptr.notifier_lock);
> @@ -2049,6 +2107,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   free_rfence:
>   	kfree(rfence);
>   free_ifence:
> +	if (chain_fence)

This check seems redundant, dma_fence_chain_free handles NULL input.


> +		dma_fence_chain_free(chain_fence);
> +	kfree(mfence);
>   	kfree(ifence);
>   kill_vm_tile1:
>   	if (err != -EAGAIN && tile->id)
