Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E33C624D3
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 13:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96C10E00D;
	Sat,  5 Sep 2026 13:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy2BiJ41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AD410E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788613457; x=1820149457;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rQHmaYfjOLln8cRFA5EWq2xYrOL3lnvnon01NEtPgHM=;
 b=Oy2BiJ41JTz7JLYaBNIQaU0zmf5e12Gjq03kurjmm6q+NCoMWn+33uoM
 86uGEi46oORFwtD+LLgvb/WJGh4mI4ZJCXFjF9BGV9B7hNajKik9dEPrP
 c20RlaDNzMCNjse/m1mNlNdeXgvmxD21wcH8/M7VrB2btNhc/hV+icIgp
 wqMUlJzZYrIexouFoBBV/Fy264db1p8WdtPV9nG/XbzKhkBQREXxwo/NM
 iX6qts2NXVFkcu2SC2rex8u8N1FPsq6ppB9N3aB9yTfpNP65ZxooNq0nv
 3sRFoKPJN7yvmezmtCZRWywQX9iN5Of6BCaoGzutao913imcsV+qTLKYY g==;
X-CSE-ConnectionGUID: 82+v1lk8RsWPtmNDZbuLXA==
X-CSE-MsgGUID: C0Mzbmw0QjmXDFaGbl+F/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92908925"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="92908925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:04:16 -0700
X-CSE-ConnectionGUID: NOVqpDJpQhePlalwYPu/pQ==
X-CSE-MsgGUID: B1cq/ZMqSm+qU5d+ZAjn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="300188215"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:04:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:04:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 06:04:13 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZFlrsQaFsBipFCUYeBPL/ZHbMfxvh1zprKriNsaVLkYV8VZE2xoqds2q3PBGiZ7wM5qDPjfGXTljW7efm93VlAxYqNmiHMLnc80QztiAhUKau9NH4DFVQ9LEcjrQPsPWYVhEtlWLOxo57rgJ7pJnH8xJn/sCNZqoCJYHUdvSglYQXShvDmNa7dyGnp67avJjxExHu3ZDUaGkSE7HO7WpAbACZbMFxgLREsdriUfjDwqkZRPvO4M5PwD++wIQkHvPFqAtTXVUtafrZbJf8tNoZvaFAklGq41FyCsqQbedw3vRwCfTnHhNZUJeDNMWiPLW5/8CuTPhSUgXd7oUUfuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biTfBX5kaPZKigPC4OiyrTaFHu8UMkzD5+PjWhTPJJ8=;
 b=rW1P0ykgsFa/ffQ+oeR+/VGLMlSyHn9wjAGzF1gfPhku4+jwC1YNdXMMz4XF/VA4S+J6hgPnojs/cD6QD4k7y7kHBPFBDjDdxvKWeEA0Ef3FkEI6fSTNx9PBRWyuNXPUrTegtAIv29tfBWoZCLlknNa9tv9ERl4G0/X96eTGSObIcscER7rE428KtKM1vj8cz7mIT6LiA9kwtvZ5YcZKyFpCPtMeCT7S5IAyYU6mTJJaa6JTEbF3ZuiCvx4LuEgeRXcObl6g2Yotvb6zDeZzkQYBgaSZIBLQ6GcQM4Fk49GzpXOTk5F9z20QHHO5Uzh54LaQe94X5cOS9XtmTB7hOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:04:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 13:04:08 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Drop unused parameter from xe_info_init
