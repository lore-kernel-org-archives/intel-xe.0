Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78F3C9832A
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 01:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228E10E2E8;
	Sat, 26 Sep 2026 01:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jy3oRzii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0621B882B5
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790384790; x=1821920790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rXwLzjnHSJ2ztN4+huUUNKors36QVb3q1zEd4g32NVs=;
 b=jy3oRziirmfkhe0+a/YXrRpCtVB5g9kjcUng/WvE5TCoU3zJYttcS+2q
 0ML89m7jvHSKGSoc+mc998LauV7UJqnM/aSDnaSr91TFFqlipjJXoMiHF
 PjZPHjgfYFAsOSOt9SB+6npUJNg6QXKh7BiTQZtyE2LHvoILWXwUUkRVk
 6n7KZCaIvudUR3HoTqAuXFioeLxj49TNKej9vISn78/d97S2Cg2ZeWsM+
 1d9pN0eCfT9UHvn9wFBKfybYKdSI3LhfdEDFzOsKpoP3jd+MmFkt6zjHb
 ixv7vf5MDhWxJlcQML+bKGGTLUiOUZbCh1zzVO5FvpMZfjMDFEjwmaBMj A==;
X-CSE-ConnectionGUID: RDOzXeN2Q6iIQgsZJFSq2g==
X-CSE-MsgGUID: QmNgS53ARWCsI2xLEqu6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90299565"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90299565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:06:29 -0700
X-CSE-ConnectionGUID: j8MUaPMYTLaQsNZ+0Eidmg==
X-CSE-MsgGUID: ymifrRCST6m1RyGc/+fV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="272630763"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:06:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:06:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 18:06:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsvsJDbztcWx2SnVILHoJAqehqhY2wpndAgcSUwdfnQaBYUS8DmrlvURP8koFnCIE9OPmbKF5i8xijx28MJhC7V6PPX+I/CBUxoYvAuqq+d39FGmlb0XLMkIg9bXqmBA60F23GFhFjNpylkJ0YMktW5sVD+gzng/a4fYrbdhJ3v5xvrvT0xT4IIm1AwCK4EQFGGVl48/0nQHZjIa7iKqF+pbqpjddLPcPbv41cDv4TZZ98HkXN2/n90mRMpeBDrHr5TxuNYd7TBC7DeecMnixiHnQX1gxwxQVzY5gd/kPDwZiSTZORXjbe7lz3sLU13uK3c5ZKSDJMxiIjqfheUTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwVJKzSg+DWbHm0j2+9yUS3G630s0Oy63zsFEysdCbQ=;
 b=Eo3RjSQlGCzv282wAnb9dtN3/a0tHfV6IwJpgRMc6dasSs6QlmisxhcyEmpLf8SOhTxjtwQd6i0hcoEZApww8kUObK1M+yDYQXbVJW08ahLvyNct8X6Kd+LDstgWLlJpWb7DNxRP5BDbNmVPbYyCGrSL2wHEARh3X5PubIj+voQaLRGOlvhqcsvly0g0+mXGn1baKHoRE8uhVB3BO3huW7xADJmqKGEPIwnXd35ykZZ5XHqAK5sqLD64xCl6OY1Bon9WVZzC4i3QwZ75uUM/BGZM3IBOR+RGOwF/K3qp0sT0leXS4lXa2LQkv+V0ro8Zf8jIGHQsCbvEGH6vFJrYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 01:06:26 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:06:26 +0000
