Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45F7CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED6010E04B;
	Fri, 13 Oct 2023 17:05:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA17110E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697216739; x=1728752739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tqqgOhLRpPtpAQ05Ocr9cK15upkJkFmnmCi+oRcMKpI=;
 b=Ip57aaTcVcWyFSbiHg+NgHYekGEmbTGKZ9vEbWeny4vvpjs4ms2X0s3T
 JmjEzmhKge/Mghpgz3CwHHkR72wlsZ791vCo1qE+S7lY1VQUTphPA6e5i
 SuixirShAvwxZr65DSEGNz64M7vGYXjStQMufrZWhfe7x6dGNmwREthuj
 A4FwbHZbzodc/yLE9214xePJk6SHxqU91ke3TPYVbUdWRL0xqBFM1ddnm
 iwIqbdwDiz5i1th9pzIrBZYyInt+GOxp/uyF9+IV/22V0YHLbiLULC7M9
 5m7ZPBqbVUlFUgzHE6EzduVZPlHLIoRu3GGCuNHhzyoRXrVFkVLMi0kHT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471455991"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="471455991"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 10:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748411772"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="748411772"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 10:05:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:05:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:05:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 10:05:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 10:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmyoxbxSYWTXsgYzFMbCHvCQzJL/S+xDaWNjmP3OY+70uzYEKH2qwGA0HoRtQyzWQvCs/QU7ghdBTnf9NChbqJuXaqk3C9AxYduKsx+v+wGbx5XllWiJS8+UMXDD3gTzIMEgxWpu6Xu2W3LB7Q7Y2OP8Z0HNVVW6l32Cn3ng5DyialYMuuINNu4/7AM6rPsdM+t0TDPR81PVWqmYG4w2IUNQWA4RO/eDD5ighPZoU3cD8xeQyvC8KNUZptOrwPWSxxoUNTgs/geOVCU2OfJ9R0PhD+pcxWOQO+YfoNASa/CdWJYhPOhNYfPjek4IhPIls6W1pxzgjyOfrkeErXHVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPCsrgr33ehU/zdwVWMuQJd4z+9rWdcMoJ0TzyPnlJM=;
 b=aHHfg+/Z2b+cEInbS3ydFD/8bVpiWy/Q1VDavgTVm5RcKBkdgEprxvWlhX/FdCIpfNv/a04YXAMhInbUPfmFiFN8LT3cONjTSTwtuk7CubE86Z9jJw53G8GtSl72MBVzmygBICXmjAknmN8QSTZ2T9ds21TjtErPOIiIAW5tzbw9UA1Zi6+5hludGkx3LrkUqcdvzKnZpI9ViAErUBYReyYoRz14SQEzqhdJZ9xlVi1fThMxFrYghwLLyGu8U5f+lDRYxWXTk5sOjtHrZ0bmpK/sT+A8yEvqgoFFVNCgsUaPnR62NIosDRzZOkQCGZWoI7HD73x+U/jp5/3j/IZlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Fri, 13 Oct 2023 17:05:30 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 17:05:30 +0000
