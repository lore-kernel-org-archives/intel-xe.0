Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A41C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017EF10E9E5;
	Fri,  8 Dec 2023 06:47:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA1D10E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018030; x=1733554030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=R5etplmSpXBas/jFRfMvn5EgnyaCv0F4DDqzXIuxlAQ=;
 b=LhyVLZvJv3j53mHDlyqSwPoYZw2wEusaT8085mLSWVjcDR/rdp++BIW/
 0jd4CzFY2QBvQMy7g3RkEg3N6UXg4dnKzLQCypHwGqZrsaqdUxDI/htpe
 ER//2PPn7QmRxspqFWJED/hrEOZ54OVScRTZCG887hl13G+xve0MCzP2A
 WO5nD1GUK0giZBT65lSSMnsgA2z5Kw+LsHOje61xbKXwAijcC0gTz55In
 Rj+1Yj5Y7pP1zjdL1daUFl1j8GZCDx0WrAmNWsJ9o0ufojy7O2zlw1zQQ
 MYgILDS0S5J5BQ+V5+SQyeUF8eKCFvZQFhc03o+jxOM4QfW5JR2o03yJV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460844207"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460844207"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765387011"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="765387011"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2cFJBMMjY/neq2pCtE8pFs0++fsZv4VKuyOI6pDEvlkfwCp+uAnxmRhlBRAa4JBFEI3RvjyVQUuPsqHT7m94RiRUBFgGzffboUA4+OlCEkQ1yit7BH2S3FyO8M0TjNEq+zj7fmuyyYbDK3uxSSIagjCDpSZbi8FGz4Al+AtXcPaHBJqc2ywA3Q2UfXA/ZOLEjloAxbxv4yOAhbrkS0oBt5lIdlWP/ginwKKVvOFpTg5DG/WCGfTTWxpQu+kUBFXKUBIzZqPzs9y1KgFE4jqhUij6ngQ6k0pCALy1mlz8uPflO2GMl035BPKis6eXW8KkZtdzaE0u8CuWhz+aPud4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGc2IpICvz5JBkhRk138ruJhitrkSZRuSon/2bmuOu8=;
 b=Zu8vSirITmPsXTgsDnciMjzydZPqif4Y/6E/8w4vgZazTlo9uFyQBlIOfVbVppxuvPBUvUW/G4Yf5NaK+gnvIeYNvtqtpQW4rRh2GAR6ntwoXc8b/YHxJuhhZhsIy9ZPE7UmGO4ptPxRgp9L1ZieT1avXUS1Qq46WMxlvAt7a09fLxdCrKDg6oArUr0kD06Kpdajv2kPy4UNyLKRWZHa5xMMJP8YECjaoFXWO5xCpExSHvG/WcN1hXSXSeEHojkW3aw9VBImUROaQ3GyN4mOvZDevp/y0s1H4HlEo1BYqE+WbS8Iubm9bX641cnIpj7zxk37BuNHAASdttOGX7Yefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 07/16] drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
