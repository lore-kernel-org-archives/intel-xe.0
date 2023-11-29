Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DA5C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9118710E576;
	Wed, 29 Nov 2023 14:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85F210E576
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701268581; x=1732804581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7twybpLrJMeQNieNy9RDC1Kl0u6RJzwzw/R8J5VZHPk=;
 b=nDblrH8fEwnhwaN1SWKVWHLZlIfnsu+p/0vPJpoqSRb5tZ2JbJ2H7Umi
 MXTZ+HfFNf9qraj2sEYuu3XX6Xq3y7QIwYo7LeIhMhK3Q3THNsNBrNk2i
 RNOI319LCqfI9RYSBujuYEohNQFICeKHwEbrv1c6t/teEO/Gji4R0L3og
 Spna7C6aWC6KjcMARwtO8wbA2R649CXJEuGnVHf9Cqb6+p5YRLmXzjwRB
 +CFx8Z5TqHofdwDXHavOKSb3piZG6SsF7ksIadY1c/8aG3NxsmKEPXNMb
 gc92Kj/etWiFKL0elG87u3Y1xfrpNkGKph/AvwG87lbrIaOSaZ6mUmLD/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="424315917"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="424315917"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839446418"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="839446418"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 06:36:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:36:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 06:36:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 06:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUrlMKESnAGpY10MKAPjrAeon/uDsmOTYvzKJaf5SNvRoxnWZ7aFjQ9KdtFUbTQWjlWdKB2EbXiaYDPYLrjI76k2ajaCldHpMXiGnUHtVE+QmkHafj2JVFrYLw2bVJZSzdlAAy0q7bN/MkHVS0yeKjiQUfibpL4EyYmpAhGgh0Cek4mUXIWIcV7npDQ5MV/rSjPCF8UY9m/Aud6HXqX+1UuMRk+uPSiPQOkFwVDWUFzUnn0G7BevzyOFLw/ls1cFPDf8BAlDX+VDNTv5hE6F1yKzjU9WpNWGMtEXeHVTapBPSjS/LF9yXCru4Idb2RjO4TDOpgh8u6L3xz2WoeyYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8THswXqEhGItxpKxLlCCyd3IfmuSOA6nr6gX2qr/jcw=;
 b=dWeYJNNeMwlll+zntlnkOFkIJo4JNzCxShasIaCXeUt/lPc3A4ajNLr0gHe1rHHrQEDkVl+LzxLTWQm7hJ04GBO3FRSYofDJzzhZPfQBoyzSa+57FwpfD0/gg8O75gTWPeFHexpZaljlGeNd2+xkUMfgl+9JVhxPNKMx4DxsmKNkjV7fYAnwGp0GTpYhuOB5EawtjlhdjjoR+AaP4kclSgiGtUgQY9MG0MALKqLQ7ahblMgTz/YB6TYQGH+aLM9zocIPuwSdMw9414oF34o+lWYv07rbXbnxsbky4L2sXPlIHhDqJY1Ddte+UtGC0y88/tXRrLinpUoK6QGiqdGWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 14:36:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 14:36:17 +0000
