Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAADC61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 23:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B159410E416;
	Wed, 22 Feb 2023 23:38:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225E10E416
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677109131; x=1708645131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sWVOwDvTL9Y1S6ggoTB9pD9IGZ4KjneO/z7dXJSL224=;
 b=ILtQxDDvIztfioyV2PWvkfojr5M+dJp0NfdU8wnr2bPMUCnxG46ZVCJi
 PtmmUfzAIEMjDpCHYk1DM8DXXqjqU0nXooUW4/S5Ee/C33zJ+NAkf+Yg1
 bwa0HV5LKyGWmellq0o1X3gurD85esaQHUmcDaPPckGpo1wSfqGJXYTEs
 zdq1f7ebv+wLBaEs16uIyxMbQorvrhAmM8qPeR0+zf0iAFos7eMYwfVBy
 Ei0EwlujP5JIptlXX4whSQBFTT7Rat0UsR1MEhld+rSVDeBEkzj829gwg
 aL8s7Xq6RZoJXCxSimTERemxBhETtTIXq+DDgeY0BgL2jiTnsZlyyGUpq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="419292928"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="419292928"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="704633044"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="704633044"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2023 15:38:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:38:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:38:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:38:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4kKSbnInIsvDzva6phLTzGptMwVeDSSyUloP0CDjzMP7wE7xq6/Oos5i0FKTDCM0IOMz5/qhO9Vnxsz91EqnENe6g4eNAwn2euDHe4rUn6cw6PzFrDljDl0M/lsbq88i4t93TguNIiU+2RuWoOPM0tQH1LXDfg7jUNbJ9d8rUnzgh8Ga4PVz7PlhRtWhcOlk937K26mrvvZ6CVO0s9APIa6PAcqGhE9B9CxvoWIdyjBGTYdoWZSJy63obM67N5L5wfZH3CLLlgylurX0aFzvfyqrdRMYlblErz6HM9WUlSZe/jjWGnjugTotNZd0fuJ794620RFfU+YFWNE/jvqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hwxFYbgnV/197Op03TqvfkoSC3qHkbVmO3gaKQ5sLQ=;
 b=hgxsKpWG3cPra/5tEXfOR4zuQSooIaDDaMJUZxiTQsseceMF0G5Xusfmuix2iO5sTW9kELVAiAnm1L+Ff67cm0KoWEWEnO4/qPfQFisNUIYMbW96bV5p1aY04ymMNon+vcHk/o67CTczfRVNIDmBIF9rbzJa1KAuQdBmK2CPwOAJ8gTHserRd6imJ8VQnU/11FA2YrFAcX/75f2lkFqg8d5hJwJhHTknX1r953cKsdjV/4i8eNEgzuw5mVicF6cGEUldkDkapNRYCDJJ+Ri1Wn7cK3+TEUPtQwNXn3l6GLTVUPn5UeXXCFKyg2700zS5983YVa4yLl0/sRNC8v7GSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Wed, 22 Feb
 2023 23:38:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:38:45 +0000
