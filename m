Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC58CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 19:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C110EC8A;
	Fri, 10 Oct 2025 19:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALS2FaoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C20A10EC7F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760123334; x=1791659334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQYDucFDV/VSakwJQ1Px71wV++XfgvHWfpsWw9+yX7k=;
 b=ALS2FaoPGNW6Mqrs6vQa8JFp2UFvitMKrQnQHkRcZnycGXpc1eitu2Q5
 uJM+D1hjcDU9nugYlyh45Xcp8LdH2dfnOV/mMybbC0Lf03eC5B14LwOYF
 rMwBNuRCLgIfeunwH6FMymnHbo5zp/YKRfMIeUAZNU/iaERnL8wA3XqIF
 uNPGEqbj56elWB/l8/n+gh+9ugDk5KY+CDmRzqTYsWSh7VxYKJb9Svq+g
 whwpTUhnCfHG3sP36iiQ5VS2s9BDKmfh5q45+J+Ft8QT+9iqVNoTGkBtE
 bq6puGQIC++eilpHhPHfC/rxjeklu9oLd1pT0c0t4zu4ATID9kLuV4Nev g==;
X-CSE-ConnectionGUID: zU+b04QDSg27ssPXVAZ98Q==
X-CSE-MsgGUID: RFMzr62jTxK0xAEjFn6i2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62268134"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62268134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:08:53 -0700
X-CSE-ConnectionGUID: t5r1uCg2SfKlLTfnq2kq6A==
X-CSE-MsgGUID: sqWJZHQWQGyah04B0++2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="185430667"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:08:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:08:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 12:08:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NheCuMZpdJ/qwmIrehZYmuuJSuFui3e+qKiwUTfNdjp1dVLofehXUJLPyQU+YLtK3L1qiL15eF5ChIqT+ZZ9ETaI04CA2YCzSdCginP4NU9wgVpzX20yttMFI9OESSaTvo76fX6iPJ/KjyJDZKK91ATtLYAsIxXddq7FBHOfwgdM50MxfLkF7XpURt/UpE7fr7Jk4q0brzwtCdtk7LDknDuASjYIP/BaP2aClXPvtKIdFJrruC3vL12uTFD6ctylY7NO/bElZlph+YmFmBME276PwczsKaEIzuCusYcluVdB9oECL5hl3gjUcWm9r6TaVZ3VHn07a1db49XQq4ExJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZqf89uYdOICAbVYwv25XfkTfSzo2M84oCM9vHbazXg=;
 b=M0/hbJ+5vo/yc7lsVgGJsKZaPJDp2faYnM7oaKyQRsESkQy0pEnj1+HGZ7NsOkkMKcQgOK7r/aa7mCeAUi0O31LAiDpZq52OYmOAyU5wC3Ev+o5NmwZ1ZPZlSCeLZNLtIO1ma7TOxQmwC9ZkRAW/3wR76qEBjuajuFI5pkKKbdS6SBYjpgansSUNxLdQ8ToNBJpFvthBVKF+nw/NFz0oHKHZvyDjHZhJIrtfRir73hnmAQdRmTvg/AlJx1FKrmInXZ/ejHocxHbqOap/J9tc+YwLnedNEdO5aK2fKTc3N+uAVfYqtjvgjS5SAWTzj5qLUPy4eWsvYDK1dCpFCl8WoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPFC15A51B16.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::851) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 19:08:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:08:47 +0000
