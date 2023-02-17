Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04CFC64ED6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 15:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FD210E055;
	Fri, 17 Feb 2023 15:03:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA710E055
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676646234; x=1708182234;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IJMJMo+fVpMXgzCnKBRSlHlweDfOYdCyL0qBFTzoAYQ=;
 b=PgcJkupvqyw5UTeomWeKeE4DQesrnLNat2tHC/4NtX1MuoD3tAuV4GCn
 uo/FvqaTTRnEDtNXaD9gqtviODquBe1/5xWrvcXey2Bdtw0cIacrRJqsn
 AKAF2INenqzlxIWbVNrY2xnf7E1iaXNtm5F1JQu8+zpqGzTfHuXhUS52s
 VnebXseDgt6DV6Xr9BWX/BqkPjW6UWxbjcZVuqQV1GoBqyjnu6ezhxnVB
 DX57a4bXN9xEpnXKQRXgMOUKTwvPGPWrNIfZPYanrkZCkp/Q7PcIL0NPL
 f4QZYH+VwqRJMddlkvUTUauNnEVUjk55OhZx9UKc+kJbFGvODjku5seue A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332005477"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332005477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 07:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="663886393"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="663886393"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 07:03:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 07:03:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 07:03:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 07:03:31 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 07:03:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfZAWo/DMvDBRuvGy1gksNoxOSGyf/ev20LnSPXTG91JYsN0x8kd0/7KQITNEsDksP0T+1VQAQVwzXVHiJ181c7EWg6v1J35KzklKFFGjllwYtF06KZiaKAWIBRTfo1qc6npVFugFt4j63L13ibNANLPcMUq+MPTOwjLXxhNKqJ+ySmuQsG2HTiHkHuB19qimbOM7fUR2U8ifZ09PHEm1pP+HjRzjrzpZlMbQybNKRa5NbQWnoBStLRTvi/K/91rs26F/VDM2i+RiBBNqO+gzCWjn7N4ihTpQhSH2ttXlFPKUUd0ma2atR8wVvXdRo42+SgS07rz8LQMRC1bI1MHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn2t/E4xkVcXyw7U2Zx3iN+TA/75OPOxW77xTgYoUUs=;
 b=Lh2e3V+a9kijhL8SbVu84TfizYcrGkMQY2iP9awOlFsHcE3alyEj3f/ey0XVcYTJqmJQAQUTtHF9hZY0uzfTv3PqbqIXXgzzEZT5w2Ud8JETJkD1pf+ZwFbOHv6zyYC87eLkWB00HhG+rx/VYO9GZgpk9iDtRrHsa4wyOi+CcNgA7wudEiDEQB5jUPMjTMbdlT4OdhY/g7wLu12owmdO6dM9QmucpPgUtTjBfPPKBkd6dDWglFum1/Cg9Sa0ICILprAS4EFkCAuAQoG2o+eWzpcPh17wjr0j11LAqLFRiQI/5xCgqtm49306AytXephU7qCN3GFRF+4upy+aitXX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 15:03:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 15:03:27 +0000