Date: Fri, 13 Oct 2023 10:05:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSl42FEhKJvWS/N4@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919161049.2307855-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 996b3dc5-0664-461a-7aa7-08dbcc0e9ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gy4dR2Mm+XaHgFtR/IHuTU9+k1mdnBgmOulA3CcM8Jp1bFlf0EPjxBt+GG1W2+K7UZkEg7TxOIiE7/MLke6F8VVSNijP9FhoPvRF7jei1tmgqX40DgJ7uGiIzHhChguTQl29sYfeAZHAGbaot+tCIXGmVUCdXMGc73HY+KR4vxDAFWYML3tORLoMoaABIT6wRibKb3a7m+KpBrxkwh/zswDmEPLGvb19U4FuLCYT5s2Xa5tu+PsR1VhF2BzGZqKUPzY/er678/Hl6CXRJlXaSZefXzqeIYAOFPLHAtIcMADnMLV1xz6lqLQa0+oBMHBd+Zn96eGTH5/vOqjL1pryG6w21avkKK7AQ1GREHabAepUZ9Gw/4Q0Moe2QP9NSnYwiRgAYgt4HoNTCQFtNozq1aXk/9jkSyKelaN3LCFmI2f1dEfZ8bxMTE0io6Cqj2hzQ5hpWn+OJMV4lfoPDNca8beJg4lPsj3eUfyARkAWWlOkyRMkIIizzequOxDXYSqHhK0opbQlpe0hMKmPMc0NjN4q6M4enWF2GB6DXcvkbIlEflITaHsG9Xui4VrUl696
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(82960400001)(8676002)(6862004)(2906002)(8936002)(6486002)(5660300002)(4326008)(86362001)(478600001)(6506007)(9686003)(6512007)(33716001)(41300700001)(38100700002)(83380400001)(316002)(66946007)(26005)(6636002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFkWnlsVTFubVhyOVBiYzNiNWdTR1RWWWwrK0RUUEJVcU5iWnZyTENqaUZu?=
 =?utf-8?B?bVNjQ01XK0JHS0xGNEh3L1Q1dllOSEtTckh3LzdZWVhUTEVvcGI4Y0wrOXY1?=
 =?utf-8?B?bjFETUs3eFJORlJBVENFWjVZVnExeUZnaEFJRjJKUmlpK1pDa0hST3ZNV2xM?=
 =?utf-8?B?d3gxSFl6SmQvc0lPQnU4ZWJzWEZkaU1yOENqUWNEcXFlWjZuRENwT3g3S1N0?=
 =?utf-8?B?SUlJclgrYjNkbzhYQnlZMnJzUmYxMlJ0U2RHdjQzeHZJRHV6YjBYOFo3L2M4?=
 =?utf-8?B?cXZoWURzbU5TbVB6UDdqbHVvcnFwUTFWajJ5cDZUUFhCcytXLysyYXdIOXRY?=
 =?utf-8?B?WlZtQXlFb0VNSTNqVzJnbUwycWVWcXhsYkQ3SkVyQVR5blp5SjlPK2JTS0ZS?=
 =?utf-8?B?cDBQQU1ZWWExZ0pVYnMyZlZCRGQrR1RPeSt5R2EzZW5kQWswYTJSb3VtNmR3?=
 =?utf-8?B?NVJrYnlMRTZwellrTTZaeHFOclAvaVFia1lvYlZTUERlRWttWUdYVTZ4WlU1?=
 =?utf-8?B?Qm45eVdiMTFZeWdpczdpSW5lWGxZZFp0aVU1cG9QR1g1SWlwaFBuNHo3LzN4?=
 =?utf-8?B?eEpKNjk1ZzRpYWlRUEw3VGtWMEwxT0ozL1UyNmxCd0d1M1duVU5TbU9ZeTUr?=
 =?utf-8?B?SVEwaGFHVW5YTjhac3h0bTRNSjBNMTg4eFJVdy83dmN2cVZlbFd5cUpZMmFI?=
 =?utf-8?B?YU4ySEhwR0JkUmVCakdnNXkrQXdCUTE4N1d2dlkwOEdLa0ZudEMwWWJkQzJN?=
 =?utf-8?B?YkpDWStkRlpYTVRkSkdNWC90QS9DUkozTE14Z1Y2cGRYckFtbkF3cW9LUDEz?=
 =?utf-8?B?ODlkMDhUTC9ZeFIzL0F1ZjVVQ0MzUjNOcllqRkFiRm4rcGtVN0RZQ0ZGbk5w?=
 =?utf-8?B?K3MxU2VJc1k1VmRrcjVMOE9NeHlhUExyeEpUUk1vM2h0bVkrZS9ZMVFqaFd2?=
 =?utf-8?B?dzRRWDBwUlM5UlpvNEtzQWM1T1Z1NUpSanA1NDFZK3BuQWozQSswcStQL1ZR?=
 =?utf-8?B?ZWdoTG11ck5rL1ZZU2pxNmhPanZlZHIrTlEwaTMzUmluM3ZuczdCQ3NLNDJM?=
 =?utf-8?B?RzN5R0RUM0xIaDR0U2Y0T2t6TVUyTnFXc3hEUDQ2TFc4NVE2bFpidnVPRnlB?=
 =?utf-8?B?MnNBeW84VGlPV24wOGdFV0N3VTBTRFl1MU4wZkROaWg5UG0ycFhXTEY3MGY3?=
 =?utf-8?B?dmljVHc0UEY2TFIrVVdZWnlUL0lLN2NXRGJSK2kxME5NV0xJaVVoTy9jblhj?=
 =?utf-8?B?ZEs3T1lTaWFBZnRpTW5xVFVjTUdXaFdFY1FTcTFsUitZSk9NT0xzL2tLWkp5?=
 =?utf-8?B?MTZnekFUemFmOHRUa3ByUjJPaDRGd1kxVXN1Q2ZhQitiMWV5ZUdXRFJHRGJX?=
 =?utf-8?B?M2R5UkdBVFBWSVhqaWxLUUMwNk5RZnVtcjJkRnRvTnZnNVVJVHVGK1JaQk9a?=
 =?utf-8?B?eDZJVXRET0N2M2M2T0JTOHJXN2lkVkd2Znl1d3J5ME03cEZ0dVhaVTVRZFlS?=
 =?utf-8?B?YVY0U3BLMlI4K0wyNkRoSTNXK0YxbGNXczJIRk10VHNuV0lGbkU4TGw2cXFV?=
 =?utf-8?B?SnZDb3VLRU02N0VVUUdJTHBOL2ozdkNpZ3Q4ZmFNdEVjVzYrc2ZMd25pMmtQ?=
 =?utf-8?B?aHg1VmlWa0huWU02YXR6aGdBYzBiR3NZUTJvcmFjeXlmQis5QUtRUmtkT2FP?=
 =?utf-8?B?M3pKUTF0QUdRR2U3akxmNHEzZEtHczgyOG9IMjJzbFFWU1NINXJWaCtETWFk?=
 =?utf-8?B?eENyaUhxN2g3QTB0TWhHajFDVWVZak1MRXpDWjBiL2N1WWFhS0NpMjk1emxL?=
 =?utf-8?B?b3oxNThmaDhzaC9iMmxUL0Z6YjZYWnZRSkVaU0JRMDJFSWlINzBJM3hyYlp3?=
 =?utf-8?B?QXVUazE3WEpYOGtTWk82MVN6K2dpUDBWOFBUb3VBOXlFOUQvaStSSGxLYVdq?=
 =?utf-8?B?cWN0Rk5rRFVabFlVamRpQXdLUm9qOVo2Wk84bFJHSE9GOFVxSVJPSXl2a0hH?=
 =?utf-8?B?VkRaTUdLSkUvaklZWlJQa0dtT0pKeEMxYVcrWE1Hbnh4QmM5d2paMzgvWW9p?=
 =?utf-8?B?Zk1FTlZpS25udVd5azNiZjRWM25vQTAvN25Rb0YreE9uZ3l1TU04cFgycngr?=
 =?utf-8?B?ZENkVmtJYmIxc2tKTXVWSUxUbDU4Z3cyM2FOeGJiTkM5bFhWbU1ML1ZsOW9y?=
 =?utf-8?Q?3rlmjGsGuPzlcuslzltLPfg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 996b3dc5-0664-461a-7aa7-08dbcc0e9ab0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:05:30.3373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qiA0gFAMqB6tfC5Op5rSQnSUxdlBszr7Fip+M9xECkc81PshZ2xE8750QU0OBd/pAKOKA8sOpc0s4O5cDJPyGzomVIInLVqoWJPaTLl6Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5536
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/21] drm/xe/oa: Add OA types
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

