Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1955AC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 11:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B838510E1C3;
	Fri, 31 Jan 2025 11:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLbfqFPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6DA10E1C3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738324258; x=1769860258;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Z9x8e/CxP6w729oVLiqC1f2gDtOqk5QVxNKQV8Hl+pw=;
 b=YLbfqFPvD3imZ4kDCY1JqBJf/ZiKdGi8liYKQoEIueQVDDW9vkhIvxsL
 yW2/lWfwwBDZ9/JnyhmA6AV/10nm1soq3m5IFcqbozICla7OOssm3yL9i
 ZwrmZtsDjaTOU0Bt5n0D6LbKKbO4RRjlKMsFlqicf45jcC+gNmlp+6nTw
 /fWyQ3iFHCp1JBlGVpOaMYsYTGtWO8UD630MorRKSq8dzcweKXJnOjUb7
 uySVG0WlftXQDV61NN5XH6T8i5jdJeI9op8exKnEWrBh6upyJoPddHK9Q
 b2bWnuaGsqAgtHg6D/Q80/2zHVyD/f1B2enaWHcSzOsvTxRiLFdNXAthb g==;
X-CSE-ConnectionGUID: 57nEk/i9Rue/2EJc3BBiBA==
X-CSE-MsgGUID: v2Fvq7ArSoWM+Ql9tLAVkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39159441"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="39159441"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 03:50:53 -0800
X-CSE-ConnectionGUID: yQilx2/fT+e1hbrjROqrjw==
X-CSE-MsgGUID: fKWByHqoSaCcb+jkxWP/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110487973"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 03:50:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 03:50:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 03:50:49 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 03:50:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn/3MLiOqbvm7mzQrk/6mBDpXgWmJtOrMHpvFIItV2RdOR3cyt0XEMdItrxyWTrbDAmKLGlycDl+5xatujncQZcHYJc1Nf+RWaskLU5FKtAtnkoQqrP3igVDWO7NSU5uXnoFVQaDRhUsgarwkR6XiU7XCBFJIpo5wNuqL2R5ZNUYgsFNElX67mmhvXepmDCZfcBU02XPfiasN9YiqAZ7PaNen0MWb4LPQ37DlAewLz99gPllYu3ekQ5YcJtmDFovfwDlQf6IxSxBWzuchn6vnkD7kgNi6VSTREHPnnHwa+WMWIlz5FEIPAIjcMq94Bi6Bap0yvsutVMtAsRFwSYN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbrIbZH824kPw9xvpk78DPXKPDn8vSoeQXMZH/Hk4/w=;
 b=pIgyFhwVdIVqz4wZdvBb8N5hBJDKVdALV4RisQlqxfUYri2NEuUWuimWQyTFqlReFgsaCa+huLnvU0aARTrmFEcpUHjyWU+sWVxdhI3P380WUNp5Ymk6O912WmgBsu7Qzo8YPo+P8vnOj/CqzcUZVMEmDEiymkz2bD3cNKk4MbDZacfhFU8gabRm3Uv6sWlw8favcIuWz4XiOf+HvQV4O2ljHmP3JFMG5V10s5YG/HRpdWN031DdIy4uJ8I9waNYtC0gjbmFCIs3omVmJ1DNGsnNGAIH/82Y7/nXOMFXVMW4Z4J+zy8qdpyVi/oY/cNpozRyOxLvxM89OPIhLpiFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 11:50:18 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%4]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 11:50:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe/display: Add missing watermark ipc update at runtime
 resume
