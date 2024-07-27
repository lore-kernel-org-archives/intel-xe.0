Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB962C3DA61
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 05:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C2510E0B6;
	Sat, 27 Jul 2024 05:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX8ZBcAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A7610E0B6
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722058842; x=1753594842;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TXzYeWuJzrKIm9ft4M3mk8+E4QTMLpW9NPYEw8uX81A=;
 b=NX8ZBcAuey4kzv+bHidwNi8SHM+bzmxmakPcReC4lcOnbYFlz4Lgh4jl
 QX7I2ugqb/o7f7VqaRUdVwk+7hGF0PzSNQX6ETZ1mNNa8t3oKP0XaowCM
 dM+ATnoOXIRk/iWI41RYfckn5Riin3rg6zb764RN8+RkDB9E8bICn9vHm
 rw5uGveQW1A3/EAwqMknvlY1HpXErHFIF0B1l5Wp/w1TMGJRLmW6iSElW
 ybmoMNBHEhFItCSUr1yK2Yv1s2ZdRgdQudQ/2cM85VKRQNsprxm3MUlv+
 t2HYNDo9V40lA6rYPY/jUIqE5Il1UZOzA9qygL1yeVMpWU+OoqXE0Eleu A==;
X-CSE-ConnectionGUID: zJ+ApJsvT6GtZzQKqWF5NA==
X-CSE-MsgGUID: XjCAoqHNRZWSlvPqunB0qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31266456"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="31266456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 22:40:42 -0700
X-CSE-ConnectionGUID: hjTnTU9IT/yRMnjKbLGHow==
X-CSE-MsgGUID: /3ZhN5K6QfWW7zfGitthCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="76688251"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 22:40:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:40:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:40:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 22:40:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 22:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV+XihL0hGVzfPa6qwjoJEFuF8ebyV9xN3q10GKws0bvg+V47AUlQjsg4vgtd5zmW9RPeQQBHs2+nY4vl4JxBfXNvz2pJSb75UQ7GihKKKphw3J+EeWNYxm66V+gKFaIoW5f/TgNbPC9B+SaH7BWL/VLSm/aiNxwVgkMNbMlM4ApT+zc069o7aE93R+80zW0TbxRiJ3UTsvNY7RbZb7Q44IWNpHyWRxWX9q7i3Fs6iVGh9061ua7HXYXSDIbF1qkmV8Cscbkx9gUVJpzrhoMisVpZII8ri3FBrLbnY+0zRWTuzUINmGSQvDZg2eRHTqgDyNRUhjgyW5WWvdVI40puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9CKBwxo9aI+5Zj21axLJ1isGbDWeA90Z0+POfPLhXA=;
 b=prBwaLPtcrubfrZCqqnoYadxmVuE1R6et4o3s2C7lVfSUrReD0gog/4FJoYeuweRLkFSCs5yic/r7SAsX/Ieg+x83tJYchb99UYWrTfImmxWshYTcbIM2cV/qxpUtcyKZmAuKmnWdxJ/snxo51Ovqx0bxZEVYvSd9y2BCGgwVgwM6mxCeXEwRq3Yy1/WlVybBgYeAkqBUfuVBpiic9eDkwoOC2UxX0cP9GtX7trn+n9O1qY6sxyjWMOidRHaPJOXnjXwUALpGIsTrHIxj6mzerSa0Qv6gSS1Y2Uap5nvbMUdbCLIM1lR7X9Ksk8YUhiC+nagWtYOzXrb1Afck0u5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Sat, 27 Jul
 2024 05:40:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 05:40:36 +0000
Date: Sat, 27 Jul 2024 05:39:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 10/21] drm/xe/eudebug: Introduce per device attention
 scan worker
