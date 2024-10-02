Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4BBCF6D2C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 14:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026010E753;
	Wed,  2 Oct 2024 14:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAsuiD+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2410E752
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727877943; x=1759413943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/7Pp3uMXaMf1St04fYDFMsfds1qTEB1LQbOclFFVVgo=;
 b=hAsuiD+aE3Hl9VYPE+itrbfW8znEf3s5LeNyK2GlqXiY9AJQVA56H+AM
 BuX4rmpfbkCGNhEEjqMHLjyoB2Tv7pgLR4l9Sic1Vrfg70krgGeLvx9x2
 IREOaBw5aVXcgIENcQbabHeozyu+dwEdmQTSMgGVin2moxN9uP6auH+DN
 Ekzg4NH37waEPx7N2eRAlzxqUGdkK/it/cgiLAMaWhLgwty4bYtkSTx3W
 AYnXyZmfsEZmcDhhMvPN1MekazK57W4DIa3f2ywKPMuxmS9OfY+WVrvsf
 +bSAJXFeIVADYw4TYZgD/Qa4aSt7diejfRAbUWft2nj4JVZRwqF3YDSE2 w==;
X-CSE-ConnectionGUID: ufeKL7JTQ9ei+hohFxGLbQ==
X-CSE-MsgGUID: Pp7EkIsaQ42UteMzWdsAqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30833387"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30833387"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:05:08 -0700
X-CSE-ConnectionGUID: 8AP4AR5hSoalpdgsgdeLgg==
X-CSE-MsgGUID: i7vjzt4cQhO4bfxlXVSPDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78970370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 07:05:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 07:05:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 07:05:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 07:05:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 07:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0VxEjgxuAuErKx85s8sCp/zPCFw0aN64tgKRXZdInFL0s/LMo8VppJvvK2bbH0/ecymiaWtBAtLwDiB9a70/AZqomJNG5/KhHjzij8FUMkMP1vsEra5YYLCgCo0quYvbtEYz8TpYHfS/Gos5q6zxmTjUEtw78vZuv/OrNhk+M61EPAl1rjUfzeWHywEIfs2hlUgB6/AeVLOlHZsIto9V9IZrY4bcyOknzuSRbJ40v5hIkrpdpU9ivOqtEqVFnURa5ruJidZAHKYbnR+WkhfKfq59+9IZsAuQ99jO+t8zgTZUCBmSEtzHOA8AZ30fjXeAleYW4clERVON9Q4EG7Twg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29weU3fZ0XzsFUFJNyZRX4wCZniu+m7Ul2xfY67Bd94=;
 b=u7TLPjDKFqwdzETTItuD5/CmfSNbHH8F0axH2LYNKZ2lZNyvN5WulKEoFSahc30YNsJK8R880tWIsM3pLxOa1IjrvM0KueenN2M8+tTEYz/FydWyz0ZIxxO4dAOgfYX4pWLViPCb3COu4LI7en9390yqrIg0qghvaWbiGi8dRkBqK/Y4akuHkNECtWRLg5+edJKWPSI/FukJM7a1eu3UfYtkjwgToo2CLNAPz4s1LgJnj3+wZK0tt3yfL8THPk12mVktGleavvWV5usRruONVynl8mrs5IvVXoBx+XmwO8t+e7pU/HrtnloDcqkQYBUpi5HdkboBFhTdphluL8SZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 14:05:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Wed, 2 Oct 2024
 14:05:04 +0000
