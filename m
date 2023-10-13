Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA3CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 19:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0718F10E059;
	Fri, 13 Oct 2023 19:35:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78E10E059
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697225724; x=1728761724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3y+iZbxEabRSj+nRmbzV55bWOMwBMpJc2YjTR/UPzOo=;
 b=G6BjXcOd/R7w8GogALO0FhIgfFzmAlc0ijnv2HnNzkEmNFn9q+fLVVfh
 KjacmsfUMg/S2C+otGPJkATT/GmnTQ1u+CGRA1nSNBe7vxfLYIEtS13MU
 e1U/GycDKRF8svkSy0wDJv6bhriuBXF107LuP4eO/zQ3J9J/Um3+yLpsL
 +cftbv1oRN3sf9S8RxjWZpkc3Z9k6yMFCOXYGlEng4rjsPfzkMlxlVLvY
 cxwx8ENGZ38tNMdpMrvu7LJa63/yJ+uSV43u2w201RkPYzRJubw+y66AF
 dcVR8wLvOxK+5TSaGuBFKs4xWesd89ANO7dthf1UIk8S3vN+kB7gfAfWm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365514534"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="365514534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 12:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878630355"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="878630355"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 12:35:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:35:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 12:35:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 12:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXLUuSbjqWNIW8vqh351HWQGuYiM0e/K/9QnNLpUarFTkiOdQk1e637A2irjH8PkUIfzSbt4IT6krqsmA/TozH2Bz1XINaSE/7Ol4KFS8cbqjKutCWxrVQKbzf1PEWeHy1IGUGrjeRlTEa7v3SziFh9P5+DO6mGUxAnYbKVrYJ1Dzoioq4LNfJ4GPQk96GQhkRNxVPuTPzZnd5e+X9vGdmX88W5QxXEc/wY8mVlQU5deCZZtpOptEa8SCybsOPWaglhwNfETxBVyun1IYl6uR+jPW2ZSFXu07WoxK7UU+vUGuuCL6l7+Tsy7lxiLBK8FcmfpzcCo5KZtvxCGuMDuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzQgEbnB+9XRkkZ4e++R7noEyFEYWpHac1kSynqoPq8=;
 b=EohvSi1PCZeo286hoMG5j2Vq2aDNvmqWuzGI4DKhEZTh28VAkF20n4vPuciPClfVw3ie6KuCLpTploSFIQb7CTCRLmYIR5TVqImJrPpbJcTpQrCT3DfH+TA7ptkzc/SU1XNhOoyLm8asY2VZ+i3HyXNodvJynhVYGQZyqXfBLhh0u/jcbQowA/e23tBCE3S6VDdy5lmqX+DQP1YAETo0CMhP/7kzjcnR3Onex0MrtT09tU7fluTYd4xyt2EzB0gXxalc3MSKxDDWhfs3nwN9AABODvoqRZeqP3FKD+HEn41voXZARj5iCmChQjIsdheHf5hP2tlC/qc13VFXZrHwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 19:35:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 19:35:21 +0000
