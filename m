Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619CC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 20:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364C910E1C7;
	Thu, 16 May 2024 20:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQx26CxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCEF10E1C7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715890177; x=1747426177;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=PNbInItyM4h1Rg7hNNX1o53dfLwtsQ70DrcDi800qUU=;
 b=jQx26CxTg0b72CFieR+pc1dZp3EZiesuL7kAkaXFLgX4dGFLHWaYVb4g
 iGWTtOrwRfOYXItU0C4Ayv6TYPok1SRQp7Ij9GgpDQhkoGjK/eEEXvLpN
 U5VpQVdv4wVjHP+hSo2I9A4n+ePMXC2Xz4ItVa79LO7HWV7iuMTF4Rs2q
 aECl0irlmkx7cKPY9budQbOUviDTWoZA8x+Dlk17DDnRGGmYKhWoQxrix
 zUlLDWEdrcf7jEU1xlkPp5LKk4uAVzYDkoJJqFw6eSUQiDBsKFYI+4Qhq
 nZ/92AVw7QPe//GhY2Gtaw2u+sJsmr/wTlsV0ILZw+ZFwc14X1z40ujo+ Q==;
X-CSE-ConnectionGUID: 2avWtRMYSi2kWeovl8BxkA==
X-CSE-MsgGUID: 7YyC0IQvQpegtpkNrBz90Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22614996"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="22614996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 13:09:37 -0700
X-CSE-ConnectionGUID: dH1Z4nCKSGWxdC2mbsO7QA==
X-CSE-MsgGUID: vaHdw5IKT56B1vbC/Wz6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31677407"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 13:09:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 13:09:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 13:09:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 13:09:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 13:09:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxUkSeG99Ftx5OSxdQCfCOvGNRkczZxNp81j2Ye+EeskdPySsW9g7BbjgiKzCNPYgXTrBdGF5/32WU5ISiDTCnYLH3bO1FbwKAVpa4BOdf2k6uXTNsA6UyBOwmjRtYNSHN+RpOshUxEK9hJK/NshLxJId3sJs1funPmy9yj0BYaWZz/JCLYGVd2RdG2pzFflxWgkWABh0EOXDPOC/DdzPo/GI3hj8PTmwVC79o8/SwkeX2psJq9t9TtyolEHlrRDnb/ZoUtgYb9tgpUZwVXMfIBNvg/IamoV/Nq1lAvQV4sQfa72N5Oxhjqv/nMpZb8vE0+/dHgw9sIjdw0Xi9hebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgnQQd1Xw98Ome5Hp5EaXwWGXjh1052DT9f72/rV7To=;
 b=IqX/hBm7CLuHSbEpClIAl16B5IQ7GCymhV5PCXbDBv22CI33TB4VByst+UquIwO2VHiL9q1TA4Pa7gAnA9VdmLcH4LA6wzb9cphmhU7VFT6Rl4v/m0VMeqC8wQz+UbMDf1SupVdV0eyolhvvyaGfKZOyaiQ8sBOeIbqR/J4b0eTk2bbITUmlWmiYvdvzquMcoWCRqcO34fh2WYHmikSZl/I6wRO3kkXsA4w8eLZDVmViYfX1mioHPmR43sKEyXNsYF1jF0naNexR5j00hEJN6BlX0gQjIlzlrYf6WoXUO6lbbeP2h3QTXR+fUaQ+xCUh8CtnvuS9nBtIY8z/6SDJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 20:09:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 20:09:32 +0000
Date: Thu, 16 May 2024 15:09:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkhvb2tz?= =?utf-8?Q?=3A?= failure for drm/xe:
 Per client usage (rev4)
