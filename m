Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC72C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 13:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84D10E273;
	Tue,  5 Aug 2025 13:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxtISBHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4E910E273
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754399673; x=1785935673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TT1MerOezyzyvcX06IQ+4LOp3lsPbDUE8THJ40y6SWE=;
 b=UxtISBHcw1G62vIxyWK0s6ITTmRedkQDyOUeLaEbKVA80at+xJUF8K3j
 7ZJyXfH1B6ZFHBjMdQXptGdHoiGw2Vktk8grZEV4dx4qJRnxXnNBfkomD
 tY7B5X56UYwLvosvWwC+0O3x0uxmMvoFfPxbK/sPOtqs55iLHYwOb0osi
 UZVAd475ZNXiXxNoWGYEhHVM3wQxcck+XZ+KyMdqZfyILW9tqCYWS75hI
 rlvppEmfc7oT28HHs2g2VY3JKB1iLJ8NGwD3ZW8Om2vXvysKsk3J+AtmC
 Su5mzhaL0ocs2w4O59lCysWTkemtqwH5VWYWyHrNXzZa6TX9rEkuHQ3eV w==;
X-CSE-ConnectionGUID: xJFgX3OMSRWLpRr2CJSr1g==
X-CSE-MsgGUID: dww2utRJRrONV6uci+G2ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67767193"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="67767193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:14:33 -0700
X-CSE-ConnectionGUID: A2GGkNRHTYSOmQOAJS6v/Q==
X-CSE-MsgGUID: 2t9GgwTkT7qY6S5GuTw5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164910049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:14:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 06:14:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 06:14:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 06:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8mK7LMhbRq0VtDZvVrx9OgN+Y2si+UmZDlJKAYlDnvJUIfs00JayG+xLyI89jvHNF9+3eEOFGO42FKyhuvuAWRCchVrbbs6986jpaLPn7t5AlpMuovWX0kFjYKCTDQp4Nr/p+YLUMVh8ih4Jk2QRJ8mIpO2bO0IZ1IN4SibHD0BFAwq4YkiePX4pX0qS0YYTTWWEMw+wPdW0TzRTRhJ037PG+cOqDLiwQjWlzVzLfsSedq1OYE7qPCLjbQEuLCsPPJdIA1GY5LtoQT3c4wVQ667tpDfpIRnpomDZsCxk2QPmnwcJUlZ1f2am+WokGY7XXtYAFche0qYqCmD/R2XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYe2DiXovgwjuCh1oWMwAQZxPW1XBccGMIdqxY4H3aU=;
 b=RSzh3ePBDtTNwWLC8b8MfemAldk3zQ1a1oDD/dh+CjT3yz1EeWVCfik02aGpPZ/dgjvEkc5opa+x3dBRV+jiLfREDbs1MqCUFcI8/yBProhPVAEGOi+XVfimBidDCULYj5qiPZhPviamqf72cGsM6SDKAejLmwB0m6VBOFo9LrVyby8R1U4SnnsEiN7lbT3az62PO+5O5OM6sZnfLRycBqGKenewZoMuCeAfmzTe0x0f3pDzlt3NpTt56R4MX5tEBLgMNLGeey7dFRKHWHf+551TsZ3VqMC8MPjU+9UVYDhhRPNYsVduHhLf0AM8f6R5YMMCzrFwz9mEQXGBok5L9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF9D9CDC305.namprd11.prod.outlook.com (2603:10b6:518:1::d3b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 13:14:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:14:29 +0000
Date: Tue, 5 Aug 2025 10:14:23 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 06/11] drm/xe/configfs: Rename configfs_find_group()
 helper