Date: Fri, 13 Oct 2023 14:35:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <dve6v32diqpvodyhbmwhjdne7bo5cktl3r6nbojslci6q2krbb@4gxpg27byifq>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-2-daniele.ceraolospurio@intel.com>
 <qafchp6pojez7hmi42qrz7qsoygjfjemo7uskoi4k4yzchhqhd@lf2hepkprzfv>
 <696bb591-e7c7-4a0d-9777-d6872b7538dd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <696bb591-e7c7-4a0d-9777-d6872b7538dd@intel.com>
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1694fa-1da9-492c-aa26-08dbcc2389d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbadLbAu3Vyi5AcWz7Y5ySHG0DCYRbHJlZEFi6JwofBOB4bM8XdIIqzhnMAU6UPa/bt4fbwgLMjFA+VwCCLASAMmbu7yvOF4nHS8HhY9Z3FKXAHUDWytgZzZ4ViT0T/fc9c5q9WjpqzKdVeMGPrCd4V4KaomTgBYfvwIX/YA1cwduxhg1BgZck0Z5zKlxw+zbDmuGU/l5B6lr9skK8DuRbUtcAAjkGduGfMkXcnPUyDwzmkoJslKC9L3+G2qzgMEE82GTs5z66EOA1TRywrVEbbT9SbRJ2kcPT6NBEHafYHBa10r44CuXAuvGQLRomOEk5A79FCBuvRfZDlYCAjnIHFRaqTBvGbTVdjV318/dDZGNwv2zzWaFkAgkVidqBNT79ZBZADdHb5eQR/rzce4poFJUtjlZaA3oDpI4WXcoCshUEmiRUjI+47M92BrkiNvL0ZnkeSoIdP49WjGrbdCWRovW11HNA7tr48q74DNoVSkW3xUyxLWjh20OmvhfYz9Jz6o7hOTYsFpPC3/y0uVz43P/P5ceuh4lrgzVQqeM1UNfs04Dr3P0SI3XGg8spOp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(30864003)(2906002)(6666004)(6506007)(41300700001)(66476007)(66556008)(66946007)(4326008)(478600001)(5660300002)(26005)(6512007)(6486002)(9686003)(83380400001)(316002)(6636002)(33716001)(8676002)(8936002)(38100700002)(82960400001)(86362001)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AKaK7HDh2gazdHG4MVlgzbJWBjnaOLe8IWFt+osRkiCsNz9Ulm7xIEf2Cf?=
 =?iso-8859-1?Q?LXh7Xz+Z5RNia2g5mjXJtBIdE67NG+v6ZKRTAVFQSab6DiGmkvZ+FS45Q8?=
 =?iso-8859-1?Q?lodRU+xfnjN1XoLl8gI9QC47t/GXuRYcsdXA2EqaE3AtbhFLWg/1VpE4w5?=
 =?iso-8859-1?Q?bb5A0T7ZPLDtKHXvUNdmSfc/X/kqba40veDn4Zpzhbg4NtGQGsaVPEHnZa?=
 =?iso-8859-1?Q?Nc+Yz2fisXpd8KVtpR2Uvcev9eijfg9gPHMWtYgbfjJ4s2FmVknBs3V2Bt?=
 =?iso-8859-1?Q?ZG05UfpnyNN239bYoxvWPecGRAYFEnGROhsaODxvWRRPSpqBuGMkKeZ4ju?=
 =?iso-8859-1?Q?nhKAR1BryLTAxKr7wsSSj80IoKWVURKb6OwttvWKyxQIOiZxXJ1eq4Ee8R?=
 =?iso-8859-1?Q?u/DmybVzHVBiAV2/l3sWeRPtxps/Nfp/Q6Jf28AMX2dlJDWsarpmzdhNam?=
 =?iso-8859-1?Q?Cvr5aVVAQUuQvRWiC6yr1VCvXLChjnx7SbALWqf5hULRaUg2RL8xjE8wDX?=
 =?iso-8859-1?Q?I0jvz1MFrBodfSPskq6xSrA9RguldVo87kTKqEJo7K5FfGSWfJmOLyMW/5?=
 =?iso-8859-1?Q?CtUpjFdYER/I9EOJoHJMUKR3m1YX8dHIpOb3tZ2lqqGT4+o/JRc8YCfY82?=
 =?iso-8859-1?Q?+ESnkumHCHaQHobMeY16YorPeOuAVO7F3uu30lyhf0dVUXONPZ7ck+PP9C?=
 =?iso-8859-1?Q?XDyK+SBfW7EZAxleLNWREi6k++NBWkBcaxYKrX3to8WVct5zauX6MEzeh4?=
 =?iso-8859-1?Q?PQ8JnqKTEJxuRQki1lSFFCLgpPfsLTnyx2+qaGA+yYMjbIfYtvu12gPTxh?=
 =?iso-8859-1?Q?rbhU7xggEh1r43chFLe8G1HRxoljk3p8uthjq6+hmuwz6t5p1V6inX0Yn9?=
 =?iso-8859-1?Q?MHeNN1cRKd2W2XJzrU9qhcuN+/dtm58YfmAbEn5ffyZeU6mkbzbDgojDDa?=
 =?iso-8859-1?Q?0dHPIVa1eckOJLluOfBvDE8WVNlIvozk27EVVkEPYm28Ct2tRpR84dr+iL?=
 =?iso-8859-1?Q?HWJ7WfZKLb/yGgWlYpEPWwJndWCWQXnEEKQHzQRkGuQZSD2sN6HQRo0aOh?=
 =?iso-8859-1?Q?TEM9iuXM5EafdOHZtO47cuiajyJjEOliffofNm6+O+sEJYsjrtlJXgRrGs?=
 =?iso-8859-1?Q?VFr6cSM8pGPmSLg6XMT9mwdRGy8tVvZ1TUXwSyAwfLNgkuxKglQIsmgluV?=
 =?iso-8859-1?Q?EtybZjHKjXVZS++EG0cGwLn+ASjqaNZ433oKKKAQsRAl1b0tnIsP3LEObv?=
 =?iso-8859-1?Q?9ikuF+hfyAbw97nLlyb5ChLcAUzVw6McTra7SG30fLDwNl9Ar0A8ZoJ3Us?=
 =?iso-8859-1?Q?qvj2do5AQmBRYls20fDxmEkDQ/UPL9RZeKwUVhvkRALKhwFJXEiqSfwtwL?=
 =?iso-8859-1?Q?fwJR/N8t2yvFpbhBrBp1SBns3Mkdg6MSo72mJQzDTXyxQ1Jf7nleiFqpJs?=
 =?iso-8859-1?Q?bQypRZ95EqBgkoW8SdrWvqzZxUui08+2SpOVQOcTrWdxZ5FBqhITZ7PrlZ?=
 =?iso-8859-1?Q?DOGgCmwaAxOLFq5yMPKo1dQ1MOqzmWZVpgKTvRbjz8UfhCFXTBy850SQvk?=
 =?iso-8859-1?Q?ZKj1jXKsxK+sIBaqTBFxC88UQ1xmoIC03zGG4IEAUQQNmgo93xm/jUvAm1?=
 =?iso-8859-1?Q?N7cqgOKTZbr0okCDX0WYZrOl6RxXq+uG9N75/D8S27mzS6ZCs+Ltsd0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1694fa-1da9-492c-aa26-08dbcc2389d2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 19:35:21.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ckwwo7nvmLMsFloW5GfSR2C6A3KCbRNvt40E6ZxHP0DzURehqmUZeaATmlkkMOpUl9VeBwLKgDxGsmSOjV+AR9bmap1PltDB6we85zEQ88k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