Message-ID: <ZqSIF4RDsEmLSpks@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-11-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726140818.54304-11-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 2097b174-984e-4916-7e30-08dcadfea3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HNahORgZxVdWT+5spr/pe/QTor+YWDEB3dBrxLWchv0RYPGrhezqAAzEyL?=
 =?iso-8859-1?Q?CWYbDvb7eQOWgySvjHxGxF9T0jDtv5ZWKlwobx7Z5ibzOsm7ZClbHGU0TU?=
 =?iso-8859-1?Q?qrPa1jTkmEiq2W/pBdSuzuUy/wFv5vc2Z/AhfjuQzRFhYPWzaVeSpF2Ut0?=
 =?iso-8859-1?Q?3WJ6N7APPCnOwVO8+l1PtCv/6ZPYAD/6vnZiPgfP4Rs+hIzodX/bR7Z1tx?=
 =?iso-8859-1?Q?dWR3KE3S8JXXvrZPrmpR3L08cGhgPN7Y1f7r8bC/w9SJMAGvzZ5y/3khUc?=
 =?iso-8859-1?Q?0QUCiT/cv5bXcz8jre5CnwvRvuTAJ6E8+ailmau1YeNyCCvilT8kiDQSwx?=
 =?iso-8859-1?Q?FRZlLUkDk3IXETKH9qeiBzLPVMIbxW5qe+TsUTBNvIe0oy6QgfzWm3v9VE?=
 =?iso-8859-1?Q?Mj/Ynve0JmJQoc+vFveLZPm8T0UjCa9cBVoxNmMkoUr5homn6C+4UmtjOQ?=
 =?iso-8859-1?Q?ecoEQuajADdWH5gpkVYVsqvn+wlYLk8yXNysCaxxR0csatsLulkXmHeOzy?=
 =?iso-8859-1?Q?Blk6dF3zmCzBk6EGmnww8fQBS8UAJg2TUyIA3RXp7ae+dDIeHjpYnxnYz3?=
 =?iso-8859-1?Q?qv5IXZNKxB2Qdl2VCYapwpjLuhH2sjFvrfzyujOdP5jmwBQNirIibU7FW2?=
 =?iso-8859-1?Q?0ckz0aFzfrniy8S3eChEDiL4h2bRJ2S2/0SkbQfAwIHrNMn5s8O6qLb/RL?=
 =?iso-8859-1?Q?452P4GlON48e0y4T2Nwj6D5JRUU+dNVGQBzDi5RiH4LExgSSDKUZimbMOg?=
 =?iso-8859-1?Q?47UNVQbppav3zh35Zu52sPEZ6rHVRcXcZGlGeln212qpNZpKdWL5PQJ/WD?=
 =?iso-8859-1?Q?9QbfcHxI13g8q12BkmsoIraBMBO4e9izWr8HWEPZlELtQ7hVAYZ6mTmpyE?=
 =?iso-8859-1?Q?AFfJEhCCA8TudlSY/iks8hbh1O3oOP0edZeOdYt0aHUx1m7MWHLPcv6KjH?=
 =?iso-8859-1?Q?bRPmV5lNLUsOi7kdCH5CiXxrvlvY1ZE6kHqWd7/XcwefNuHsdDdMp34zGq?=
 =?iso-8859-1?Q?vZ6sB62DLFRINdUKBMM+uXNXSkqriTjW6XztUQoi67faaN0IcomPn/93gZ?=
 =?iso-8859-1?Q?h/Vq9oiTDn04oTMR1oWYARIzuHuTyZ5Q/vAe6JbIkZBDkYLCvw9V6SCgWJ?=
 =?iso-8859-1?Q?wuCIIOQpXho3vjRZNPjcdwRxXzdJCZhuS2oNgbg4tmszSoIyne2MBtWl2W?=
 =?iso-8859-1?Q?Jc3ZvyI0ARPBQ2wu91NjMfvV0t/cffrZILPu1L+vlZOvW0BoRpG4eXZ8i4?=
 =?iso-8859-1?Q?MvGAwjxWLZFy5+1StOgfT/pIEB5QA03THddoaDCajIBV5zWUMzfNme4Mef?=
 =?iso-8859-1?Q?ZDjsTPp8yvfBWCtxFG76lw/Ds5PahvWfmQy4KH7rEWiLJGr0LBxT58G5yz?=
 =?iso-8859-1?Q?d7E2hzsmY5ymMNqQ1WgReUsyCJce4/kQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s21BF6bpEvklAHL6+ZLcg2e0eCqAFP/dz/tDDC2v2c3Ik4a1OM/gobsBN5?=
 =?iso-8859-1?Q?Mzlnzw4ORe6S87tCHbevIt4EA+bd4uK6JQthko3+OHifZLveqZS8wglN0K?=
 =?iso-8859-1?Q?d5m319DEmBKBKzReUjO8yEnr47T5IroEnD8GiZ+ZCciUbl6+VGh2fR3hTZ?=
 =?iso-8859-1?Q?3TUjKmk9SSg840H7Q8OMRJ3u81IG8lLOfAivlZDJRpErc35Vm495Tt2z9g?=
 =?iso-8859-1?Q?kZ9bPkqeB2Mqml7YW5ulPivljTGFHH2oanaf40BBHKD/7pgKNucNBWNVs8?=
 =?iso-8859-1?Q?QVCRXaxNd+lyveUxMZAnhNxJ+B7ItOTozvTFJBTOZrtEO6qESszNqX1QSj?=
 =?iso-8859-1?Q?5M8TsrMsLcanNzY0j7+0vLrBVkMahZTM0dOeeCFaVaf6juwdu40a5nRVJZ?=
 =?iso-8859-1?Q?qUZNfjdJrcxczy934/8aUtqKJq0CqRkkw3Pc0PBSoRZK9EmDWuU74LpoZy?=
 =?iso-8859-1?Q?aBIpVcnSCOX2FNXza5Dg2H8+qhXqUjbyo4ZJbl5CEMM4sqUHiLjaAPqqAs?=
 =?iso-8859-1?Q?bGnHj9cQabglSkdHrH92X1HUVMfpsU0lDaJdRutUDHPgXLSSe7LPIABReE?=
 =?iso-8859-1?Q?YQdt+eI2JbXZ4AB1m5z0WEYEMmOvlQrO2ooHbl/AjmPHWi5gDLN+RegOvA?=
 =?iso-8859-1?Q?TdtlCe9kYZEShJixfCBmga7zkC2Zc9bI0luhYJBaJq9+BhwLI8M14Ru0ph?=
 =?iso-8859-1?Q?3pSenb3E+BvgEXSNpba1KwQXs1om/EkwN65LwYSwrh3EReDIOVg+HDMtyQ?=
 =?iso-8859-1?Q?/o+zAUkYj9zUtqyjk35CgHnQbIhhdXR3THof8rqj9wWVoqN6Pp0oyB+hGM?=
 =?iso-8859-1?Q?1vru5BUEhr+IPYf6pxJdiunPKwjsnSidvD0KlUbTBDIRidBjshh2pjXn7d?=
 =?iso-8859-1?Q?vAdcorr+6PtRy1vLOLvvOKD+eLN9o3IBInNE7GAzTxCfCg1RX6lNxBYNjL?=
 =?iso-8859-1?Q?PvwU4Z6IAFRzrCfwkjNWR9fZ07MXm4CWQT/h6J0shh4qJhjUrKMqELdtzU?=
 =?iso-8859-1?Q?b78/U1O86lVWcqmvAOKmTTaLWL8ZMboTPvM96ubV69Wtqh5NFeCgAJAnEO?=
 =?iso-8859-1?Q?kel7U9UwrEofacpXSUVuEVuu2jBIHvPaeFg8Hj9rCESU84VS9Xj3LLDnLM?=
 =?iso-8859-1?Q?NGT/M2tQJFm6AKQKaMXqEh8/AWSxYQFIKPqWad6ik95jTU9lPxVaWCRmDw?=
 =?iso-8859-1?Q?gWK7zeTAXnlvmWdoLPXlM9ZjKyGD/SFWcdx7P9M4InxS63xnSdLQApZMju?=
 =?iso-8859-1?Q?TrkziaA1DLY06iTCcOdJ05ZR7k4SoX0jk0RKRGMgpUy2/Z7s4ruxQhaSIy?=
 =?iso-8859-1?Q?yg/APieHg5uzAZaHEfrNvAYMsczoDvarYrEvFV7aIYUrHPx65xuWeISHaZ?=
 =?iso-8859-1?Q?2/Zd4a/Vf6hxL5F+PTWI0wWSNXXEbKrj5t/xX5klHN0TgWtWkWuleu/Jb7?=
 =?iso-8859-1?Q?0Knk/l76Itux2tZZgnF+FBdqG0kMEj1hO5sjb0t61hu+sXsWnApdShI8nU?=
 =?iso-8859-1?Q?TNg4fE18Gzf5JS2vBoEafokYFzQwl5iEJCuD/obbbhY7AGLrvjqYYYgfOG?=
 =?iso-8859-1?Q?Q8pMJOr2O+j3wAAKoOGhDQSAoDt3oas3qs9yIS6pVpeKReKjTGf1m9+LZt?=
 =?iso-8859-1?Q?kfPMgRJ7npC9BWRer3AQnV1gUu09LKkWVHJ6vPH52yMhPct46684RrqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2097b174-984e-4916-7e30-08dcadfea3bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 05:40:36.1390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaA9exZwhdMflD8mvDKoP6tfXJDER+QGwoy+ivJJNYmQdpcIln3YJHY7iFmLRhM+wkya0YU1+hpxnbzwYSLE1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

