Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B710C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 16:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBF110E0A4;
	Tue, 22 Apr 2025 16:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPxqnNIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053610E0A4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745338284; x=1776874284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=goUizZeMinUa2HqEuw8jLofsADJiPdOHjiHJen11hEk=;
 b=KPxqnNICA/IvO0/X0reXwq7gwRpjHbh1q1yB9vlFdyCwGBHTZZSZJEU5
 lr8+9U8Z/G9A7fVHouwGEhkW131TXi12QiI5y+p3iBDN2/0rvlxx8dleh
 /wQ4m1/LE/u9Uqdp/DWdbkI0pZ38czjQ5pCHJqDtrYLq8Lw16nn2mVgS7
 DreTJ4GNMl+pJLYjzwb042TtxNJhDPFt/j9naGZCD6FXxsGLIAsA3itKt
 6kQviLfzRv91bZsD1K9jcZxqdpmE44txFtHqDDBh8FcpFeA9/E+IlYQxQ
 qZtRkbHvFU7EONP0ISbcBZhfbE4kekPKkmtu3HOkZV6cD0T+Y73Fl/7Pw g==;
X-CSE-ConnectionGUID: BuTuhhIdQbyIOTnfhorAnA==
X-CSE-MsgGUID: 6hCrkqwgTT2O+qlmvPR2dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57095967"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57095967"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:11:23 -0700
X-CSE-ConnectionGUID: /VXYoxJuQ/e932XVPYLgEg==
X-CSE-MsgGUID: YEv//AgqQR+7uDT7X5Od+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136840918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:11:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 09:11:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 09:11:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 09:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gpxi7S7qtv8tvCvynAY2eiDH4tc6XYt2JspuYHwr3fezj/hMaDinecYAVvg8uB/blVWhXRyLuSdXgZqhhTgH2TYI18v5NTWV9fDwxnN2vB9bkFDks9A3YlqXv6eb2SjrqhAc97ORtoX+SlPTgRx+GS5TMjoIiznx8HfIH/Qp7Yx/zzG7Q6QDRiqKbO5MQjy7eeLlqT9WeLVGSGdZpk+gG4YWOCBeKCkjqv4P6ko+KqHuR9dXDB1vZg3lxRqjcWXXOA6E+QuE/wxCm2mJvK9dMh9FP2UQkxF0gASNpdmXxDNAN78Px5LxRArFpEv1pgxxKiSi/sMpDNXDgtPQ38iKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ0hanmpgeJ1Q1K7vMJtD2abGwaSl+3TP12cLo+kbDM=;
 b=LJN/p3v3gM5dFEHgtiD3G0EvxfOjo1rhE66uKurRWrQNF50SlZgana8826D7d58UM7CCC6yGy50XF4tpv+JfABFLpNlvZfdunXetw2wTLMCtKuWKCIa717397VsYwdix3FyLknkTQ+mPM8bUeUJXtzBT+fLrmdpVGopOQzAG8yyyQ+ESOvjHk14Yxmm8sOV52wd6tcBcLcIaBeAdpMMeXHbXzl7fK5uW0N7i3XXOjflCDSgHm8zY+6v04vLGFxjd8oMkxfGIkq4u6NjHHVOsdI7Q1EcTMeiWjEPvUEPqZaWqjuXkqOwdbPLwHHbUpXEvn/DMzzOKx5jUfeX9UyZ6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 16:11:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:11:16 +0000