Date: Fri, 25 Sep 2026 21:06:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Violet Monti <violet.monti@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Message-ID: <arcahvIqBmCytAmw@intel.com>
References: <20260922165607.129560-2-violet.monti@intel.com>
 <arL_YfVMnFsqzzjm@intel.com> <arQIKbgr4QbAJ-Lj@vmonti-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arQIKbgr4QbAJ-Lj@vmonti-desk>
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd2b601-ef6d-491a-4b66-08df1b6a6359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 50l19b9TrJwMRyhDrRr4QAuXSgFhDDf8wdIeEb5r8c0XCcOYSDQqIS0/YG5Ikbr8cromLMNkLlDAgsKGZJjaXW2qODNhMF7dQ02xVo50f9tPqMGn7tDw9zcL+qUVp6WflGsnI8SuiZ1XEoYegqgdOwcS43elZrBcNMYki+EbpmIAYXPEk78/w2GW5TNsgr+lgHL0n+QQzEN2mpAIsyCaZIBcmIKIbBJFmg1gpWwQRt1BQxWueaV0eJd9/r2HhMZvOzr8rM7LEF4YBjrbqsThhzMXyynsYOJkg1rX4hNkQsRxd78ZethbtQwUYQwVKUQ8+H05aWv4S3fbma7nxQJGQ/2nZRkCe5jq4FFkjMQ7B8WJSvYzY7kZA7o85yL2ZA2clQh89AN/z571x0BXw+LmhKnZcjxqY+DWMNQHFtX7Lt2b1AU+grmNknYJAetJHtWf4X5FHPuwhH9+px5xMB1MCLSAbQZzC3s1US5fnrPS8hLdp3gv3lJkXXM5kll/H0WPL+y2ISMpWX0HQWchb1SrxrP2ngDtFPUGloxX7IXMG1JtolQfq2Y9BhAWhJnR08f8unTtTdjBtIe8ELRb8bheeLMXQtzJHyQEMzZE36VJ8O7ECcGcdz+rFzatC5bB/dNENcObOpym059zaEbRdPSQN8Bir/Rs/kUK1mioVjXeGYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YAuU/R/ko7jBsvudI0XBTseP5+EPRcJ9sPwodppgpT3pYNIpH9xDALxIJ3cr?=
 =?us-ascii?Q?joipAANwcdf9Msf5067eI7xh0DI6B7aVYDmQGCmkRJBNv0sCHu1h0IiCHhAj?=
 =?us-ascii?Q?rS6TaHdKVwP5aua+SfzeEEYrKxp6Q0cSQucer3g9dEYn7umMC78qZr2MLOUw?=
 =?us-ascii?Q?DPogY3LJoUlVeuwv4RfpAgz70hgdvD3s0qImEBUh5TWt6qUkrQhrjvgUg/Qb?=
 =?us-ascii?Q?A60wtECEoHicL20rpqOFJKzlp/P5dSUmratQe2p/LdPtyYuk3nRinC3a5C2T?=
 =?us-ascii?Q?FYug4GnDJkYUQhSh/CMDTGwt9/WaN46v169YrqCf/OsBKr85GyApsSu5IzoR?=
 =?us-ascii?Q?DZ1wlEN/P33ybErQ0gkqblqYXXLivMoqdUUzh7L5m/fodYECiNNm1hKPLGga?=
 =?us-ascii?Q?AZLHDUeUdYK95XLJcAgFMpHhMB5G+7oF1wmYsAv/Q2wQ8eADfBbQM4Fyaagw?=
 =?us-ascii?Q?cIJ1TvQBXXo8lhwoRrgFU0DATn0XE4KxYFN91nwDNMyDv6swXw8ud4SOOOVa?=
 =?us-ascii?Q?Tu4mOLZ+G33oVz1Lza5ySLRfpDpGa7502c5GT/jWt0OWSyMb1e4x1Eb5k8IC?=
 =?us-ascii?Q?neQQNBYmfrRZz9bJQ9f58Ae/hIcN1eYrBDMFwWbkoy+imsrWfDl4MkyXZ8mu?=
 =?us-ascii?Q?lPlWAu7H7IRxVUrOmIsWBoSRYGROXe9HI/WMVU2xArl54SZSV1LpadmrqM1+?=
 =?us-ascii?Q?Ia93ArxuGkRdLEy6dn/6DWWWMm/Brh5f2yatiCiOFP8RNInna4VfJT8vVQHe?=
 =?us-ascii?Q?16k60U/CINWR+sJGXl/zMpGj+/TsgpOqCtqg1ik7aANdSZBlQHGJJoYwWgvQ?=
 =?us-ascii?Q?TFOWCXkgUPyLAdGyPFSFy0rPh0VTLQ332CT1PVn47l65sIyV1fSPvcVAgcIB?=
 =?us-ascii?Q?BJwIuL7gEKbVTlks3cZPbjmgTsVCKbgFRrfbFaBKD4kcMxLdi+F3elMmr1Uq?=
 =?us-ascii?Q?uK4UhzWANZ65GNe/y6x/oe0HA0UHVP+uugRZp8wOqjGnOwHmSW2Nc1MaD1Ik?=
 =?us-ascii?Q?1akoL6ELXnVfju6OBu9xbdHe5T/9egaMrbk+32dAYdm+82AR3qdWu/haXyYY?=
 =?us-ascii?Q?cwoXM3hS3m/z8HU/HNnFZxZ6CYoaAw3UP31qagiUqNrMHGXOut44FkgDiO5o?=
 =?us-ascii?Q?ELtrUjUiyRdkSaGilENS8SHAfnm+GZpuZeB9D5XjF5Twh8MUDTlbOAcTrNgs?=
 =?us-ascii?Q?M6Se+2gPf3TCk88rYZ7Ioywv+TfqqSvARn87dBUCXx9/iPvb6m+lMLVckgnz?=
 =?us-ascii?Q?26TiPvIlK4UQqWNlYAtEaZNKTaAVBD/OMZwVglThYE19LIjfjuDnA9Rt/lJJ?=
 =?us-ascii?Q?lU3TG60/8hrhI71OtfBwNLPk5W4WDWYqtQWWM76u0PyQwSLBJArYt+H7wCob?=
 =?us-ascii?Q?03A/ST8b/5xUiGkGiU7rvaGF374OEJJP1AOLrDQUWx7sYFg7x+QjJRrCLheO?=
 =?us-ascii?Q?NxSifIU5xrOUi/sPP4e3M5pjO7a9Wly1UDhih3G5uQ59v8lJI+ybK7b//Ih8?=
 =?us-ascii?Q?Qn3rYcJyXccHEH+cQrsXeysahgpnM1pyOxBR3GuUEkwB0MN+aWibDH1BvBaw?=
 =?us-ascii?Q?LT4z6JWyXY5ATUtim6AE7xaRqT4Gm67AVBtW/8b/K0Dl+CJTUu3Oo9QTg8xA?=
 =?us-ascii?Q?8q/NKik7Ywo8B1cE3GahnKculVHbvWUBjef9XjsunbvP0d3OVdp5cSEl+PHr?=
 =?us-ascii?Q?Itsn5pUrOW+KHU6tJpMB1OMVr4Dw2DBkz+Az5AY7ofUvjhBnKYJkMuvUUBMn?=
 =?us-ascii?Q?Bynbc/72fIaIuEW11d8C6708a/vEwwQ=3D?=
