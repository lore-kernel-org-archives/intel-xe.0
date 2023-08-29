Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7642CC71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 22:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E43610E136;
	Tue, 29 Aug 2023 22:02:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA7110E136
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693346563; x=1724882563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ojMW0OK94dku2sUmqIWzi95BZ1oHVi0OWWGP7H9V0T8=;
 b=QMbE/tTtivHHv2TcXlt7ymJeuJxHnqgqIk7uuhO5xbZXTY4d9zDoiXpi
 OQmsLs3bXtZTSLodFmeKzX5cPpCOS2tntgtBIVqA3fpkPNNlKpSU+uvp0
 TBGe6iJqlDnCjPHd0cReqn3PZPlxcp3amF6ykdhcYZA26Y7X7oinEvz0M
 joebp5kglOF+OnefQomV/f0r8+vs6zWdKQNriWvmETx1+//Ps2Nc3qCXa
 yOU5fa2loUGqgRm3c5zsxqE9YhMs6C8zIv5/OYM+Y92s/f6+uvS6p0ZvI
 wrW8hDT41xJCYy8AVjbI8vZphPn+WJpBe08WDxcDTuaUrmke0GRAAmg1H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375447611"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="375447611"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 15:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768218039"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="768218039"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 29 Aug 2023 15:02:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 15:02:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 15:02:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 15:02:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXDtnltOp23AkG8K1mtEAl02g8ZlFsnAXp1DcaqxQ84tI+NM7uOMkYX+CdFlkvwV4FkQlP/yPGj9Otzy7Xr//rFEvG/HE5IXadxW1xgWeKlSyVf/5Q2ENJXkW/X2s4SeuqDnNOU+0TWZYu891jvpqYcAVhyLgeDOpgR4qM0qJ+smO3B7+I9iOyXjEQ8ogk/v42bXAnaOFfg/a/5r36eE15Kc98WLCRibG0lN4QmYmqQuVQs2L/RLUwdKQbKu4BgtyTki03zmEf5a10r0QIS/jK9P64yUKbZHHIXF+iJX6otClqsZd1PIR6stHjPFQiQBfUawPd+ZeeXBvB53vR57ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvtlVOESv4azPg+edz2PdSTRohLWyK8nTAF/afXl9fE=;
 b=Ue8dXFlcRy7KaQpep5MilTiL9zbKXkDk/GHlldZIy0nG5DogfEhXUwiw8uUyGY4N8SUmTSN95H7cc26TCCo8VdPVFAxuRm8xZRWrzTTogc74WEaNsEBXEloRwTOj2+N++LDD8KzuXjQebtGbt0b9HsBYHZCe5VR8nGVBjA3KPnUjPJCePzu6wJnaX3Kfvpghl5byOKsPdEBrYTcRuX54dZe+Jp7Pkij8AoHaaWH49kkFpOmsiLy35WmYTocrZ4DEWrFXCqDEJf8uSkAQuHI7MYEC/JDwEcL2wx4PRPyIBvJO6ppOe2gm0NMH/ZvLGjzW3+tr5EjHTHo42spA920w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 22:02:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 22:02:38 +0000
