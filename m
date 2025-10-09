Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34118CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 19:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67C210E23C;
	Thu,  9 Oct 2025 19:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGzPS0As";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC5310E23C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760039509; x=1791575509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x3bUAo7/I88hFEVFsX5zgni6LWFXFq0SyCwEF0Ym/Ag=;
 b=dGzPS0AsCyuIEIk/o/cuXNhdnHDI28YztvdcS7IOh34mp3ETnxblCoLe
 Oq50xP88luOSHbAklSZPpuCNh3OtsNrq5uFNoiHZWkD5pcatmgKX1ax+U
 eiJ24cLczg+CurlZe2DwJFTf6RdYgyrZ/ybmZT3qmSnWmNX+uGF/BW2pN
 ikcQxAIMyTZC4KRUNRNLsS9iOpMx56nmEtZuA7FNW/5LeEQ9HYrp5U6vl
 3T+NUxuyAEBrQpOuU+NiKVw1rRefgkm9jhFpRHhFJAHucHXNrdMnXrDht
 plAmf8lj9n+TrB3fwG8gByz9TxRt2PC5cH+6AtUBHJZmecIXgTpLjf9py A==;
X-CSE-ConnectionGUID: wkbhVMyhRPqOYHBVHLLgFQ==
X-CSE-MsgGUID: KWdkc+vCQaeyncMU7T3kXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66115325"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="66115325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:51:49 -0700
X-CSE-ConnectionGUID: XXcSOz/zTQKbtoXxqQaMlg==
X-CSE-MsgGUID: bobBGwEzSxqDaYWxvg5NNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185180832"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:51:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:51:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:51:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6/F5OrRNyKaMEpLFn7cO2llC9XbxlIQHEOnWn3RrRspllgumwl//NYzk7rgcmHQGMSnlr6UZwavbYWgnbAYSqZtHq9bgrbcLJgG1k6561MaUxbS7hMmOthMz6U5+2VVMqJFHHN6BxJNS1IPHFqeS/W22p8cpoSiOpOvWyektz+3K8o0eAGasUYyR4fhj4vrzKCwpsW1MWKeq2X8WA2GxsFuIKfvjhPS+FmJRo1fZHiMjbAZKs4StQrMeqWWGOKyOxcN3ONwahkmDLh1kAHIX54jE7R7Z6oRvfaPyl0atqj7ZpuL2msmRBEi2zxbyoEu2O3R8meLI8YY34btvxQSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ABZTq2lKWY50DxqvQdTIh1eozBtnKPvXLo9UEJekAs=;
 b=jkBmryAdpZR7vUXsJa8PKZJPUDm9CYczSAs1bxdB2nOGom5ZJHJFTkB8NqYjQSRICksy92do7IjIt8Y7PKk6vOleGsuMPFJfMsEieOyGZuBb8s73tkGzJTyix/pIuh28anONb5t3jRId2KoNI5aho+HQsBVCb5Ddi/90Dj7ZBPtoLtwdhkFCMiEl4LBYERQ7CEVBPByLP5W9y/QTZ6WVNLe2MoNcoFbbiU9lIbtA3QPRAPrcdErxhpQSjLMHKVnaSAVyJWd54fE/DbRHotH/kr2j//1iVFcQoM0vfzJJRIfOQxydSZsZPQq7P7v8GmtFhhviY8yCA7BarY6DOOcR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 19:51:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 19:51:40 +0000