Date: Fri, 17 Feb 2023 07:03:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230217150324.dwqckit75bqeq6vq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-3-lucas.demarchi@intel.com>
 <6c00722b-42aa-b9d9-4167-99fcf62fefb4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c00722b-42aa-b9d9-4167-99fcf62fefb4@intel.com>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: d69feddd-5415-4aff-e86f-08db10f81fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5Hnl92CZyx6YUlXeiC5NSAqM8taftQJoadPB/e+Yv/OG34/wmOw6gPS6HijJK/38H3MVkESQCBV3HXOdIMsiwMWKcNqUwa9rPGuzelrfLlszV93B7ExZwEM2nz3vuEMQVl7DhfkpXnxn3sSxzlYqApUUJ4bm+B9HrR15kgbuQ/m4uXOMmIwDtqkoTERnmGkCYqKjecCm+f5RhXzv92I3YJtvolpNoggs0S9t1z78qgt7n8CM7rGx57fv0i0Yzes3MyJKK8hoth2mtfv4eQtNPEcXcUXQS8CwDUfqoABnnlipKd24Yx50I8p4CP+k9B72K7ky6LjL8U2B8Ug8iONMmnTHlw/dDS3II5JXz2DYJ9ZtddyXaU9rh5uaSDIQAoOq6uD0Ni9nZISi9Yzz8BbPbFJGXYn9r6jBh7vvWX8swHILdu34h9bu1m2/FNQsEqsaQvRsp2bA65R8Tjxj8jVbZmTLLFyy8Fk1zdWyv9KMye4ipfui13u6WGlmQGxlr/D6xHH6CJKkLoXoP0Ux5T2yhcR0M6nUB4aTjbKWOkN6MuTlHY4ZZQdC/y8khbQTNzToWIz6Zcpwhc/r7CGZyQtZ8cEFDVQ/Lmnvm+ManoY7oE5Xh2z+pKi910cVPYZWGlz2Rky6v4B52qTHeIqkx5tPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199018)(6512007)(9686003)(26005)(5660300002)(6666004)(6506007)(1076003)(41300700001)(36756003)(82960400001)(86362001)(83380400001)(38100700002)(6862004)(2906002)(186003)(6636002)(6486002)(8936002)(54906003)(478600001)(316002)(4326008)(66556008)(8676002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bINmllojX49BoJqtChMHw9evczJZRMoLgFq6fEYiIcRc61fZxhnofMDSz7?=
 =?iso-8859-1?Q?tJckPzssbrCClfZF+aamchV4OvTMyd0b+0jBXnPNnMjhURnNFHm9GuRuif?=
 =?iso-8859-1?Q?g6TbukyEIFPnH8npGhRnyVFK9igEMgiicFt2Yp5k58ngzBCNLf373UMLwY?=
 =?iso-8859-1?Q?rLvQnvWehmvo5JEvVUCjkB32v71mxhs6rOVea4J4fdg4atncfV93XXo2pN?=
 =?iso-8859-1?Q?l2wfyfdPznvSq3qubhD8uNTngn7MCHvEeByCowIxiXKY8ltVh4Bml/w8ra?=
 =?iso-8859-1?Q?QMgzgCO3I24qtVeWPI+PnNrAvMte5N83lho7KSe8raEo8OnsX1lp6TZ0Pa?=
 =?iso-8859-1?Q?rH7bKoOGofPg5Ogpu+fjY7pwkuyK5YiTlImnJmDEy/q9jSihaePMrhkF2C?=
 =?iso-8859-1?Q?hJLNKzV+nl4kdwNBDlBTxUp0D/PiY9ifkNPnW/i9dxf0CEL/gHjxb7hoon?=
 =?iso-8859-1?Q?05Ic1/WcvidvT1LnMbgoiJxLgukfLcr+hJhtoeQEwCLyFhUuYX/tHEkSbG?=
 =?iso-8859-1?Q?N9iX3PaIrUTYbiGw7mHD6lu7iuUg0uw7LXD/hR/+nXP/EtP67Je7Ko2atB?=
 =?iso-8859-1?Q?pYTyINbsOxN6jfXWJqUIv9Y2XuoC+OXYxLBl3wJiGhWW85Q0YDvhfzeRvT?=
 =?iso-8859-1?Q?LftXKdaFK06XA7FMSUGK1qkKlZP4bl/r+tU8DdWbfXtQAX/4Wv9+6brBXR?=
 =?iso-8859-1?Q?lhTgKJN2BnX/oHf21OWOzuYkUtnqRNDYzWl2JWvTZw6MM3NUYRszCmvIKN?=
 =?iso-8859-1?Q?4fvHSpNmdOp1LKmrlgpMozJtHquq/arZeQgQL+RDNehfa9fE2BG5DhCgt9?=
 =?iso-8859-1?Q?wr+FN8SPsiUBa7vpZWjfrapMcyNmpBDBZUpTz1jq8qA84uf5Cml0UBBA61?=
 =?iso-8859-1?Q?6kNGZmf4neeS6TIikQTQjJ/dpmyIpYqtfvH9JaFI+GwGhHa+HtIEoYhlBa?=
 =?iso-8859-1?Q?zSsamqg7PRea/xJHbSrd9YKKF5zvv0IY1bwMGgX9yDag7Y3QrUT3FNCB6L?=
 =?iso-8859-1?Q?oroBtodxNpUGmGn+twekyQDLYe17YrnoC/mk8D+2ylwIe5av4dZNl/K70X?=
 =?iso-8859-1?Q?tgKntQsiiNOc9qALIEcPJz/OV2DvmoGlwA6Kx/jn1WYmG8BNofqXPtqdzF?=
 =?iso-8859-1?Q?tf/rGDE8ptOzTrgs6WU+xj1mk94T/LKvY09ATJpHoDUWjGLFSmtTR3fWv1?=
 =?iso-8859-1?Q?bYV5i9zJsZZ3fdFQkCGmYY35sHx+y+jBEqx/FnaLiZqrMARbWErGy6D9LZ?=
 =?iso-8859-1?Q?70W5lXatBCyd2olvY+jDOayPsjASlbhGb2SrXZFy2Q9//erjz7+5v5A56D?=
 =?iso-8859-1?Q?bDDs+HAKdWbPZsAfpr1BfKqcqvyiQ5lN4rYn6/Y+FwPM32oQdkf/mzfmlA?=
 =?iso-8859-1?Q?91U59hSkVLReXe2TPhFKDlRB97VQCcn2A7FtFuex2tDn94C1asj1XpHfne?=
 =?iso-8859-1?Q?lAHo8AVCtA74NbiTwzYSMGCGl7wOOq8rmn/Lh/6fKPX/4J3lekygamok0N?=
 =?iso-8859-1?Q?FQoHbTMIvTZmgmcDsoLVlMf6xCX5N7E1GBY4lAQZmrUwIO5bhxltGOVUDN?=
 =?iso-8859-1?Q?eKHwA3EUrTACP3dSQgzt2/iYbZhyGkdexLEVq42xO0qBVlrk0yUX3r+jmf?=
 =?iso-8859-1?Q?lvra+y/Bbxn/UpX/rrG6kqKtVG4/M4IZEZ+cax3q6XlgXzrI75uR2khA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d69feddd-5415-4aff-e86f-08db10f81fa5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:03:27.4457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rcp/QXNenEyvsKxOlN6Iw/K9GmBTnv9tdC6qF/+jP2QWEEdcmu+G4YmNz+fg4zCF4CukfjrMEq/C1cQOPe+ok91ru8ss8qN8jsIqt+akDWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/11] drm/xe: Sort includes
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 11:20:50AM +0000, Matthew Auld wrote:
>On 17/02/2023 00:52, Lucas De Marchi wrote:
>>Sort includes and split them in blocks:
>>
>>1) .h corresponding to the .c. Example: xe_bb.c should have a "#include
>>    "xe_bb.h" first.
>>2) #include <linux/...>
>>3) #include <drm/...>
>>4) local includes
>>5) i915 includes
>>
>>This is accomplished by running
>>`clang-format --style=file -i --sort-includes drivers/gpu/drm/xe/*.c`
>
>Neat.
>
>>and ignoring all the changes after the includes. There are also some
>>manual tweaks to split the blocks.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
><snip>
>
>>  #include "gt/intel_gt_regs.h"
>>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>index 7886c8b85397..a27e6c1a6aff 100644
>>--- a/drivers/gpu/drm/xe/xe_uc.c
>>+++ b/drivers/gpu/drm/xe/xe_uc.c
>>@@ -3,13 +3,13 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>+#include "xe_uc.h"
>
>Needs new block here?