Date: Wed, 2 Oct 2024 14:04:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
Message-ID: <Zv1S++mT0UuQEFNZ@DUT025-TGLU.fm.intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
 <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebab87b-7ce0-4709-39b7-08dce2eb36ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hzbXjXuheeJJ9pkWTPPKIH0Lr0OpMRpZ/r1QeXWlG5QbsxiIdq3XxAg2UKP7?=
 =?us-ascii?Q?PZbaIpYSrwr1mf6UaSg7ND2kT0DocAljUeCFuoyH0K519EAtnyZTbGb8m979?=
 =?us-ascii?Q?OVHCmIi1lQkUQSGS/6/rJc5fJShqThXKjMXCFEDEmDnrV15Q1gAWBkU4qZGg?=
 =?us-ascii?Q?8Y2CPPxDNYnBwgFNyTByg88fnZgeIHSY8vNmKzOvvCWPnVmpiP1iO2k8t9bf?=
 =?us-ascii?Q?Q5YP2scTsv6yCJ1AcUWAQjLlNQYibrZ6CAXHg8FsEFznVPksW0aZPP+HwzSH?=
 =?us-ascii?Q?kYWXC9qXi6y8ZzsVa2Au3njhlOCE52B8G75Im9hevD2L81vU9R3vC+q6xJSH?=
 =?us-ascii?Q?YzPnOrLbLmpZWrUzH4UNEIwQ+rR75rWQPIueggII77pg0C9Iesah4Be3IFbU?=
 =?us-ascii?Q?BKoie9fPBtbw9VXqTLQ+XFYZJj1oaOBO7W0jfy9lSEY7MXUMbUqjvy4n+bp+?=
 =?us-ascii?Q?p6cXGbTHuNuP/8zCBFbfWQGzkgINN8ZmT+eHm7pJL/I87NDT5bEOWtabCaIZ?=
 =?us-ascii?Q?xKMFpXti9SxQ+XFcZUonRWWsJwcw+Msfp6IK/xXT5933k1h69dh3gJYcTbKX?=
 =?us-ascii?Q?IlwYeox+rn0pGtPs2fn5M7NKf3bOAsdslmzZOM3tv1hvX2AQL6CchnPqnDsV?=
 =?us-ascii?Q?4rvkEtFYNCWjbmzEtSt/W4SBAEfGY/IBD+1Lyd8a8wB7W/eifOEL2f8xQOtQ?=
 =?us-ascii?Q?CPksRT5+6oktq6hsjNVlZQ/9/tSRLMihOpcfJ/LjYHdEmagi363YyOs8Ydoc?=
 =?us-ascii?Q?AGxrSgn8tcraQpqM2sBkPlLLW7PUOT6gmyUM5TWMYQe/abIDAUedmbHur1Qf?=
 =?us-ascii?Q?k17abQg7nsL7eMQPb870BPDSrSVPRw99XZrAD5tf44WDV27NobowcuC5dSbH?=
 =?us-ascii?Q?/Ne6nV/C4D5JLQSMyPc/mCNoEUT0Fb5oyvqx0625vrgey9b1uTwX97KB+YN7?=
 =?us-ascii?Q?mEpQstMpAv2Hqwaf2c3SLLKoaB9uI7ob/DAG0QRk6RfXYBCuc0DmARrQLXIJ?=
 =?us-ascii?Q?ExQVFjtv9Q/7hz7l4fudvlOPtX9XDXaOu9+SKnvdVtuQjXd2/bLJlpALCL08?=
 =?us-ascii?Q?wkZ4LfYthTPUSHaF8TPFYvsjyj2Uic1DOe/Y+PJ9O22ivcbakecv74KN9n57?=
 =?us-ascii?Q?6XDpoDLwOS5SFW3O+DZUQmtLJoJR9Mo/P1o31zoZMtfVs5qrvsZCbkpndJLu?=
 =?us-ascii?Q?E5ZT44M+puANagwcuyC1MVYV8z1QVdTYQplfaOYEq+8ozsVqX0ZTbPUJ4Rwe?=
 =?us-ascii?Q?ozv3q+VWItae9Htb8hyAile7pGFimBuqV67foIEf4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uXD7F6vcg7pyasBx/CEgdCLuD6jhftvswFB44HdeM7dlHQwU02on8zcZA/3h?=
 =?us-ascii?Q?qTc/QKGjFJcZHVD97xZzK46r3L/PkCjZO0zXPyL4FtvwXZ6SxLGiU116gb31?=
 =?us-ascii?Q?C6tbU8PdDTBXBTSIjAOpMlB5+598IKOVlfm5hk2YNw59wHULCD2STxnvAIoh?=
 =?us-ascii?Q?BUKqKbMmoy1hUjgNk+0WXeJfR7tlJeQkKK5gFBF/dyzqja2aXvv1kpl5pB1x?=
 =?us-ascii?Q?6ATxwtQpGaBjGcgqslQFWGxa0BewWiihTBx3NyVMi1VGfQISgCvyGm2C9M9l?=
 =?us-ascii?Q?Fl7IvGlYw1GdL6EpXNbjAs7zB2QnatQrXuSLuCPkebD6/s+3Db/LN6xReIj6?=
 =?us-ascii?Q?/7TRj790TnDmRBH1musJZCmYmqoXm0dq1OEGt7KFt5spv/g5tqJ/Qqj0FuMO?=
 =?us-ascii?Q?CbC66cHRmIY7bqxTGHWt5Zj8jn7AUZrnwBFD6pqWf9JJ37vm3zGvm38sn9RT?=
 =?us-ascii?Q?yszEShY772YwoJx7QCjpQFww1E9+vbt/ztITtA7l0PA8ll8B1rZ4Bd51bc/O?=
 =?us-ascii?Q?tPYqmZnA3RERfPoiURdutVt/POAcj13BfK9h9aLbYU8f2JawgqZ+hzV2P/Au?=
 =?us-ascii?Q?4vsd1EGIowc8numPq3JHP+6xPq3wxR9aDFPOzj8LmDoVrLfgcTHMyNLkqkUo?=
 =?us-ascii?Q?RBeAqvV8UTNubcO3LxzJlQXz70ltXY7iX5fZfEFBPqKCJ0G7bMDpOSjOHUWO?=
 =?us-ascii?Q?8cBqso8K9vU8kuQL1Ioyl3ppeHh1EHd8xy+tM1vKrdgcY2XFZYdKrHlVkhUa?=
 =?us-ascii?Q?WYLVoSwKPAzvgH6VDi/W5HI06/xH5OBuwKYOEVKkeewHZWb+BhTkNn7133rr?=
 =?us-ascii?Q?1eICjl0I6MOp9IS35mBGVleTpV1oUnE8M3INpQUcRJ+s3v7aY7rCCgC4Eweh?=
 =?us-ascii?Q?MWWpOa1CvqGPouLxwmoD41bLUQCSKJe+s37KGjN3bsRTEf6uPItz14j8KCMC?=
 =?us-ascii?Q?VOjhR/IyUl35qUzcdYNyqHtyoTLrV5SsuMZkJ2OZkzjK2xnoCnQnZXITYdgj?=
 =?us-ascii?Q?eZ6PXo9nkrPWgeKXygkC8mKCfn9lyMh6+kOdRfn2WyZsDS8bKAij0rcXnDZN?=
 =?us-ascii?Q?G4U/MZedvIDnKJhFnrZsvYbJLXcKt8oUmqavFx4Exhhw5WI1TfB6bGjSx+Zz?=
 =?us-ascii?Q?Ru8A/NDv5hY6UFrq7VYrK47KnEPU0/qIlxNhpHhsO2Oayx0a/GsWfKF6tikV?=
 =?us-ascii?Q?z7xeCy1S58xrUyP8QrezEypa0haADuXYPRmFKC/aoiMdFeEzAa8Uzhr6DosD?=
 =?us-ascii?Q?R88vWpSZj6WpBVP00ap3Q2FHhSFdOm85/+BJ/oxPAkh7nYTupx35kfHTa87H?=
 =?us-ascii?Q?vZGm49nEAVmGOVfU3cbN0ZhbB30rmy1etuwVRHhigYArsBmj8tdARlOpgHYV?=
 =?us-ascii?Q?08AVuImTQb9h0s9UrB3uI4YyTo2Vq0r7SqqHpGfcVBcKsVWCUuX19WhIVW4D?=
 =?us-ascii?Q?5dEmo8NC5BP4uw3CyiuxM59VE17oPxbOYjjNT141y3KRsngus1qU3FShGcXf?=
 =?us-ascii?Q?Gg1+PIrG6cAh9y7lmsUAU1hdj6yny+21TLK9P2DZ/XAIGDyCj+Qk4at6xcuD?=
 =?us-ascii?Q?nxpo1wbmSUnO50486Zu09L+6SxscvMpZ18NLkkaw28e8oXlRgFpAEV/JeDF4?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebab87b-7ce0-4709-39b7-08dce2eb36ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 14:05:04.7742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fac5TJhRHi1+73VgZWHfKDvpC8vMuLiVUuWquYQYT3TzKzVGuGAJN30T0vJ/jwQS9kgPlokoKOkLZ3AzuYc0jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On Tue, Oct 01, 2024 at 01:41:15PM +0530, Nilawar, Badal wrote:
