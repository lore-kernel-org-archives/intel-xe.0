Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBD7C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 19:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1B10E8FC;
	Tue, 23 Jan 2024 19:56:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932010E900
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706039796; x=1737575796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lwaBifY0WwX6Wca6TQymUC7EeeRb7SzNBJ0FctzDd3I=;
 b=cbV3IBah32YucoRtMMWqBJUsR/dJLqmp0cNddo1WRBxKww0UEBLrTEMx
 8Tjj9EfEs7/hkfFXFmbaTLnJdsF1O2Cha8fNMDTplKKwmW3AqzysQxzIo
 zLf0LXvr4xjBzDFBXeIPhT38Zotb7vFe8lERTeOBimby4WEmbCrN0aX+W
 NlZvB2raNIvtbG6l2EfJT8tBYXF9t+/9t8YuwLtBmUubpqZVRibUokwb5
 L4A4zJ4In6z/fpZBbnoYAlhRsfS41PmjEwmzkwTMy2K7deIot3p3zOMBM
 INtmHbspBBbbJw6E/m8jasNYEEKqVmtdgubqG+0N/BFfLPGBpCaQTn3Zc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14984688"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14984688"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117384862"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="1117384862"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 11:56:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 11:56:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 11:56:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 11:56:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 11:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCbdeS+4qPrAE1P1JE5JcbM/ORt1xOxxaBjo1kBUzeK75wH40xFvWbxvVrsJ14KwG17juH/1cA1SlYYVVry/tdifaRgNE/L/kwHLM6CtFOC888R/1CIvaOFVdXt6horZJc83r6Yg1JXB2kFNI0Z7o3FA0oQYpfoZQLYsjnf/z5nvNltx16Q231pn3lA+8oNcJ6rd6ZKr9vFRxC/Ha3cp+IHIpR/Cy4awTEVZtw9d/scjuoLufwNa0mJ3TvujvvNDIRaWbCgDLy1X20CrsdLG8XVdqBsjnrMo2Ohabf809coMu/WfccRGDGzHyAjQC6spzVSjoPm1+Me1sJfQN3KD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5k/p1q7wppVvtUM/FhAJvg8F8GS4ujjpaZHKm6NFUM=;
 b=ew9xfOt2PACHUY4Bxeb+FbZN9doS3wA1Ryb8NHZsNYj1F76r11lU6ZIfZLt8aQLPI8bIkvm4DY6qolCk8TflvGs5vd2jNJDuwoSRhvetURC2r+fQvcHDQom3bXGys6Ic9UwDsQflGccvNz5ZPqWkZCMhWvOeG41TOAsClrGJ0vWrWSQ+gLtLpsMK5EzPnmMjh8BAXS5FccHLbRrutanEYhZkroTmOmsfrAYFRDNP2W4YOaVxNXV4CwIQ5AOVn19mMTs+NEmdItQgKJWVYyWVEQeLWtTG+BikNeYug8dsOP4xOKMeByvHE6ycd5WQm4TC+2Ylw1marJBqIxBisSVZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 19:56:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 19:56:30 +0000
Date: Tue, 23 Jan 2024 13:56:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Use LRC prefix rather than CTX prefix in lrc
 desc defines