Date: Fri, 31 Jan 2025 06:50:14 -0500
Message-ID: <20250131115014.29625-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 159dc651-6be3-4f62-3fcc-08dd41ed6ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LEf8k4GC/1qMhAfmPnsnBEBdBfsXaYyVRxSdK9vlphhVEnKaCsXxIE41Zc+l?=
 =?us-ascii?Q?K3tHY2iMbmUCwhp7SusS6vDEISOJK0/8ELeMpArUU3xY7MOFMQjVnYvtniIg?=
 =?us-ascii?Q?boMloUNgDHNuzE7dhe3jPGUnxA1kUF8ANBEhPLv2T29yZAjTXbOg0RfbyysW?=
 =?us-ascii?Q?gPodJO8UMwc4pN1GZFNtfre4X5rCfNiBMu9WaecMya/C7qO9Vz+2BxdUxtMh?=
 =?us-ascii?Q?UutcrSeuWWV5GmDCXDl3MsO2onf6iluwo5jfX6vzchM+x1zwREHjb+yUkOk/?=
 =?us-ascii?Q?lw7TmdHVw4yf6tesTbm+o0AmmT8gagNbvMF35F9BDsD/XqExJ8bWCH272gs+?=
 =?us-ascii?Q?EB7KP6+gKuczw+JsEnBknJ+zH87+g1rnKajhdhsRH/VHLWlHxBc0dLfmmrqO?=
 =?us-ascii?Q?Skuan7b/RzSGjB74HvbCGzo+2jtxaJw7Hg/TNm7HmI1+Ngp70bMIooiIx1Z9?=
 =?us-ascii?Q?f05AfIWUjxSQAyU0Kww6nLcMnScBBXN/86ovqdbCVaisqTjeTsdhpDxHzp/X?=
 =?us-ascii?Q?invqQnh0MridL54T+hb8n971bH5srhgyeUkTuoSz0iHbeENRvWolbLzAqrSH?=
 =?us-ascii?Q?Ik9ejOGXqu0hM0ou2Ef4HjP8oqQ3BmHNcmj3/ivvAZfi5BpkgtgJWcUHmA1v?=
 =?us-ascii?Q?qoDJKusDukTZDJEmaEuhFT+KxAa/nuoK7aivv/ZFXYCjwgS+NCIcqQDyeyvY?=
 =?us-ascii?Q?zVcLbIGVFFbT3Q7r3MOKW/eVN2lIEM74rl5Xhx2z28GGnu9YvoZALBHPNwq/?=
 =?us-ascii?Q?Ax1Cru8aNSY2as5NATYM2CFc4Tmjpf33XOA5XJkPM4/s2HP5/+FdeqkzyytZ?=
 =?us-ascii?Q?pNKAtnfX2VKSrZGqHadh9yjQ3qh7eetddVyfYsoCSS7rnSo/ekteQVieHy5M?=
 =?us-ascii?Q?6CYcLHPE5yshSHkqdan3sD8114cwByMgtnp03pl9pMXINKkqk67RUGrK36G4?=
 =?us-ascii?Q?NkTC1HKYehzLzuDziu/bhiIXLpb07Y0tiXlzRV/Ny05B2DPMurqcqG8Nru5z?=
 =?us-ascii?Q?C7tMJwa93YFAjTyz8CCQzxXbQypSpJzICGAICNJ6UMRExWYwcYJapOKouRCO?=
 =?us-ascii?Q?irHAeYh2Galr2xrSXjpQwlpeuW5vHRYdcSI/g2KeiQSMLrp+9BJVhm5So+/a?=
 =?us-ascii?Q?QXEB4ry7bANZv0u9XE4CwZqSdSCXwVI0A2WlM3QNTYf+kAZQVLOicQpm21N3?=
 =?us-ascii?Q?e3eMosiD76tyvVdVRcAoSun2dtPidmdlV7DGc2AaZA8T0wneXO02W5bOrcMo?=
 =?us-ascii?Q?EetpQ8IVMfgL1pVl/m1+/hvnyhuWNhD1l+6zt8YGHLlzN7zLWowUUaomjc/S?=
 =?us-ascii?Q?jzS2CEnxXTpVLIrAVhp4dU4wEb0mdpqTBxPprwL34Bd8tp46eY/eUekQ2bN/?=
 =?us-ascii?Q?Eq3gi04wrNc3JjERf9gZ6QuALcdv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LGc9Y76O0Tt6hnLZztOs/5vBraYvalAXhgm0qi8ZL4CUaYzt+QT4WmBR9or2?=
 =?us-ascii?Q?XQJ/Wy9G85xtM21q9X5WAhg/ZW2DdfQuuLNzg/K3E3Gj64QMu88HP6ksrF16?=
 =?us-ascii?Q?CYnczUCWuGrgvFRZ+NvPvtRZF7u3zzXisSWHlIcSrQH+U4mONGoH3p5H6pRT?=
 =?us-ascii?Q?vR1peWicE47HZ8h+a5NH27+35xaRf7r+2o46wV/3ZcA+4uUWppKqqOROBvP/?=
 =?us-ascii?Q?jifLw8bx6lAvTFXYGWB/Z/8naAkNHxMsrP4EUilr4m5SRTbJxazuNmfaMRH0?=
 =?us-ascii?Q?LZJrGsgE/5TaqQsFn/enNe+GgR22pQEWPEo+dlLI2l1r1ng8efV+FempxJxA?=
 =?us-ascii?Q?kcrdkI3spropGzCEcog3NbPqXOh74TyLPTnkVSuuielfzBJrGhaBbsgcG9tS?=
 =?us-ascii?Q?BEVE8A1jHu/eE255rK68lHDfUt8JILAAgSBSq3t8tOzY04UdCn3s2s3idxyX?=
 =?us-ascii?Q?eP7zvKnvOxJS7KTnXMIyD6nhxEq8zTTH20m4BKgfsFd30VEr1p7ZmofBQIZm?=
 =?us-ascii?Q?ht/dSjocZ96eeipGsUzWixQ+zk36hvaucfGR0qjQ1iQQvHHcxwuhut45JVIw?=
 =?us-ascii?Q?1ne3mN76UwrkmW5KFzQiK0glOmvixWdYPoV+KPAqtl9Gd8SiupnBL/KBtVeU?=
 =?us-ascii?Q?ZiqboJP2DLT7AWjHiMPGFA6osDcDNr6X9fqMgk/7QJYXI9qfz5dK13JAubjF?=
 =?us-ascii?Q?78SRSe+Z/dga3ON//0heSRmUYnX9GX2phubWXVZ2XnIh3b3V2NtlZisjfwoj?=
 =?us-ascii?Q?NxfQK83MCbd1SO4QKgqf0v4t5RMk+L6dlMaX2/PSwuaaLUh4WHn1W3gpEDe1?=
 =?us-ascii?Q?JlNau1165J35R5XiZdhXQBvDmCQrpELe5kMwtMwczmk0USWGr1UA42QJdSuP?=
 =?us-ascii?Q?ycORmeeDm5g6+79BhtxthN7SW90u0fVavKiwQ/LvQaX0FD1gY7FUFtrN/ysO?=
 =?us-ascii?Q?+0fONtjQ+ztdXjG1f7NGA50StI74QCDSNVl+ZoJuPMY0J5ZngwlR5HyyNFyM?=
 =?us-ascii?Q?t71npKJg5PJofzXaA+0Jkg5hkuRRfqZsvibeLPO//PW9zeoAlAvm2VtyDoHn?=
 =?us-ascii?Q?tbe9wrmqd86HeAxyQfW5ClmDesuCJPAPfcO0vTKWifIY86iK3t+V7T+G/MJL?=
 =?us-ascii?Q?c004YJTAn59fWtetp+yxXUluiJjtxsrvi8+4pFY/eBov5V32rRmhPC5BrEbZ?=
 =?us-ascii?Q?buwcjSn8qwtWkorDGG4CJ1DcnKCtDhm660uyLG7iXk3ukwRLVoZLPqDSSO2f?=
 =?us-ascii?Q?ZOgPCx3Ee6a9sxXslfpuZt1PDKo/5g+Bx0DWOVU3xeDPaO3oowNZYRNi7d1u?=
 =?us-ascii?Q?LNbp7uyM2DtSSo++1TJJCo11mxvWjW9eGix0vVUN92Ep85LEV2EES4QZQSrU?=
 =?us-ascii?Q?+oKF8zlKIubZ5Yy0t/8K6p5Nid2TxidMbAx1DXoHAn1BDiHnNAp2adKD/wBz?=
 =?us-ascii?Q?FBiJd8AMyipCjThj3ZFahZEax0cEfzdzWAVDxF+A4cQOnqpjJE6cADc3bUjg?=
 =?us-ascii?Q?O2QEuMGF9px0g4y1YQ5JspkxqBkWCRmEtTBIENNAOanGa5DRX2M06ArhYowM?=
 =?us-ascii?Q?A7BP+f9SRwEu5tGGH9OGGbFRRwqrHo1TOjZiBN8ghAFWz7u+kmj9Sgiodqc3?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 159dc651-6be3-4f62-3fcc-08dd41ed6ef2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:50:18.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUXqF2DoY036TBbZVjafJATbmyAOlC3W6XuinExzCyqlXVfwldyZu7Fg2RjTZE8/u+BuDRDdfe2ARTz2xC7UTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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

Continuing the alignment with i915 runtime pm sequence. Add
this missing call.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 651799c946ac..363295918cc5 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -29,6 +29,7 @@
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
+#include "skl_watermark.h"
 #include "xe_module.h"
 
 /* Xe device functions */
@@ -481,6 +482,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 
 	intel_hpd_init(xe);
 	intel_hpd_poll_disable(xe);
+	skl_watermark_ipc_update(xe);
 }
 
 
-- 
2.48.1