Message-ID: <auhnqzxjtfo2pnczckmzuhk5b3ydpuwyayroxsa4s6ydkg4vzk@l7fp3c7pf4b5>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250731193339.179829-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF9D9CDC305:EE_
X-MS-Office365-Filtering-Correlation-Id: b74f4529-24b4-41f9-c601-08ddd4220224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PvVHwXgobXuzkzNpYEfkvh2akiIlzKFAcAgAhLW7ImmNHAJxa8U+woOeeh4A?=
 =?us-ascii?Q?vv8r6CAEQewFdoK+CzjfFvBqKTKafQoUdfOiSESnhoU5XseAGoi0Gv3ykgsC?=
 =?us-ascii?Q?dHGiQEfEiCYqhhSO5hQW9PVbN0Yft+skyhcC7qRQG+NAN+P3VBr7x0XlHBzc?=
 =?us-ascii?Q?9t48B+IwkxXBoy+Gvt0EEbYCZmvmNznvruGOz4/K7Z1meNrqQKQPKiaeAYF/?=
 =?us-ascii?Q?+GAxcv8pGd7U0c04pZve7Nr42veSNLLxHwQaiywWT1EyOAGyrQ7pJ1iJjGgw?=
 =?us-ascii?Q?ov7pasonyUQl4QiSHEtQjkQ7S8txcvI7TXwYluTLnmdsBEqX7plH+vdm+yUr?=
 =?us-ascii?Q?2AukIP8KAvG51Plb9ffDe0P/O8Ca5vQw2eorT8iq0/qYXVCbQL2o5JnoaB3z?=
 =?us-ascii?Q?0SLLJ9Cy41Np4mADbNij+ldpE8vGPVFOunKfsKOvVBI6zKSaTcfjrdYFfyz4?=
 =?us-ascii?Q?/d68XD15Iwej+0yKzR4lJQWm8JvTh8ZtpKaHxPWCvbLpC/UrFVYKxpCqFBfV?=
 =?us-ascii?Q?1ZMn9KAOT07snJ+rZt51fFK3yx8I/vLZEClmgQJr+EILjzCfSRc2ZDPvZyY2?=
 =?us-ascii?Q?qfmmx7pG8Dpf7GNv4S1bQWJdmUehGpN/msbAnrmzFMpkgD8h+OUr0oxHTC96?=
 =?us-ascii?Q?VEFcvRZyFDukpSsfe7KT+Zym6LusYDmg1XEdTGF6qfH9z3R07byzHbozjUzF?=
 =?us-ascii?Q?aCaBjUbCMrfyhdqdKmbi0FhmSDO9aQbTao584XKHt0Qe2yjBxyGFf0tTOtBq?=
 =?us-ascii?Q?XSh1l6C4jV4WMEAJtxc0cyI5u9Zse4vgIrINZCvL2Wo7G41LRVI7kEvBekM0?=
 =?us-ascii?Q?wqSpS6edt17W0Q814+Sq0Sietc9q1FxykFt1dqQTlIUb3M8CvnJLB8bMorpD?=
 =?us-ascii?Q?Ih027DepeQ5KyE7S/7t7I9MQcJhG5zAus8lWHmWj3EM5nz1Gzoyke7xDitRo?=
 =?us-ascii?Q?OpV5S6AlC7D+tDMyEMpXszDLrhl6giH58B7CWldivuVcpt+zH0luw14WTWfG?=
 =?us-ascii?Q?NzgLbqpfM9Z0PZdXZWzsiEiAn2Sw+s/xwQ2TJEZ8A2nR3se5JXCwZ/oksh+J?=
 =?us-ascii?Q?YX95VJS/ax2377kbbgJF1sUghW4IqoIlXFeaY+rgOkbfrvP3VtNYmNS155ke?=
 =?us-ascii?Q?Ck4cqj1osA9PxvvCGbKtRVcYk92ab9HHS1VuLBg99JLI0sGjM7xSMEMGcTkJ?=
 =?us-ascii?Q?abOawRMhBFJuteDYZCX/t1ghZZt26+iMD0dTX/nYh06AlquETyKCIyrp3jSo?=
 =?us-ascii?Q?HvWapqHPx2c8jOntuSyWCPnGnsNo/1B47LvGst56H07erklWr7W/IvQR88dI?=
 =?us-ascii?Q?Bb3Dt9lcNBz8gAwHWSAdjDBLY7cYLnkuUXbQyliiqe6UGR4obUtjVnLTvHKX?=
 =?us-ascii?Q?urmfi0rwEPDnDuyCeNQIudnBSixQPC6I+zOWgleRZ5TILgNqoiSXnHt8Da2y?=
 =?us-ascii?Q?FK/VmRMGs7M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DGLZkoocpMVYndUlu5ZEpzfwkMbKTj9poe2oI/gylvtu6HGYFxQXxlh3ObkO?=
 =?us-ascii?Q?K8+uCv5B+VqnmryfFQilA45zxv5goGTEbkc7JgQPRaAjX1ZUMEF23Vz3+Ds1?=
 =?us-ascii?Q?AUSO1HeguVGkXQAUzT9K5L3IyrZ/tgui3YSACqNRMjRCDMSO37NcP4emYWIL?=
 =?us-ascii?Q?6MbaGMb+2vgJ6U56VaX+aab3JDidOnSKgV62ZGzCBoyxhYWtF9xOX/AObu/p?=
 =?us-ascii?Q?2F/x/mCWSM4dFEcWwUv1U19V5hqsHZpbUmtqcVjF2XsbBsXjaEBsBrupyFdI?=
 =?us-ascii?Q?NZxfhMbwzp4Z364rb7VFGeVgXRXy8Uev4qK7A8bOvUiTyBE9cEzE+/oPgsjX?=
 =?us-ascii?Q?5xKjtAbaXtOvd/OqTLqebh3a8KPMaC6PGnGKDSoVmg5KlPdr+7U5C+P2qho6?=
 =?us-ascii?Q?PyNN/JRQ2e8e/hHU7lbpzJAXst6+2eIPWc5pOX/IJWYhEVmlaB7LvLh/dEZ2?=
 =?us-ascii?Q?DYHXnWXME3VAlxU/1XjQnboL/wsQBjhP+pbCyjB+VDs9/2KD5N/XRwY8NJuY?=
 =?us-ascii?Q?LscHpZswbOJYWvA+YpMPFyXwazS4L7H6I/ONRfhHzVPh8T++qbyap6UhfuPv?=
 =?us-ascii?Q?nuNqdGoZpQQHc+zU9hEhMR5fR4j/fGmGNmzptD8SQzHqrunPyelshSDNFei2?=
 =?us-ascii?Q?N5XY8DJSfBqrRlNvdiNF3C6kD+5uK5YqcoYVN7vdoC/rqNt2/ZLy1KUvlwkg?=
 =?us-ascii?Q?lqOeDm9I7UtMFh9GFEnNJh3dv1Opdo6TlaHIz+E4sKbcWmmuq2ZfGI6Xi9HH?=
 =?us-ascii?Q?lbXv8JyKy2luORN7BqqbxEiuVV64KGPr//q5L0aIsdCv7xt1g6DNwIP4KOc6?=
 =?us-ascii?Q?SE7KmcvjllHq6xIFvuCAXtXB9wSuDeyR4zEOvLYTmD+iQK6pofirUW9sKWeh?=
 =?us-ascii?Q?VSVqTJlfTcTd/Ol+sUMjjkKPtPckUHRRrIO+X0CrIbyPCRY+iDC7Ly5w0lzB?=
 =?us-ascii?Q?FCbN2n/CckAuYRnWU2hMhQhg3gXCffCrxPlkrYsow9DEw9edISDxd68Mo+Gq?=
 =?us-ascii?Q?zrGEUZF90qRWT3iSpxllRxl/2EDRgz9CSPj+83K5Jhu80TfKWrL1MJSNnZTx?=
 =?us-ascii?Q?cnUQnwgwFzoakrcjACP7ZTJ0HPlTUxmoiEf4n4UOtko7y2fkqL5WQz30Fd4S?=
 =?us-ascii?Q?91+1oNDh1SvmgEIcUTNlyDAcJvhPLm2hi4nh940cTuj07flMkmLyxPZumi74?=
 =?us-ascii?Q?SPshKuucxHwCRrO7Ro09cCVke/bUMCGGn8sWkSynDFad682mAatSW9p/hrHm?=
 =?us-ascii?Q?gr8OT45GVEy8Lz7mRFj0t8w2AMQSQY3vmCdeYgfMsxUoGzrTEmFPERoFjJbP?=
 =?us-ascii?Q?aaORVomxOnUx5sAoSliV4F7oeCKWMKKh1EV28SXiJj85FlwmtIza11+mTuVW?=
 =?us-ascii?Q?vj8NIxznjUE0XOUDU7DMztSLS0Nlc7Pdux5VaXt4rY4mPsGh8UgcGn6KZn1/?=
 =?us-ascii?Q?5KGbZGQ8tUeC2kBruObkfDufI3X9FhtOMw/tz+/uJSyBkrYVckDKrcC5RSpQ?=
 =?us-ascii?Q?iJNzHrnqm5BBHNOmd4r4X/MTzDT3xZn+dBtdbThN6d/l4NZjYHHyoR7MFH51?=
 =?us-ascii?Q?JwzaPr3+EaXjk+QYH/Z2Emvqz2n45Hk8QPDU14gz+ZfzeHcfqGLZ4yjmtNRw?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74f4529-24b4-41f9-c601-08ddd4220224
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:14:29.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKP2P8s3enUJ6pk+EXnkFM7uZ5dKqFxn7+ItBtzTfKuo/40WA4tTU4N6LS/aFiAESR0DSTiBxMNiY+tyQ9FwmX8c79aDuY7uuylYtd1mVvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9D9CDC305
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