Message-ID: <z3cr5i5ddkccxzlduqiry3jhllvhxkgfkfqkp6kry7hocs5grd@3x25gybalovw>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <171581100833.2118035.17065471464354631390@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171581100833.2118035.17065471464354631390@8e613ede5ea5>
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca7d169-74a1-4c3f-b5eb-08dc75e419e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jTW8uZEaLZmF17V10X+qkJIEfb8erC64Le4ih95fG5GulZ0Hk6FGIh39/aDI?=
 =?us-ascii?Q?jfZYAbsKUgNDthbbhDA5OEWQXRsJzopH6O0FgKIypVLvf8/Vp9OiFHe/I73Q?=
 =?us-ascii?Q?yzh/zGqgv5pYk9UOG1IzrQTwkccorwSSqrOXNBI7Xn2hVaoWCkjRadsdUpxz?=
 =?us-ascii?Q?jhS8PzSvLag/X3v6xD/39r63wHX4ADQKhlqOzXZp4zzHa/8yVXJtvgK/2rHX?=
 =?us-ascii?Q?iwmaxBCf9BquPtEHx0McVLI9ek9VUQX3Gld7eUVieeox2De6qyAh9m83ZL33?=
 =?us-ascii?Q?Rmj8urM7hMKTrLqbaD1wHkm3TBoToPgG8TI31LVyA6AYTcLx5yWkPTW0ljLB?=
 =?us-ascii?Q?1f1mpQKqX8i8bjwI9xLji3RP6d5j9zMSP2rQmRwBefMOyFUN50JzYqAAssCe?=
 =?us-ascii?Q?zIyCPcNF7lTWEtXtI5t3fx2q9AMSuZnNIft+GHGsNxHe8hV7jFVJ2/jh5NeR?=
 =?us-ascii?Q?fq2NEC8Nk3WC+mZdWXYYDYeq3tEI1W2wBpM3CxIO4UUG9PMpAV5WM2jWawqd?=
 =?us-ascii?Q?4g/gzcLZOxr0ehhEwY0MnHBNKWlPbZ4+BGgl89RjInC05A5u7gw7dUkC5kOc?=
 =?us-ascii?Q?eq3JzQVn0dq+e7zLhFbL0V3QyVeVLz3Ov5dePd4MIGwSnodZQRs0R20FkzV+?=
 =?us-ascii?Q?K9te+2D3b+GyFvvnI1Cap9syoXtRjgg1qDBfvFupIu1JC+CcY373P1KngT47?=
 =?us-ascii?Q?+wFPLd/5NPl/5U1qHvnebpzfEqi8fGQqxBJAXrePEO6dNfMEuFXQwt2ROo8P?=
 =?us-ascii?Q?yHh+0ySWCWG5jxn2poGqo2mbQ2mlxxryrSpCjBNQ2MfMVYnpIbrwGHbwWei0?=
 =?us-ascii?Q?lSNvwkF2Vh3x3gUJgpecQq8hqkNqPNy+L9wlOQQv2IG55+/547d6aUGaSFpr?=
 =?us-ascii?Q?UWz5/2tAAtVtRi3nyoaQWaXFgnfqAoJAo1zYfBGt0hU8HC5URhztog37or6L?=
 =?us-ascii?Q?eo6xWCUsZ81bSYqrA24DdU7g1vTmMUULVGUD1TR7CcKBXJ/hDM6xhOBa21vb?=
 =?us-ascii?Q?t4v2TSQQxQBQRmNTgHrHXb1tp/2IqELIqI4DjQx9mJ5cOl1Eb1bf8yLbQq9d?=
 =?us-ascii?Q?xleS3sZ88I1J9M9jfDqppQeGWrtPS/xKaTVHgkCQHIMZmy14eIqnucN2VYaF?=
 =?us-ascii?Q?E1l4buKK7KXvu45PGqdidmT4PSKV635a/EvrROIkuGKyj/vDxShYEiaNVoI9?=
 =?us-ascii?Q?CaKIq5b0B9eHGVFHQTbQv3xXu5i7upFB6ByyHRdCet1rZdQDuTvTeWMGTyCS?=
 =?us-ascii?Q?kcJR/xeTUjC4cdPBjS/qQmioMZnVZ2Kls9cbKUEf9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bUGcfnVqaeQnLsVinHDHL700v6KrcZFIU+mKiz6jZ30nCcxLl+ISRlU/dy8E?=
 =?us-ascii?Q?oU/BUIOvoyygq32fiTn7LPUc29yz1wVETCH8PKus8tW0pEWhMsiilixzVhGz?=
 =?us-ascii?Q?OLfAb3Odpyp7csdZy8jp1gvmfscudMitsfPiUZi3ilDeE/bQocZlra9Cd6t0?=
 =?us-ascii?Q?7kHL7x+X0lgDGlJIXT7oeQMgyosKEQ6B3zt/O2yIkxqhrgcPHLsLfqIJDxeU?=
 =?us-ascii?Q?WBPauo3qdlt2D9VOITAJo8R0Rs9Tk/HcUj3zSidzdG87/8tKPMXGbYAlw6v9?=
 =?us-ascii?Q?D9DuyCjlU+pCYxtbmx/WL85j2N1WKvEjFDGW6RTWhuYLF5eotany5YyuTYql?=
 =?us-ascii?Q?Gv4jva9xXXahRxgy8J/Z1v7kSaYLs9PpA4u+v/45znDXcFHzZ4Ie+41riePv?=
 =?us-ascii?Q?WHNizK2IVXEH/8qnp11lx+KHgiQkHWfONLXH0TqV4cc4Q0eG1bXk9q9HxYxH?=
 =?us-ascii?Q?SJ4cROa7I7ph4ueZ8BrDwFcJ4CR4fCJ6bEDdeYbl49trGRBF/GcHb2TgyKeL?=
 =?us-ascii?Q?55chYRAUGSeCtwLN9BXYQEYolA338N4czn0c6dwBT2H9+iPGBTsjxb0dlpn7?=
 =?us-ascii?Q?d8UnpVnw6IJf4eQAX8izmRD0AFtJuJaX/cwv35gYZXMgRdRvTBEpSjOTAdUu?=
 =?us-ascii?Q?tXYNioH0FQfH51br4a5TXXheXrDY+7MEn5yz/wbEkG4LppJTNKFKqyvTo2NH?=
 =?us-ascii?Q?Mvb8FlVyD8ETZ3LZ5WRm8k18TxxNF4tn1u/Zx/KBqwidLqof9A5JNmQlQELN?=
 =?us-ascii?Q?cFEPjWLgcoi+SPqSU3dUAwopI/3cLNAXcyzYhQw0bLq354ydv7YDcCOneZ7B?=
 =?us-ascii?Q?ZOk2OuEnIt8u7jw13rU3btgyjEyfwPSF8rioYzWIr3Xn68eEoZw4oofilNco?=
 =?us-ascii?Q?6Cf8SOsydgrtO6tsDK5veGkQvc3e3xglOq5j4mCFSx87RuCcaye7WJXcxlLN?=
 =?us-ascii?Q?STD7InlVemCouwbS4UtB8nWXEDI0v7sToSCZ9JjLHmV6xzSiV6uDVmlxOcV0?=
 =?us-ascii?Q?7j2u8H7qIX7BpP0GX6iIGHtFV6E1nwdbe1nclIIpWW6gqeurQNbSZKTdarT0?=
 =?us-ascii?Q?NJjdAKwetWXaBBZQlqma9F5vFNV5yMYPLu3Nu9nWAlrlNSBqr0SLtJhhyCnB?=
 =?us-ascii?Q?OK97AiEaayikr246wifXujTEALrQJNl8Fwpc4grnEMM5zYfsy7soVx7qct3v?=
 =?us-ascii?Q?1ru4TmXV8JqaWWhv75ZnGR1NEj51MrcTIyDirUfDnVN/PeUVBLpiEpJNl4Rs?=
 =?us-ascii?Q?PQAYmNw03zF09XJSkocDpzArBqHMbYVlW1Yq4KpeELx01oIopVaupjcerMgQ?=
 =?us-ascii?Q?IcFb89/KbO2smo2bY2RITWD8IfR6r/0IUadVk3whZWdr3hZLN4/T0EZUAdsG?=
 =?us-ascii?Q?FGf+KKQExGNKz02c2rc4DdlE7LQYvEYyihEB3q2UrLAXUoSdlPMypG5kC/7J?=
 =?us-ascii?Q?hNCBOFhU1ciVjyZZnzE29qsBlw0AVrJ3YcT7ItVsmz45/xicToaMhBsXuxHz?=
 =?us-ascii?Q?71OaQnh7VpTW4z00t7S3sFlv8hCvlAU6YFmgfxGTK0G4A2phmYBQZ1zdblD2?=
 =?us-ascii?Q?Geq0LOJAgHVSfkq3I0TeeR62bQv2VENzysS0oFOqICa7jaTeoFL2Y3sNCHHA?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca7d169-74a1-4c3f-b5eb-08dc75e419e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 20:09:32.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcfsCUdg0nTEdBQwpwm2OyEU/pCm2ZusZu7jYysYDdo0dR/uo3Frn2/P7nJKxWw4RLteCZcotSPHRFuvXdlcDkIrVrCI5GvxZC2mXqYTvNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
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

On Wed, May 15, 2024 at 10:10:08PM GMT, Patchwork wrote:
>+ cd /workspace/kernel
>+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'
>+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
>drivers/gpu/drm/xe/xe_gt.h:44: warning: Cannot understand  * @xe_gt_record_user_engines - save data related to engines available to
> on line 44 - I thought it was a doc line
>drivers/gpu/drm/xe/xe_gt_types.h:388: warning: Excess struct member 'mask' description in 'xe_gt'
>drivers/gpu/drm/xe/xe_gt_types.h:388: warning: Excess struct member 'instances_per_class' description in 'xe_gt'
>3 warnings as Errors
>run-parts: /workspace/ci/hooks/20-kernel-doc exited with return code 123

oh, ok. I used the wrong syntax there. I will fix it.

Lucas De Marchi