Date: Tue, 22 Apr 2025 09:12:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Message-ID: <aAe/9JXXq6hDUlCn@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
 <aAe4bIz2NEpidrNC@lstrano-desk.jf.intel.com>
 <dc38675294a98589b550fb0929d028e669b4d873.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dc38675294a98589b550fb0929d028e669b4d873.camel@intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb96d5a-bac3-4cb1-2b7b-08dd81b84f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BAxfhYfYFsTE/DmClDG9dhZ4VGTW6V2cOmboug1KvGIXlyyShKyoz/1nkcGr?=
 =?us-ascii?Q?Q22S8dKm+0G8NWGLyeZuX7i6wTUGz9pUvXJ4MiUD8uRxxsZtW0mcSmFKSan3?=
 =?us-ascii?Q?d2bMJZSFe5FVR5VgnWn0oRizOoawhy0+55V0guBFZlI0jcGqZxJcO3CwVxJ/?=
 =?us-ascii?Q?tjyhBU2cKH27zsajzLC83ccHmURTPK3dx2BUpJiTUVwSQrwsZy5SE59PBcVk?=
 =?us-ascii?Q?00eSP0A6uPxxDwUr9K8wg011eXO2rwW4M/aP69KooCVd+spB+P6oKXH79Tuf?=
 =?us-ascii?Q?CMJCjL1P1UfBJ0gDRvAepfs4hxQFhOD0xx/02DBGyW3vMJ2Kj/3AfJoACveA?=
 =?us-ascii?Q?UBn2+PS447JL5KZ3I37mCHwuk2R6FfnHfNogHw9VTFPDPgAy+CSlqNXA5UIa?=
 =?us-ascii?Q?w4Rf7vjRE7RvX5nhd1NN7h2tkc1jPnu34Qq5oaPdhQVFiDsW0E8prn4h8nEB?=
 =?us-ascii?Q?hObj/484vSQjyrK9kBE0tQx7Xg+/ptRpZaaQ2gAVEtb8mbkgcQgeTMdsOjvL?=
 =?us-ascii?Q?wDm8GY5AxC55dw/i77JGpDi/5WgM90fAWswhM2zpoe6J3mYsrsxxpFWOV2ur?=
 =?us-ascii?Q?lZhTmVsXzXdgIVUltSe/uQbikWQ6Dgkmiu1mnrEa5r1IwSnx/Og8p38OM76v?=
 =?us-ascii?Q?VcrYkMWf6l2+Zz2bcRMf+vhTA4qjv3npMU0//jARMZ5BXturz1ueaAiUIZWQ?=
 =?us-ascii?Q?uy8OVcFlYx7ko9eerCXSOk+Qzl0/MzV1dRah36i9YKaMnbwTkrYwSCWEByc0?=
 =?us-ascii?Q?hxvKZTHADuuoxGFaHBINaW2jj1nurbqZgoSgafr9Mdn9I0/cMIy61ZPk3g4u?=
 =?us-ascii?Q?rWFGmzrLfQJ7nQ7xzLvSynieSywg/UzBbXtFH6axTuXN3BK1lnNmpMON5eX7?=
 =?us-ascii?Q?dWs95+quwAQTeyinuUUgky1hW7isAISVOlzd4wHDyfyulaju2JCBakLS8XKI?=
 =?us-ascii?Q?iRcATTCtDZ/vCsT6qppsYKOHQ1BllpxpF2YmwWcfbvWuA2hA/xOVq93mjIPi?=
 =?us-ascii?Q?Cbf2CVQ5C5uiQGk1g/4AaXLoHZZc+rVb1kP3ImRDBknWW24n1ZmCys92XWA/?=
 =?us-ascii?Q?0D1WN9xuWvq4qvdKa5fdqA80oLcWLeErGoGL2TpwAemG1ObnVjZSCPDb4irL?=
 =?us-ascii?Q?4r9bls1KP3JhUgv5bicJPajNFnkrYi0VMS2QuYuhP9HLZCbcvQMIguD+/k2O?=
 =?us-ascii?Q?D2wAKMKI0T/wU6Qd8tReqR4Ze6k4sCZcTmCEowTuXtOBGWvwT80++jBbPOQ7?=
 =?us-ascii?Q?D5NUxQahf/jpqYfbjimqD8Ar6/UtTTJd7oI+/evMmCTViVvKm4GZXQ6rWAuY?=
 =?us-ascii?Q?dBv0FGxuCc5t46kZDR+XIeSPtHJPhx6agev6BkvdIbNYBLpBQXcXlHjuqVt3?=
 =?us-ascii?Q?qcoYrScTs4772vF+C8EHbI8JuxUTv2HHO78624ksrV2r+gCdxmjAfB652K5d?=
 =?us-ascii?Q?UQcBdXG/qhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UmV5skQbbokK1Wq+3Ztq7CrE76TDrLVpGgIWYk7quLWZMhr0waSGqCiwiTB?=
 =?us-ascii?Q?qvwGbI7KcwNhMMlCXAL6QIKDue7MHcwzWO1OY8sDeHmuIiPV1bBNVRjf/xQi?=
 =?us-ascii?Q?BOZ/pRyHMpHgrGloAWu64T4FF55NciAk5AWa1daQLxLT46UC22eyGbW9H7PG?=
 =?us-ascii?Q?ANFbGMBLbrEFjNLR9QaPak9sOhh5BywWoI8ustv+0m/l+EdOPRndkKOzYJ6h?=
 =?us-ascii?Q?8w1eAcWSdJaAycO2jGjiLRM5zX5n+Q5Jo3T6jI157Rdu1Seos+a16xDNAHcA?=
 =?us-ascii?Q?64oQ96Yoiz4zNPDY2zD5wWvF+jyZx9bctRmi+00a2d5bu1OAvFLAgt9V2cB4?=
 =?us-ascii?Q?DsV2MiuMBCh1qoWRY1AZFvgTwsXA38Tk+lqCYYPc/wTmptJellTJ9sYPBOtw?=
 =?us-ascii?Q?5OUyG4KzhcyfPPrSBRufq1xOP603PaF9WB1Tef7iE8/IufujTDmRy6YWzkkv?=
 =?us-ascii?Q?T8q9Vn+vypYWAfCIQTLMTBNej/Y0Fvx/aARcE762TYuef1v8XCWi20rdTxip?=
 =?us-ascii?Q?r9w4cIpkpQQa6gG/S/JETzTGqAtyZfENhDXIQIE0O9ilNyXi6xwAIp3ruv2n?=
 =?us-ascii?Q?tYcIeNGTAq3XC427TiouN9GYtrG6qTHUCkp9u6XGf7Yh31nds6EuOOYsZoE5?=
 =?us-ascii?Q?zuxG+hTDZ5TJ/UusfJYw+cp7JqAJzUpzgzosmQUDEVIhVmJB0Jzsh8uSg6uU?=
 =?us-ascii?Q?KqV2Nkx7LJOpLF2yIGOmfroizCDmAilyiVFBDW+NRbdg3eYxRC5g3GifK/SP?=
 =?us-ascii?Q?eVwKTo7y8tNSQ+shuMQc9hvF6xvlqBo7eLZgVa9AC2dop5dounyQnAne0D8N?=
 =?us-ascii?Q?e4aMg9FtQkemgq6N1raWdMHspPyv8QgiXxprRhMc9Xa0EuC16MVlMHYfAuaV?=
 =?us-ascii?Q?95seCa1HB/OwzgobZTDPrTgQC2LqSGZHhHU/1TKHhUXEuA1paRjtWP8eyyAY?=
 =?us-ascii?Q?2hZ/0AwL9U4j7Lz1bHyxysfE3S5yrMufSxpER+ZLToSSLoed25J+0rcc7vnk?=
 =?us-ascii?Q?xWQNNZ/HeI8mhvRXlxsqsimmCPbrueZGJxT/caWcPpKvy/QG6mXPKwCraJoR?=
 =?us-ascii?Q?MSjsgloiaNeQvIam/6GIugQ6YnRSJo2H2OPd5zGCmneExoHxzZzeCXLDi0SR?=
 =?us-ascii?Q?fi+CRi1X/krB10s4EOeyihKBkxVkdzFMb1GkCTk3mzBWl171LEHbmlt/MGsZ?=
 =?us-ascii?Q?fskzLeMD/743n8C1yAGRTUivU7/wewwsLGcOBdpD2+X1J/Jihb8LGxbbqByp?=
 =?us-ascii?Q?UJ6cdl9uG/KO+LrL31P+lgp87yZ6dPf4gMPdy4SCO9ZsC6/sf1WPmyqRJyOO?=
 =?us-ascii?Q?r2Wz2vbmbaZDGVgQnxvjLLvYDuEUjVtbwCgZEYRgO9Ui8hL7jTYzMMMtkUiP?=
 =?us-ascii?Q?4Ewz/jkGJb8KmHrx/Gg3kCs/fh67rsSxk4+brfDTWCC/meTjW1Bywz1BaRxp?=
 =?us-ascii?Q?fz100v6Q10S4JGpYJVVnyEp5F3Goko+eJrVeKZFPxOhMBMjt55gYc9dTWFtR?=
 =?us-ascii?Q?TdGRXkAGdoOsgE9pdSXe3D8/N7vkjiQXycTtBuemPFVnriK3gaZyshjnGMyA?=
 =?us-ascii?Q?xofwUG93fpxefjjY9Jh+3vN/xMP27jspDr6yqgCuwDjSuIQBH8bJbL2Na2HJ?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb96d5a-bac3-4cb1-2b7b-08dd81b84f8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:11:16.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJ3NRYR1fyz4nbK8rcuZCV9F2VPkns8FHjxYvWVJJVE0XlqCAavK5jJHKw0plO64xQNGLpSp01cVyJb8ioaUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
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