Date: Tue, 29 Aug 2023 15:02:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <362xppdiza3tf32vq247rq37ely3hwli25fopqzodbmwhgwhpk@bvmufc7m5fmr>
X-Patchwork-Hint: comment
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829162840.73444-11-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdb1b5a-c492-4b9a-ac7b-08dba8dba889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ol0kkyAY+zIN9idf/czZaytgqUMh9KHEGQLHiG/7xoG/ihY582CHi7u5qCr05mY3LdVbHNXBZ0NLcVLXvnn60XQL9iUeT76hYHvcNm5FFb9AxKDaCXaiOAqbbTiaBLk6gO5wqtfbRimmZWM8OFrzfqqjPM7izfTyFoNlZHtGtKG33NmZJ0bXYEf1MebYzVExcOZ6I6kXQ6pnC0AY+7hDfDZRBu06LqQBc1J+90o3R8AXvf1Sk+NDQQCeheLXagYbso19iaRIDkXSY7zA3lC21Fpaw3wirs7gadKPIRz4qpfOfUVhKNIOBXj9ll5zGGj3y8kwx18nIRQ0zHuQ0Sm7hqzvtUmsVUw2Lotd6X1NU6kgxTPBF9QRWmFFh/AavPf1UNVJm32pTS1VBW/izoVg5sFPQNGshrbbkNgFJ+TpnUBPZFWnsNINYOHAA2apPOGIULJJI6f7efFUEQqs3Wd+PRXeEqJnH0a6kSsWMTndK/uF/eXNy+sPGHVLPeaIlvVaft6b2cxChq5QUyqxO4oa4jAJjIpD9pH+dV2PkbhnuP74leQIV9NzENBJUqGcYGNz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(186009)(1800799009)(451199024)(6486002)(9686003)(6512007)(6506007)(6666004)(83380400001)(478600001)(6862004)(26005)(2906002)(33716001)(316002)(54906003)(41300700001)(6636002)(66476007)(66556008)(5660300002)(66946007)(66574015)(4326008)(8676002)(8936002)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UU17foft6Yb5VdekWbZAg1Q2GuGGNzr+fFB+YJVj2wlSD00376w0myPE/X?=
 =?iso-8859-1?Q?B4o60cyow3TgsdlIIx740OifePRVe3mluQ9PSBw3widE+ISsPSgWJBEIvC?=
 =?iso-8859-1?Q?xParozIq/m4PZCBlRQ7XrNRylZhrRkSBXB6V/HAnSPnZOl0vaUfwwfOocB?=
 =?iso-8859-1?Q?eH0sfff2WPjUpGG/GdoLuynCC31OKI87AEQ8v2GnjBJyfuyEAAlL/1M5t7?=
 =?iso-8859-1?Q?Uuhi0aebWM58+nmS0JNq+qvHFj0yp8m6t5sTQIvzRa3f3LlAKFYOhkc7Wl?=
 =?iso-8859-1?Q?nM7K15Fsouzg5PaMTddICet00tO2X89slyeJsMJVwbV2lRlSbGkgvM0z2Z?=
 =?iso-8859-1?Q?cEZfD+YDf2K8SJgdbVsa5b0nvaRO3HX/sq6rBZ75KAFL1esmss01iXvmzy?=
 =?iso-8859-1?Q?81hdcm3yCNg3J3LSoEz/uSK8mra2DSNBHgGJgqG2sP3+CU7r7GcvNL69rG?=
 =?iso-8859-1?Q?md3g0M6fhD+86lGrHC2HL551CehPH3mv3WtvZxLf/UtxMgo/8iDziVdmWZ?=
 =?iso-8859-1?Q?a3FqEuI0SWE6frNVGjwnJgqumuH/+gt9gaGF/MIZLbvcTVT0uDX6Dc3MQg?=
 =?iso-8859-1?Q?In23ZUBb4TWVvWcHJNDg23eJy+HPvRQ1zopQS5wkYyQ/uv6eWfkuTOtjJO?=
 =?iso-8859-1?Q?jwRcKjflsBFpow4qT3lOUWVEfrjIRoevC5o8zHtypQSPZ/bLljLExUOfGl?=
 =?iso-8859-1?Q?1lJzM+MGWPTtUNfLunChhtml+m9nYq9Uo/BKOcawA4MaxZw06j2oZ36S0z?=
 =?iso-8859-1?Q?k5dect043jjpmT/+HU/zlTTNiIjXxGT03vJyf4TY/BztBrXR0RAvcofPyQ?=
 =?iso-8859-1?Q?xowb2U6mf5QRUAHBOB7TZH0DlLNnwhsSKsD4frBqyuAFUjDnPfUcGSItWr?=
 =?iso-8859-1?Q?d/2FqL6hVWgpa5Hm0+2pWYDmgv4u1hQ+ZL5akmgeCxX+liHarORNS75Ws7?=
 =?iso-8859-1?Q?AEpuxi0vYncRJsRKZa06rlUacG35m8CyFbqJ4DgjzpPcPWCkO0sDvuZa+0?=
 =?iso-8859-1?Q?9RWcN/7Svx9LnO5zSwHGcM3oVL2GFhKvkFloTaj37lXVLAVYkOoGnkUSAP?=
 =?iso-8859-1?Q?8oC1/RSwaSrXwllGShubs1dGRgLkGgUAdjykD23zf5KF3CuVUrgcDiKh3F?=
 =?iso-8859-1?Q?bamv6SWyjZTbwhRaPF7CdU0jNu5YvjlCCLy3DBMyfXVf7n/96EA/wxb6TS?=
 =?iso-8859-1?Q?Pu8ZV7rGzFr4AKAIEII1a3QaMTnHrZK79lui4kLKEbHWehhs5fPWMzvWlq?=
 =?iso-8859-1?Q?mLrU/dSNklZ/CUVlvf4pc1gOjF1pTNcQ44MPxmuJ9ag8DwOpeMf8ckYF3H?=
 =?iso-8859-1?Q?H06o1/RW2gHA48B/uAF7DsDbPUfEK2H9lrgf8bJ4/FCUcR6zwRF0f16mMi?=
 =?iso-8859-1?Q?YjWhLbO+fuXV9KgSfC+c54TuH6O7H0AGh53pbpatWm6cJ3ndSq0vp483JC?=
 =?iso-8859-1?Q?VTXaKqQ2g2s3nX/CUzWN8ceTkig9vqhA6X859SAfMUVlrvrPnnDIaMkaFq?=
 =?iso-8859-1?Q?HMvKqlivP2Z1OUI7z5bnnoFOlYZSPq8d0fotDRGubMVEaJ+xpPE07YlMUO?=
 =?iso-8859-1?Q?mU1zyyy7TTzYKBJN2MypQO9QRpmPSse+Av3r8Wgq3NYuwLDFutYITNzHKY?=
 =?iso-8859-1?Q?Uij36zUAc6H80Zgi2brgU+B+L8pmVqHWBEc6wV6JSjTDDItZ4K8Rhakg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdb1b5a-c492-4b9a-ac7b-08dba8dba889
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 22:02:38.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp16yElH53e+k8ACxJk3AN0dWBZv6+ASW75yix8gSeTxWXwVs9Kgw31/S87dN9Gly1r87Pe5qO1V9m4f5FZ1yPypJTbKNXRwQ/++2cJ8r6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Carl Zhang <carl.zhang@intel.com>, Effie
 Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:45PM +0100, Matthew Auld wrote:
>Future uapi needs to give userspace the ability to select the pat_index
>for a given vm_bind. However we need to be able to extract the coherency
>mode from the provided pat_index to ensure it matches the coherency mode
>set at object creation. There are various security reasons for why this
>matters.  However the pat_index itself is very platform specific, so
>seems reasonable to annotate each platform definition of the pat table.
>On some older platforms there is no explicit coherency mode, so we just
>pick whatever makes sense.
>
>Bspec: 45101, 44235 #xe
>Bspec: 70552, 71582, 59400 #xe2
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Cc: Filip Hazubski <filip.hazubski@intel.com>
>Cc: Carl Zhang <carl.zhang@intel.com>
>Cc: Effie Yu <effie.yu@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  2 +-
> drivers/gpu/drm/xe/xe_pat.c          | 67 ++++++++++++++++------------
> drivers/gpu/drm/xe/xe_pat.h          |  6 +++
> 3 files changed, 46 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 06235da647bb..53520ae30b33 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -238,7 +238,7 @@ struct xe_device {
> 		/** @enable_display: display enabled */
> 		u8 enable_display:1;
>
>-		const u32 *pat_table;
>+		const struct xe_pat_table_entry *pat_table;

if following my comment on previous patch, we'd have

	struct {
		const struct xe_pat_table_entry *entries;
		unsigned int n_entries;
	} pat;

Lucas De Marchi

> 		int pat_table_n_entries;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index f19f5d8dcd94..9e72c1b4b41f 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -4,6 +4,8 @@
>  */
>
>
>+#include <drm/xe_drm.h>
>+
> #include "regs/xe_reg_defs.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>@@ -33,34 +35,34 @@
> #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
> #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>
>-static const u32 tgl_pat_table[] = {
>-	[0] = TGL_PAT_WB,
>-	[1] = TGL_PAT_WC,
>-	[2] = TGL_PAT_WT,
>-	[3] = TGL_PAT_UC,
>-	[4] = TGL_PAT_WB,
>-	[5] = TGL_PAT_WB,
>-	[6] = TGL_PAT_WB,
>-	[7] = TGL_PAT_WB,
>+static const struct xe_pat_table_entry tgl_pat_table[] = {
>+	[0] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>+	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
>+	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>+	[3] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
>+	[4] = { TGL_PAT_WB }, /* zero coh_mode to indicate invalid from userspace */
>+	[5] = { TGL_PAT_WB },
>+	[6] = { TGL_PAT_WB },
>+	[7] = { TGL_PAT_WB },
> };
>
>-static const u32 pvc_pat_table[] = {
>-	[0] = TGL_PAT_UC,
>-	[1] = TGL_PAT_WC,
>-	[2] = TGL_PAT_WT,
>-	[3] = TGL_PAT_WB,
>-	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
>-	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
>-	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
>-	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
>+static const struct xe_pat_table_entry pvc_pat_table[] = {
>+	[0] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
>+	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
>+	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>+	[3] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>+	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>+	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>+	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>+	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> };
>
>-static const u32 mtl_pat_table[] = {
>-	[0] = MTL_PAT_0_WB,
>-	[1] = MTL_PAT_1_WT,
>-	[2] = MTL_PAT_3_UC,
>-	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
>-	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>+static const struct xe_pat_table_entry mtl_pat_table[] = {
>+	[0] = { MTL_PAT_0_WB, XE_GEM_COHERENCY_NONE },
>+	[1] = { MTL_PAT_1_WT, XE_GEM_COHERENCY_NONE },
>+	[2] = { MTL_PAT_3_UC, XE_GEM_COHERENCY_NONE },
>+	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COHERENCY_1WAY },
>+	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COHERENCY_2WAY },
> };
>
> static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
>@@ -82,27 +84,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
> 	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
> };
>
>+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index)
>+{
>+	WARN_ON(pat_index >= xe->info.pat_table_n_entries);
>+	return xe->info.pat_table[pat_index].coh_mode;
>+}
>+
> unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> {
> 	WARN_ON(cache >= XE_CACHE_LAST);
> 	return (xe->pat_table).pte_pat_table[cache];
> }
>
>-static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>+static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>+			int n_entries)
> {
> 	for (int i = 0; i < n_entries; i++) {
> 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
>
>-		xe_mmio_write32(gt, reg, table[i]);
>+		xe_mmio_write32(gt, reg, table[i].value);
> 	}
> }
>
>-static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>+static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>+			    int n_entries)
> {
> 	for (int i = 0; i < n_entries; i++) {
> 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>
>-		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
>+		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
> 	}
> }
>
>@@ -115,6 +125,7 @@ int xe_pat_fill_info(struct xe_device *xe)
> 		xe->info.pat_table = pvc_pat_table;
> 		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
> 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>+		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
> 		xe->info.pat_table = tgl_pat_table;
> 		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
> 	} else {
>diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>index 9ab059758ad1..e2fabde2c730 100644
>--- a/drivers/gpu/drm/xe/xe_pat.h
>+++ b/drivers/gpu/drm/xe/xe_pat.h
>@@ -28,9 +28,15 @@
> struct xe_gt;
> struct xe_device;
>
>+struct xe_pat_table_entry {
>+	u32 value;
>+	u16 coh_mode;
>+};
>+
> int xe_pat_fill_info(struct xe_device *xe);
> void xe_pat_init(struct xe_gt *gt);
> void xe_pte_pat_init(struct xe_device *xe);
> unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index);
>
> #endif
>-- 
>2.41.0
>