Message-ID: <laifryu47rwkwhhjddhmvfp77n7idxnbhb7jih53bst2y3imax@laru5h2zphzb>
References: <20240123185530.1595588-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123185530.1595588-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7e263a-ac78-4927-5161-08dc1c4d646b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+A3rrgy0H0tqJHEUAFAHoaW6HjOLruS4bL6sCRLKDIHJS93THq1XtVcctpmijl9tSAOsTxThNFo4lkcas9b54BtGs2INIHXgQc1UWLq915z0A/mVgrd8uZSuTWN8KqOc+lVxn29VN02CIQaB42smsuMIZRHrg3xQqS6Pefu/Ao/YpviqEWZ4M7ky3EKYWTj0AGevpzqGEtdemWEkg0F7sH8UCy4G4M6amNsbX4WrN1xo+rtFsmVX4oq70tWA/vjK8TJ7+SVd+N/GhEMi7BviMbmu780mmKaTEr9B6JJ9nvmTVupyIm2lvPNhRmyfe4fPELHgrYDrJibOPCYQPlc/soV6RJAiwz4NFY7f3hJ3lBXXjYSDFO9R1pyKNKCt/kzGufFaePYkxFiAuAZusj7UraGYiniRT1zraSnbTwNkOUZb0EmWcoLqHXTAADVyUwOglLSceRZqqmnoEwkre+ns6KGERUyFhKz+h1CBcyEGxJG02I7njwoqpbBHbSe8Qabfn80NEWgZMrGGgn2juuIMfIrDke919n2TZyW2XMPkFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(478600001)(966005)(6636002)(6862004)(8936002)(6506007)(4326008)(66946007)(8676002)(66476007)(316002)(6486002)(9686003)(86362001)(66556008)(26005)(5660300002)(2906002)(6512007)(33716001)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kayhpQyvNCm4ctZfh8Z+Kv+lD3XgpAG1+445hoyXzrZ6gbghLKq49dkysi?=
 =?iso-8859-1?Q?puOInOcR7MqlacIhKjysuyQ3zibAyfiZLBuNR98qOr7nYk2CXimppe4hEd?=
 =?iso-8859-1?Q?RZqjp0vTZLFNN/SlWjFF45ZnCpAtNyDRIRNfaXmtoBiDxqi7aZST7c3/F5?=
 =?iso-8859-1?Q?Xa4cDixTbbOfz/4tfgOKCvnriOjH/bxM3yPYvHaveyv1u+AuAlbP1qEySH?=
 =?iso-8859-1?Q?xBuvWmNXCaSMvRongkaiYhOkrlyI7UPkSflzDsCPcrXd8KW1ejZ9+zwpWD?=
 =?iso-8859-1?Q?6BK1EUIFS4PI57RcjF5oPrJXwjKBT991av7nVwqoNsnuB1OdpKL41biJxO?=
 =?iso-8859-1?Q?jjjCXjtsZxeRvuX2lWBefMUXpP+Z+I/TbdidLzdtT3DV2BKLuKUwGiQM0y?=
 =?iso-8859-1?Q?8xrSeI5L4jyvmJv7Wu+zhSMg9RM102o3wWdENMA/3U1TIo/1IE1kpK0G1D?=
 =?iso-8859-1?Q?xNUsS1hHJx+jUL+i/PRtfX6UPTldxJAzsRfGxtLUQEUSX29A9rWQIrpj2z?=
 =?iso-8859-1?Q?DMB39x5VDnLf4LxwrcW5rSEItWUZHI36uIfk3U4s5G4Cq2Xffd2vK+whR6?=
 =?iso-8859-1?Q?rQYzhzeoK5pCn8dogFxb17gSBc5T6yso9c3RbBlO8wWVI3oA77Qg8oQZFZ?=
 =?iso-8859-1?Q?fXMErJczznLdAltrkQnNQGzP5R7RBd/raiVODOzKDbXttjwoPkLChokS8W?=
 =?iso-8859-1?Q?+v0LxRuQmkRqsGdMWfmc/BTBD/xGj4PyaMj3znEKHNa7uJ3nXuXB+EQ0NN?=
 =?iso-8859-1?Q?5YBcG/KzouWNncKzkmjc58Wf8DO5SsycthKfih5Qhe8++BNOZFlw6hB8ow?=
 =?iso-8859-1?Q?rRIJkKQf9fiTPDvuNxrVl5n6C7g6Si2Zz4XFgRsGASKDtOsECrUG+kI6py?=
 =?iso-8859-1?Q?tBtAQQEZvPgK2N6o7E6K5c/Sc5WB+hZhOOSn3IHpskQQvkwjtEu5vktze2?=
 =?iso-8859-1?Q?5KjTMnm/5CTx6VVNbkoGjD7lwVXzwebl17C0J3pfZkSX5cANi36+K8CA+i?=
 =?iso-8859-1?Q?sd5BT3TygU4k5WuGxjex+a3blnAQJLAWQVYpNk1Ou0+3C0vuPEkBUo49Wt?=
 =?iso-8859-1?Q?s8usH8Vqlms01baK/FGQNIEsFdieg5h9wyT4MvbU3JadKTPwakm5Eoal5/?=
 =?iso-8859-1?Q?kRBjFyTgpbHeRuMGLb7aBgl4iFNz4xccmOmyBWZEuGvZz5FhxjVHDRfLe5?=
 =?iso-8859-1?Q?VTVctVeVrcAWlWZe94pKlBDJccBCAAYyoc7ZzprUAiNTAJsr4EdA6RSIns?=
 =?iso-8859-1?Q?QwYxWvT/UmB9yEyFFKiOYVYk4/EyF+kwd61mjfmKIhuFit5djFpg9YqfPo?=
 =?iso-8859-1?Q?Ea1Wp0LyMY3wpORPsi2Qo287JjOQsiz0240ikonNckW1EIA3Z6lWpmZJPH?=
 =?iso-8859-1?Q?yN/OgCOuShaSMdqN3YqAEchCkJj6fU/WkfniQsQwXGp9yBrqPsh3QKS2ua?=
 =?iso-8859-1?Q?deudZaL/UeHxhT4/VfxjSprYSQ1zuwSs6Q7rykpSbWPDGFlcBFBtJnm3du?=
 =?iso-8859-1?Q?26Uvh3GE54kM+c3nk2l/woR6+krBZrTiPBssA9rZCpCMiM/cgyqEe6OzB1?=
 =?iso-8859-1?Q?vrLpfVN20nkKkDJwRbyi069QPJ3ePYxVUmsRSUfoKuiUc9gpd6EHcfYAoh?=
 =?iso-8859-1?Q?ZC3puNbqHwGaa+ymL5b0pAG9ez6P4pazLjBdeCHsuSJp7My2D9ICZGZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7e263a-ac78-4927-5161-08dc1c4d646b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 19:56:30.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYEzrdWftnDT0rYSuNQnhbenZz1LaKQdxdo4WQHKkU26gT+CUS14fjgiFg8TeniSFxxR3pz23RqfrKNpWDD/ELDgzrgJ5H/LiYpCp7ScSh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 10:55:30AM -0800, Matthew Brost wrote:
>The sparc build fails [1] due to CTX_VALID being redefined. Fix this by
>using a better naming convention of LRC_VALID as this define is used in
>setting bits in the lrc descriptor. To be uniform, change other define
>with LRC prefix too.
>
>[1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112267/

how reliable/stable is that link to be in the commit message? maybe
better to point to the email @ lore.kernel.org?

>
>Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index f17e9785355e..c005e56847a1 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -23,9 +23,9 @@
> #include "xe_sriov.h"
> #include "xe_vm.h"
>
>-#define CTX_VALID				(1 << 0)
>-#define CTX_PRIVILEGE				(1 << 8)
>-#define CTX_ADDRESSING_MODE_SHIFT		3
>+#define LRC_VALID				(1 << 0)
>+#define LRC_PRIVILEGE				(1 << 8)
>+#define LRC_ADDRESSING_MODE_SHIFT		3
> #define LEGACY_64B_CONTEXT			3

maybe this should also have the prefix (even if it didn't have it
before)?

Lucas De Marchi

>
> #define ENGINE_CLASS_SHIFT			61
>@@ -786,15 +786,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
> 				     q->usm.acc_trigger);
>
>-	lrc->desc = CTX_VALID;
>-	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
>+	lrc->desc = LRC_VALID;
>+	lrc->desc |= LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
> 	/* TODO: Priority */
>
> 	/* While this appears to have something about privileged batches or
> 	 * some such, it really just means PPGTT mode.
> 	 */
> 	if (vm)
>-		lrc->desc |= CTX_PRIVILEGE;
>+		lrc->desc |= LRC_PRIVILEGE;
>
> 	if (GRAPHICS_VERx100(xe) < 1250) {
> 		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
>-- 
>2.34.1
>