yep

>
>>  #include "xe_device.h"
>>-#include "xe_huc.h"
>>  #include "xe_gt.h"
>>  #include "xe_guc.h"
>>  #include "xe_guc_pc.h"
>>  #include "xe_guc_submit.h"
>>-#include "xe_uc.h"
>>+#include "xe_huc.h"
>>  #include "xe_uc_fw.h"
>>  #include "xe_wopcm.h"
>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>index 7276a375e2e0..a0e35627e45e 100644
>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>@@ -25,8 +25,8 @@
>>  #include "xe_preempt_fence.h"
>>  #include "xe_pt.h"
>>  #include "xe_res_cursor.h"
>>-#include "xe_trace.h"
>>  #include "xe_sync.h"
>>+#include "xe_trace.h"
>>  #define TEST_VM_ASYNC_OPS_ERROR
>>diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>index 1e4e3a1b0631..29815852985a 100644
>>--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>@@ -3,13 +3,15 @@
>>   * Copyright © 2021 Intel Corporation
>>   */
>>-#include <drm/xe_drm.h>
>>-#include <drm/ttm/ttm_tt.h>
>>+#include "xe_vm_madvise.h"
>>+
>>  #include <linux/nospec.h>
>>+#include <drm/ttm/ttm_tt.h>
>>+#include <drm/xe_drm.h>
>>+
>>  #include "xe_bo.h"
>>  #include "xe_vm.h"
>>-#include "xe_vm_madvise.h"
>>  static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>>  				       struct xe_vma **vmas, int num_vmas,
>>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>>index 8fe182afa06c..e9ac560be57f 100644
>>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>@@ -3,13 +3,13 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>+#include "xe_wopcm.h"
>
>And here?

yep

>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

thanks
Lucas De Marchi


>
>>  #include "xe_device.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>>  #include "xe_guc_reg.h"
>>  #include "xe_mmio.h"
>>  #include "xe_uc_fw.h"
>>-#include "xe_wopcm.h"
>>  /**
>>   * DOC: Write Once Protected Content Memory (WOPCM) Layout