X-Exchange-RoutingPolicyChecked: HuW0ReJce7YEKTbkBjlWwV96udfo/60n5FTUQLKXS9Uxron6k1XU4LDXobXk+pisfhdzkFZrXLE1pZPvuhcXxtFAzmC/4SKVlsQVXUoRkAI3m4s8KsTv+9/5NW5jfgn2EoPeJbRe1FHg8ZG+IN6jYIXkbXX5JUM+d3xAAGTR2gIz09T3+iC+HzXfqXesQisMXjvm3eZy1R0+oFWlv5ISBwx6OOL0LSVSjM4+A93G2I4EpeKHEbDPWuL0AourSYgAr0R6TRAQNMkpGg9+yhsn/JGgbH/xySig01H1h2L+ieP4wFY1j6FtQWlvRd5YwzxuRf1/uKarWSK9sDKEnDYaQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd2b601-ef6d-491a-4b66-08df1b6a6359
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:06:26.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNARR02WgQWinPMDeqFE/6PUNkliO1cwiF1o95UbqlH+2zq+Movg8rjgZNeuuGKMjLbblguhpi0MmOCoZfh7vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

On Wed, Sep 23, 2026 at 10:11:05AM -0700, Violet Monti wrote:
> On Tue, Sep 22, 2026 at 06:21:21PM -0400, Rodrigo Vivi wrote:
> > On Tue, Sep 22, 2026 at 09:56:08AM -0700, Violet Monti wrote:
> > > A new PCI ID for PTL.
> > > 
> > > Bspec: 72574
> > > 
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > Signed-off-by: Violet Monti <violet.monti@intel.com>
> > 
> > I honestly believe it would be better and faster if you had just reviewed
> > the version that Matt sent yesterday instead of resending it.
> 
> The reason for my resubmission was to rerun the CI results after a KUnit
> failure unrelated to the PCI ID change. Matt is out for this week, and
> delegated this patch to me to review and handle in his absence. Since I
> am not the owner of the original submission, I was not able to rerun the
> tests using the resubmit.
> 
> Is there a preferred method for re-testing patches that have been
> delegated, such as situations like this?


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
and pushed. Thanks for the patch and diligence.

> 
> Violet
> > 
> > > ---
> > >  include/drm/intel/pciids.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > > index dff389b56eb3..32c88a690ad8 100644
> > > --- a/include/drm/intel/pciids.h
> > > +++ b/include/drm/intel/pciids.h
> > > @@ -880,6 +880,7 @@
> > >  	MACRO__(0xB08F, ## __VA_ARGS__), \
> > >  	MACRO__(0xB090, ## __VA_ARGS__), \
> > >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > > +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> > >  
> > >  /* WCL */
> > > -- 
> > > 2.43.0
> > > 