Date: Fri, 10 Oct 2025 15:08:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5] drm/xe: Enable media sampler power gating
Message-ID: <aOlZvHjdAcLhvXWD@intel.com>
References: <20251010011047.2047584-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010011047.2047584-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPFC15A51B16:EE_
X-MS-Office365-Filtering-Correlation-Id: 14588a38-fe11-4e25-7b14-08de08307090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cWFJWvfoO89GYpR4y2Q00Gnp1vGe+FiKdpq4zjKrbFqEjWUQGtNYB+v0gbSI?=
 =?us-ascii?Q?SeHtaOP+6lXm8iHV3RFwRco4w8BECt7eUgHxIHNVypjmYo+gVwB7upCD80bT?=
 =?us-ascii?Q?cCjKhPWCz/Uv+JSg7je4yp9l47xdzvelSr5jvqKgKzHVfbkfQFm9Iowh3e7F?=
 =?us-ascii?Q?rf71FV3xri6C1XsZWKNp2WX8fo88gDykOZWZ8OwkBh1Pah/j9NuvQGIf1hoD?=
 =?us-ascii?Q?+kh0WoxwHI8poWQ4CrE0XIPYIRqxYYSKDnUT2aM4JWupFLbPiY/+unquB88A?=
 =?us-ascii?Q?MATDmOXgTyR9xO/BDgdnVQARdriiEX2l9ohgglU+6yE7N7lVWYg8qk4lpWkw?=
 =?us-ascii?Q?0v/YsR5uibPzN6hp5xg2MdudlPQSAVdIs0j28FFlLSul82k6x3QJvh6jTWBg?=
 =?us-ascii?Q?8fWUa4k4rXQiuibTnbc81ts6xoRzs+h3VFZyhysNrSoMV6mUVw+9w56jN2Na?=
 =?us-ascii?Q?vCVeVQ8ZXtL8niMA0O0ARKOoUES7REAAOBjok9Q+KwYgaKWBjkRaTKVVn5Yj?=
 =?us-ascii?Q?IqkeNqRIfAtQ6AlFZsKzSjLL0VH9H31q3EdPE/WdvldUZ9PR6EfB58WbectS?=
 =?us-ascii?Q?9tIVFuRIF5FAYH03+Q0HtJ0xCh1qaLUARkn9u3s8N/RVcbK1fgTH1+Kh1Y6h?=
 =?us-ascii?Q?RXvJ44EXD7AsCRz8HYBbkdpGMe2+ci3biTWX8SkIvADRBm/hK6f7CB2HIf1N?=
 =?us-ascii?Q?VAZ4u+zPh/XzJvJdidZB6w/lM/lJJCesI51QMdsomtMwAvUjt9gUrD5FSFIJ?=
 =?us-ascii?Q?wZHUNwARKK5L5awqJGY8RmFcIAIkuco6mDG1RcIZn03qiFMdkM1ePgdkKF78?=
 =?us-ascii?Q?dRUpYIpk3gCow8RliVWNpnx4PjHhznHOGKAq/0gz0Ac/L0rjYSKvYCCfx8gU?=
 =?us-ascii?Q?5+kf0k3s5LkCT2jByZqFUklp3UWSyxbzmwIA8mvfRML3yjQQ0apk9bRPYSpj?=
 =?us-ascii?Q?6JJt8GQPEPozfIKEf/hPbiCU5kS4U5cF609kpCOIMKOKAZZa638cRDv/j5kN?=
 =?us-ascii?Q?9qVvcMzRqOPqT7vRbXhxkEEArwGNTXOLBBkaetHX5Je7SJgQY9L06bZQWQfW?=
 =?us-ascii?Q?kk/k3aw4SJhaWXJf9rmgfZDY57AJ00Syq+oWMb9DoyRrdBx2+J+L5vPhSCfY?=
 =?us-ascii?Q?vxxPFU72oa0aszDE3PVZB4D5xux5KsTLcqz1CAuI5axP2Z0rPnHNFPfK+O4w?=
 =?us-ascii?Q?yzY0QYNPFAMmoE7gnxRnVmheMaLrbY4jqJTqU9R/PoiYVZu49DS2auSqDV5p?=
 =?us-ascii?Q?+NJI7+tVz2/S5Ybv1veeF3fZdSX0Kd7XtPp1YdqxsylS/a06gszcEWvRirPY?=
 =?us-ascii?Q?tr7rwGAaO0V7DNoM/B4gZCPIlKKv0/8/qCnK4sIFdlID759UptWrmVnkch41?=
 =?us-ascii?Q?sBtQVCJNS8WT6xhlNEgBmGughZmaZGsupEnJfhslsndUgu+EDwSTr3hzNTWx?=
 =?us-ascii?Q?5q5YpLOdH6Q+Ex/81IdTq/+uX7ORzMPC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q4NbuA6kPKGDpAUqKL3NpQPU5yct4QvfrhhnsSIhYY7xe68sjnwxGYI9a9Xn?=
 =?us-ascii?Q?XxYGoXGqxEQc0IqyT/VNWwxB7Gnt+vwovaBSZUXm3Qv+Uaejd/8MFpmKd3VU?=
 =?us-ascii?Q?8Jryhyegyleq5kfZXmyodRsxDDcQZe1b2VhN6TsstE81fsOKtjAlH1uha1Al?=
 =?us-ascii?Q?lHuny1/jQvySyD/IU7boG/dnehZ2Dp4EfvOZSEIJPa2g7+qpZJmQ6a2TX4J/?=
 =?us-ascii?Q?L84ZcyztXt+9ZnGEJdiu2drgiKbvn6B1sMFKUG0NvYJ4j0KOeACLZwnk/K1s?=
 =?us-ascii?Q?Q+8B5FJObu3AdEhihEKvwBwvx0WQYynShkGWSFPQBolVTYX0YSlld3p/Zsl5?=
 =?us-ascii?Q?qRIhS3YvtH18NFJZrlDSAMM+HVmgWx6XM6mM/ii4+6yvyXaj78p7A66d6ONQ?=
 =?us-ascii?Q?sDzG/uth6ERdYqTsNdxAClKxL0V92vHB5Pb46S4Ne8efbH16dM5UWPrGGQYO?=
 =?us-ascii?Q?RkQxbN59hPl4QF2xhfDPwT/2F9SwHx4aesbk5RYoryAvK/vnTPVSQF7K3QML?=
 =?us-ascii?Q?4creX94MTrVPziago1FuPcTnT253o3ELAo5pALVmVnnas+I/MD349HSgQXtw?=
 =?us-ascii?Q?/lYsq+c0BGTPEGoyTczS444b17dVR9F5xNg8XpSmJgjLmNsEJyeiZaHfib+K?=
 =?us-ascii?Q?GQMt05ZUNQ/2+WSvzD7NPCy7nqIrpREyChFBuE0wOQnSd99WB9Jaw419c3eU?=
 =?us-ascii?Q?i+BRr8s1xZh0weAcASJklD9bGDBD72CvQ5LdfKiEyjB9YNU2ZSqLQqFEjmKN?=
 =?us-ascii?Q?A0W3zxqlIgfT3biYwZzTqhUgYGBJQD0utLhGtLdskVJQoUcsK9h5zrkzNrpe?=
 =?us-ascii?Q?9sc6f+MsWQf08ymtwSF9yvBSfsExQA6ccojsS59VaKP0qey0r1NbrG1lh9od?=
 =?us-ascii?Q?qLQPkB/HeuZfGRrcpK0wTS8ePDOKyOPqR5BCWDvvdcof9RcvO9v9q1dA2gLL?=
 =?us-ascii?Q?QYyWpnIRCXs6evH+uLAsZR8mgsZoIl3HEnb+a1eeIP0Ve1QJZ2hD5H/5+UaI?=
 =?us-ascii?Q?pDEwMieoy25qbz/Z0GqsnppYLUxRx8V8UijUp1GAhDB3IRtrsVBW4Ox/b0tH?=
 =?us-ascii?Q?Dwdl7FH1wzoEoFq5rpbpFf8Yng1+nmht2AFpNK6oJ02ctXT4ufszMn4Y+bCU?=
 =?us-ascii?Q?dJPat2aF41pk6AozYaJ6piJEeEQ/0Wl5SqX4PKBNYhsfo3uvo1lsB3fbD/hA?=
 =?us-ascii?Q?h1DTJZT1ReUkReyZAmxSDwGerZjxi0UMYBkkdG2Yg+RyDtCBASoiSpuNxGQb?=
 =?us-ascii?Q?Knav2iFqkyGwAdUTpplYYOMvxZaRYSW1sh8UyuoObOvhM/ZyKEIFGsnkpGQe?=
 =?us-ascii?Q?M0j57fWBhq8E2DXwhKi5bg5+9UtyBoHo7log0PHb2s/dM9KQ38nTVl6Oxysf?=
 =?us-ascii?Q?mbvufwPP/ojAkoLTHns6TYJlbS/Gy7JmLAoJc7zxF5ec+Ul3QNPnhwN3vDxW?=
 =?us-ascii?Q?INlIMcXEOiG4kEonbTR4hHQU0qGEOS5eBvYA9webxmNcPu86v9zR5JV8F+xP?=
 =?us-ascii?Q?CT44sOgwSjsgA9WRo46gUVl6IaiaBGyTeRxTCsY403ThTgIjIMhOaZAVvquz?=
 =?us-ascii?Q?mxpBjgBp0IIb5fy8IqJufP1doPmcQdopUWB6r19QN7EJEQ36YPiOYwMDyNpX?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14588a38-fe11-4e25-7b14-08de08307090
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:08:47.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJDLByB97j83JaOryMtx0/HIicacmp4q+XEhkH6nnYN9f7ul78La9gCfl0jZa6ahGWTtZxerWczr92pKD48OBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC15A51B16
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

On Thu, Oct 09, 2025 at 06:10:47PM -0700, Vinay Belgaumkar wrote:
> Where applicable, enable media sampler power gating. Also, add
> it to the powergate_info debugfs.
> 
> v2: Remove the sampler powergate status since it is cleared quickly anyway.
> v3: Use vcs mask (Rodrigo) and fix the version check for media
> v4: Remove extra spaces
> v5: Media samplers are independent of vcs mask,
>     use Media version 1255 (Matt Roper)
> 
> Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

still valid like we discussed offline. Sorry for missing the version and
causing the confusion with the engines check.

pushed to drm-xe-next

> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 06cb6b02ec64..51f2a03847f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -342,6 +342,7 @@
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
>  #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
>  #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
> +#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index f8950a52d0a4..bdc9d9877ec4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -124,6 +124,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt))
>  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>  
> +	if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1255)
> +		gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
> +
>  	if (xe->info.platform != XE_DG1) {
>  		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  			if ((gt->info.engine_mask & BIT(i)))
> @@ -246,6 +249,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>  					   str_up_down(pg_status & media_slices[n].status_bit));
>  	}
> +
> +	if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1255)
> +		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
> +
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