On Fri, Oct 13, 2023 at 11:59:01AM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 10/13/2023 11:31 AM, Lucas De Marchi wrote:
>>On Fri, Sep 15, 2023 at 03:34:55PM -0700, Daniele Ceraolo Spurio wrote:
>>>The GSC-enabled HuC binary starts with a GSC header, which is followed
>>>by the legacy-style CSS header and the binary itself. We can parse the
>>>GSC headers to find the HuC version and the location of the binary to
>>>be used for the DMA transfer.
>>>
>>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/abi/gsc_binary_headers.h |  74 ++++++++++
>>>drivers/gpu/drm/xe/xe_huc.c                 | 131 ++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_huc.h                 |   1 +
>>>drivers/gpu/drm/xe/xe_uc_fw.c               | 144 +++++++++++++-------
>>>drivers/gpu/drm/xe/xe_uc_fw.h               |   2 +-
>>>drivers/gpu/drm/xe/xe_uc_fw_types.h         |   5 +
>>>6 files changed, 304 insertions(+), 53 deletions(-)
>>>create mode 100644 drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/gsc_binary_headers.h 
>>>b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>new file mode 100644
>>>index 000000000000..666f2665b5b4
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>@@ -0,0 +1,74 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2023 Intel Corporation
>>>+ */
>>>+
>>>+#ifndef _GSC_BINARY_HEADERS_H_
>>>+#define _GSC_BINARY_HEADERS_H_
>>>+
>>>+#include <linux/types.h>
>>>+
>>>+struct gsc_version {
>>>+    u16 major;
>>>+    u16 minor;
>>>+    u16 hotfix;
>>>+    u16 build;
>>>+} __packed;
>>>+
>>>+/* Code partition directory (CPD) structures */
>>>+struct gsc_cpd_header_v2 {
>>>+    u32 header_marker;
>>>+#define GSC_CPD_HEADER_MARKER 0x44504324
>>>+
>>>+    u32 num_of_entries;
>>>+    u8 header_version;
>>>+    u8 entry_version;
>>>+    u8 header_length; /* in bytes */
>>>+    u8 flags;
>>>+    u32 partition_name;
>>>+    u32 crc32;
>>>+} __packed;
>>>+
>>>+struct gsc_cpd_entry {
>>>+    u8 name[12];
>>>+
>>>+    /*
>>>+     * Bits 0-24: offset from the beginning of the code partition
>>>+     * Bit 25: huffman compressed
>>>+     * Bits 26-31: reserved
>>>+     */
>>>+    u32 offset;
>>>+#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>>>+#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>>>+
>>>+    /*
>>>+     * Module/Item length, in bytes. For Huffman-compressed 
>>>modules, this
>>>+     * refers to the uncompressed size. For software-compressed 
>>>modules,
>>>+     * this refers to the compressed size.
>>>+     */
>>>+    u32 length;
>>>+
>>>+    u8 reserved[4];
>>>+} __packed;
>>>+
>>>+struct gsc_manifest_header {
>>>+    u32 header_type; /* 0x4 for manifest type */
>>>+    u32 header_length; /* in dwords */
>>>+    u32 header_version;
>>>+    u32 flags;
>>>+    u32 vendor;
>>>+    u32 date;
>>>+    u32 size; /* In dwords, size of entire manifest (header + 
>>>extensions) */
>>>+    u32 header_id;
>>>+    u32 internal_data;
>>>+    struct gsc_version fw_version;
>>>+    u32 security_version;
>>>+    struct gsc_version meu_kit_version;
>>>+    u32 meu_manifest_version;
>>>+    u8 general_data[4];
>>>+    u8 reserved3[56];
>>>+    u32 modulus_size; /* in dwords */
>>>+    u32 exponent_size; /* in dwords */
>>>+} __packed;
>>>+
>>>+#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>>index 293403d16f25..ff86b7d8633e 100644
>>>--- a/drivers/gpu/drm/xe/xe_huc.c
>>>+++ b/drivers/gpu/drm/xe/xe_huc.c
>>>@@ -5,12 +5,14 @@
>>>
>>>#include "xe_huc.h"
>>>
>>>+#include "abi/gsc_binary_headers.h"
>>>#include "regs/xe_guc_regs.h"
>>>#include "xe_assert.h"
>>>#include "xe_bo.h"
>>>#include "xe_device.h"
>>>#include "xe_force_wake.h"
>>>#include "xe_gt.h"
>>>+#include "xe_gt_printk.h"
>>>#include "xe_guc.h"
>>>#include "xe_mmio.h"
>>>#include "xe_uc_fw.h"
>>>@@ -33,6 +35,135 @@ huc_to_guc(struct xe_huc *huc)
>>>    return &container_of(huc, struct xe_uc, huc)->guc;
>>>}
>>>
>>>+#define HUC_CSS_MODULE_TYPE 0x6
>>>+static bool css_valid(const void *data, size_t size)
>>>+{
>>>+    const struct uc_css_header *css = data;
>>>+
>>>+    if (unlikely(size < sizeof(struct uc_css_header)))
>>>+        return false;
>>>+
>>>+    if (css->module_type != HUC_CSS_MODULE_TYPE)
>>>+        return false;
>>>+
>>>+    if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>>>+        return false;
>>>+
>>>+    return true;
>>>+}
>>>+
>>>+static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
>>>+{
>>>+    return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>>>+}
>>>+
>>>+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void 
>>>*data, size_t size)
>>>+{
>>>+    struct xe_huc *huc = container_of(huc_fw, struct xe_huc, fw);
>>>+    struct xe_gt *gt = huc_to_gt(huc);
>>>+    const struct gsc_cpd_header_v2 *header = data;
>>>+    const struct gsc_cpd_entry *entry;
>>>+    size_t min_size = sizeof(*header);
>>>+    int i;
>>>+
>>>+    if (!huc_fw->has_gsc_headers) {
>>>+        xe_gt_err(gt, "Invalid FW type for GSC header parsing!\n");
>>>+        return -EINVAL;
>>>+    }
>>>+
>>>+    if (size < sizeof(*header)) {
>>>+        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>>>+        return -ENODATA;
>>>+    }
>>>+
>>>+    /*
>>>+     * The GSC-enabled HuC binary starts with a directory header, 
>>>followed
>>>+     * by a series of entries. Each entry is identified by a name and
>>>+     * points to a specific section of the binary containing the 
>>>relevant
>>>+     * data. The entries we're interested in are:
>>>+     * - "HUCP.man": points to the GSC manifest header for the 
>>>HuC, which
>>>+     *               contains the version info.
>>>+     * - "huc_fw": points to the legacy-style binary that can be 
>>>used for
>>>+     *             load via the DMA. This entry only contains a 
>>>valid CSS
>>>+     *             on binaries for platforms that support 2-step 
>>>HuC load
>>>+     *             via dma and auth via GSC (like MTL).
>>>+     *
>>>+     * --------------------------------------------------
>>>+     * [  gsc_cpd_header_v2                             ]
>>>+     * --------------------------------------------------
>>>+     * [  gsc_cpd_entry[]                               ]
>>>+     * [      entry1                                    ]
>>>+     * [      ...                                       ]
>>>+     * [      entryX                                    ]
>>>+     * [          "HUCP.man"                            ]
>>>+     * [           ...                                  ]
>>>+     * [           offset >----------------------------]------o
>>>+     * [      ...                                       ] |
>>>+     * [      entryY                                    ] |
>>>+     * [          "huc_fw"                              ] |
>>>+     * [           ...                                  ] |
>>>+     * [           offset >----------------------------]----------o
>>>+     * -------------------------------------------------- |   |
>>>+     * |   |
>>>+     * -------------------------------------------------- |   |
>>>+     * [ gsc_manifest_header ]<-----o   |
>>>+     * [  ... ]          |
>>>+     * [  gsc_version fw_version ]          |
>>>+     * [  ... ]          |
>>>+     * --------------------------------------------------          |
>>>+ *                                                             |
>>>+     * --------------------------------------------------          |
>>>+     * [ data[] ]<---------o
>>>+     * [  ...                                           ]
>>>+     * [  ...                                           ]
>>>+     * --------------------------------------------------
>>>+     */
>>>+
>>>+    if (header->header_marker != GSC_CPD_HEADER_MARKER) {
>>>+        xe_gt_err(gt, "invalid marker for CPD header: 0x%08x!\n",
>>>+              header->header_marker);
>>>+        return -EINVAL;
>>>+    }
>>>+
>>>+    /* we only have binaries with header v2 and entry v1 for now */
>>>+    if (header->header_version != 2 || header->entry_version != 1) {
>>>+        xe_gt_err(gt, "invalid CPD header/entry version %u:%u!\n",
>>>+              header->header_version, header->entry_version);
>>>+        return -EINVAL;
>>>+    }
>>>+
>>>+    if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>>>+        xe_gt_err(gt, "invalid CPD header length %u!\n", 
>>>header->header_length);
>>>+        return -EINVAL;
>>>+    }
>>>+
>>>+    min_size = header->header_length + sizeof(*entry) * 
>>>header->num_of_entries;
>>>+    if (size < min_size) {
>>>+        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>>>+        return -ENODATA;
>>>+    }
>>>+
>>>+    entry = data + header->header_length;
>>>+
>>>+    for (i = 0; i < header->num_of_entries; i++, entry++) {
>>>+        if (strcmp(entry->name, "HUCP.man") == 0) {
>>>+            const struct gsc_manifest_header *manifest = data + 
>>>entry_offset(entry);
>>>+
>>>+            huc_fw->major_ver_found = manifest->fw_version.major;
>>>+            huc_fw->minor_ver_found = manifest->fw_version.minor;
>>>+        }
>>>+
>>>+        if (strcmp(entry->name, "huc_fw") == 0) {
>>>+            u32 offset = entry_offset(entry);
>>>+
>>>+            if (offset < size && css_valid(data + offset, size - 
>>>offset))
>>
>>isn't this an error condition?
>
>you mean "offset < size" ? That's just there to make sure that the 
>offset doesn't point to outside the binary, so we do want it to be 
>less than the size.

yes, that's the error condition I'm saying would be silently ignored. It
looks odd that this function would return 0 even if we have an invalid
HuC firmware with the offset pointing outside.

>
>>
>>>+ huc_fw->dma_start_offset = offset;
>>>+        }
>>>+    }
>>
>>if we are here but we didn't find huc_fw, shouldn't we rather bail out?
>>
>>I think the assumption for the caller should be that after this function
>>returns success, dma_start_offset must be set (to a valid value) and the
>>version parsed.  It seems like we later validade if dma_start_offset and
>>version are set, but isn't it more fragile to validate later?
>
>The issue here is that the "huc_fw" section doesn't exist in the DG2 
>HuC binary (which does have GSC headers), but it does in the ones for 