In-Reply-To: <20260904170531.516-2-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-2-michal.wajdeczko@intel.com>
Date: Sat, 5 Sep 2026 10:04:03 -0300
Message-ID: <877bkz97ek.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcae167-a8da-4a3e-5dc7-08df0b4e2bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: OFexZ7P1QK3X4o+nGYforbvmMuBVrn1xQFBjp/ZEKOCDVmdNawTnfYU7fxX3ZD7REoKi2O7S76sPOI3Qi2z4zTAA/F24MsNB1JjTvOhawR2lFjBoC0PtLFAJUTN1OCv0vgVvjCFAb4XqCdhtDReQuzBeH3KqpCqSSEjeZpDS7ExBxtWi/qF51rwTwH3BpBhRw7ueDJzoqUiLoXvg1exqSNqLbgaE9oLcaEixiKwKU3HTzItSvuEJAFBdqRNBLuRoULOadLlSl3pOXAKr7VYyVYQy+okIMCxq7/ED9ympky1Z0BNUP18d07QzlbqZyTfxGrAU9MHeqhNYMi7Iftiyv+KZkIvdwyq+27J4DHDiri0zhaclPo+Vx3ZJC158C/3IGFqQ5X1YgDNt72kT/H2PpGjCkR7UEu9Plf/DZeqNO6gP5kDa/ucBW0Wi/SbFawe7cm7nVQqUVw3t5t6eRFNW+G+8mQ70lBiAYf4hbU/M+BUsNo8QH46sdbjaHXMAbUJbcwsfS4Xeb/d73w0EcfjWrVJS5m0NUseUuCpZqu5bdBIoSiA7H82cKUXNRMSVa5NTigumwUdNemGHwDnHRDlyX2JWFD/SxOhSMpd6Xvf2KtTgqSezQwCYiyMrQUM5GqX8R8QEo28bq3V2yvgSXeipwSopkY63rQxR+WJ8Enhp3CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?65u8LlXxG696ITqsqaAzWuJVJZmwclkTR5valjhTD185G4friTBkLhapUIYc?=
 =?us-ascii?Q?P/elbQIVH6qPwSOhKuJhx4PRFWhVs6S1NmYwRo+PG0+Hrz/hA1JKB5XsETgf?=
 =?us-ascii?Q?WxzEoTfJjxKkx65YtjiezHUSHeIXPHzXkslZbBK4fkF6tuL0f4A22QGNLUpp?=
 =?us-ascii?Q?AdUdzrm1Zs/vkPRfGDROcNOSyRMlM3LW5DcItiG7ldxexoKVj9gBIhsCFRh3?=
 =?us-ascii?Q?Gmb7iyQkXLQZQ65yKfah5ydj/La4L8xh2WlZEMwVB+IjQdEapXlPFK2YR+Y7?=
 =?us-ascii?Q?LQXnvyobnJZVk16MQSMbxk93zxNobgm1/fl+3vVx0lXB1TmI+1B++5CKTJF1?=
 =?us-ascii?Q?tRtrM9y8seTRbtPONYQfzDqw3pNxZZBF23c4iJs4GdssxcxtN2j9p1xJW8y/?=
 =?us-ascii?Q?FIq0LsIJDLKNJkiIxQ2ahlhFS5gkFX90U36UZOPSt2UvSIA/CkIev+M3x11D?=
 =?us-ascii?Q?6ux30bW3rxF6Ai9IUprz9M8aaX7VQeQ8awlSifkKsX78BEnwTzcn1wNDR0+1?=
 =?us-ascii?Q?S9cpz9sNaCwtl1ZvKL9F1Mu7f/tN1KL6n9P/RzQkKVKVK8TkWnQueWUIdr2N?=
 =?us-ascii?Q?rGQSdkpbuK1v/MobxrPqzqzTApNNzXv22IlU4oPs+3lEDKT3M2EbV58xFo/P?=
 =?us-ascii?Q?cRNpFQdm0kwIq6v12hot8C8OFPqeP2aYZ5RmCEAuXLTXHmg5YEHXAARTyI4W?=
 =?us-ascii?Q?vSRS9Y1t/7EweKUqe8ukcxyseE8gQIUtnpb7j0f9w3H2jQVYtVG7Z9G8UPUQ?=
 =?us-ascii?Q?cnQHHIidtoL3dp2kOt59014ZIM/hne6T9o3dRrUGmLiHWr1O+Dbp9PwSjlpq?=
 =?us-ascii?Q?6wZbkuonyPazbxrp3CbunIuPEdN6sl/ewlsHJvFwO0mw2dJH5vJeuOpBVBtV?=
 =?us-ascii?Q?Iv89FbgpmnlCBtUNVMyrsgBRH7dvx/C20MGSlQ/f4dU70onPdHVGt7FeiHzH?=
 =?us-ascii?Q?iLQhjibTXJXpHa6MVz2P3ljoOhb6wrr5Fo8mvi/euFoRoTQ/7RXiLMJC/A9k?=
 =?us-ascii?Q?yTGVi0UTZD7So2h3kVyi9bzAtul2ZREtSjA73cC5NbmzbRE/JO1d98lvqfUO?=
 =?us-ascii?Q?HTG1Kwn0bxmGI7fLe9YkixoKu9kR7+IGB9dxHJ9b6VWpYa4ZafamMtuHSpti?=
 =?us-ascii?Q?YbzhJINOrkX5IKVC75PXIwS/ajDtgmKbfk1uWTUYgGXnOTJ8NZ9rmbmIKoia?=
 =?us-ascii?Q?UsbqNRKtUNq/CDGJKhbneMkOWVh88FV962e1DizHcdo+s4hOrY04z/RufwPb?=
 =?us-ascii?Q?wdDhFOwfvUcroYvQuI3SB5TSn7fgYoQSWv1iHzbwYh8xqQ5ITahHX+8YW7JQ?=
 =?us-ascii?Q?rNzPjL0JP6A6vwypkhew5hl2D9DT8fFCdoaxTvCPJoUMbsfdHq91JsTY6lIM?=
 =?us-ascii?Q?lca4BVy5T7R+TG/eR/DcA8mfFEUz98mLI9yK5g0K/xSuV0ZFOmQ3wkO4ufnz?=
 =?us-ascii?Q?0v4+8IwBT4uItyDG3ZiArs3l8hcux/mKvfhDA4rFt3A5mTL0rCTtkrD6lw6I?=
 =?us-ascii?Q?Mx2FngWxY/VE6Tia7QMijSZvikQFyUVLTcjtMzuiUyCns1rG63WRyfU0OiKB?=
 =?us-ascii?Q?f+xCGjHJDsi6jT28IM1SYIbAOS7b9S0mixzP9zn11ViGaS4sIlyGq6PrPs2h?=
 =?us-ascii?Q?VtUjYr6UcS47H6J3XFBpZxzHPWENLdELFVI6bn8jrod0WoSHKQD+hiEVk9qC?=
 =?us-ascii?Q?jT08R6W97N9APRxViqH4Q+vN5y44ykV+KAFx1mUI352Sy1Ti1Cm66tLTftli?=
 =?us-ascii?Q?j8Oi5H81sg=3D=3D?=