Date: Wed, 22 Feb 2023 15:38:42 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230222233842.z3kg2sw64ytj6rni@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:303:8f::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8247cf-9b70-4b99-1173-08db152df02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJNE8cOmbeLb+1h+NFrMzakIKjnkSn+hf6IK7WNrMRYcAruKZPLVWSVBNmgaTrUw4uLw9nCrble813D//6L74EpVZdkLW0rhicGtHXmEOdLx3kt8R2Bbv9rFLpFCEcZeFhCfZjI6k1XqflQBx2NrEFJ9Xk/KVcwb27EovSBT1aEIrepk6Re454LFhCEXfaENmI+izSSqsaNGLqmvO9R1G9isgLzL1nykNG9n5Nzeg08WhzLot9Q1u5eKyC2jzu2H5oEuvMPAbcduNgiS4bNamREKFpVrlvIjtbci+YlSXzuVeWZFtdkrCGgWzP5maBso85YOSLmWsMcy0P+/jcx02zLmOxOT9rl3bRZiCVu2kcREnMG7v6hRA4lHzvd26le572Nwr4DaOQmY0iwNMuHa3AX+BF+bW2oO5IU3AcEVV2LW+bbjSKoek7sixC14SRkRPfELX6JCjXVKlo8N5e9Y4mPyVGcJZXTbFyc5Kg3Oq6dwOjaYRyXdlNizOWrp8EPUwB6qDesyJWjqDN6tzHcOVs0gXjIlHB/zNrqON8tYMSaEea/hrWnSr+7bBsFk/SQTZ3nxa1G0Qh46+Q2gfj6kpJ9RRHx5MDdhNqJNgWStrvdwX4sDoUqfuT7MIOe6L/bdSzLt6y7b0fJHsIdDDhNDiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(83380400001)(38100700002)(82960400001)(86362001)(2906002)(8936002)(6862004)(41300700001)(5660300002)(186003)(26005)(6666004)(6512007)(6506007)(1076003)(6636002)(316002)(8676002)(4326008)(66476007)(66946007)(66556008)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uv0PRvf1IrXoXsb7NA4Z3MdNsMjrwAOcOWBG8WROc47La3zCdoonjcXjnyib?=
 =?us-ascii?Q?G/v2SALq69o0skxZ2MxnFgXtdePpuUeRMLVCNLdMrTFmIeT0587/oyDPpFhE?=
 =?us-ascii?Q?IYUoV5H5wZUQJ/ZUTDqcmcunXh5O1FzX210KbIF6rZiqgPsezGXUAhu1MFJi?=
 =?us-ascii?Q?HTQTg7U/W3lLbutT8I3JpbsWvMCWXhnslZaWXQkKT1i++7sqTd563TiWfRV+?=
 =?us-ascii?Q?6ijiF4FkNgd+DZPu/7c+jh7NaxZO1ynmWlMaIO65+I+FMw4fvoXjRmazsiBF?=
 =?us-ascii?Q?jyNEQNPWMS8HPisM54Wa4R1GXBXuKMgCRliN/npttgOdrXcT3F66VAXXG2EL?=
 =?us-ascii?Q?KLIwWht24c6BSvPlqLCtr2mnGelSsujZ6j69Ii8d7ryLwC6QnHPfuLjxtA7Q?=
 =?us-ascii?Q?CONWD6sQWnFsE9bdBa7Ac5MylrBKLIppIEEPsXVsig3n0uhm6qL8FoHKrEqB?=
 =?us-ascii?Q?wGTR560+ruWg4Wxi0DYTEaAB5X7OXKawyQr/W8Te3m36osl22JtEvXXFazgb?=
 =?us-ascii?Q?a95OorYk6Dr/G6ZnbdpPjX5F46f0NKFz5JZ15rlVDH6OpY69nIMjhJwuFkDy?=
 =?us-ascii?Q?XpIxq+kH729osfHkrC2fe2n+D20idu0Crm2WvTKYioDBeV9qq8L7QHJNFl6j?=
 =?us-ascii?Q?p/d0mHpbXAGvbt9gWn0HxRGH6aanJHfu6sIZWUQlWdvifQfzvaSojOTUDg01?=
 =?us-ascii?Q?Kw6+kUlNXhv1ygyELqJkUP6vF+q2KyPRmStaYvOG1MhD4m/Hmu7lKxVbWXRK?=
 =?us-ascii?Q?JyaU0uJxdEFYUeGmymH30KfVjRpETCywSt4wLIR9u357J2PoS/rs0v+z+OXx?=
 =?us-ascii?Q?FcAx9KjIYfobbstskT7uvazw/VRUIMPVHPx81CDCmLOhzSdkW3d2FE3Ayvql?=
 =?us-ascii?Q?fgJFz9B/JHgRdBVmbfHC78f9NF9B5TD/GVVvHqdMhtMNkwLCdKjR2WnANPnt?=
 =?us-ascii?Q?xlvjtb8Fa18H8i+ZQ7W7MYroLodbjRi4SRZmLuBTpKhx4nA8omjsX56t/v8R?=
 =?us-ascii?Q?1p908Olyoq9v/hRAlXspEGssmGNO394SDIqZ/H2d7QJp7C48zNi19S0857Be?=
 =?us-ascii?Q?hC/O8sWa3DLVgMtRFSfoNdGfcgSBO4R7h5wV1lR5Xp5a/cGmAcHh+C+Lnxp2?=
 =?us-ascii?Q?J83RQ5vc7fxa8fMx7uhqtpEmruYxvrO23VjZDQdmadZP8Gfw/h+MfUlMzLeN?=
 =?us-ascii?Q?u/33ZwXIOkbGPwJ2SlhcBRRH1YqKuO2BEXYxULjR6Xoq6Oz70lKb1JCp7D1C?=
 =?us-ascii?Q?sjyPWdaFFIpEkveSWOXmNmBboX4IP0+QM9Pcedjae7Ac+tYaPAf8lqaCTOSV?=
 =?us-ascii?Q?KLU74J62dYL2Ozq/2v95p3dmyJvTdHkyYzJmkhghHUAUQUoXv++PVj+hTb3E?=
 =?us-ascii?Q?8w3iDe3AiUdqnwj9dlIDBYt0aNuCtywLfmT4V8QO3uchq6Z18gseEHT5uMm5?=
 =?us-ascii?Q?IXvdwzjY5OnlqY1iGYOTJLfssMYl8KgQ1s0rnd16XY7vI8/6RLWwynoZPRbC?=
 =?us-ascii?Q?5i/M1NBQZ1qdplxEJ4QuabX1dX2Xm6ZAajc4i/2siwjPKi1yvBkY9dcViZ0H?=
 =?us-ascii?Q?iU0a1dIL9mKhlD3+VfyA3TnH9mxAz/IRGMW9m7DP1GOHRjCahfH3U9W5wAQr?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8247cf-9b70-4b99-1173-08db152df02f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 23:38:45.3822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQeh6LsWBEPD2XgA1HQITpD5WDQcbjoKo3IL1RZDpLWogLUgVy3vIufEKvEeocmyV9h1yx/ur5DlbLti0ZX/ezyrVGSqVYPCAbU4lJG9Gyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/mocs: Drop xe_mocs_info_index
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