> 
> 
> On 28-09-2024 02:57, Matthew Brost wrote:
> > On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
> > > It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
> > > queued, but it didn't get opportunity to execute and timeout occurred.
> > > To address this the g2h_worker is being flushed.
> > > 
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 4b95f75b1546..4a5d7f85d1a0 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >   	}
> > >   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > > +
> > > +	/*
> > > +	 * It is observed that for above GuC CT request G2H IRQ triggered
> > 
> > Where is this observed. 1 second is a long to wait for a worker...
> 
> Please see this log.
>

Logs are good but explaining the test case is also helpful so I don't
have reverse engineer things. Also having platform information would be
helpful too. So what is the test case here and what platform?
 
> [  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
> GuC PC status query
> [  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> GT[0]
> [  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> running GT[0]
> [  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: GT[0]
> GuC PC status query
> [  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> GT[0]
> [  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> running GT[0]
> [  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset

This looks we are doing a GT reset and this is causing problems. This
patch is likely papering over an issue with our GT flows. So this patch
doesn't seem correct to me. Let's try to figure what is going wrong in
the reset flow.

> [  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC PC
> check request
> [  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> GT[0]  // IRQ
> [  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for G2H,
> fence 1311, action 3003  //Timeout
> [  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task state
> failed: -ETIME
> [  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued

Here this is almost 1 second after 'trying reset' which I'm unsure how
that could happen looking at the source code upstream.
'xe_uc_reset_prepare' is called between 'trying reset' and 'reset
queued' but that doesn't wait anywhere rather resolves to the below
function:

1769 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
1770 {
1771         int ret;
1772
1773         /*
1774          * Using an atomic here rather than submission_state.lock as this
1775          * function can be called while holding the CT lock (engine reset
1776          * failure). submission_state.lock needs the CT lock to resubmit jobs.
1777          * Atomic is not ideal, but it works to prevent against concurrent reset
1778          * and releasing any TDRs waiting on guc->submission_state.stopped.
1779          */
1780         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
1781         smp_wmb();
1782         wake_up_all(&guc->ct.wq);
1783
1784         return ret;
1785 }