Date: Thu, 9 Oct 2025 15:51:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Message-ID: <aOgSPCmwMEFuRajH@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-8-shuicheng.lin@intel.com>
 <aOfMT1zzARbUH2yb@intel.com>
 <DM4PR11MB5456181EDCAFA6F6A2732B6FEAEEA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456181EDCAFA6F6A2732B6FEAEEA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To SJ2PR11MB8424.namprd11.prod.outlook.com
 (2603:10b6:a03:53e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a003dd-2ff7-4ddf-a4f3-08de076d4390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OjaMcMKQ/ShHP2C4R9AjGdEmfN3TF+eYZZmhLJFAYWJ4ihkkHYXxT60B2KSV?=
 =?us-ascii?Q?5p27ObKA058v9fAfUJeoVbmYJq0JQmthvK6nfd7wiz2H8xqYZhw96aXegzBk?=
 =?us-ascii?Q?IIG94mthwKxxrRZ1rPtN3f3PrXZD6LzEC+Xd9335cHLGo3HJp3EdTiaNg/r+?=
 =?us-ascii?Q?yR3pe0/Zu3rtQja0eOQj8222AhfiY1jhxJQcYIpkEoS9MH1/w0lCAbGeY6wc?=
 =?us-ascii?Q?7wuwN1Wvvk/4z7WYkTNRvKXFEHQ7H4vE05ndg3vS25/ofkiXo95V47C0TVgM?=
 =?us-ascii?Q?IaW6XeHNWYOGv94MS1nslDyBoU9d5/3TguJwYQitpq+AW5ZC1wG0RGHTYKsl?=
 =?us-ascii?Q?sqzkItCWFWGxICnGUipd3UHocQCkNuZQ2VBGI1wdxSs4UDLU4Qbk6J67xCug?=
 =?us-ascii?Q?Mlidc0yCars87hrUaGVzT25wgnTSHBrQ9fxvH5mXPgyd9RmG+ms9PC9FIyVI?=
 =?us-ascii?Q?xG89qfBzg9EvAYfOJy8jaA4xrxh2OemM8XjMQsqxrGmoUr013lEz32nksz7l?=
 =?us-ascii?Q?4C1JxvjRqSWjIr/qSln1DLOZZGogLun3kpYDPhTVG9wufpgY9ERVPQqNlxnh?=
 =?us-ascii?Q?2eUL6ofbth7dRshEv4XW8QABFF4bItd0do8Vuz0ynT5pveMtxa3oW2sLPZTX?=
 =?us-ascii?Q?FxR672HTnjveGAaW8Tp83MuoczFb+MES/gv9BZfj9gRlhe+6JKah4l7QMOzY?=
 =?us-ascii?Q?e4hSOdRMtbZLRFTPdSfdqp2uSjl9Oq4EMV+iRHrAH0YBYH3PUay9vr+J0/mg?=
 =?us-ascii?Q?ffD7JNDMC+hEdw6bchO0DrtoF2kbgGIkDjOSQDO5lalrmD0c/U1XbAGKMh8x?=
 =?us-ascii?Q?zuaCgBEt2eGTM27jQ6ppNHhqvErKT2Lt5Wiif9TtfqrxrtFYeF/IgYNewJ/q?=
 =?us-ascii?Q?eZciCLQOwEteNuwasORDQcyx08+pQ9AhwukWkNv17vygzj1rVZA+y26A01sq?=
 =?us-ascii?Q?KFXVc8ydwwtsTD49uX6g526/Mcvt1+E3VSEwq+3COdyqIL4cdZ0jOcJJzo1/?=
 =?us-ascii?Q?YZEt87hmjSxJzyVb7DJrGytiETisv57eibyd5QY/CV3FogKUvhWDuTmHxZCy?=
 =?us-ascii?Q?Nnl5liEuPMj0j0wLL46c3VU2ZA+pd9YdyWqxAGSVzArV/pT0CzsAd+QYPKLa?=
 =?us-ascii?Q?A444qpq1ihMx4PoDOl3CAGzLf6G9GnkJGb2DRwEtzUsif5rU4vIsLspii1EZ?=
 =?us-ascii?Q?/ghRsAzl5I1Lkt5HByG6KTnoqOOAuCx8QwNjca6nozyETClFO0pVG+T+Njby?=
 =?us-ascii?Q?cvrNN51apJb8FpUHr1EqKlzHddcLy2H1s6/1kGyq4+NGIpZ14iCpa8Xk094g?=
 =?us-ascii?Q?YFBlWOE1r37M6YkTSiEDsIYtGYKoiZfLKn69rYkKXZLIIyx1ibLULnJdBSho?=
 =?us-ascii?Q?IE9l/mLcMvdmxrOMvB+/IK1yKZ5R8wnhzdVK1z9wVrX5rPgl2x4LyPgTpf9O?=
 =?us-ascii?Q?Xa2bkRlAyusqJUDpvT4Ear0ZXlNVLIAp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NHm5DVNs380esR1shXpxVqkKGVEtS7/fHZ32cDqF0HMBzKOaRBLz7GVCGm0r?=
 =?us-ascii?Q?OJn0yANeIw/3ENd612We5Xdw6HjLAehA19b/jFzz0DXwiwYEVmEuPj56AZyC?=
 =?us-ascii?Q?NghF5E2m3dFo0GuYn+cOZiE+1DV2y1xXDH077uaNOT6uHKQ0Wo9hUXpWMUW2?=
 =?us-ascii?Q?kg6HwZWM1KWA6nffhhk0qwviFYGVbOE97l18TnsRUkkouHoVh/8UN1ScYcK4?=
 =?us-ascii?Q?YcJWCpf+NqJLsAAs69jTNyt/OXJxYmHLgatHxvkxGaRfjcQHmbD7dK8fbHaj?=
 =?us-ascii?Q?WVtYxjz86yB6gifN3lQ/T3/erxnDLux+rTZsGV82d9otalERMPIfXYUbq4Vh?=
 =?us-ascii?Q?fzorQ/InQ/JIXEIBkrlQthEmluP6MqWVJjJAP23MR3ikEqN2nZ39YWfw3XHg?=
 =?us-ascii?Q?KnGayDgsdkdSzr4oRjcPdrHBwE9lCXP42XDrrVTsrwOqPzXep7w+vJIIkI/2?=
 =?us-ascii?Q?4eQYbU9ocMeo61kQNK6eYlqZLQakCEpe76rCnxxbPbJYD4+Ey4En1qqT1ntq?=
 =?us-ascii?Q?/4kiPig9PsiIPRdLg+k/dzS0By7sojhWsnVUiNUg1GIqtUSXe3t7OrV5sTuh?=
 =?us-ascii?Q?y1na6b6pToyPm0WkBe+uUDkyh2C5afzs2kz/I4zCjCM+bNINh3NkfFQuXvOc?=
 =?us-ascii?Q?pFrs10KkNqGGDWAZTmxjGyfS6J7CDP/j9imSbPspU28UiDdMzHegTBQ64xJ6?=
 =?us-ascii?Q?YO/hEF4bVgb8psfMgI76MwFp1O0VAsBBTMkubxPPOErqzdyqzjB6LZsF6DbG?=
 =?us-ascii?Q?gy9I02d5VZRYNR6SYyo2TeHRtjoEBu08eSZNYNTDzEvflMuZH/fKjIGwTA7x?=
 =?us-ascii?Q?lXLc9FRFOqlRpViHmnOnqCG9VsSskGFhMB61rwkBneMmiZyX0sjO/p2QkzYU?=
 =?us-ascii?Q?rrOLLZL0hJg14Ccgx+sXP24oFWxFCKaK8ndhjzmyjd6ed/Q2jCg96G4y8ukA?=
 =?us-ascii?Q?AWp0uEMhG/26SRzJd4Mo/xNa/FfvGFZXbA9qC22Vw0Akn55MZJDJDiMIgQLo?=
 =?us-ascii?Q?/jAsfScOoVHJmw8/szWuHvDw7GNKlzGC8pSpUCYL9801wHUSyf0H6NOra0fG?=
 =?us-ascii?Q?V6Va0L8FO3BVggXs27Cy20sOv/3rWhNLbDEIO1DpYxcimXP+NbUm80Q4MF10?=
 =?us-ascii?Q?q5SaNnaKYmdBXVuoJD3mWMitGUGilstqdZ1RzaOLxEiY5We/qjc/Jgqg+JDB?=
 =?us-ascii?Q?QT7975T6ZchvVgVG49fyxIZ9evRDEuY4opCCESq8QBLXADbD74Em/BDVyzFj?=
 =?us-ascii?Q?wRq8Ja9B/qKFb1oC3AJo4RQh/Xj/1VkZjXCzvj/6vnqj0J6dazf2unEYMvTE?=
 =?us-ascii?Q?T6TFAwlAYMRYE1ueltltiiLIgDkBsnnol0C4NVd3Nku0Ze3LLfMJHbG3iN0q?=
 =?us-ascii?Q?VIxYKKNUwTxcoGVwBHMe8TF+wI6VSa72IvyFJqRmrPZ0uxxkMbuHfW8U+29M?=
 =?us-ascii?Q?PlSgyYo2SU7Badxs3y5nJJ8y6BULcikhXIFMtafCkJRKkUWkGm8DtmsOngKW?=
 =?us-ascii?Q?c+3BE7QtI41r053UkYcEgVzze89Ilhx7Xb1gdfmw4h9I+A3B7WgOX74OvZUn?=
 =?us-ascii?Q?N2DXgVN5w9kfZFoDPruEha4/t5fEvvNMNkOPHUvgH5+qUY9C23YTyL7TBfXV?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a003dd-2ff7-4ddf-a4f3-08de076d4390
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:51:40.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acwmbBR9dgebaA25KTBd9CoiaP9vwM5JY8GiDfOz3MA/tsYVsaJq60u6gBlbIZ3b6ovEH0pRp07mtSarwsr/Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Thu, Oct 09, 2025 at 02:06:40PM -0400, Lin, Shuicheng wrote:
> On Thu, Oct 9, 2025 7:53 AM Rodrigo Vivi wrote:
> > On Mon, Oct 06, 2025 at 08:13:27PM +0000, Shuicheng Lin wrote:
> > > The function never returns a negative value, and the return value is
> > > assigned to a u64 variable. Use u64 for better type correctness and
> > > clarity.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > index 9b00bdc8ef1a..d8ded2400706 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > > @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> > >  	return wopcm_size;
> > >  }
> > >
> > > -static s64 detect_bar2_dgfx(struct xe_device *xe, struct
> > > xe_ttm_stolen_mgr *mgr)
> > > +static u64 detect_bar2_dgfx(struct xe_device *xe, struct
> > > +xe_ttm_stolen_mgr *mgr)
> > 
> > hmmm.... because stolen size is u64, this is right.
> > 
> > But looking to this function below, I'm wondering...
> > 
> > Although theoritical case, perhaps we should convert stolen_size to s64 and
> > then fail if stolen_size -= wopcm_size took it to the negative side?
> > 
> > Lucas, Thomas, thoughts?
> 
> How about add an assertion like below?
> +       xe_assert(xe, stolen_size > wopcm_size);

I like this assert

>         stolen_size -= wopcm_size;
> 
> Or add drm_WARN_ON that already used in this function.
> +       if (drm_WARN_ON(&xe->drm, stolen_size < stolen_size))
> +               return 0;
> 
> xe_assert() is controlled by CONFIG_DRM_XE_DEBUG. 
> 
> Shuicheng
> 
> > 
> > >  {
> > >  	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)-
> > >mem.vram;
> > >  	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> > > --
> > > 2.49.0
> > >