Date: Wed, 29 Nov 2023 08:36:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <xzcdhyohbgpi4bhhftjwbk7yfjdrg2iaj7mpb3ten2u7s6zmxr@afzjeti76ad5>
References: <20231115112921.1905-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231115112921.1905-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8aff0d-4939-41b0-bad2-08dbf0e88bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liSA+J7v3b2MqiZwZtb7w3UD3XIDA+n3sFSqyhzkqI7xRJl9SSCb1Owd3cNPxUhYT0D5agne8qOiIQaYu3KsjFbSdo8JbsQ+e9AAkiJ1rn6yOAHzq6GbtS6IYSOTH3aBYhSfqO+MIt3MuE+si9a7URFDQTQmoDFpzV0hSDZIZB/Pu8bBK0PFbsWukH4Yoa2x6PoHt4q5+JB0VLCJF7Sxc3KYDHAQ26v7dC01l12szn7i8311KMvwoisVxcKbZomWDcCTWnT9EOZ8jVSh4D5cE90/gwoXIFXZOmiBNstXCp6IsBxgKTzb+fiRdrcWwDfCzHrjlBUOQ62BuphEMhwiNML8YE+PatsB4Mmhdr9CLmVeOfB0lx6W6+cosJ8LCbiGqCN0gqCCwtjNgPjkFKeX/a3BJIXe3olbUbDqPKJD+hLYRNQunlpnd1aiMPdUT++C+LgEFJssdh2dpBwgJzsBVEHOLL1SS0yTsz8Vdzv1QgEtaXwQO4eZoqGI+3IpitUEykbmrMoBlpE7bm+JeSqDm+28pBkBftiHugzt9+KsMyvNyRBg08KllKn7Tgx/nZ37
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6666004)(8936002)(6862004)(4326008)(8676002)(9686003)(6512007)(6506007)(316002)(66476007)(66556008)(66946007)(6636002)(6486002)(478600001)(86362001)(33716001)(41300700001)(38100700002)(26005)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/9Z3xmDsu70dBXyesla4bEop/fpUxeV7ywCQBd8barLRVXx2T+7FJoiL9n64?=
 =?us-ascii?Q?4KyF0m0xBxfBxE4wtCUA/KMp19s3g+mKEEF99yle2qaranPKEAh0wkRZWC4t?=
 =?us-ascii?Q?Fcp4F954zUj3xSMuwqaSVj2iS/rtHY7moD89+0UV3t4VEKoVTmp8ztfLErLF?=
 =?us-ascii?Q?Q/OBmiW7lBGR0Ft5pYzbR7E0pj24ErzdIp3FbU/MdPGu4yBPoj2AT5tw6WeT?=
 =?us-ascii?Q?5zUqN2itFgzlYHLlBwDSmVNRdhrJoWV+DCfrGZ+w8hmODhdTcHFYRrsb2aLQ?=
 =?us-ascii?Q?yIvz1XALEFknIgyf+YAcTw8KFQrQz61BbSh8bAMjJBheAKmRzm4dRd0JYSQS?=
 =?us-ascii?Q?2x1WZaZKC5OEMBJlOo0vc9c3ekGLf8dXbgROWH3OBZ/y/7y/iRS70XReQZOX?=
 =?us-ascii?Q?xUmygmOzBfAQB4S5yEiHtVOVJwpuYD0IijeLQ8Ko4i4jiQjZlBv5NKfCEA4V?=
 =?us-ascii?Q?Bruc18Tyzruuz0GI2ddQbsdnroblZ9WxaYte43mR0TuYYnxrxB6YuOpij6Ex?=
 =?us-ascii?Q?jlekNShOUIjGtXXCSdxfTUj5sYUlP/qsE75/ksQRcb/5x78flHXE3LRKG7Wi?=
 =?us-ascii?Q?LfXZUvFjYKDYcT1vqP9DBmerhTp47A/tO6f535TaxfhRx/gDHUmzreCho1AY?=
 =?us-ascii?Q?ruDs/pM9tWzyIih/4dAlXtkU1920SeRThQqTv8Rfky/xnq+KWVW+W3ibz1Me?=
 =?us-ascii?Q?Megq2ECEYB3rWrhfB+nk8IuISXGThCsG01JEkm02/gSyLqYiJpaD5OeZWsWO?=
 =?us-ascii?Q?s+ltw9yJre7yLEth68LlWXyOWYBmbYE8LRPiLAg6YJ7VrCceK5597J7Pvdrk?=
 =?us-ascii?Q?KYBw4UBuRxDfmXLJfN1kh9naP1YIXWIAoLGgS1wJE8ClHc5rz2uJp45OuVfF?=
 =?us-ascii?Q?p7omLX0Av4oopXvczMsGIzed22k3hj72bLqIH+N+OiugVL9n5ZLuWck/UylR?=
 =?us-ascii?Q?paCFL5mT7sDGkPh293t6kyH/WD4Y5L2kJDcrGvaq94cmudL5FgRbieFyN14L?=
 =?us-ascii?Q?TpGeDcLc7dE1qOypWeUK1zoYLz1yQ93+WvCjGNMnPqL+CmgVH0CEb9+7V88m?=
 =?us-ascii?Q?4+PpsQCpDOll+1fJfFGmi7/0T4L3s0nPXt2Sr8lt25z6BcSuf8WJHpp4o1BT?=
 =?us-ascii?Q?fOTI/ZZlEQI5eUEA26doGU5xRNb1UURGpX5glSoVkrJHxMfyhDG9onpCWQlm?=
 =?us-ascii?Q?B6i7c5k9CuE/zxkQsAtYp+B8iXf9X1LrukjJJ0aEr0DlIgMseJGtv4ybFK56?=
 =?us-ascii?Q?IBPzprky/IcrhHChFftQOYYqaimjfpVO2WWfbQTJnVjWmsyZ95Ch+a55Zc+T?=
 =?us-ascii?Q?C1qWtwC9J+Rd1XFuewXCGknu75fBslChvBsM+3YWVCCVXXbD+6pHX6Mf9SUE?=
 =?us-ascii?Q?Be8Ft2sMCpvLeiAkcY4tHE1QjVqj2SRRj54rsxgb1en6n1q8cUnfjg1Ik2O7?=
 =?us-ascii?Q?UeVNwdsrd4lFiDEXXpZ1Kk512p2rfVDqS+hPBRvkMDrjVkbQX3VgQPl9tfol?=
 =?us-ascii?Q?oCpc8CGkE9E/XB1XIgzA83X1yCsZHACWSVGjzO+APckOMNPfwBIio80BZyag?=
 =?us-ascii?Q?KYeWp9yNxyMC9Vt7Hu/bVydCzKhx0Nj37iBYsUByaIwjwwJgTIpIY3xziPOz?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8aff0d-4939-41b0-bad2-08dbf0e88bd3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 14:36:17.3976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XEMzzSQTvH0TTvDhb5jiGCOeaLB4IhiVdmE4xOzAg6E8a4NSPJ/yXR6vQjAwiT87oTsONJx56gRPyfYdiuwjI3LOdOl/gxKbefGktVGco8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/doc: Include documentation about
 xe_assert()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 12:29:21PM +0100, Michal Wajdeczko wrote:
>Our xe_assert() macros are well documented.
>Include that in master documentation.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> Documentation/gpu/xe/index.rst        | 1 +
> Documentation/gpu/xe/xe_debugging.rst | 7 +++++++
> 2 files changed, 8 insertions(+)
> create mode 100644 Documentation/gpu/xe/xe_debugging.rst
>
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index 5c4d6bb370f3..c224ecaee81e 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -22,3 +22,4 @@ DG2, etc is provided to prototype the driver.
>    xe_rtp
>    xe_firmware
>    xe_tile
>+   xe_debugging
>diff --git a/Documentation/gpu/xe/xe_debugging.rst b/Documentation/gpu/xe/xe_debugging.rst
>new file mode 100644
>index 000000000000..d65e56ff3500
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe_debugging.rst
>@@ -0,0 +1,7 @@
>+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+
>+=========
>+Debugging
>+=========
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_assert.h
>-- 
>2.25.1
>