right now this is controlled by the filename in the last patch:

	if (strstr(uc_fw->path, "gsc"))
		uc_fw->has_gsc_headers = true;

( which I don't like, but it seems safe since we don't have such a
firmware for DG2 right now )

>MTL and newer platforms, so it's not guaranteed to actually be there. 
>I could modify the code to assume it's always there and add an assert 
>for DG2, so if we ever want to add support for that we'll hit it and 
>know to come back and rework the code to handle the section not being 
>there. Would that work?

Yes, but for DG2 we have the GSC header but we don't have the entry
pointing to the blob...  How would we find the right blob in this case?
Any version difference in the headers?

>
>>
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>int xe_huc_init(struct xe_huc *huc)
>>>{
>>>    struct xe_device *xe = huc_to_xe(huc);
>>>diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
>>>index 5802c43b6ce2..e151bcbe13c6 100644
>>>--- a/drivers/gpu/drm/xe/xe_huc.h
>>>+++ b/drivers/gpu/drm/xe/xe_huc.h
>>>@@ -10,6 +10,7 @@
>>>
>>>struct drm_printer;
>>>
>>>+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void 
>>>*data, size_t size);
>>
>>as said in the last patch, I don't think the decision to call this
>>function should be based on the filename. IMO this function should not
>>be exported outside xe_huc.c
>
>I do have to export something from the xe_huc.c to be called from the 
>FW parsing code in xe_uc_fw.c . If you don't want this specific 
>function exported, I can instead export a more generic 
>xe_huc_parse_header() to cover parsing for all types of FWs, but that 
>function would need to call the parse_css() function, which would 
>therefore need to be exported from xe_uc_fw.c. I'm ok with doing that, 
>just pointing out that we'd end up with cross-exports between xe_huc.c 
>and xe_uc_fw.c.

