Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0687C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 23:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E66010E5AE;
	Tue, 20 Feb 2024 23:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iq93Nuhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDBD10E5AE
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 23:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708471576; x=1740007576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6b2oJVsN1JCQb/3WUv9itdwW/U4IKMNu/dBtg2F3WTc=;
 b=iq93NuhzLbx9HST6FKhQlq4eTq3d0Tme45oFLMbinxCtP1njasbnKJb5
 BQ9uXWL0IiXvvOIqGlKyNYR5YE/WnrzntqASOyOF1qQiqIQ5gUWbWUvtB
 m7XywQpcixoAKnQ01ldWjZJp7sbxe60yz1Eqiq0J/CLanQra65O/9rQsy
 5TvFkCxZM3dz1fsiBCwpMKs7ttSXqiNHb7Be3RQwuIxDWsEjvrXp6GGps
 jEFeiECv51p39pWaZ5MMvD8ayrxXw4jRNZONzRR6/+j2usLWCDI23CEuP
 eSjCbvf2LM0uX4eZ85M33+HLhLj6tiujs8KzLYCnH9c0i5i65h9ZsoidR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20039202"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="20039202"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 15:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="35970596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 15:26:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:26:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:26:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 15:26:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 15:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyPjyIahYS/cNY8P9m2qehvpuk5EFd6cCqiKP7uuM5+o39ky6Bpf0xdJLcEI3H8fwTUQJNfT5c+zYs8hiE96p7nZGg4OuAm9k4HbsDp+XW+F01Pz2KXa9kLD+65iSLpcQLl0bk59WS2I/xHdzaD8PKEA0OsY8NVI5pJJJKCwO4PLVxxbBhDl3Y15wHCrZ/cbmD7e/Cr0Ug7tQLbvcm4IiqZYAi3VJdqcfJOVOucCysoFf76eBinRWmfSXkuMLQRUbJ/xNYye3oPmW+EtnUVNcoGlhrHxq3fs5mlAbF6vQosP1oI2mQTraoQVjeaF/2dfNPBORfcJlchgnAKUohP8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ/1oVLsny2A1+XjxemuBf0LnWaLjoBXfMiYxc+i9rU=;
 b=Sd3kDOJ/0lM40f+7m2V3/nBKCKAAMkd+KDwgcK6DXoyyOipC9VdlY5q9B+5vDeYIQBSGFNcpTwiOEIfL5ZBmeJW/BpATN5rjtOqgWaLXAIG3fKNX8sLJARcXOZUwRpXvb//HnTZYC3GOGh8ioUbel0/vAGHj/sp5NyvIb68yM6vMj1Yj1wu3QGOKKSg1NuerhE4m7v0DOt3EsUVXGwTUusk9HYX0lDx2Z9fFEbtQIWuaBjrxWWijPCg47UbraRDqCicA08bFZdVkKJ7GFVSrprMFFjifi+pvs8cjM8ulgD4IDNwin+oTEaEVypcqMiZVFux3Um6tDMLqrr0Z0cBlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 23:26:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 23:26:08 +0000