Date: Fri, 8 Dec 2023 01:46:34 -0500
Message-ID: <20231208064643.877688-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 16449e9f-6945-45f5-3223-08dbf7b97ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ld2PYWNl+2XOxWrK0WYM4n7nECjgyyGtCjyGX0UoCP3G610MUDgrDvIybh1V5Gzy0bvyzZg1RtuLqnw2QB7baH9fE5+zQd7mYP6GwGG3uu3r/Bcyk8ErG++cOZeMuiy23vDBe1EMBNx5ML50guQ3CJ4wrUQjMazddQFUikwvpzlGeRLYmbjGEr44TtSQoFcfCFM+tNOYOpx1z0IeokVdkSylsHiZLjES75Mi3a4EZMR9NwVDPN7LwT9k8wXOKLp7kQvKl90OkobVOZnjYKeCWHiEMSXy2Eup6P6J++C6rTCNQXa/5j81M6TnB7OIDdBn4RvmkwV0u/qluLSsirhrlTM/odEochRumNMOXrPXZq8Z4bOu7+SjaNEvFNbMfrFo7ufTycG4bpq3CuTO6dUrpHCUJj87sw+u9Yj3/JrGvDgqaEYPyqLeeaJO7JPxkugIzKpZSWDOebfHPb/Jj0rRsBE8BxbomPvBBTjVtz9SQUhj7CYlwDr+EHJVVstfrldZ23r2ahrI5d3VoAg4NOkd/fIG7wX6KFzcagB1Ij+6C3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJKMHRKdmJ3aHl4Q1BhWlRoWnRudnRBaHJvTlUwZC9CMG9rL1AxV3cvWlRs?=
 =?utf-8?B?TG1OcjArWGxhSXl6dUNBUE9PQU5kd2k0cWVNRHh5YUxDSVg0WTlIeHpYZzBN?=
 =?utf-8?B?bENQbWQzOGtkOGlYeTRGblJhdG9YaGRKemY4UGxlSThHMlA0WDRxWlJwVFk0?=
 =?utf-8?B?T2VqRGp6bzBtak1ONDFsMmNxWTllaEI3Z3pBK0hvZCtneE1vdnl6eEtOWVZa?=
 =?utf-8?B?S0VjTUNXRnBBRUVidkZVZ3EzeFlFSjJTSW56cjdIVGZrOFlxczlDZnVRUkNr?=
 =?utf-8?B?ZExLY2U1MWFnSDRYN2NQYVN2YjR2RVR4emZqZGNyT1FVN2Q2blRCemRTaVJ2?=
 =?utf-8?B?R0szL2sxWS9uVDdYMm44NDFMSTRSNWVKZTdWOFJFRVZnK0xuRjQ1V0NXTU9O?=
 =?utf-8?B?czQ3aVFvOHh4UklJTWFFakpoWkhrdFhhVWFUWGRzc1RvT0l2VzRCY3ZuazVU?=
 =?utf-8?B?aS9udHY5UzlXaHpTWHRaSU5FWnY3ZXNIVDVLSVFic1BnU0FWanB4L052WUxi?=
 =?utf-8?B?QWxyQ3JRdnRXRFFQZDJicUlyRDhZTEJ6WXIzdFdYUWRONUdhKytGRGlhTkx3?=
 =?utf-8?B?N1FTdFFMTURlNmg4OW1oc1ZiRG0wSkJyZlord2FVUEF0c0s1NlR3R0JCUFpu?=
 =?utf-8?B?Z29VWjd1T2MyS3IrUXZjTkp3WkNvWFRiNW5MQnM2ajg0SUVYRHFHdDBEdk4v?=
 =?utf-8?B?RkpBSzNiWnlPc3ZBOEJBZndVRmZTSjluTXp2YkpuaCtJVEh0YWVocFNOU001?=
 =?utf-8?B?MHVwVWdNMFNwQTI3TjgyVDg5WjY3dnVqTmw1REg4SDcxOEgzdlRNNlZkMU9T?=
 =?utf-8?B?WENBUm9kVzJiY2xhUkhZTHpHU3dvNzhjQUhQZVBObzZ4MDRTQ1pOU3FuL2Ux?=
 =?utf-8?B?SzlOQmV6RnBVeEx0SHNIdEpHdThoWW9CdkE2dmhCNS9BMGFNRjJVM0YxcG9v?=
 =?utf-8?B?TTNib0NSSkVGY0RqOHBxREZ2Y2Y3Q3EwSmxwSjI0WnZWSlZUbTgvazJ5Q2N4?=
 =?utf-8?B?QXR6dDhHSE5uNVh1WEU1WlBMcmVqaGNyN3lncmY5aXVNUG5aTzRjdHB1VStT?=
 =?utf-8?B?K2RmWUgzVkNhUjRnNmVBQ3c1cmdGTnFxdnhjb2ExMXVhSHNXcmV1aWhublU1?=
 =?utf-8?B?dWgwN2dkZ3NhVTA2ckQyblFZZWxEa0VQR1VRb1hHbGhyNHI4b3JVU0E3VmNQ?=
 =?utf-8?B?U1JMS0xNandDd3gwamFOdnVPem1LSEhvTk9qd05nSUxpaWxtVFdNbWQ3Wi9x?=
 =?utf-8?B?VjF4YkttVGs2RjNUNXVNMm5CL0JCSWZSVkZsL0hYaGVUSTF3MG9aYUo1MENL?=
 =?utf-8?B?eU93VHZhVU94ditKR1ZjckhWbVV4SEdDekR1enpzTVdqUWY2ckhFazhYOWxy?=
 =?utf-8?B?cnZpeDQxQ2ordTJnbDdYbk4yY2lXUEVzYkRJamtkM2J6K25pakpmTHJxNmM3?=
 =?utf-8?B?RUZtRTJ6YTRQb0kvdis3Wm1KSHRYb1VXcVo3RThkT3lVZysraWJDRUtmV3lX?=
 =?utf-8?B?dXZFL21ncVVOZ0I2V1ovMzdRM3FyVVRJTTl2ZFFtRTdvR0lORXNKT3lpSnk2?=
 =?utf-8?B?OVI0Y1ZTMVlucjNlbEZDeVlFdkF6cHpHeTUwZ0FqUHdKdnNGT3M0YkVMRGN6?=
 =?utf-8?B?QU1tRVV1S1FTSFZ0SURyeHNXV0FzNy8zRjVRdjduRFNMaU5jcVlXamoyamZu?=
 =?utf-8?B?RVlQTHRBNU5DR0hSZENiR2xiQ0krZlB5bkFqV053L3hKUFNxUnNMazV3c3c1?=
 =?utf-8?B?RnVZR3pOZVM5bU1nM1BTTjdLVEdDbmJFUWV2M2JJS2ZsN01nU3Y5N1Jaekx6?=
 =?utf-8?B?dkIxRUhjTFh4OGxNMVgrSmdTL3NWaDVsNDZWaVZvamxCWFJ0M0krNncyMWZn?=
 =?utf-8?B?QlFQSjIrL2crVzBxWjMwRldlb2pIb2E4QVJJQ0l5blFFY3RZWVFocjYxRDJs?=
 =?utf-8?B?SHlvcHByTHpycGxwb3ZFcHVLNHlDanRueFZ0Z243TTAxQkhRdTVzMnhnRU13?=
 =?utf-8?B?dURKTTllbWdrYkw1L1MzL3owYWd0U0VadkpNNzg2RkpHSG5XT3FINzFnSGxB?=
 =?utf-8?B?VnlYTm1ibjU4T2h2NWdnRllUNkgwUlZjVDhxWEs1clcxcVc3WmgwNWZ5cVBp?=
 =?utf-8?B?L3BZc0luYzJTd2ZOQkRhMExDam9PM2Rzbmptczg4REN6YjRmUU9TN2cyeXNa?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16449e9f-6945-45f5-3223-08dbf7b97ebd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:07.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC6x5kI1ZnJaANEVUBcdjba537u5iSvjDiLpO0G2vbobrvW1pNq38sy4qWbIiLRsN4KPKz44exbYH5zj/58PbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

From: Danilo Krummrich <dakr@redhat.com>

Introduce flags for struct drm_gpuvm, this required by subsequent
commits.

(cherry picked from commit 809ef191ee600e8bcbe2f8a769e00d2d54c16094)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-8-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c            |  3 +++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 594ebcab5a4b..0a010b52e33d 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -720,6 +720,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @flags: the &drm_gpuvm_flags for this GPUVM
  * @drm: the &drm_device this VM resides in
  * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
@@ -735,6 +736,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       enum drm_gpuvm_flags flags,
 	       struct drm_device *drm,
 	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
@@ -745,6 +747,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 8977a518de96..f765e3835306 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1828,7 +1828,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 59b32c5b7d16..239680b83079 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -184,6 +184,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -202,6 +212,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuvm_flags flags;
+
 	/**
 	 * @drm: the &drm_device this VM lives in
 	 */
@@ -252,6 +267,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    enum drm_gpuvm_flags flags,
 		    struct drm_device *drm,
 		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
-- 
2.43.0