or move the gsc one to xe_uc_fw so the header part of the firmware is
all inside xe_uc_fw.c, which I think would be more beneficial... yes,
it's only used by HuC, not GuC, but it's still part of the header
parsing and discovering what exactly is inside.

>
>>
>>>int xe_huc_init(struct xe_huc *huc);
>>>int xe_huc_upload(struct xe_huc *huc);
>>>int xe_huc_auth(struct xe_huc *huc);
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>index 138960138872..f956457d0b11 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>@@ -13,6 +13,7 @@
>>>#include "xe_device_types.h"
>>>#include "xe_force_wake.h"
>>>#include "xe_gt.h"
>>>+#include "xe_huc.h"
>>>#include "xe_map.h"
>>>#include "xe_mmio.h"
>>>#include "xe_module.h"
>>>@@ -344,57 +345,21 @@ static int 
>>>uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>    return -ENOEXEC;
>>>}
>>>
>>>-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>+static int __parse_css_header(struct xe_uc_fw *uc_fw, const void 
>>>*fw_data, size_t fw_size)
>>>{
>>>    struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>>-    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>-    struct xe_tile *tile = gt_to_tile(gt);
>>>-    struct device *dev = xe->drm.dev;
>>>-    const struct firmware *fw = NULL;
>>>    struct uc_css_header *css;
>>>-    struct xe_bo *obj;
>>>    size_t size;
>>>-    int err;
>>>-
>>>-    /*
>>>-     * we use FIRMWARE_UNINITIALIZED to detect checks against 
>>>uc_fw->status
>>>-     * before we're looked at the HW caps to see if we have uc support
>>>-     */
>>>-    BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>>>-    xe_assert(xe, !uc_fw->status);
>>>-    xe_assert(xe, !uc_fw->path);
>>>-
>>>-    uc_fw_auto_select(xe, uc_fw);
>>>-    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>-                   XE_UC_FIRMWARE_SELECTED :
>>>-                   XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>-
>>>-    if (!xe_uc_fw_is_supported(uc_fw))
>>>-        return 0;
>>>-
>>>-    uc_fw_override(uc_fw);
>>>-
>>>-    /* an empty path means the firmware is disabled */
>>>-    if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>>>-        xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>-        drm_dbg(&xe->drm, "%s disabled", 
>>>xe_uc_fw_type_repr(uc_fw->type));
>>>-        return 0;
>>>-    }
>>>-
>>>-    err = request_firmware(&fw, uc_fw->path, dev);
>>>-    if (err)
>>>-        goto fail;
>>>
>>>    /* Check the size of the blob before examining buffer contents */
>>>-    if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>>>+    if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>>>        drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
>>>             xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>-             fw->size, sizeof(struct uc_css_header));
>>>-        err = -ENODATA;
>>>-        goto fail;
>>>+             fw_size, sizeof(struct uc_css_header));
>>>+        return -ENODATA;
>>>    }
>>>
>>>-    css = (struct uc_css_header *)fw->data;
>>>+    css = (struct uc_css_header *)fw_data;
>>>
>>>    /* Check integrity of size values inside CSS header */
>>>    size = (css->header_size_dw - css->key_size_dw - 
>>>css->modulus_size_dw -
>>>@@ -403,9 +368,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>        drm_warn(&xe->drm,
>>>             "%s firmware %s: unexpected header size: %zu != %zu\n",
>>>             xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>-             fw->size, sizeof(struct uc_css_header));
>>>-        err = -EPROTO;
>>>-        goto fail;
>>>+             fw_size, sizeof(struct uc_css_header));
>>>+        return -EPROTO;
>>>    }
>>>
>>>    /* uCode size must calculated from other sizes */
>>>@@ -417,12 +381,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    /* At least, it should have header, uCode and RSA. Size of all 
>>>three. */
>>>    size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
>>>        uc_fw->rsa_size;
>>>-    if (unlikely(fw->size < size)) {
>>>+    if (unlikely(fw_size < size)) {
>>>        drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
>>>             xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>-             fw->size, size);
>>>-        err = -ENOEXEC;
>>>-        goto fail;
>>>+             fw_size, size);
>>>+        return -ENOEXEC;
>>>    }
>>>
>>>    /* Get version numbers from the CSS header */
>>>@@ -433,6 +396,86 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>                       css->sw_version);
>>>
>>>+    if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>+        guc_read_css_info(uc_fw, css);
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+static int parse_css_header(struct xe_uc_fw *uc_fw, const struct 
>>>firmware *fw)
>>>+{
>>>+    return __parse_css_header(uc_fw, fw->data, fw->size);
>>>+}
>>>+
>>>+static int parse_gsc_header(struct xe_uc_fw *uc_fw, const struct 
>>>firmware *fw)
>>>+{
>>>+    int err;
>>>+
>>>+    /* only supported for HuC from now */
>>>+    if (uc_fw->type != XE_UC_FW_TYPE_HUC)
>>>+        return -EINVAL;
>>>+
>>>+    err = xe_huc_parse_gsc_header(uc_fw, fw->data, fw->size);
>>
>>parse_gsc_header() here versus xe_huc_parse_gsc_header() seems confusing
>>from the abstraction pov and looks like a layering violation.
>
>The idea was to expand this function to apply to also the GSC binary 
>(like we did in i915), so the more generic parse_gsc_headers would be 
>called for all binary types that have GSC headers, while inside it 
>would then call the function matching the specific binary.

could we keep it in xe_uc_fw.c? See above

>
>>
>>>+    if (err)
>>>+        return err;
>>>+
>>>+    if (uc_fw->dma_start_offset) {
>>>+        u32 delta = uc_fw->dma_start_offset;
>>>+
>>>+        err = __parse_css_header(uc_fw, fw->data + delta, 
>>>fw->size - delta);
>>>+        if (err)
>>>+            return err;
>>>+    }
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>
>>can we split this patch in 2 with the code movement first?  It becomes
>>hard to read the delta when there's a lot of code moving at the same
>>time.
>
>sure
>
>>
>>>+{
>>>+    struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>>+    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>+    struct xe_tile *tile = gt_to_tile(gt);
>>>+    struct device *dev = xe->drm.dev;
>>>+    const struct firmware *fw = NULL;
>>>+    struct xe_bo *obj;
>>>+    int err;
>>>+
>>>+    /*
>>>+     * we use FIRMWARE_UNINITIALIZED to detect checks against 
>>>uc_fw->status
>>>+     * before we're looked at the HW caps to see if we have uc support
>>>+     */
>>>+    BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>>>+    xe_assert(xe, !uc_fw->status);
>>>+    xe_assert(xe, !uc_fw->path);
>>>+
>>>+    uc_fw_auto_select(xe, uc_fw);
>>>+    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>+                   XE_UC_FIRMWARE_SELECTED :
>>>+                   XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>+
>>>+    if (!xe_uc_fw_is_supported(uc_fw))
>>>+        return 0;
>>>+
>>>+    uc_fw_override(uc_fw);
>>>+
>>>+    /* an empty path means the firmware is disabled */
>>>+    if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>>>+        xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>+        drm_dbg(&xe->drm, "%s disabled", 
>>>xe_uc_fw_type_repr(uc_fw->type));
>>>+        return 0;
>>>+    }
>>>+
>>>+    err = request_firmware(&fw, uc_fw->path, dev);
>>>+    if (err)
>>>+        goto fail;
>>>+
>>>+    if (uc_fw->has_gsc_headers)
>>>+        err = parse_gsc_header(uc_fw, fw);
>>>+    else
>>>+        err = parse_css_header(uc_fw, fw);
>>>+    if (err)
>>>+        goto fail;
>>>+
>>>    drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
>>>         xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>         uc_fw->major_ver_found, uc_fw->minor_ver_found, 
>>>uc_fw->patch_ver_found);
>>>@@ -441,9 +484,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>    if (err)
>>>        goto fail;
>>>
>>>-    if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>-        guc_read_css_info(uc_fw, css);
>>>-
>>>    obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
>>>                     ttm_bo_type_kernel,
>>>                     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>@@ -496,7 +536,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, 
>>>u32 offset, u32 dma_flags)
>>>    xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>
>>>    /* Set the source address for the uCode */
>>>-    src_offset = uc_fw_ggtt_offset(uc_fw);
>>>+    src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->dma_start_offset;
>>>    xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>>>    xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>>>b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>index a519c77d4962..44aee1bdb133 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.h
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>@@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, 
>>>struct drm_printer *p);
>>>
>>>static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
>>>{
>>>-    return sizeof(struct uc_css_header) + uc_fw->ucode_size;
>>>+    return sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>>>uc_fw->dma_start_offset;
>>>}
>>>
>>>static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>>>b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>index 444bff83cdbe..850224890f25 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>@@ -91,6 +91,9 @@ struct xe_uc_fw {
>>>    /** @bo: XE BO for uC firmware */
>>>    struct xe_bo *bo;
>>>
>>>+    /** @has_gsc_headers: whether the FW starts with GSC headers 
>>>instead of CSS */
>>>+    bool has_gsc_headers;
>>>+
>>>    /*
>>>     * The firmware build process will generate a version header 
>>>file with
>>>     * major and minor version defined. The versions are built into CSS
>>>@@ -113,6 +116,8 @@ struct xe_uc_fw {
>>>    u32 rsa_size;
>>>    /** @ucode_size: micro kernel size */
>>>    u32 ucode_size;
>>>+    /** @dma_start_offset: offset within the blob at which the FW 
>>>is located */
>>>+    u32 dma_start_offset;
>>
>>maybe `u32 ucode_offset`?
>
>it's not the ucode offset, that's further down. This is the offset to 
>a full FW binary in the legacy format, including the CSS header before 
>the ucode and the RSA key after it. I could call it css_offset if that 
>makes it clearer.

yes, it does. Another thing that would help would be another ascii
diagram like you are adding in xe_huc_parse_gsc_header(), but zoomed
out with the new gsc header, then css, ucode etc.

Thanks
Lucas De Marchi

>
>Daniele
>
>>Lucas De Marchi
>>
>>>    /** @private_data_size: size of private data found in uC css 
>>>header */
>>>    u32 private_data_size;
>>>-- 
>>>2.41.0
>>>
>