Date: Tue, 20 Feb 2024 17:26:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [topic/xe-for-ci v2] fixup! drm/xe: Add PVC's PCI device IDs
Message-ID: <tjq3pr5bzh5mzurrfv6gs3hclmxkry47u554hcpv4khfpo36gw@6p5zeygarahu>
References: <20240212230024.973104-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240212230024.973104-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 622fdd7d-4fa2-4418-48e4-08dc326b50d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHVwE0EPkNOMfLWBo3ZJ9OLgLJ6uBQyb6H+rrWIH2NicNgQYwy3Sgth84Uz+VQ3N7lXU+RxyzbeFEs95MAW509lF5hMAgauERQzn1neMSfQaJVSyGuObY7Js73Dm77L+jQcKxuhoF2NAQ3kX+3O4Sfe5/zzxMncgnWEKHA3PsahZJv9DSc2W1uUbRUdC5YnnbomVkT+w6Owp2Iugy5vs03Ctf+Y9lYlhw7HhZaOHNc1p0l84uJAtImyQ6fJfGU8QEcuMmDbh1Hn0ZPYF9hqEb88LKenRXcwfW1T/seycSfsE+fEMvXd3HQ/JidlqeK8+cIf7dRT+zCxcWIqU/QRbDBDJf7qBTtXv1/qXmo0MkAum6cK6tnBX3YRDZ7fEkyQ9fBbjR3w9/WHa8WPGaW4l5r7HYy7Qul4m5qskPEquroGHSMxL3P72py/rAL7Ce/HknMBW4Oyq1Fb0pK2lRFaoSJcsrBqFoLSVWQxPjR4yIGYLjEBqi6HWxf7wYqLxZXclo5Cbo3A/tEBqJG4+xNg2IORK5BmiwNByEOkNLRrnCPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JXF9/5AKrKCm6HmyEcl9imQ7YH7cMroloR/r6+WqfwbZfjZJ1Gb+g8Cje/P4?=
 =?us-ascii?Q?Lard5dlmJ/cZs3SBebYtWvc8nd6y9puQa5P6hOLUt08Q6NlAwlTR0foP0m7S?=
 =?us-ascii?Q?mvOMs3swy126Tp4pvgROlwx9pixTEbDFR+GESJTOncauJcn1D/33X+M7Tj5O?=
 =?us-ascii?Q?gjkpkTnpV1sm6lXO7SKvXOLfrOLHcHv94rbMJOdlM7wERFozKVc+Jzeq+Hid?=
 =?us-ascii?Q?r/HWD+1SEZl9jQc8wGUJqyw3dSIcPjyYMzq11Hqmy4Dc7XcxYVW5rWVR5wZh?=
 =?us-ascii?Q?8YveMKOh9jO2yaJINHrSB73huaf/8gDyYuZgF9/urKy36zjnTAszidRaitbS?=
 =?us-ascii?Q?cu9xA54mGzUless80ff+iZRwRF1ge12efCfSW8mPVta+JoCNwxOG+f/s15Xy?=
 =?us-ascii?Q?3AcDMshU9+q8AQYZuXXKuDuzfJIAOGq20h3jOhinVhXj5HH7qh3whOJ4C4dP?=
 =?us-ascii?Q?s+i/Q/Bi9kZ4Y/mSVCR4KxOGjQG7TotihPqsUWusEjgS1a9oBd5i42EKMmt+?=
 =?us-ascii?Q?6UaKDpLgsOpeUxpLRpKMJkyOIhZiSwkNnDnADniks6uLzeEfT5ckwEoByx13?=
 =?us-ascii?Q?SZZa7MPx5h806/CAreGLzlLdPlO8kIXfhzu2muc/0cP//+xVcafmwtpSHL1s?=
 =?us-ascii?Q?ZICQd9/hl/zIiSvYakmm8CJEQxucVdV4AY5EwdnXFCLPqM6ohuAwhaxiErKn?=
 =?us-ascii?Q?ssxDHiFMrRGwy4u3R9AFU3JRh8raSGTXUEVjgQkBpmmHD3Yr3nW4Fgs0OodQ?=
 =?us-ascii?Q?I9sArrwKVSgIHT1a+yV+R/AtZib4Fjgl233Spi4LCUZ8K4iLFK4YSMJP/VYl?=
 =?us-ascii?Q?0BN8yKzSdTxaluUwDyTU0jLUzQ3D0l1qILkZDOSZ3P0F/PXFFPbLnESKG8le?=
 =?us-ascii?Q?ngoBgzj8ADnowEtEAvmsUqYBEsC3Cx9hG+k9ITs22RBfZpselqi5o0lJ3S6M?=
 =?us-ascii?Q?LS1Bm70n5dkDTDSMQ++39Cy6Kf9GZCADggU/RdUZS3HQUfBYDJyHso2pNtqF?=
 =?us-ascii?Q?Zn3bUCXieVIDcqtGyP3TDvR+/Q0TC1IEVRMZ7hhFQq6Bzjb20DAFtR4dxQwX?=
 =?us-ascii?Q?m1w4eLYWcB2AVcPLcBnmiuyqwXAMHZV4OldJNZPjRtRzMFiAuCXX9ijkLKzd?=
 =?us-ascii?Q?Kns5QS9SQhExHophIhUpOLQaikaujQ0WtgshzSkCjtMcs2mZmF4uIG427ekI?=
 =?us-ascii?Q?JJUcn+BqiU8YHgDxvy9QZtyoOckbIaLhZw69u/VzEY6B762q1Kt+vshxi8ej?=
 =?us-ascii?Q?LhehF0++Aqq3BL3nZ9l1QLqkiQjGDHMv50gXDpwy/Oe/9FcE8+2zBZfkh3D1?=
 =?us-ascii?Q?A20LOCqBnw64UHUJwyfbDQNw/k82jU91PAT9yPAIpQWAJbL8KUwY7BP4xJaw?=
 =?us-ascii?Q?lFpMqND/eNNl8mMl01F7ftP5Mf80jD1lNDvnea48xeFiIX7KVONLwY29A1RY?=
 =?us-ascii?Q?KM3HQQcQ1JsnxC9Wcp6vCs3UUvHXIV7SkAOwqcBZcaIMGcebT5nRtsm2Ackj?=
 =?us-ascii?Q?6n7J9mu9eoPBXtjYkJPtWW4PoO9QqyBSQFuYZvEftSnj+n69OZndkbTG4YGE?=
 =?us-ascii?Q?22a8V0VizUNBP2jssBXWHTuPhISJvqzPH4HHPuo5HJVde6l+sl4FCCpse0vb?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 622fdd7d-4fa2-4418-48e4-08dc326b50d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 23:26:07.9938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLAo7P8kr+bXD7tBlJRKYqwFZIYNmDyaoMIJlTHYbY7bA9zdDAGNkfAdkWomAW3B8pptsxe9eKf3JsKdjBnsAHyZ2pEjgFxaWakCzoQ+FdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
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

On Mon, Feb 12, 2024 at 03:00:24PM -0800, Radhakrishna Sripada wrote:
>A new PVC vector only SKU got introduced. Add the new PCI id
>to the list of PVC PCI id's.
>
>v2: Make it a fixup comment(MattR)
>
>Bspec: 44484
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

applied to topic/xe-for-CI, thanks
Lucas De Marchi

>---
> include/drm/xe_pciids.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 3011d99a05c5..2b7c2003ddb4 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -186,6 +186,7 @@
> #define XE_PVC_IDS(MACRO__, ...)		\
> 	MACRO__(0x0B69, ## __VA_ARGS__),	\
> 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>-- 
>2.34.1
>