If this log from an internal repo or something? This looks like some
sort of circular dependency where a GT reset starts and the G2H handler
doesn't get queued because the CT channel is disabled, the G2H times
out, and reset stalls waiting for the timeout.

> [  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
> GuC PC status query
> [  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
> GT[0]
> [  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
> [  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
> running GT[0] // Worker ran
> [  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!
> 
> > 
> > > +	 * and g2h_worker queued, but it didn't get opportunity to execute
> > > +	 * and timeout occurred. To address the g2h_worker is being flushed.
> > > +	 */
> > > +	if (!ret) {
> > > +		flush_work(&ct->g2h_worker);
> > > +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > 
> > If this is needed I wouldn't wait 1 second, if the flush worked
> > 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?
> 
> In config HZ is set to 250, which is 4 ms I think.
> 

HZ should always be one second [1].

[1] https://www.oreilly.com/library/view/linux-device-drivers/9781785280009/4041820a-bbe4-4502-8ef9-d1913e133332.xhtml#:~:text=In%20other%20words%2C%20HZ%20represents,incremented%20HZ%20times%20every%20second.

> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250
> 

I'm little confused how this Kconfig works [2] but I don't think
actually changes the time of HZ rather it changes how many jiffies are
in one second.

[2] https://lwn.net/Articles/56378/

Matt

> Regards,
> Badal
> 
> > 
> > Matt
> > 
> > > +	}
> > > +
> > >   	if (!ret) {
> > >   		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
> > >   			  g2h_fence.seqno, action[0]);
> > > -- 
> > > 2.34.1
> > > 
> 
