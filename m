Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4921C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A356810E0A8;
	Fri, 28 Jun 2024 20:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ns4sLFP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A4D10E0BB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607243; x=1751143243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=prQXfaLxQOVggAFHns6iM3TptuMDf/LC3YudDhN7to4=;
 b=ns4sLFP8b52DPQGMy7ONAoJAxDZqDnBM0H77/WPy1Ru3V4xC2EgXo59M
 ub83D8ue7mAd92WJ6vRsW8lwxlA4J+/h0lsphCDWinLCEJDNcP8iaBIAa
 CH7hQ6U20h2TXDoyhnmzkhTKYQICoQoZlV5Z6LuQiLcAax7Eg5lURd/pz
 OCIbrITFEXQ2dnuC5MQPiGtHNPdYT8w9kYhDEK3d3iSyRWRpRPAcF0aIB
 qp0jxcUR4rVwUffagrnF7N/k92wwF7JtBkdWlPkzbJUE4TvOw3YPR7h3k
 gldY1TzaTJEf7mynzMVTIeHxs8kVU8EJgytEhZvh0ux56WCTIFZTdCxif Q==;
X-CSE-ConnectionGUID: SmCYRYboRtyGC1TN6jgN3Q==
X-CSE-MsgGUID: fIHJfIXRQCCkiw0U4VKmIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12307487"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="12307487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:40:42 -0700
X-CSE-ConnectionGUID: z3oc7YpQR8iNqfYWyWWnZQ==
X-CSE-MsgGUID: v+Qy9NFZRJW5ZC+r42VoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="76033577"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:40:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:40:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:40:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKOgMJUR/arEPbQ60H0OaTZYtRUMv6GfMLiPkX23kxCg3AN5hKmfIY+/bIedtJssgSJqP2QU9ium17ETbQ0ZOJlAi3XKjm6yh+W2vlQvxs7kNdds9BqeoSQz02/v/E29TgGCs1efclcMYGLXVZwUwqtoombLNwqviSD+8a7Rj2Yhp5ZD4rYFe/IpFL8N4/vOZY8iNccSoykMIXrbTJ0Toi7auY42trQ1a7Zn/djpjzjxm4izvvKf7pbrsNw3TwrGRRzsmkVxHIc4UyrDlT7TsVAXXpCuRvYLGhZDZlnaOxFBMhhOQKfJbBQEWGHZlqO9tb097lAwRbtpX0fgUZuciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZrlAz7Yikl6g0cmf/g4O4gvrwpM2uikt3JYIiCpEvc=;
 b=V8F6fg2ws1SwllyNldM7H83wQEhsswegP/fPZNvp1lAtt2lIDWcMoclm23kLr27jCuDNBcjChw6u+n8Uva8JNAIQSc3sUiwP+Bhv0v9e7CfM3bIq6mPkqxOuxLGCeVPmTx1pb/Ky4LnP1JtBWZaClk4cW7Nc9Pi97DWqofi6/akvbk54ASvpurKzsRiaN5KWp+9am62Dd2fU7QufnVIeix8wK1fF+J5oF9QX8am9mf1AEU8H97rCoDYQHQLIznXIqX1KxPYGYOqmQC9G6mQFNN/nMuUs749jzrUvrVz+ZJaf98b+BW5XXVHyX++lCwYml3mKxlzriyO7NQ4LbpbNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 20:40:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 20:40:34 +0000
Date: Fri, 28 Jun 2024 15:40:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/mocs: Update MOCS assertions and remove
 redundant checks
