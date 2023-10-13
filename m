Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB12CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 18:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319910E62D;
	Fri, 13 Oct 2023 18:31:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3810E62D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697221913; x=1728757913;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=39+H9utNej7G51AITspaXKid3oNGK1+s5yf+qCRXWUw=;
 b=Nctuv/LCZ73s5pkIbAWmSXCFS6DVaKkkS1A3Tu6l9wySA5An5AdLGvP0
 eZHMXlQ17eBDB+eVRCtLhtUfYtVcLDioywSjPjHhZhKopGosBIqgS0TLu
 txf6X2zBpKWHCXn4H8eFWdIyyra9DsyvQ3VxujvjIXvOdulXjAgSkm60u
 l0X/NqAgA+83quWMlo4Dj9n/Akck56EGMejLX3Z6wuoyQlHLv1S+WzBkN
 hEcz8EeXtOexuGKj1IFk57N2tmUdmASx4XvFS96XOTwhN2ax82TTO/u0p
 kyukRGUTMEOurkVnqDcj0V7D86bWyu3BYwxYSW13oNObPCU1OoNFzHKN/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382465980"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="382465980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 11:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845578257"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="845578257"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 11:31:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:31:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:31:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 11:31:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 11:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRizvjn8qRIoLba+G0CNLqoSRMHQZ9M/e5ZxXkWRcatm4H/JZ1b2iYs6eEFe3bByWfqwRbNvytRvFQpuLVKZrAk33RXl9xVjGxOcWYHgUWI2Z4VLdoVOXWR1R3EVpDSakZ+dVGFGwQcE/yr9l6KhNSikaqkv3JkxmSQAmJJTPTb5vZaPRDW849mSkVsvHQomDuDGxtitP4gZUtLyiUbseuDi9zqw+tOvIzgvEJBNbm99cDfAp6iMqyjC7bRU/pJKEvRnJpt2UzwdH84pfJEt98JILBiOwul0KvL5e7ngzNDuE3kd+h5wQCsEgdgw+LTpBWU3TcmveRJ7jswgmynbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDCG/MiX4DLyIxv4WZePXEby6KKSXjRdmhb2X0CyoeQ=;
 b=YlSRpo9VQF2BL+pK2qMLzwv3rUrW1xT+at8JtNf/+U9qFAOJPOpRpGiUgeb1J5w3sI9NisR9UZL/5Go0PTgYKJt+Ekq/FhYKjn7JiXUz7qexA0opgafRrXFSWWr0ixqjnV5OS+Dd1qiiv54kE52UR81ohdd9XuVpiKvENgGkdPaOjP96obSAyUHz/IEZ7AZpXA0YM/kFB/NdF3ORtmvvBxucnA2FlODlaqihoJleNUwlvx+O1onnoXF3KDXTuGwDSnbQW3LlqCg85DRkIXSKIJ1WGSMmOkot87grnf1o6/4aSsWplsSMJD5oJ2FQtLjYZrOmgFtWichtobKLL4Nugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 18:31:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 18:31:47 +0000