On Fri, Jul 26, 2024 at 05:08:07PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Scan for EU debugging attention bits periodically to detect if some EU
> thread has entered the system routine (SIP) due to EU thread exception.
> 
> Make the scanning interval 10 times slower when there is no debugger
> connection open. Send attention event whenever we see attention with
> debugger presence. If there is no debugger connection active - reset.
> 
> Based on work by authors and other folks who were part of attentions in
> i915.
> 
> - v2 Do not validate potentially active hwe against engine->hwe.
>   Whenever the engine has width > 1, this field contains only the first
>   hwe of the class.
> - squash dss walking and semaphore to mutex
> - v3 error path fix in xe_send_gt_attention (Christoph)
> - v4 runalone active fix (Mika)
> - v5 q->lrc changes (Mika)
> - v6 Use C99 flexible arrays (Maciej, checkpatch)
>      function with 'for_each' in name (Maciej, checkpatch)
> - v7 long running active fix (Dominik)
> - v8 resource handling errors rebase (Mika)
> - v9 find out lrc handles first before sending event (Mika)
> - v10 adjust runalone shift according to hw
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   7 +
>  drivers/gpu/drm/xe/xe_device.c           |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_eudebug.c          | 389 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_eudebug.h          |   1 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h    |  32 ++
>  drivers/gpu/drm/xe/xe_gt_debug.c         | 152 +++++++++
>  drivers/gpu/drm/xe/xe_gt_debug.h         |  21 ++
>  include/uapi/drm/xe_drm_eudebug.h        |  15 +-
>  11 files changed, 624 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 06badc5f99af..b7b6b047c02c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>  	xe_gt_debugfs.o \
>  	xe_gt_freq.o \
>  	xe_gt_idle.o \
> +	xe_gt_debug.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 764c270599d0..b9d713a2061d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -132,6 +132,9 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> +#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
> +#define   CURRENT_LRCA_VALID			REG_BIT(0)
> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>  #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 96a59a96dd4c..03e83ce3e35d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -437,6 +437,8 @@
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> +#define TD_ATT(x)				XE_REG_MCR(0xe470 + (x) * 4)
> +
>  #define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
>  #define   DISABLE_GRF_CLEAR			REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> @@ -516,6 +518,11 @@
>  #define   CCS_MODE_CSLICE(cslice, ccs) \
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
> +#define RCU_DEBUG_1				XE_REG(0x14a00)
> +#define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
> +#define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
> +#define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  
>  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 90bb0a8b1881..ba1c80089906 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -768,6 +768,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_eudebug_init_late(xe);
> +
>  	xe_hwmon_register(xe);
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4dcfd39cb909..3b33add576be 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -516,6 +516,9 @@ struct xe_device {
>  
>  		/** @ordered_wq: used to discovery */
>  		struct workqueue_struct *ordered_wq;
> +
> +		/** @attention_scan: attention scan worker */
> +		struct delayed_work attention_scan;
>  	} eudebug;
>  
>  	/* private: */
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 9611acedeee9..c2de001cc33a 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -11,19 +11,29 @@
>  
>  #include <drm/drm_managed.h>
>  
> -#include "regs/xe_gt_regs.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
>  #include "xe_gt.h"
> +#include "xe_gt_debug.h"
> +#include "xe_lrc.h"
> +#include "xe_hw_engine.h"
> +#include "xe_exec_queue.h"
>  #include "xe_eudebug_types.h"
>  #include "xe_eudebug.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
> +#include "xe_execlist_types.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_rtp.h"
> +#include "xe_sched_job.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
> +#include "xe_force_wake.h"
>  
>  /*
>   * If there is no detected event read by userspace, during this period, assume
> @@ -843,6 +853,371 @@ static const struct file_operations fops = {
>  	.unlocked_ioctl	= xe_eudebug_ioctl,
>  };
>  
> +static bool queue_has_active_job(struct xe_exec_queue *q)
> +{
> +
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_job *drm_job;
> +
> +	if (xe_device_uc_enabled(gt_to_xe(q->gt)))
> +		sched = &q->guc->sched.base;
> +	else
> +		sched = &q->execlist->sched;
> +
> +	drm_job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list);
> +
> +	if (drm_job) {
> +		struct xe_sched_job *job = to_xe_sched_job(drm_job);
> +
> +		return xe_sched_job_started(job) && !xe_sched_job_completed(job);
> +	} else if (xe_exec_queue_is_lr(q) &&
> +		   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
> +{
> +	u32 lrc_reg;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
> +	if (err)
> +		return err;
> +
> +	lrc_reg = hw_engine_mmio_read32(hwe, RING_CURRENT_LRCA(0));
> +
> +	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
> +
> +	if (!(lrc_reg & CURRENT_LRCA_VALID))
> +		return -ENOENT;
> +
> +	*lrc_hw = lrc_reg & GENMASK(31, 12);
> +
> +	return 0;
> +}
> +
> +static int match_engine_lrc(struct xe_exec_queue *q, u32 lrc_hw)
> +{
> +	int i;
> +	u32 lrc_ggtt;
> +
> +	for (i = 0; i < q->width; i++) {
> +		lrc_ggtt = lower_32_bits(xe_lrc_descriptor(q->lrc[i]));
> +		lrc_ggtt &= GENMASK(31, 12);
> +		if (lrc_ggtt == lrc_hw)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static u32 engine_status(const struct xe_hw_engine * const hwe,
> +			 u32 rcu_debug1)
> +{
> +	const bool xe1 = GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20;
> +	unsigned int shift;
> +
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER) {
> +		shift = 7;
> +		XE_WARN_ON(hwe->instance != 0);
> +	} else if (hwe->class == XE_ENGINE_CLASS_COMPUTE) {
> +		XE_WARN_ON(hwe->instance > 3);
> +
> +		if (xe1)
> +			shift = 10 + (hwe->instance * 3);
> +		else
> +			shift = 11 + (hwe->instance * 4);
> +	} else {
> +		XE_WARN_ON(hwe->class);
> +		return 0;
> +	}
> +
> +	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
> +}
> +
> +static bool engine_runalone_set(const struct xe_hw_engine * const hwe,
> +				   u32 rcu_debug1)
> +{
> +	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_RUNALONE_ACTIVE;
> +}
> +
> +static bool engine_context_set(const struct xe_hw_engine * const hwe,
> +			       u32 rcu_debug1)
> +{
> +	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_CONTEXT_ACTIVE;
> +}
> +
> +static bool engine_has_runalone(const struct xe_hw_engine * const hwe)
> +{
> +	return hwe->class == XE_ENGINE_CLASS_RENDER ||
> +		hwe->class == XE_ENGINE_CLASS_COMPUTE;
> +}
> +
> +static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe, *first = NULL;
> +	unsigned int num_active, id;
> +	u32 val;
> +
> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone failed to get force wake\n");
> +		return NULL;
> +	}
> +
> +	val = xe_mmio_read32(gt, RCU_DEBUG_1);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone RCU_DEBUG_1 = 0x%08x\n", val);
> +
> +	num_active = 0;
> +	for_each_hw_engine(hwe, gt, id) {
> +		bool runalone, ctx;
> +
> +		if (!engine_has_runalone(hwe))
> +			continue;
> +
> +		runalone = engine_runalone_set(hwe, val);
> +		ctx = engine_context_set(hwe, val);
> +
> +		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: engine %s: runalone=%s, context=%s",
> +			hwe->name, runalone ? "active" : "inactive",
> +			ctx ? "active" : "inactive");
> +
> +		/*
> +		 * On earlier gen12 the context status seems to be idle when
> +		 * it has raised attention. We have to omit the active bit.
> +		 */
> +		if (IS_DGFX(gt_to_xe(gt)))
> +			ctx = true;
> +
> +		if (runalone && ctx) {
> +			num_active++;
> +
> +			drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone engine %s %s",
> +				hwe->name, first ? "selected" : "found");
> +			if (!first)
> +				first = hwe;
> +		}
> +	}
> +
> +	if (num_active > 1)
> +		drm_err(&gt_to_xe(gt)->drm, "eudbg: %d runalone engines active!",
> +			num_active);
> +
> +	return first;
> +}
> +
> +static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_exec_queue *q, *found = NULL;
> +	struct xe_hw_engine *active;
> +	struct xe_file *xef, *tmp;
> +	unsigned long i;
> +	int idx, err;
> +	u32 lrc_hw;
> +
> +	active = get_runalone_active_hw_engine(gt);
> +	if (!active) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	err = current_lrc(active, &lrc_hw);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	mutex_lock(&xe->files.lock);
> +	list_for_each_entry_safe(xef, tmp, &xe->files.list, link) {
> +		mutex_lock(&xef->exec_queue.lock);
> +		xa_for_each(&xef->exec_queue.xa, i, q) {
> +			if (q->gt != gt)
> +				continue;
> +
> +			if (q->class != active->class)
> +				continue;
> +
> +			if (!queue_has_active_job(q))
> +				continue;
> +
> +			idx = match_engine_lrc(q, lrc_hw);
> +			if (idx < 0)
> +				continue;
> +
> +			xe_exec_queue_get(q);
> +			found = q;
> +
> +			if (lrc_idx)
> +				*lrc_idx = idx;
> +
> +			break;
> +		}
> +		mutex_unlock(&xef->exec_queue.lock);
> +
> +		if (found)
> +			break;
> +	}
> +	mutex_unlock(&xe->files.lock);
> +
> +	if (!found)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (XE_WARN_ON(current_lrc(active, &lrc_hw)) &&
> +	    XE_WARN_ON(match_engine_lrc(found, lrc_hw) < 0)) {
> +		xe_exec_queue_put(found);
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	return found;
> +}
> +
> +static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
> +{
> +	struct xe_eudebug_event_eu_attention *ea;
> +	struct xe_eudebug_event *event;
> +	int h_c, h_queue, h_lrc;
> +	u32 size = xe_gt_eu_attention_bitmap_size(q->gt);
> +	u32 sz = struct_size(ea, bitmask, size);
> +	int ret;
> +
> +	XE_WARN_ON(lrc_idx < 0 || lrc_idx >= q->width);
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, q->vm->xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
> +	if (h_queue < 0)
> +		return h_queue;
> +
> +	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
> +	if (h_lrc < 0)
> +		return h_lrc;
> +
> +	event = __xe_eudebug_create_event(d, 0, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					  DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz, GFP_KERNEL);
> +
> +	if (!event)
> +		return -ENOSPC;
> +
> +	ea = cast_event(ea, event);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, client_handle, (u64)h_c);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, exec_queue_handle, (u64)h_queue);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, lrc_handle, (u64)h_lrc);
> +	write_member(struct drm_xe_eudebug_event_eu_attention, ea, bitmask_size, size);
> +
> +	mutex_lock(&d->eu_lock);
> +	event->seqno = atomic_long_inc_return(&d->events.seqno);
> +	ret = xe_gt_eu_attention_bitmap(q->gt, &ea->bitmask[0], ea->bitmask_size);
> +	mutex_unlock(&d->eu_lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +
> +static int xe_send_gt_attention(struct xe_gt *gt)
> +{
> +	struct xe_eudebug *d;
> +	struct xe_exec_queue *q;
> +	int ret, lrc_idx;
> +
> +	if (list_empty_careful(&gt_to_xe(gt)->eudebug.list))
> +		return -ENOTCONN;
> +
> +	q = runalone_active_queue_get(gt, &lrc_idx);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	d = xe_eudebug_get(q->vm->xef);
> +	if (!d) {
> +		ret = -ENOTCONN;
> +		goto err_exec_queue_put;
> +	}
> +
> +	if (!completion_done(&d->discovery)) {
> +		eu_dbg(d, "discovery not yet done\n");
> +		ret = -EBUSY;
> +		goto err_eudebug_put;
> +	}
> +
> +	ret = send_attention_event(d, q, lrc_idx);
> +	if (ret)
> +		xe_eudebug_disconnect(d, ret);
> +
> +err_eudebug_put:
> +	xe_eudebug_put(d);
> +err_exec_queue_put:
> +	xe_exec_queue_put(q);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	ret = xe_gt_eu_threads_needing_attention(gt);
> +	if (ret <= 0)
> +		return ret;
> +
> +	ret = xe_send_gt_attention(gt);
> +
> +	/* Discovery in progress, fake it */
> +	if (ret == -EBUSY)
> +		return 0;
> +
> +	return ret;
> +}
> +
> +#define XE_EUDEBUG_ATTENTION_INTERVAL 100
> +static void attention_scan_fn(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, typeof(*xe), eudebug.attention_scan.work);
> +	long delay = msecs_to_jiffies(XE_EUDEBUG_ATTENTION_INTERVAL);
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	if (list_empty_careful(&xe->eudebug.list))
> +		delay *= 10;
> +
> +	if (delay >= HZ)
> +		delay = round_jiffies_up_relative(delay);
> +
> +	if (pm_runtime_active(xe->drm.dev)) {
> +		for_each_gt(gt, xe, gt_id) {
> +			int ret;
> +
> +			ret = xe_eudebug_handle_gt_attention(gt);
> +			if (ret) {
> +				// TODO: error capture
> +				drm_info(&gt_to_xe(gt)->drm,
> +					 "gt:%d unable to handle eu attention ret=%d\n",
> +					 gt_id, ret);
> +
> +				xe_gt_reset_async(gt);
> +			}
> +		}
> +	}
> +
> +	schedule_delayed_work(&xe->eudebug.attention_scan, delay);
> +}
> +
> +static void attention_scan_cancel(struct xe_device *xe)
> +{
> +	cancel_delayed_work_sync(&xe->eudebug.attention_scan);
> +}
> +
> +static void attention_scan_flush(struct xe_device *xe)
> +{
> +	mod_delayed_work(system_wq, &xe->eudebug.attention_scan, 0);
> +}
> +
>  static void discovery_work_fn(struct work_struct *work);
>  
>  static int
> @@ -877,6 +1252,7 @@ xe_eudebug_connect(struct xe_device *xe,
>  
>  	kref_init(&d->ref);
>  	spin_lock_init(&d->connection.lock);
> +	mutex_init(&d->eu_lock);
>  	init_waitqueue_head(&d->events.write_done);
>  	init_waitqueue_head(&d->events.read_done);
>  	init_completion(&d->discovery);
> @@ -903,6 +1279,7 @@ xe_eudebug_connect(struct xe_device *xe,
>  
>  	kref_get(&d->ref);
>  	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
> +	attention_scan_flush(xe);
>  
>  	eu_dbg(d, "connected session %lld", d->session);
>  
> @@ -979,12 +1356,22 @@ void xe_eudebug_init(struct xe_device *xe)
>  {
>  	spin_lock_init(&xe->eudebug.lock);
>  	INIT_LIST_HEAD(&xe->eudebug.list);
> +	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
>  
>  	xe->eudebug.available = true;
>  }
>  
> +void xe_eudebug_init_late(struct xe_device *xe)
> +{
> +	if (!xe->eudebug.available)
> +		return;
> +
> +	attention_scan_flush(xe);
> +}
> +
>  void xe_eudebug_fini(struct xe_device *xe)
>  {
> +	attention_scan_cancel(xe);
>  	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> index ac89a3d1ee1d..1e233c4683d6 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -18,6 +18,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  			     struct drm_file *file);
>  
>  void xe_eudebug_init(struct xe_device *xe);
> +void xe_eudebug_init_late(struct xe_device *xe);
>  void xe_eudebug_fini(struct xe_device *xe);
>  void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> index 6e3c23023933..16667b4dfe45 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -105,6 +105,9 @@ struct xe_eudebug {
>  	/** @discovery_work: worker to discover resources for target_task */
>  	struct work_struct discovery_work;
>  
> +	/** eu_lock: guards operations on eus (eu thread control and attention) */
> +	struct mutex eu_lock;
> +
>  	/** @events: kfifo queue of to-be-delivered events */
>  	struct {
>  		/** @lock: guards access to fifo */
> @@ -202,4 +205,33 @@ struct xe_eudebug_event_exec_queue {
>  	u64 lrc_handle[];
>  };
>  
> +/**
> + * struct xe_eudebug_event_eu_attention - Internal event for EU attention
> + */
> +struct xe_eudebug_event_eu_attention {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: client for the attention */
> +	u64 client_handle;
> +
> +	/** @exec_queue_handle: handle of exec_queue which raised attention */
> +	u64 exec_queue_handle;
> +
> +	/** @lrc_handle: lrc handle of the workload which raised attention */
> +	u64 lrc_handle;
> +
> +	/** @flags: eu attention event flags, currently MBZ */
> +	u32 flags;
> +
> +	/** @bitmask_size: size of the bitmask, specific to device */
> +	u32 bitmask_size;
> +
> +	/**
> +	 * @bitmask: reflects threads currently signalling attention,
> +	 * starting from natural hardware order of DSS=0, eu=0
> +	 */
> +	u8 bitmask[];
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
> new file mode 100644
> index 000000000000..04d2d43ce249
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_topology.h"
> +#include "xe_gt_debug.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_pm.h"
> +#include "xe_macros.h"
> +
> +static int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
> +					    int (*fn)(struct xe_gt *gt,
> +						      void *data,
> +						      u16 group,
> +						      u16 instance),
> +					    void *data)
> +{
> +	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
> +	unsigned int dss;
> +	u16 group, instance;
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));

Missed this in my previous reply...

This looks pretty dangerous. The 'xe_pm_runtime_get' is designed to
called on the outer most layers. This is an inner layer.

i.e. Calling xe_pm_runtime_get with any locks held is not allowed as it
can wake the device and waking a device takes numerous locks which then
deadlock. What makes this really scary is most times xe_pm_runtime_get
doesn't wake the device, it just increments a counter so we have silent
bug until xe_pm_runtime_get actually wakes the device.

A quick audit shows this is called with d->eu_lock, probably actually
safe in case this but still not a good idea.

I suggest just protecting all of the EU debug code with
xe_pm_runtime_get / xe_pm_runtime_put at the outer most layers (e.g.
workers, IOCTLs already have this built in see xe_drm_ioctl).

Matt

> +	ret = xe_force_wake_get(gt_to_fw(gt), fw_domains);
> +	if (ret)
> +		goto pm_runtime_put;
> +
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		ret = fn(gt, data, group, instance);
> +		if (ret)
> +			break;
> +	}
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_domains);
> +pm_runtime_put:
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
> +static int read_first_attention_mcr(struct xe_gt *gt, void *data,
> +				    u16 group, u16 instance)
> +{
> +	unsigned int row;
> +
> +	for (row = 0; row < 2; row++) {
> +		u32 val;
> +
> +		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
> +
> +		if (val)
> +			return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +#define MAX_EUS_PER_ROW 4u
> +#define MAX_THREADS 8u
> +
> +/**
> + * xe_gt_eu_attention_bitmap_size - query size of the attention bitmask
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: size in bytes.
> + */
> +int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt)
> +{
> +	xe_dss_mask_t dss_mask;
> +
> +	bitmap_or(dss_mask, gt->fuse_topo.c_dss_mask,
> +		  gt->fuse_topo.g_dss_mask, XE_MAX_DSS_FUSE_BITS);
> +
> +	return  bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS) *
> +		TD_EU_ATTENTION_MAX_ROWS * MAX_THREADS *
> +		MAX_EUS_PER_ROW / 8;
> +}
> +
> +struct attn_read_iter {
> +	struct xe_gt *gt;
> +	unsigned int i;
> +	unsigned int size;
> +	u8 *bits;
> +};
> +
> +static int read_eu_attentions_mcr(struct xe_gt *gt, void *data,
> +				  u16 group, u16 instance)
> +{
> +	struct attn_read_iter * const iter = data;
> +	unsigned int row;
> +
> +	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
> +		u32 val;
> +
> +		if (iter->i >= iter->size)
> +			return 0;
> +
> +		XE_WARN_ON(iter->i + sizeof(val) > xe_gt_eu_attention_bitmap_size(gt));
> +
> +		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
> +
> +
> +		memcpy(&iter->bits[iter->i], &val, sizeof(val));
> +		iter->i += sizeof(val);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_eu_attention_bitmap - query host attention
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: 0 on success, negative otherwise.
> + */
> +int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
> +			      unsigned int bitmap_size)
> +{
> +	struct attn_read_iter iter = {
> +		.gt = gt,
> +		.i = 0,
> +		.size = bitmap_size,
> +		.bits = bits
> +	};
> +
> +	return xe_gt_foreach_dss_group_instance(gt, read_eu_attentions_mcr, &iter);
> +}
> +
> +/**
> + * xe_gt_eu_threads_needing_attention - Query host attention
> + *
> + * @gt: pointer to struct xe_gt
> + *
> + * Return: 1 if threads waiting host attention, 0 otherwise.
> + */
> +int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = xe_gt_foreach_dss_group_instance(gt, read_first_attention_mcr, NULL);
> +
> +	XE_WARN_ON(err < 0);
> +
> +	return err < 0 ? 0 : err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
> new file mode 100644
> index 000000000000..3f13dbb17a5f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_GT_DEBUG_
> +#define __XE_GT_DEBUG_
> +
> +#define TD_EU_ATTENTION_MAX_ROWS 2u
> +
> +#include "xe_gt_types.h"
> +
> +#define XE_GT_ATTENTION_TIMEOUT_MS 100
> +
> +int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
> +
> +int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
> +int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
> +			      unsigned int bitmap_size);
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> index 25dddb8b22f4..453269ac8307 100644
> --- a/include/uapi/drm/xe_drm_eudebug.h
> +++ b/include/uapi/drm/xe_drm_eudebug.h
> @@ -27,13 +27,15 @@ struct drm_xe_eudebug_event {
>  #define DRM_XE_EUDEBUG_EVENT_OPEN		2
>  #define DRM_XE_EUDEBUG_EVENT_VM			3
>  #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
> -#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
>  
>  	__u16 flags;
>  #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
>  #define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
>  #define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
>  #define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
> +
>  	__u64 seqno;
>  	__u64 reserved;
>  };
> @@ -62,6 +64,17 @@ struct drm_xe_eudebug_event_exec_queue {
>  	__u64 lrc_handle[];
>  };
>  
> +struct drm_xe_eudebug_event_eu_attention {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u8 bitmask[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
