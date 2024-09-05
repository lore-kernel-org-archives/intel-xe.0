Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68479C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 16:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345FA10E7EA;
	Thu,  5 Sep 2024 16:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiAiTaWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182F010E7EA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725554228; x=1757090228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jHAhIUa5gnpoHaVlbZMqcE8WKqnM3alJ9MbT5W8YNCo=;
 b=kiAiTaWAwayPPGc60Gb94jfS+o75AcWWmpPAvDrmTot3qaVyuF1BdqsL
 fZNdW+gWEY/8add98130Wn1FqXajOYTBr17zoCY8eeHPw/t9La1h3CMhk
 BS9GkKCzeVCThfpBqfBpZ+r2jhMFMUOrTp/2UQh1iOX3m61SRqf4uO1yr
 HUF6yMfVhdHcZ7KKfML8niw1g4MJeHY4rYlKuCfu8ueFCKsqqqSpvVC+W
 ujS8JY1o2tBL75w4KxR1p4m8N52oXs4sL/aWdkRgEOQU6qfG9j4zEXtCW
 oMf90besomRF6YLGQmRsgj4LUWC8Z+6t8jTnD8ETL0nAMkXOnUumvP6z/ A==;
X-CSE-ConnectionGUID: G1oy6ONvTYC1TaDfIiJF0A==
X-CSE-MsgGUID: vxE6sBuPRJWK2PxJkPx0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34953847"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="34953847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:37:02 -0700
X-CSE-ConnectionGUID: bBACawq9QgiLvCtY68wRGA==
X-CSE-MsgGUID: gJxq262nSg631rFM3cxiyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65673969"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 09:37:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 09:37:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 09:37:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 09:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBgOxnibp91XRWiz1ocDIL3XYFF6Jkam8MHLjJpndzwnc+MEvhSl5Gc0tKKasg4FuZVodNSMmKvimAgSPo443P5nBA33bnbOGFIdqKYZhfKAlMKrHcLgBWsGYgVVGWCnE4RaSjqk1j9n1uIAF+vL1Eadg91x3AtSU262RJ/PEE3XDK1ArERjNkM6ntLvVARi4VgKfOW0rI0s2Kw50wv74sR0bPCqdQQ5qpIMZ6zJEPFjbnA29yYYDis54sZvrvNLSAIzIUQxDLrF4Qyp3IcorxAF73gKlAjgjRVq1RIJ/FUlye9WfPIsYtxMcL8JYiCYwMjutfpC+NA8pHB2pxsryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHu0rs1KB5Bw4nrEv77MXIy6nxXyvGkMd3OZOCjfF4k=;
 b=UHkO0RG03BQxgSBZoY0VbLMQZFCIQXOrhy03/h1kW4FiUDk3dX3QNQ9aE6fgHcZtwvGb+RbYDf5vVUrPKUKrE8eN+nSsqOwpj0oQzewfPdXbfNdB88cTHnjurmgOc3xUmQUvvwSpl7+PNRcj1XNrzO476sFhgkCag7a3oAKrd5uKIWs2/O77CW9G4ljcUlpwfmlom2XnVS7habAzk5Qiz9voleJraXDJIneaaOD0C3h45/TKhbCg4Bw+/5246ogMAaYOx9f1zbN+74PFeK+ZT4r2/oPp23xw8vbZE1qRqa5uFTt/ngpnxeFJ5kLowaDkyzBok9ZidUmtDuFKEvNu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 16:36:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 16:36:56 +0000
Date: Thu, 5 Sep 2024 11:36:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Arun R Murthy <arun.r.murthy@intel.com>, 
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix missing conversion to
 xe_display_pm_runtime_resume