On Tue, Apr 22, 2025 at 10:02:58AM -0600, Souza, Jose wrote:
> On Tue, 2025-04-22 at 08:40 -0700, Matthew Brost wrote:
> > On Thu, Apr 17, 2025 at 12:19:54PM -0600, Souza, Jose wrote:
> > > On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
> > > > This commit introduces a new madvise interface to support
> > > > driver-specific ioctl operations. The madvise interface allows for more
> > > > efficient memory management by providing hints to the driver about the
> > > > expected memory usage and pte update policy for gpuvma.
> > > > 
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 97 insertions(+)
> > > > 
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 9c08738c3b91..aaf515df3a83 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -81,6 +81,7 @@ extern "C" {
> > > >   *  - &DRM_IOCTL_XE_EXEC
> > > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > > >   *  - &DRM_IOCTL_XE_OBSERVATION
> > > > + *  - &DRM_IOCTL_XE_MADVISE
> > > >   */
> > > >  
> > > >  /*
> > > > @@ -102,6 +103,7 @@ extern "C" {
> > > >  #define DRM_XE_EXEC			0x09
> > > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> > > >  #define DRM_XE_OBSERVATION		0x0b
> > > > +#define DRM_XE_MADVISE			0x0c
> > > >  
> > > >  /* Must be kept compact -- no holes */
> > > >  
> > > > @@ -117,6 +119,7 @@ extern "C" {
> > > >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > > > +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> > > >  
> > > >  /**
> > > >   * DOC: Xe IOCTL Extensions
> > > > @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> > > >  	__u64 sampling_rates[];
> > > >  };
> > > >  
> > > > +struct drm_xe_madvise_ops {
> > > > +	/** @start: start of the virtual address range */
> > > > +	__u64 start;
> > > > +
> > > > +	/** @size: size of the virtual address range */
> > > > +	__u64 range;
> > > > +
> > > > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > > > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > > > +#define DRM_XE_VMA_ATTR_PAT		2
> > > 
> > > In my opinion we should drop DRM_XE_VMA_ATTR_PAT as we can already change the PAT index by unbinding and binding the VM with the wanted PAT index.
> > > Similar for DRM_XE_VMA_ATTR_ATOMIC and DRM_XE_VMA_ATTR_PREFERRED_LOC, we could have those properties in vm bind uAPI and if needed to change we could
> > > unbind and bind the VMA with the updated attributes.
> > > 
> > 
> > I had thought about making madvise patch of VM bind too. I think it
> > could work but I do think it further complicate an already highly
> > complicated VM bind KMD path. Also the idea with madvise, is it doesn't
> > actually update the GPU page tables rather just the KMD VM/VMA
> > bookkeeping. My prefence here would to be keep this seperate.
> 
> Looks like of those 32 pages 25ish are just refactors to allow madvise support set these attributes, maybe if those were supported in VM bind uAPI it
> would take less changes...
>

Maybe but I honestly doubt it.
 
> > 
> > All of the above attribute are really only intended to be set by
> > faulting VM which Mesa doesn't use.
> 
> We have plans to drop scratch flag from VM in Xe2+ platforms to support a Vulkan extension but that will take some time...
> 

faulting VM != droping scratch page - it means the GPU takes page faults
which are fixed by the KMD. This has a consequence of not allowing
dma-fences (drm syncobjs) so I don't think Mesa will be doing that
anytime soon.

> > 
> > > > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> > > 
> > > Mesa can make use of DRM_XE_VMA_ATTR_PURGEABLE_STATE but not the other ones, so you will need other UMDs to land those.
> > > 
> > 
> > I could see Mesa using this one, but again this just flips a bit in KMD
> > internal state - it does touch GPU page tables so would be goofy to
> > implement this in a very complex VM bind IOCTL.
> 
> This one I also don't think it belongs to VM bind uAPI but I did not knew it required a fault VM, we plan to remove the scratch flag from Vulkan
> driver but the usage of this attribute would be in the OpenGL driver, so I don't think we can make use of it then.
> 

This one can be set without a faulting VM - it means when memory
pressure exists and memory is idle, it can purged (not saved) rather
than evicted (saved / restored). Same idea on suspend / resume.

Matt

> > 
> > Matt
> > 
> > > > +	/** @type: type of attribute */
> > > > +	__u32 type;
> > > > +
> > > > +	/** @pad: MBZ */
> > > > +	__u32 pad;
> > > > +
> > > > +	union {
> > > > +		struct {
> > > > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > > > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > > > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > > > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > > > +		/** @val: value of atomic operation*/
> > > > +			__u32 val;
> > > > +
> > > > +		/** @reserved: Reserved */
> > > > +			__u32 reserved;
> > > > +		} atomic;
> > > > +
> > > > +		struct {
> > > > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > > > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > > > +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> > > > +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > > > +			__u32 val;
> > > > +
> > > > +		/** @reserved: Reserved */
> > > > +			__u32 reserved;
> > > > +		} purge_state_val;
> > > > +
> > > > +		struct {
> > > > +			/** @pat_index */
> > > > +			__u32 val;
> > > > +
> > > > +			/** @reserved: Reserved */
> > > > +			__u32 reserved;
> > > > +		} pat_index;
> > > > +
> > > > +		/** @preferred_mem_loc: preferred memory location */
> > > > +		struct {
> > > > +			__u32 devmem_fd;
> > > > +
> > > > +#define MIGRATE_ALL_PAGES 0
> > > > +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> > > > +			__u32 migration_policy;
> > > > +		} preferred_mem_loc;
> > > > +	};
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > > > + *
> > > > + * Set memory attributes to a virtual address range
> > > > + */
> > > > +struct drm_xe_madvise {
> > > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > > +	__u64 extensions;
> > > > +
> > > > +	/** @vm_id: vm_id of the virtual range */
> > > > +	__u32 vm_id;
> > > > +
> > > > +	/** @num_ops: number of madvises in ioctl */
> > > > +	__u32 num_ops;
> > > > +
> > > > +	union {
> > > > +		/** @ops: used if num_ops == 1 */
> > > > +		struct drm_xe_madvise_ops ops;
> > > > +
> > > > +		/**
> > > > +		 * @vector_of_ops: userptr to array of struct
> > > > +		 * drm_xe_vm_madvise_op if num_ops > 1
> > > > +		 */
> > > > +		__u64 vector_of_ops;
> > > > +	};
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[2];
> > > > +
> > > > +};
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