Message-ID: <g7omhchknx3zvweqzqwkrbbe3hql74h2qidvzazhcs6jrltl75@wuxyxtaviutd>
References: <20240627203741.2042752-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627203741.2042752-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 92640feb-6ebe-4edc-359e-08dc97b28f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t23/DKckCzFrdpGVoPXCnHsDVzKmOxiMO/Cv0+daMDAUXttP1gkKDqbF2ovX?=
 =?us-ascii?Q?ljmJSaeaLS3o2cyNBbKL/lpKepnQBanJIHEYqBBISmE8QWxDxo9eqLpHcvTN?=
 =?us-ascii?Q?TkGVS4BzW5CEG9mPPyQlQY8a1ArqZw9+MzuAFEf1ePbW3/NEeaF1ZWS+wQK/?=
 =?us-ascii?Q?hSpOxsqohg69B6vX24Xo9K/QmB+siEF89NSPcb642MD21tl7VprBWMGwMD9S?=
 =?us-ascii?Q?UWRGlO/ZYbRuUKWAEdoLeNkJ3DILFcSrGU22VEMZD3bczs2Mmduf/6rBeEJp?=
 =?us-ascii?Q?3l/gLJN5Lktf0pEgHPgORRfiP4AGjOp3/rrILMMs9UokPCz7yUB4cNgMw2B1?=
 =?us-ascii?Q?p/KHmrUUdvMyFM3CK10zStOtVCCNgMvsqqI1VNvga3neLAkOdRHqh6ougLAr?=
 =?us-ascii?Q?9Iz3Ne0jXDSsvNmHYCiS24Rletm4dRVlULgh2NDy5TlO6mZ8AWRQJi5eWcE0?=
 =?us-ascii?Q?lk14VmdVTRl62kxYEyCp/UaCb81mtmxgCAlx5U4D1qKGIsrACNigYysjoETI?=
 =?us-ascii?Q?9nCvPpn2dxBpvSvGX+nIx3K64fx9s3DmseqKELtpnmAfH2qOCfPLsdn7WpZA?=
 =?us-ascii?Q?N5lA972RI8i4DM1fOGdtE2uGxvRL/e1cqjl9aBuZCvkSW3T9jw6Mgfo0zTIw?=
 =?us-ascii?Q?3WW7Xs0baANlwCNsR4AMFe5m+nMXB7T2I4CGbYTp0V1MUZAUmVHMzF2Qr6sm?=
 =?us-ascii?Q?QuCZbdpazlsxTKTkQTmRsQOYvTIQAcLWQU1DJp8L40nlWg/JSo/YOkyqN6G0?=
 =?us-ascii?Q?bLOjvr3ZzAgstqheaK6JE/7gaWWjAeg8Ztq1QCR+UVa3qgIop7COUijlyCP7?=
 =?us-ascii?Q?gJkJdXtWZQWpnyAgexPFd233IAMoWPFHHK/g711DJ4l8gsmotLk3I7h2EuWv?=
 =?us-ascii?Q?HNO8fB3DCdQJ8McwzZJEcf4oCYZCoeBnTBe1tp790zXOr8H/RoDeE1X11x3l?=
 =?us-ascii?Q?ImDavgfom6If85wOi3mvlZE53xh6wutkVoA0d3zLp/H5WQsXn8Y4m+6wtH5v?=
 =?us-ascii?Q?XbIYqQL0GMbXnjNfCd3rdsZyOqA2Ncc5+jOVXz3RWyPjP14i9gEaRot/1c5H?=
 =?us-ascii?Q?TGR7s904I5rMkZdQKsgCPYwsngdXYZhs9J4N6Lj2BZLZnz2O3TI8YWPPklaP?=
 =?us-ascii?Q?cMYel/xfPEZdS0MGKCL7TyWWsWovxsmeysfu7HLAjL86tlVLqbuaL0Sns/Bc?=
 =?us-ascii?Q?VoSZUVKnDkLBUeTr0nbRaeD44XPMdnmHctyXtxxu/tsR901XsPeMoELGx96t?=
 =?us-ascii?Q?o0Ti9EUNBkoc3F5Wj+Ua729SpNihj745FeULhQeFospmRcEP0xPtgPQb1Xsh?=
 =?us-ascii?Q?+ewKYDIXmACjHvjpT987mHRdgO9TrHiBqdfPcSDnR4JbQYnkHtHfFxfquJB8?=
 =?us-ascii?Q?wR68qSkVRNQSEAHVursjG0fLASsF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ITORsfkK90Svu4vIX4Au6eoCQSiWN6SRnmXwTsqjHhJ2YfxqbMBkaoaAHPt?=
 =?us-ascii?Q?biuwR2YHIwlL7nIycrDwm+HZqGFD/cy9iNkrMx5udcCmH6rai5Mq0Xsn+yFy?=
 =?us-ascii?Q?XSONYfdtYsHeQdnrHNbgcAj73fNTYuW9nOX1jk6aJER2SK8gSdofpDxzmajk?=
 =?us-ascii?Q?7h5FOY/y/9y9gKLv2U3+Wr0EQHHKXr8gqh3IQEa9XPtJHcoWi+KzXKbhHDVd?=
 =?us-ascii?Q?DIJVrZmo1c3U0QN6w8Og4wGNVQicMJ0PTnII6rt4UhW6Rit0QGi04HVAb9gE?=
 =?us-ascii?Q?urr5+JMfkoVL0/tY3qPMOpKKdenbEr8itdPmGk77rF4SfqAvdecKEhgVIWC6?=
 =?us-ascii?Q?a2Ds1BV/4+PeqE1Uk3SFWUCBeBhvQCk/rjklmGoxFqXyjmeqEqlZvajReSw3?=
 =?us-ascii?Q?rESjABYmTpunuTGEgNO8LO+QfjmfHf1INKIjec+brqrGraj/MAbQKqvdSFWZ?=
 =?us-ascii?Q?SQ8wJUGyFoN4EYmDrQkaXt4Y09xOZrw+DfDC2rShyaz4cDHx6enDiwko3hA1?=
 =?us-ascii?Q?FsvQuxbUItzlZ4yBrlFLCHRClUuA06NctJB5oTcwEm2ItseTDcRWX2gljHNW?=
 =?us-ascii?Q?4oL3bkao7UFzkHYY6Ps/1NbnpusDNjWvm0kXJvyuxl0La02csDSwkSNd6Z7c?=
 =?us-ascii?Q?q0UoSU8XeDAdYgWX4Pu963Zlu25yuc1sTZx4qVT4pVrABwQ34a4GqXyQzzcY?=
 =?us-ascii?Q?KAIqY7eacn30mPvT8OmsRDkabGOltxCsimaxWW2IibJ66JqfkzaO+upDjnVC?=
 =?us-ascii?Q?NPaaqDK1KlK0gt3tt7lVccLDYtp3Q2PGZdhrHqBHVmQrf3jd4m+Za87LJMQS?=
 =?us-ascii?Q?+7+PgYJhHxdSJKH8zEg7IFVSIt94TX+nW0mz/TvamDvxbKOFqcJhfHKQzO8t?=
 =?us-ascii?Q?TWnE3IcrXsaG+OpNmiEP0IhdwEUdl8L1/r0oCSaUWvqN3w5IEPiNUI/O6bcC?=
 =?us-ascii?Q?4ZBScYbNbhvrf01kdHTQtmVTj+K8StdOga9DDg2xDbu+KVyXhG1ZSeDvEgZq?=
 =?us-ascii?Q?re+LiqgQFuMPXv0Npn4bZUUFrrCLBpjfPj7lJwGhRrh9idy680bqQAI+SvLH?=
 =?us-ascii?Q?dEc0u/QlN+sBM6YtvQ7Psf5+YPiDjhMqr1cttaYkawRDolfqfX2DAvLKU1Qr?=
 =?us-ascii?Q?lk7AkWy4pJo+aOY+A9QjwRGh0nazgnQS9o5C4sMTzNNpIf4QM4Hqn+R9HU1i?=
 =?us-ascii?Q?ATcq6DK/glpjQFD+FF3zhMytZBBmv5IPDItit2UN29gC+VTdCSaSjggKoAcZ?=
 =?us-ascii?Q?Ik4V19oH/tDiBLAtmu6ruAMvH4asF7Apq5mDqcWlZvLFLVyaGdtfbn82Jgcs?=
 =?us-ascii?Q?HscApv5VCZ1DHV7a8trkNaussRrI0M0cNDfyE0YHlkAa/2I0mh4QrxobG2Kl?=
 =?us-ascii?Q?UBAznl8L0xdfhshgVRINHygDDQEmVpXfYkrAGGBMSGxer4fyUkT2OnUvhnkX?=
 =?us-ascii?Q?ZAGsXrlBAoeIK6bZ3ytOdHZoUigrJ4gfkoKtu/yCHbLQjy+bhOTD1L4PCZsF?=
 =?us-ascii?Q?SD+7MbBuSGqBs84BGEnsUUK9MVQ6yhn0wqBQyUTWmi/EeVIiu+AykUJah58R?=
 =?us-ascii?Q?7+ax1iZZ1mJX8//LUrjBogY/ypESkPVBrWH/a1zYnHPH81R5ojmyjDN0oZRf?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92640feb-6ebe-4edc-359e-08dc97b28f69
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:40:34.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vwgd7WUBi/99x8AQjwFU9CJ7n81VJ7xs6x10z4xfOi5/nF+c2pZrFrVL9mN+ZEa0flR5cS95PhlaQ7EfIMunHFIJgpCRrHhVbLZ/1Z5q458=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
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

On Thu, Jun 27, 2024 at 01:37:42PM GMT, Matt Roper wrote:
>Rely more heavily on assertions to describe the MOCS programming
>invariants.  CI checks these assertions and will ensure no violations
>sneak in due to programmer error, so we can remove some of the redundant
>WARN and silent return checks from non-debug builds.
>
>Also tweak/augment some of the existing assertions: there's no reason
>we'd ever want a platform not to have a MOCS 'ops' structure hooked up
>so ensure info->ops is non-NULL.  Likewise, we should never have a case
>where the bspec-defined MOCS setting table is larger than the number of
>MOCS registers exposed by the hardware, so add an extra assert on those
>sizes as well.
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