On Thu, Feb 16, 2023 at 03:17:21PM -0800, Matt Roper wrote:
>The values in the xe_mocs_info_index enum only match old pre-gen12
>hardware not supported by the Xe driver.
>
>The only usage of this enum was to set a default value for
>info->unused_entries_index, but this is unnecessary since every platform
>in the subsequent switch statement sets a proper platform-specific value
>(and the XE_MOCS_PTE default doesn't even make sense since the hardware
>dropped the "use PAT settings" capability in gen12).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mocs.c | 30 ++----------------------------
> 1 file changed, 2 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index ec89ff3ac29b..583e198af88d 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -23,30 +23,6 @@ static inline void mocs_dbg(const struct drm_device *dev,
> { /* noop */ }
> #endif
>
>-/*
>- * MOCS indexes used for GPU surfaces, defining the cacheability of the
>- * surface data and the coherency for this data wrt. CPU vs. GPU accesses.
>- */
>-enum xe_mocs_info_index {
>-	/*
>-	 * Not cached anywhere, coherency between CPU and GPU accesses is
>-	 * guaranteed.
>-	 */
>-	XE_MOCS_UNCACHED,
>-	/*
>-	 * Cacheability and coherency controlled by the kernel automatically
>-	 * based on the xxxx  IOCTL setting and the current
>-	 * usage of the surface (used for display scanout or not).
>-	 */
>-	XE_MOCS_PTE,
>-	/*
>-	 * Cached in all GPU caches available on the platform.
>-	 * Coherency between CPU and GPU accesses to the surface is not
>-	 * guaranteed without extra synchronization.
>-	 */
>-	XE_MOCS_CACHED,
>-};
>-
> enum {
> 	HAS_GLOBAL_MOCS = BIT(0),
> 	HAS_RENDER_L3CC = BIT(1),
>@@ -341,7 +317,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>
> 	memset(info, 0, sizeof(struct xe_mocs_info));
>
>-	info->unused_entries_index = XE_MOCS_PTE;

since leaving this as 0 should never be valid, maybe add a warning after
the switch for the cases someoneone forgot to set it appropriately?

with that,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


> 	switch (xe->info.platform) {
> 	case XE_PVC:
> 		info->size = ARRAY_SIZE(pvc_mocs_desc);
>@@ -406,9 +381,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> }
>
> /*
>- * Get control_value from MOCS entry taking into account when it's not used
>- * then if unused_entries_index is non-zero then its value will be returned
>- * otherwise XE_MOCS_PTE's value is returned in this case.
>+ * Get control_value from MOCS entry.  If the table entry is not defined, the
>+ * settings from unused_entries_index will be returned.
>  */
> static u32 get_entry_control(const struct xe_mocs_info *info,
> 			     unsigned int index)
>-- 
>2.39.1
>