Date: Fri, 13 Oct 2023 13:31:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <qafchp6pojez7hmi42qrz7qsoygjfjemo7uskoi4k4yzchhqhd@lf2hepkprzfv>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915223459.2964036-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f5680a-2271-4f57-581e-08dbcc1aa8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPr1prJ3OdtarJVWZfwxhFKzl3TjB1eXtWyBiA/Lo8pf4yZg1OAP2h284bTW/6OpNh/lup8IsaRzLzkUBFSSmfjhRyN2PzCE3ZeVL7KB3JQT/f9ykKbOHs+6quQXnmZEosncJY+r8t1VDvz/iEhbt4oBZdd+Zbe1JrSlnkT/T+el1AJTh/AfTTxM+Hb9H+fwtZRk9TJyqTVYJZodKtNw7t+Nga3xkkHmnmeVb8wUilz88uhd1bh4nrUtVzj1SiOzD9rgWENnczr0W+rUkAsP2+aAJavLP6Nv1SOIRco0V9YJQlbgYecM75W8/Msi3edQ53B5pgOGQq8ExHEMC87YNhZpJ9WI9SUHiplJrdaeMEghm3VCA19XnMaCVE043IjY9nEXHS21+ZFYI2NMVOfvV8kkIHK6eqJtGSsaNy0YhtRYv4H/nUnf9W2SJWaY0Al4FV6RSRIjEwQH6WVH8IcsqMRm3gIxPwffo/sFSOd3D6M5pFmgOw2xHG9S67qxfj6pMdI8MFYBsp4KhxzKyprKVTL3vmS/7ESit6QX2enlsO6qWr8FKhPy7mVF5/uSlIe9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(9686003)(6506007)(6512007)(6666004)(6486002)(478600001)(86362001)(82960400001)(38100700002)(83380400001)(30864003)(2906002)(33716001)(316002)(26005)(41300700001)(66476007)(5660300002)(66556008)(8936002)(6636002)(6862004)(66946007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?16HNNVkqwBTdLQXTGQgfVAynpzKjLaKRs690jOFhhtShmIDXO+fHb4zCh+?=
 =?iso-8859-1?Q?j+v5EcYg931U92jjRvuRcYSkjAPq0jhICnPIrFnvVsjTRCj3OrRmWTNcVm?=
 =?iso-8859-1?Q?26LdODuXsR+KuMWoKTFHXqwO9gZziFj3HGcBqyYIR5xQeJ4Z3XRwzbSUhX?=
 =?iso-8859-1?Q?93Hk+lYnaQ3uJxJ8ekqmIilriLZJElCy9CAmDa+bTsLCLy4RreGdkhYDNj?=
 =?iso-8859-1?Q?8qYTBb+1Glh0IJ5nBBrQg3YgnpHp9HFSyZAp9pxfgpEJvYzYjRuKL8s5hJ?=
 =?iso-8859-1?Q?nxwlTmJnBXEhp3yDDDX4F+W/pL7MzkhaHj43dNdOT2GHNt5tm+QUbCfr9S?=
 =?iso-8859-1?Q?uEsoSl2/4Dqx4LQMLD9keBQOCh3Ym3HBXwbZ0N9KUlpejMm62liAJ79qKW?=
 =?iso-8859-1?Q?ajrj99vaffDeer65wsECgwZiqX+68/Hu5s3/1e15iGquJlEfyrMoZ2uQQe?=
 =?iso-8859-1?Q?7Jm9aeilt5DPyRSR3ly39bBNGDCF1EoqWYwmBaWgRkxfBaH9ZpCRwrHtya?=
 =?iso-8859-1?Q?kNacR3fyZuPBFCEfuQEWDY4vKNI0GlSVrwo9v1Q1P/Hj0h8HoFyP1zrD4l?=
 =?iso-8859-1?Q?jC9LrPNk7o3gp5fWGmpVajyCc33LQ3G1OBjxRCeooZ5Mfgf6INUFvrAmhw?=
 =?iso-8859-1?Q?z28O2su7ZlqKO0LpuiFWDd04RZMoUW4XX+fBU9kHgIE4zw9cppZtQtMS4v?=
 =?iso-8859-1?Q?7oHIimLvTdHECmSkYgw+G6n1bFc5wyACBfS4H6o+0duihOHoLWlxZWyVCh?=
 =?iso-8859-1?Q?rB0bp1Kgo/VoBwcCFhGFzk+chbGcqJzfyxCKzfrklBoV0ugS1pv4PGuBgd?=
 =?iso-8859-1?Q?UeCIvl1zicUjql30l7oEPoPyTkiet4CiJGaTKdbKExzdkCFSxezgKuwuQA?=
 =?iso-8859-1?Q?RrwTe+Js7/+w8cXmKFw2VO9GMPP7BUvupJcmXPE6SPrIZh5qMaK4FfLfF/?=
 =?iso-8859-1?Q?TSoouPSZCFkvC1RZoNKMtSmOe0eJ2XWlC9Ohv9hZY7jetxazU2rkODu3ar?=
 =?iso-8859-1?Q?gpzDg1zJ5P3D2DD3qoQDLJkluFAnTyqc/rNAXG1R9nqq3yfgjluGdKIctf?=
 =?iso-8859-1?Q?kHZXBzW9fS/KO9B2d1PSy95WT8kqC43UoLLYzqeJFCQKsptClMPG/JGGE0?=
 =?iso-8859-1?Q?W0VlGv+QeclJt3leMVDHu6uW37N/W7kQ7x14GdEvvdtGovacRCB1KmYGzL?=
 =?iso-8859-1?Q?Z2DTaIjxcWxP53XZblAEoLI+wSYf6B6M3nuwFYg1utNx6UvnYPLKVZNIG3?=
 =?iso-8859-1?Q?PMC3EUpEX1AUbG6Xo3QS4u7PY5HldbE2XuLX452bQWJTBkuRPxZrdiq51V?=
 =?iso-8859-1?Q?LzSMI+xv+Spn5WsVnEGVkGmLzoRDkiv0s1+y8QVS/jHG7I/HFSt/rAnv95?=
 =?iso-8859-1?Q?x0yLOv2SQmBM30FwMc1MBaOLEHZCLjo8wF1MZOBxiKxCfKNFhc0u4gcnCn?=
 =?iso-8859-1?Q?Xo9pD2lLqY9e+y28z/+yUPxhPrZPQe9KOfPr3soWE92+/UCXFYpvNfR6Zi?=
 =?iso-8859-1?Q?sfITitxvS/5v1Ai0zTojCacWUY/tf83/jApJwfwgvk5c92Qt2T7Fpzf2H0?=
 =?iso-8859-1?Q?imoxi1oWwqykJgtBHN4pHgTWP4Vx0SKWp4paOdyHNMIFfqF3L/bFsv4DtD?=
 =?iso-8859-1?Q?tZ9qIGGldxRx76kmD4nAiYwtLOJ14hbwbCp2/vPDiqVCEBLdP/Ryp9zg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f5680a-2271-4f57-581e-08dbcc1aa8a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:31:47.7032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IpYhVcalzVAoueCQ0o0kYHjyaMobj6XjpPCxLNfqtB5kFrS18Vz/KAAV54oHXoXMtcfNmHGg/C2bTFhZPnQBUT3QPkD/Dfvb7j+7EASA5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/huc: Extract version and binary
 offset from new HuC headers
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

On Fri, Sep 15, 2023 at 03:34:55PM -0700, Daniele Ceraolo Spurio wrote:
>The GSC-enabled HuC binary starts with a GSC header, which is followed
>by the legacy-style CSS header and the binary itself. We can parse the
>GSC headers to find the HuC version and the location of the binary to
>be used for the DMA transfer.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/abi/gsc_binary_headers.h |  74 ++++++++++
> drivers/gpu/drm/xe/xe_huc.c                 | 131 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_huc.h                 |   1 +
> drivers/gpu/drm/xe/xe_uc_fw.c               | 144 +++++++++++++-------
> drivers/gpu/drm/xe/xe_uc_fw.h               |   2 +-
> drivers/gpu/drm/xe/xe_uc_fw_types.h         |   5 +
> 6 files changed, 304 insertions(+), 53 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>
>diff --git a/drivers/gpu/drm/xe/abi/gsc_binary_headers.h b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>new file mode 100644
>index 000000000000..666f2665b5b4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>@@ -0,0 +1,74 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _GSC_BINARY_HEADERS_H_
>+#define _GSC_BINARY_HEADERS_H_
>+
>+#include <linux/types.h>
>+
>+struct gsc_version {
>+	u16 major;
>+	u16 minor;
>+	u16 hotfix;
>+	u16 build;
>+} __packed;
>+
>+/* Code partition directory (CPD) structures */
>+struct gsc_cpd_header_v2 {
>+	u32 header_marker;
>+#define GSC_CPD_HEADER_MARKER 0x44504324
>+
>+	u32 num_of_entries;
>+	u8 header_version;
>+	u8 entry_version;
>+	u8 header_length; /* in bytes */
>+	u8 flags;
>+	u32 partition_name;
>+	u32 crc32;
>+} __packed;
>+
>+struct gsc_cpd_entry {
>+	u8 name[12];
>+
>+	/*
>+	 * Bits 0-24: offset from the beginning of the code partition
>+	 * Bit 25: huffman compressed
>+	 * Bits 26-31: reserved
>+	 */
>+	u32 offset;
>+#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>+#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>+
>+	/*
>+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
>+	 * refers to the uncompressed size. For software-compressed modules,
>+	 * this refers to the compressed size.
>+	 */
>+	u32 length;
>+
>+	u8 reserved[4];
>+} __packed;
>+
>+struct gsc_manifest_header {
>+	u32 header_type; /* 0x4 for manifest type */
>+	u32 header_length; /* in dwords */
>+	u32 header_version;
>+	u32 flags;
>+	u32 vendor;
>+	u32 date;
>+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
>+	u32 header_id;
>+	u32 internal_data;
>+	struct gsc_version fw_version;
>+	u32 security_version;
>+	struct gsc_version meu_kit_version;
>+	u32 meu_manifest_version;
>+	u8 general_data[4];
>+	u8 reserved3[56];
>+	u32 modulus_size; /* in dwords */
>+	u32 exponent_size; /* in dwords */
>+} __packed;
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index 293403d16f25..ff86b7d8633e 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -5,12 +5,14 @@
>
> #include "xe_huc.h"
>
>+#include "abi/gsc_binary_headers.h"
> #include "regs/xe_guc_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_gt_printk.h"
> #include "xe_guc.h"
> #include "xe_mmio.h"
> #include "xe_uc_fw.h"
>@@ -33,6 +35,135 @@ huc_to_guc(struct xe_huc *huc)
> 	return &container_of(huc, struct xe_uc, huc)->guc;
> }
>
>+#define HUC_CSS_MODULE_TYPE 0x6
>+static bool css_valid(const void *data, size_t size)
>+{
>+	const struct uc_css_header *css = data;
>+
>+	if (unlikely(size < sizeof(struct uc_css_header)))
>+		return false;
>+
>+	if (css->module_type != HUC_CSS_MODULE_TYPE)
>+		return false;
>+
>+	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>+		return false;
>+
>+	return true;
>+}
>+
>+static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
>+{
>+	return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>+}
>+
>+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t size)
>+{
>+	struct xe_huc *huc = container_of(huc_fw, struct xe_huc, fw);
>+	struct xe_gt *gt = huc_to_gt(huc);
>+	const struct gsc_cpd_header_v2 *header = data;
>+	const struct gsc_cpd_entry *entry;
>+	size_t min_size = sizeof(*header);
>+	int i;
>+
>+	if (!huc_fw->has_gsc_headers) {
>+		xe_gt_err(gt, "Invalid FW type for GSC header parsing!\n");
>+		return -EINVAL;
>+	}
>+
>+	if (size < sizeof(*header)) {
>+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>+		return -ENODATA;
>+	}
>+
>+	/*
>+	 * The GSC-enabled HuC binary starts with a directory header, followed
>+	 * by a series of entries. Each entry is identified by a name and
>+	 * points to a specific section of the binary containing the relevant
>+	 * data. The entries we're interested in are:
>+	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
>+	 *               contains the version info.
>+	 * - "huc_fw": points to the legacy-style binary that can be used for
>+	 *             load via the DMA. This entry only contains a valid CSS
>+	 *             on binaries for platforms that support 2-step HuC load
>+	 *             via dma and auth via GSC (like MTL).
>+	 *
>+	 * --------------------------------------------------
>+	 * [  gsc_cpd_header_v2                             ]
>+	 * --------------------------------------------------
>+	 * [  gsc_cpd_entry[]                               ]
>+	 * [      entry1                                    ]
>+	 * [      ...                                       ]
>+	 * [      entryX                                    ]
>+	 * [          "HUCP.man"                            ]
>+	 * [           ...                                  ]
>+	 * [           offset  >----------------------------]------o
>+	 * [      ...                                       ]      |
>+	 * [      entryY                                    ]      |
>+	 * [          "huc_fw"                              ]      |
>+	 * [           ...                                  ]      |
>+	 * [           offset  >----------------------------]----------o
>+	 * --------------------------------------------------      |   |
>+	 *                                                         |   |
>+	 * --------------------------------------------------      |   |
>+	 * [ gsc_manifest_header                            ]<-----o   |
>+	 * [  ...                                           ]          |
>+	 * [  gsc_version fw_version                        ]          |
>+	 * [  ...                                           ]          |
>+	 * --------------------------------------------------          |
>+	 *                                                             |
>+	 * --------------------------------------------------          |
>+	 * [ data[]                                         ]<---------o
>+	 * [  ...                                           ]
>+	 * [  ...                                           ]
>+	 * --------------------------------------------------
>+	 */
>+
>+	if (header->header_marker != GSC_CPD_HEADER_MARKER) {
>+		xe_gt_err(gt, "invalid marker for CPD header: 0x%08x!\n",
>+			  header->header_marker);
>+		return -EINVAL;
>+	}
>+
>+	/* we only have binaries with header v2 and entry v1 for now */
>+	if (header->header_version != 2 || header->entry_version != 1) {
>+		xe_gt_err(gt, "invalid CPD header/entry version %u:%u!\n",
>+			  header->header_version, header->entry_version);
>+		return -EINVAL;
>+	}
>+
>+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>+		xe_gt_err(gt, "invalid CPD header length %u!\n", header->header_length);
>+		return -EINVAL;
>+	}
>+
>+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
>+	if (size < min_size) {
>+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>+		return -ENODATA;
>+	}
>+
>+	entry = data + header->header_length;
>+
>+	for (i = 0; i < header->num_of_entries; i++, entry++) {
>+		if (strcmp(entry->name, "HUCP.man") == 0) {
>+			const struct gsc_manifest_header *manifest = data + entry_offset(entry);
>+
>+			huc_fw->major_ver_found = manifest->fw_version.major;
>+			huc_fw->minor_ver_found = manifest->fw_version.minor;
>+		}
>+
>+		if (strcmp(entry->name, "huc_fw") == 0) {
>+			u32 offset = entry_offset(entry);
>+
>+			if (offset < size && css_valid(data + offset, size - offset))

isn't this an error condition?

>+				huc_fw->dma_start_offset = offset;
>+		}
>+	}