Message-ID: <lr32ezs6vaxy7wpdqb66mxatkkpenejxsqlpkehymaie2if5mf@vayqcqkob66c>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240905150052.174895-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:303:b8::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: f71c6c14-2d21-4ab4-525a-08dccdc8f4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pCji10qK2OXi6uIwzC1LkNMsM78jgeIOc3Opi8Ohpl4I70vv0ksqrOheHOcX?=
 =?us-ascii?Q?9TG2sslnP3yn5zRCRqurt6xCRsoe2tzChPpsjud2MXuSXnsBxax7KqBiozxo?=
 =?us-ascii?Q?prwz3/PzEvqPRPcl14aY9HZwH4cFAsPPuzVXKJAab0Kb4sT1eK2RCxW+21X6?=
 =?us-ascii?Q?6OfJYUpW6rKQmYJWMTXHD97mDjT49NluM6NXzxFCb5YyMXkSyfObbgFkopFB?=
 =?us-ascii?Q?HXCTGAzAxhlKLptFrtqiU1gDSUuvkmR/MZbea37UsVtSma9J+vgO9J3TJlAK?=
 =?us-ascii?Q?1+AiPNmjEDbnEnP36KknLzSs41pShp8BiuE/AKYDx6HcXfw1mrGlaG2DTRCV?=
 =?us-ascii?Q?odukeK+Qz//IKWwpVPTdsQIZYM16R7ZWCleYvowY//ygEACxW/pnzslvgrs3?=
 =?us-ascii?Q?2sRk0xNMIK9i2AGI+FNoH/l+nbZXke7KKi9MYIZCyp56aJcAYq/vAr2HbwBv?=
 =?us-ascii?Q?W8J6N6cP4p+GV9dEFzwMHo9yDaajpSk6of68z71LnZgsqYbpt196eI3g0ILv?=
 =?us-ascii?Q?6cjFhfqXZESB37HNQo+isFWp2GpG7gbccyy0q+lElsIyFVNQjXYc7oz6/Yzp?=
 =?us-ascii?Q?FwOsiXOAg6Z1/aQqKa44kK8llD5BnqRwU9faWlgnua6F44vJXWpv8yVC77DZ?=
 =?us-ascii?Q?X9wfT2JDg0ZRgd2hLjslkN/eloBGkLXgXdLuwvLi7YBrdBPVcnNBHy+m4NWF?=
 =?us-ascii?Q?5OfgF32GilBOxocUYcocQ+4EaSGQcq1oB+XumxymNTj9baGyzlHf/hTnIbdn?=
 =?us-ascii?Q?FfzBxkc7lOIjza439gjUIBj0TK+eP+XiApKo4vh3JPHy19TeHRRQKlRuA/dZ?=
 =?us-ascii?Q?UgZBcCnA9zMu2o+f0zZyl8FcTFRrzFaMav+eLpSNvgCdD0Hl3+zhTMqetOvb?=
 =?us-ascii?Q?iwDQQmam0lvJ6iN+1lN5lKLh+6ie/oHH5KGPkJsx/d59CnzViG/1Woqon56U?=
 =?us-ascii?Q?Gb8ZiI5WwNeiGvWec6fFh38uvaA/tLIVyNCrPGHAmHgtlNFO6jfwlHse8DZ+?=
 =?us-ascii?Q?/xsr5qZlx8zDvp+4FLmJfuMtOzJfsBIrUVWIoj0DYibiTx95nkgTW8CtfTEY?=
 =?us-ascii?Q?qrSY+/2HJJAiPJ5YczKPtydt4wFK1j1jfpg1vwhNAMawQlscKDC9sK5ngx7D?=
 =?us-ascii?Q?lSkUwXRzGaXEqIS4tEi0ciRV8vpVaWKUUIQj8gfJOWJm5Sjj1knw8ySXgJKu?=
 =?us-ascii?Q?9JEtK61inPO8TgVKu8sGx+anfTLFgwLVzH1JmTbXa1qEzFylMBrUN3cFjwSs?=
 =?us-ascii?Q?n79gZNebQ7x6CnxI21cYxLBFlgF6p+DPPGfWAm32JK/CdsR+FEvxOLv8D5jz?=
 =?us-ascii?Q?aov7W9KsRgwSl/qlBQm4p2h/+RStrN7PUPfP8OBTf9wzNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r77fTna1D4EkuFDeViJtdMnXM+qYRvkYbF0xwaAxhkn0XhsHgbwPEdbMb4kd?=
 =?us-ascii?Q?tbToPjM2IbC7ZnbhIcykIPiurOex/o29+n1lLbNX8dr9Xc56CNV/XNOT9Nlr?=
 =?us-ascii?Q?nGZDo+zPWsNXJk4rj+2GoNHESE7m91S5OU4YRSPw6D2lTw3QKFCXXyQWrm+U?=
 =?us-ascii?Q?E12kIqdXavioFXhxmEXnZsT87Mk6xkHrJXDihCaZav12jbD1eucMI2OaVGQC?=
 =?us-ascii?Q?30D0PO0ZnYzoEOv2FXrObJBPNiu1xgTov/KO5qfUqcvMcGgaWyeL8qjQe1n2?=
 =?us-ascii?Q?aOZwuczrND+fIcCQ0BXteAOKO+Vrt7gN6Vaoxf9tMMj6nMFbAQQOa9IdHhUl?=
 =?us-ascii?Q?qZM+zMSUL9vE/KRfDc39KroOn2tfxfwDAMdntRdLVEhLSGuuG/lyKArN7MQ9?=
 =?us-ascii?Q?S/E3dHMk/ufOUFuPcBvPtwI1AeQ9G3GoFlW8jnttC2mAHdCEd0AKe+je9u6L?=
 =?us-ascii?Q?7HdSg/Mghm37tLJIXXn2GWFvGtlqVB3mqZHDWpc/ecY9Fl/UPlJhmozwZJYX?=
 =?us-ascii?Q?+bngC2dCdLD+F7wB2Xjg5cK9zKPALCg7nO1aXgrHgQ3OqEId+RRQbR5Su0DC?=
 =?us-ascii?Q?7lD/DH2R2xRAinTYbeGGyU/yNsbl4C+71m1QAxmZjamfvbQdBDtE9Mw6pJb6?=
 =?us-ascii?Q?UWMyNU2xHFf7r68yc+ljG9lcPiK/zfapThynOqn+Z25EzaQpMUMOz0tAFGMM?=
 =?us-ascii?Q?O9NIS8kkH7Is9tn3ABjnmDDxhlc2WDaFrqXUGxbWaS2b8lW3CZ2cU2XIDDPo?=
 =?us-ascii?Q?4nbVqSDnHeFDbbXjPq88XY9OyU/KtQuZ7JCTubgfTnX7lM0/Us0e3SgMNhct?=
 =?us-ascii?Q?hsgsI5HSYQkzt2VwxJG/m+OXacnpxROWMlq//roprFfDYicYeDmqoLEQUuSs?=
 =?us-ascii?Q?lNKXuw4eo0G489mFr/K96e1/W3VXnwuWroioHT7Bm4K3wrYY3SPOtj/MSf3D?=
 =?us-ascii?Q?1uNvdayiNNB5JdqKI0cLZD+hbkXtkFVuGW665bGLrq+sgrstb0bLLE00wIqd?=
 =?us-ascii?Q?l57kCsZz4XuZetO9/U+nq5tajJ7A/2D78L3nxbUp/9o0ZNCYBXvUvVb8lgNy?=
 =?us-ascii?Q?xPs+P0Rm9kmp151mB6Tjdb2WiEYIIOMUUVv2KQQS/HmWi1LwBWMAiCq5+Mok?=
 =?us-ascii?Q?f64f6zPW7/IbALNsVHDXoLnWqKcGWhBJ/y3kxe0X3OO6DI4BPcrwXZRPv3Wg?=
 =?us-ascii?Q?BVpPIsfN6Pt9vMHUD/UqOXag1TsdUGai/WrQpTKjlafXXJr3WdpjeHQUSO+Q?=
 =?us-ascii?Q?CfBM8ZEFtYPDcmSe+nKpm/DpyQfTsSPZW1nJxEGBhAMeD6IzeJUOJwnwksVy?=
 =?us-ascii?Q?ZxGlCTBeM+7sLUMrw7/RTl/bnaKySRtiXuukG7JTrii/W20y46BvWPLrL29O?=
 =?us-ascii?Q?BYWgEB6UJf8makBtA6XtgLQMKqm1Q0B8HdqeR2Qfbn+VDjt+qR2/HwoZ23VZ?=
 =?us-ascii?Q?MfQ/f2AmvHw6m0L1TOZ0tkys6eKVuxWnj+NOPlJhWzpJPI2v6OkfO9MhL/AU?=
 =?us-ascii?Q?XEczL+jAhO5SZDRSnXOXt5I+I+ZavhD4oaP2rdNmfUBMJ2Rl3ZLKJRbcsshb?=
 =?us-ascii?Q?4OKtH0fT+rQoW2/s80B/JkFPxntwpaNcfI6NvCTuSyyAlD4c47ML0DEk4xhT?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71c6c14-2d21-4ab4-525a-08dccdc8f4ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 16:36:56.8351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bUwWS3hJtbZqIUvFDQRx+6YNNQa5aKzVvNHf1fbvwQgUlnlpx+xmV6iu2PVAlImfT9qllYvzirTxugzh3VBzrGECUfrr7Cb7uSk+do8lrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

On Thu, Sep 05, 2024 at 05:00:49PM GMT, Maarten Lankhorst wrote:
>This error path was missed when converting away from
>xe_display_pm_resume with second argument.
>
>Fixes: 66a0f6b9f5fc ("drm/xe/display: handle HPD polling in display runtime suspend/resume")
>Cc: Arun R Murthy <arun.r.murthy@intel.com>
>Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index e518557e0eec6..9b1204db12c3d 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -416,7 +416,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> 		xe_display_pm_suspend_late(xe);
> out:
> 	if (err)
>-		xe_display_pm_resume(xe, true);
>+		xe_display_pm_runtime_resume(xe);
> 	xe_rpm_lockmap_release(xe);
> 	xe_pm_write_callback_task(xe, NULL);
> 	return err;
>-- 
>2.45.2
>