On Tue, Sep 19, 2023 at 09:10:30AM -0700, Ashutosh Dixit wrote:
>Add types and data structs used by OA. The data structs maintain device and
>gt level information, information about the open OA stream and OA buffer
>used internally to capture OA counters written by HW as well as capture
>configurations which can be selected for an OA stream.
>
>v2: Add linux includes to fix build
>v3: Change oa_unit_id to u16 (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Umesh
>---
> drivers/gpu/drm/xe/xe_oa_types.h | 295 +++++++++++++++++++++++++++++++
> 1 file changed, 295 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>new file mode 100644
>index 0000000000000..4063c81e353ff
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -0,0 +1,295 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_OA_TYPES_H_
>+#define _XE_OA_TYPES_H__
>+
>+#include <linux/idr.h>
>+#include <linux/kobject.h>
>+#include <linux/poll.h>
>+#include <linux/sysfs.h>
>+#include <drm/xe_drm.h>
>+#include "regs/xe_reg_defs.h"
>+
>+struct drm_device;
>+struct drm_file;
>+
>+enum {
>+	OA_GROUP_OAG = 0,
>+	OA_GROUP_OAM_SAMEDIA_0 = 0,
>+
>+	OA_GROUP_MAX,
>+	OA_GROUP_INVALID = U32_MAX,
>+};
>+
>+enum oa_type {
>+	TYPE_OAG,
>+	TYPE_OAM,
>+};
>+
>+enum report_header {
>+	HDR_32_BIT = 0,
>+	HDR_64_BIT,
>+};
>+
>+struct xe_oa_format {
>+	u32 format;
>+	int size;
>+	int type;
>+	enum report_header header;
>+};
>+
>+struct xe_oa_reg {
>+	struct xe_reg addr;
>+	u32 value;
>+};
>+
>+struct xe_oa_config {
>+	struct xe_oa *oa;
>+
>+	char uuid[UUID_STRING_LEN + 1];
>+	int id;
>+
>+	const struct xe_oa_reg *mux_regs;
>+	u32 mux_regs_len;
>+	const struct xe_oa_reg *b_counter_regs;
>+	u32 b_counter_regs_len;
>+	const struct xe_oa_reg *flex_regs;
>+	u32 flex_regs_len;
>+
>+	struct attribute_group sysfs_metric;
>+	struct attribute *attrs[2];
>+	struct kobj_attribute sysfs_metric_id;
>+
>+	struct kref ref;
>+	struct rcu_head rcu;
>+};
>+
>+struct xe_oa_regs {
>+	u32 base;
>+	struct xe_reg oa_head_ptr;
>+	struct xe_reg oa_tail_ptr;
>+	struct xe_reg oa_buffer;
>+	struct xe_reg oa_ctx_ctrl;
>+	struct xe_reg oa_ctrl;
>+	struct xe_reg oa_debug;
>+	struct xe_reg oa_status;
>+	u32 oa_ctrl_counter_format_shift;
>+};
>+
>+/**
>+ * struct xe_oa_group - OA group representing one hardware OA unit
>+ */
>+struct xe_oa_group {
>+	/** @oa_unit_id: identifier for the OA unit */
>+	u16 oa_unit_id;
>+
>+	/**
>+	 * @exclusive_stream: The stream currently using the OA unit. This is
>+	 * sometimes accessed outside a syscall associated to its file
>+	 * descriptor.
>+	 */
>+	struct xe_oa_stream *exclusive_stream;
>+
>+	/** @num_engines: number of engines using this OA unit */
>+	u32 num_engines;
>+
>+	/** @regs: OA buffer register group for programming the OA unit */
>+	struct xe_oa_regs regs;
>+
>+	/** @type: Type of OA unit - OAM, OAG etc. */
>+	enum oa_type type;
>+};
>+
>+/**
>+ * struct xe_oa_gt - OA per-gt information
>+ */
>+struct xe_oa_gt {
>+	/** @lock: lock associated with anything below within this structure */
>+	struct mutex lock;
>+
>+	/** @num_oa_groups: number of oa groups per gt */
>+	u32 num_oa_groups;
>+
>+	/** @group: list of OA groups - one for each OA buffer */
>+	struct xe_oa_group *group;
>+};
>+
>+/**
>+ * struct xe_oa - OA device level information
>+ */
>+struct xe_oa {
>+	/** @xe: back pointer to xe device */
>+	struct xe_device *xe;
>+
>+	/** @metrics_kobj: kobj for metrics sysfs */
>+	struct kobject *metrics_kobj;
>+
>+	/**
>+	 * @metrics_lock: lock associated with adding/modifying/removing OA
>+	 * configs in oa->metrics_idr.
>+	 */
>+	struct mutex metrics_lock;
>+
>+	/**
>+	 * @metrics_idr: List of dynamic configurations (struct xe_oa_config)
>+	 */
>+	struct idr metrics_idr;
>+
>+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
>+	u32 ctx_oactxctrl_offset;
>+
>+	/** @oa_formats: tracks all OA formats across platforms */
>+	const struct xe_oa_format *oa_formats;
>+
>+#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
>+
>+	/** @format_mask: tracks valid OA formats for a platform */
>+	unsigned long format_mask[FORMAT_MASK_SIZE];
>+
>+	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
>+	u16 oa_unit_ids;
>+};
>+
>+/**
>+ * struct xe_oa_stream - state for a single open stream FD
>+ */
>+struct xe_oa_stream {
>+	/** @oa: xe_oa backpointer */
>+	struct xe_oa *oa;
>+
>+	/** @gt: gt associated with the oa stream */
>+	struct xe_gt *gt;
>+
>+	/**
>+	 * @hwe: hardware engine associated with this performance stream.
>+	 */
>+	struct xe_hw_engine *hwe;
>+
>+	/** @lock: Lock associated with operations on stream */
>+	struct mutex lock;
>+
>+	/**
>+	 * @sample: true when DRM_XE_OA_PROP_SAMPLE_OA is given when
>+	 * opening a stream, representing the contents of a single sample
>+	 * as read() by userspace.
>+	 */
>+	bool sample;
>+
>+	/**
>+	 * @sample_size: Considering the configured contents of a sample
>+	 * combined with the required header size, this is the total size
>+	 * of a single sample record.
>+	 */
>+	int sample_size;
>+
>+	/**
>+	 * @exec_q: %NULL if measuring system-wide across all exec_q's or a
>+	 * specific exec_q that is being monitored.
>+	 */
>+	struct xe_exec_queue *exec_q;
>+
>+	/**
>+	 * @enabled: Whether the stream is currently enabled, considering
>+	 * whether the stream was opened in a disabled state and based
>+	 * on `XE_OA_IOCTL_ENABLE` and `XE_OA_IOCTL_DISABLE` calls.
>+	 */
>+	bool enabled;
>+
>+	/** @oa_config: The OA configuration used by the stream */
>+	struct xe_oa_config *oa_config;
>+
>+	/**
>+	 * @oa_config_bos: A list of struct i915_oa_config_bo allocated lazily
>+	 * each time @oa_config changes.
>+	 */
>+	struct llist_head oa_config_bos;
>+
>+	/** @specific_ctx_id: id of the context used for filtering reports */
>+	u32 specific_ctx_id;
>+
>+	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
>+	u32 specific_ctx_id_mask;
>+
>+	/**
>+	 * @poll_check_timer: High resolution timer that will periodically
>+	 * check for data in the circular OA buffer for notifying userspace
>+	 * (e.g. during a read() or poll()).
>+	 */
>+	struct hrtimer poll_check_timer;
>+
>+	/**
>+	 * @poll_wq: The wait queue that hrtimer callback wakes when it
>+	 * sees data ready to read in the circular OA buffer.
>+	 */
>+	wait_queue_head_t poll_wq;
>+
>+	/** @pollin: Whether there is data available to read */
>+	bool pollin;
>+
>+	/** @periodic: Whether periodic sampling is currently enabled */
>+	bool periodic;
>+
>+	/** @period_exponent: The OA unit sampling frequency is derived from this */
>+	int period_exponent;
>+
>+	/** @oa_buffer: State of the OA buffer */
>+	struct {
>+		/** @format: data format */
>+		const struct xe_oa_format *format;
>+
>+		/** @format: xe_bo backing the OA buffer */
>+		struct xe_bo *bo;
>+
>+		/** @vaddr: mapped vaddr of the OA buffer */
>+		u8 *vaddr;
>+
>+		/** @last_ctx_id: last context id for OA data added */
>+		u32 last_ctx_id;
>+
>+		/**
>+		 * @ptr_lock: Locks reads and writes to all head/tail state
>+		 *
>+		 * Consider: the head and tail pointer state needs to be read
>+		 * consistently from a hrtimer callback (atomic context) and
>+		 * read() fop (user context) with tail pointer updates happening
>+		 * in atomic context and head updates in user context and the
>+		 * (unlikely) possibility of read() errors needing to reset all
>+		 * head/tail state.
>+		 *
>+		 * Note: Contention/performance aren't currently a significant
>+		 * concern here considering the relatively low frequency of
>+		 * hrtimer callbacks (5ms period) and that reads typically only
>+		 * happen in response to a hrtimer event and likely complete
>+		 * before the next callback.
>+		 *
>+		 * Note: This lock is not held *while* reading and copying data
>+		 * to userspace so the value of head observed in htrimer
>+		 * callbacks won't represent any partial consumption of data.
>+		 */
>+		spinlock_t ptr_lock;
>+
>+		/**
>+		 * @head: Although we can always read back the head pointer register,
>+		 * we prefer to avoid trusting the HW state, just to avoid any
>+		 * risk that some hardware condition could somehow bump the
>+		 * head pointer unpredictably and cause us to forward the wrong
>+		 * OA buffer data to userspace.
>+		 */
>+		u32 head;
>+
>+		/**
>+		 * @tail: The last verified tail that can be read by userspace.
>+		 */
>+		u32 tail;
>+	} oa_buffer;
>+
>+	/**
>+	 * @poll_oa_period: The period in nanoseconds at which the OA
>+	 * buffer should be checked for available data.
>+	 */
>+	u64 poll_oa_period;
>+};
>+#endif
>-- 
>2.41.0
>