X-Exchange-RoutingPolicyChecked: b/ym11s+1XZZtQ9ESWDYRWQHp07l3eBXHOx70c96K8vAgoMJnpW/pUx6GPzwHcdNO9GfVrAEekpZRu9DiGanBJCU3Kydz2qwCC0KKgbj+rYq2KGKyYUPYY1aQRTJFqf5iF3YWwZMr4ur4hjjuCfewmFMd7jGmyq3FJIhBzSHycHtr3t5iL+rZ58WQQc11EjQs2uGYxdQ6FXQDuOIuT83jnOwhJBwK4LaZWl0AAZEsvpEDDlzx3j0PhhF+/0/O7P7qxY5Ugwk1KwVl2b+rmpuUI06b6ilG7sQwaGRqBBOIY/s7msHO40cJO8n0JG4yfG17PwseU6KGvaiVuGPtUSfkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcae167-a8da-4a3e-5dc7-08df0b4e2bc0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:04:08.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qz5/XJo8wa2GXzm7y6M8JmDIj8ZGnjT7oly4NHeKJqN/8Ps2IBu0/ozUGZ3eBhrQSpZF8o1upPO8bI0QJR5K9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We don't need anything from struct xe_device_desc in xe_info_init()
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c       | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index bb0393475524..4965a01f6ba5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -382,7 +382,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  		return err;
>  
>  	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> -	xe_info_init(xe, desc, &probed_info);
> +	xe_info_init(xe, &probed_info);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..47fad696545c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1011,7 +1011,6 @@ static int xe_probe_info(struct xe_device *xe,
>   * present in device info.
>   */
>  static int xe_info_init(struct xe_device *xe,
> -			const struct xe_device_desc *desc,
>  			struct xe_probed_info *probed_info)
>  {
>  	const struct xe_ip *graphics_ip;
> @@ -1244,7 +1243,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  	if (err)
>  		return err;
>  
> -	err = xe_info_init(xe, desc, &probed_info);
> +	err = xe_info_init(xe, &probed_info);
>  	if (err)
>  		return err;
>  
> -- 
> 2.47.1