if we are here but we didn't find huc_fw, shouldn't we rather bail out?

I think the assumption for the caller should be that after this function
returns success, dma_start_offset must be set (to a valid value) and the
version parsed.  It seems like we later validade if dma_start_offset and
version are set, but isn't it more fragile to validate later?

>+
>+	return 0;
>+}
>+
> int xe_huc_init(struct xe_huc *huc)
> {
> 	struct xe_device *xe = huc_to_xe(huc);
>diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
>index 5802c43b6ce2..e151bcbe13c6 100644
>--- a/drivers/gpu/drm/xe/xe_huc.h
>+++ b/drivers/gpu/drm/xe/xe_huc.h
>@@ -10,6 +10,7 @@
>
> struct drm_printer;
>
>+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t size);

as said in the last patch, I don't think the decision to call this
function should be based on the filename. IMO this function should not
be exported outside xe_huc.c

> int xe_huc_init(struct xe_huc *huc);
> int xe_huc_upload(struct xe_huc *huc);
> int xe_huc_auth(struct xe_huc *huc);
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 138960138872..f956457d0b11 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -13,6 +13,7 @@
> #include "xe_device_types.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_huc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>@@ -344,57 +345,21 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> 	return -ENOEXEC;
> }
>
>-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>+static int __parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
> {
> 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct device *dev = xe->drm.dev;
>-	const struct firmware *fw = NULL;
> 	struct uc_css_header *css;
>-	struct xe_bo *obj;
> 	size_t size;
>-	int err;
>-
>-	/*
>-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>-	 * before we're looked at the HW caps to see if we have uc support
>-	 */
>-	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>-	xe_assert(xe, !uc_fw->status);
>-	xe_assert(xe, !uc_fw->path);
>-
>-	uc_fw_auto_select(xe, uc_fw);
>-	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>-			       XE_UC_FIRMWARE_SELECTED :
>-			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>-
>-	if (!xe_uc_fw_is_supported(uc_fw))
>-		return 0;
>-
>-	uc_fw_override(uc_fw);
>-
>-	/* an empty path means the firmware is disabled */
>-	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>-		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>-		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>-		return 0;
>-	}
>-
>-	err = request_firmware(&fw, uc_fw->path, dev);
>-	if (err)
>-		goto fail;
>
> 	/* Check the size of the blob before examining buffer contents */
>-	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>+	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -ENODATA;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -ENODATA;
> 	}
>
>-	css = (struct uc_css_header *)fw->data;
>+	css = (struct uc_css_header *)fw_data;
>
> 	/* Check integrity of size values inside CSS header */
> 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
>@@ -403,9 +368,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 		drm_warn(&xe->drm,
> 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, sizeof(struct uc_css_header));
>-		err = -EPROTO;
>-		goto fail;
>+			 fw_size, sizeof(struct uc_css_header));
>+		return -EPROTO;
> 	}
>
> 	/* uCode size must calculated from other sizes */
>@@ -417,12 +381,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	/* At least, it should have header, uCode and RSA. Size of all three. */
> 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
> 		uc_fw->rsa_size;
>-	if (unlikely(fw->size < size)) {
>+	if (unlikely(fw_size < size)) {
> 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
> 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			 fw->size, size);
>-		err = -ENOEXEC;
>-		goto fail;
>+			 fw_size, size);
>+		return -ENOEXEC;
> 	}
>
> 	/* Get version numbers from the CSS header */
>@@ -433,6 +396,86 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> 					   css->sw_version);
>
>+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>+		guc_read_css_info(uc_fw, css);
>+
>+	return 0;
>+}
>+
>+static int parse_css_header(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>+{
>+	return __parse_css_header(uc_fw, fw->data, fw->size);
>+}
>+
>+static int parse_gsc_header(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>+{
>+	int err;
>+
>+	/* only supported for HuC from now */
>+	if (uc_fw->type != XE_UC_FW_TYPE_HUC)
>+		return -EINVAL;
>+
>+	err = xe_huc_parse_gsc_header(uc_fw, fw->data, fw->size);

parse_gsc_header() here versus xe_huc_parse_gsc_header() seems confusing
from the abstraction pov and looks like a layering violation.

>+	if (err)
>+		return err;
>+
>+	if (uc_fw->dma_start_offset) {
>+		u32 delta = uc_fw->dma_start_offset;
>+
>+		err = __parse_css_header(uc_fw, fw->data + delta, fw->size - delta);
>+		if (err)
>+			return err;
>+	}
>+
>+	return 0;
>+}
>+
>+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)

can we split this patch in 2 with the code movement first?  It becomes
hard to read the delta when there's a lot of code moving at the same
time.

>+{
>+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct device *dev = xe->drm.dev;
>+	const struct firmware *fw = NULL;
>+	struct xe_bo *obj;
>+	int err;
>+
>+	/*
>+	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
>+	 * before we're looked at the HW caps to see if we have uc support
>+	 */
>+	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>+	xe_assert(xe, !uc_fw->status);
>+	xe_assert(xe, !uc_fw->path);
>+
>+	uc_fw_auto_select(xe, uc_fw);
>+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>+			       XE_UC_FIRMWARE_SELECTED :
>+			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>+
>+	if (!xe_uc_fw_is_supported(uc_fw))
>+		return 0;
>+
>+	uc_fw_override(uc_fw);
>+
>+	/* an empty path means the firmware is disabled */
>+	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>+		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>+		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
>+		return 0;
>+	}
>+
>+	err = request_firmware(&fw, uc_fw->path, dev);
>+	if (err)
>+		goto fail;
>+
>+	if (uc_fw->has_gsc_headers)
>+		err = parse_gsc_header(uc_fw, fw);
>+	else
>+		err = parse_css_header(uc_fw, fw);
>+	if (err)
>+		goto fail;
>+
> 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> 		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> 		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
>@@ -441,9 +484,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	if (err)
> 		goto fail;
>
>-	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>-		guc_read_css_info(uc_fw, css);
>-
> 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
> 				     ttm_bo_type_kernel,
> 				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>@@ -496,7 +536,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
> 	/* Set the source address for the uCode */
>-	src_offset = uc_fw_ggtt_offset(uc_fw);
>+	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->dma_start_offset;
> 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
> 	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>index a519c77d4962..44aee1bdb133 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>@@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
>
> static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
> {
>-	return sizeof(struct uc_css_header) + uc_fw->ucode_size;
>+	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->dma_start_offset;
> }
>
> static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>index 444bff83cdbe..850224890f25 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>@@ -91,6 +91,9 @@ struct xe_uc_fw {
> 	/** @bo: XE BO for uC firmware */
> 	struct xe_bo *bo;
>
>+	/** @has_gsc_headers: whether the FW starts with GSC headers instead of CSS */
>+	bool has_gsc_headers;
>+
> 	/*
> 	 * The firmware build process will generate a version header file with
> 	 * major and minor version defined. The versions are built into CSS
>@@ -113,6 +116,8 @@ struct xe_uc_fw {
> 	u32 rsa_size;
> 	/** @ucode_size: micro kernel size */
> 	u32 ucode_size;
>+	/** @dma_start_offset: offset within the blob at which the FW is located */
>+	u32 dma_start_offset;

maybe `u32 ucode_offset`? 

Lucas De Marchi

> 	/** @private_data_size: size of private data found in uC css header */
> 	u32 private_data_size;
>-- 
>2.41.0
>