On Thu, Jul 31, 2025 at 09:33:34PM +0200, Michal Wajdeczko wrote:
>This helper name shouldn't suggest that it iss a part of the core
>configfs API family. While around switch to use different helper
>to release a reference.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index d69b5f248e59..acdee616d118 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -309,7 +309,7 @@ static struct configfs_subsystem xe_configfs = {
> 	},
> };
>
>-static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev)
> {
> 	struct config_item *item;
>
>@@ -334,14 +334,14 @@ static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
>  */
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> {
>-	struct xe_config_group_device *dev = configfs_find_group(pdev);
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);

looking at this now, I think it would make more sense to call them,
differently, which would affect the previous patches too:

	struct xe_config_group *grp = find_xe_config_group(pdev);

and:

	struct xe_config_group {
		struct config_group base;
		...
	};

but I'm ok with what you did here.

Lucas De Marchi

> 	bool mode;
>
> 	if (!dev)
> 		return false;
>
> 	mode = dev->survivability_mode;
>-	config_item_put(&dev->group.cg_item);
>+	config_group_put(&dev->group);
>
> 	return mode;
> }
>@@ -355,7 +355,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  */
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
> {
>-	struct xe_config_group_device *dev = configfs_find_group(pdev);
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>
> 	if (!dev)
> 		return;
>@@ -364,7 +364,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
> 	dev->survivability_mode = 0;
> 	mutex_unlock(&dev->lock);
>
>-	config_item_put(&dev->group.cg_item);
>+	config_group_put(&dev->group);
> }
>
> /**
>@@ -378,14 +378,14 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  */
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> {
>-	struct xe_config_group_device *dev = configfs_find_group(pdev);
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> 	u64 engines_allowed;
>
> 	if (!dev)
> 		return U64_MAX;
>
> 	engines_allowed = dev->engines_allowed;
>-	config_item_put(&dev->group.cg_item);
>+	config_group_put(&dev->group);
>
> 	return engines_allowed;
> }
>-- 
>2.47.1
>
