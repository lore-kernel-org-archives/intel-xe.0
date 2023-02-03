Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC79AC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5F410E08A;
	Fri,  3 Feb 2023 20:25:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAE410E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455945; x=1706991945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4yicvdcyuXgnqZsQ3LeHmgIv3GQVEtwx/qa8lrLlv80=;
 b=VKiWadGcuDAkzms7FWrEDTbTftPaw+JqFIg3O5aznvoTVdeGPHsovgrm
 xTgl4wSPVGyPpGCMXjavK1IRINbNKOTUjjIXxhqwuFfkaFW137lTfTofZ
 AlajtiFMYaAG4Bn+5H1ygrc61ZHsM3UqLXCYqCE0leq5q77yO/HuFNh0q
 HeV/XJT0/HChT3gNNcb6U3EoVePuZPGWh4MUk4PRslfyrOM1oxIQhwsmR
 Ri+a20f4ZKP5uXNszC/ACOdk/tV2Mon7MJ1XSntEqMfPW7PTuKGKdcNim
 82uY+9VfgNHkgtJKDk40WNa2SggarM+9cam2G7xDz7BFf7L+dswd7q3ms w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415059355"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="415059355"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659206961"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="659206961"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 12:25:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:44 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SexezHettqbcwJgE3Q3dg8x7GPae2B2tYRU6PiZ8BBRVRj1GI1hlq9Z7taQhglVfsOosglVwL7bbwDNKEn1vs5KZonxhljJ0pJTb+8abUZZAVbqOjfXyDDQKoRJgMB+IbA5L6Jv6zQVt7KcT9Wftl7pmOdR6XglaK5FGDPv+Qygyv27z/g83NJtMuLYAv+IfdhOrRIjUpu98E8gq7XNgjROsX9tbBfMpKwBGMSethzhbQVtdBvfuphbIUQxQYrUwtforivAA7D96/Q+e/G0TnI+gwMxWrWQr02BUqlh4IKAbCDQi3ShraEpXDnUxv2+AJ94aESHdMXum0zSG3ebMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM0CkRI5pfjFe79DPtEQOj5Rim3CJt46W3vsKtV1HoM=;
 b=DaRLdOahlrv47tQH0f7Y1Hdm4gnXPV8BN7K9uNGao1ZN1j1yVtVe9/sOOrPTzaynCTwFJBhMIpLRO8poyyOfuiam8r56Bl56wgzAKifjYwEuFGNFbUSLjgwsd40t1FV9Sso/Gi8aSUCkK10VTyPc3MevWkCflWE0dUPQgw33M1CfPqAKwMfQip4/ySAnUuuRPNbRbnylMMFDtt38RbgoqgqRpud3IF+7vOjsxOsYmvtCwQgnI3+jsRcSIWqiT0+/i8sAO/v5OSDwp2ZCxIsf9ypsbPN+tg0dRvlfLNk/OXZrLaH+BofkFF1XGsjf6N8bdP8DsxMeBvev/yEC/nEFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:09 -0500
Message-ID: <20230203202409.577032-23-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: c29341fe-a787-49ee-0884-08db0624d14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJfUNSjSkiJ3woJfd9WGP6yCl3y2gkztKflKXxHb7N0wtxe+HzzDnxsgInESDiJx1qu7uxTz1fSXRsUPGGic3ofgwhTDJ2QQrDm192BJwJGuteA34194j1rqkQtG3nph66P90pD80AKhg20FA5ajnnp4DzkHTBLvcu3912mZN2A4gEEJUsa0yoaEg7QWjV+v51gf9iAzoHn3K5FV+Tk/fCHVw4GLZTcaE1MdMC6iTH2gfwHVa0yhNsGN1W9hK09XCtQvrezOGUNNTcOx6yVwrUIfLuWwZ1j1NXmmZIMCBbJUz948ZCA9XEly4Mq4CVb6SNW4JD82kvTU9HPXAjXugNjUQmqo2Qj14DjCtkY3uLnhMmLNixCwwNFEq4AIQh4WwZVF8ENBeHqqxZPIjq6VJAgEA26+vwFY6XohDNco3PsFFaL2HVjb/eMmtywNN6UGiEp1He7pJpbaoc30aXOxJvv8IC9NLyPdpzWfhHhSeJlUjZH4lt18lfVYz/+Vw7uuhlmVIF90EexULYrdc2oiq0TnH5muCup7JyEATQbv/9bx8hjvrNzPHjE+mPW0BYgVCyEVCw5GuUywjdTkTLLxnv1ildzdWBNGhtohcKlQu8e79dADTxdXMX1n6oJkpwGg6bqPjhdAY7GQhrR/RbZ1cx/CKvvIQykL5KJkXv0a6wIm8oK5OaRg4zHsLfJtQ869
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m9LM0gYfD6Tzx5sC/HI9r7gt+zmxtFnsA30CE+NDHJmPZq5o5VCQsadLBgyU?=
 =?us-ascii?Q?WlgrAdmrtZlq4wl1IDRv/A22bgAPbJ7CdPSDLjfQ+4WDgiUVqz/F7hV7tzoG?=
 =?us-ascii?Q?CGIqYQRgFdW2gJqu+nciCkFEGdn/1Zo3mSmSMg0WYnXXGJWurdMdl6skKbEQ?=
 =?us-ascii?Q?0cKHLuuWVZ0Qes8uA3SWYz90e6eN9kWz0JdM7hnbqF9uMlPewIHItGvbLNam?=
 =?us-ascii?Q?WUhasRDA5kWR2kLCV6bb3/+rVaIb1vNGeFcovNOjuri4cKaIINnf2zcH1YXQ?=
 =?us-ascii?Q?DMtx7Vnafg6WEhRTFaXvcJhnBSad9X2mrmpMlo2gVdQeqFMx/HWOQsnJ2nuF?=
 =?us-ascii?Q?zriNb6cpz+k91pbZmHWpdexWVS0CZFU4xslYfPVw+9iLiA1/inXKz6LapQ1o?=
 =?us-ascii?Q?T7ycYeerS7Ao5vIuFyYfQXAqpsYZPMZir6ALu3b1I+PORhJmHCREInHAGH8C?=
 =?us-ascii?Q?WIfz2Az3HgBgYCuuE5jjKRgIf/Av0XkVSV02UqTBFm20R69Wn9giBuUUxUOU?=
 =?us-ascii?Q?8DuW6Bxsd/s+vnNL+ZcxLs+WBeJ+jePh8IqjSPSDdZe9CBBdq/acVfkilxYH?=
 =?us-ascii?Q?9dUXC1wWPZH9NfOfIzZO8KNdCPvAxdtUdsHkYnZOv3uUmqBkr4c2udNsNQ0l?=
 =?us-ascii?Q?8YWDIi5EAtdKpvbWlXBQ43z0aZTDhvIdXlHecvnGVTUTxN581zTmZYAmRtQ/?=
 =?us-ascii?Q?8LJvgiDTg0e0hExoikLm+v+UXX8YT0b9nABm7/DBbZxPHSqFG7ybsh8Kj+QP?=
 =?us-ascii?Q?QeA9qzxy0BXgN9i92hUc3+t9gD0OxSbdRNEE2MhhQqfh+ORTlSDDRXxBXBKm?=
 =?us-ascii?Q?Hk1yKT/PI6Ke6Lenq9x95Hj7EvQ3pkgtgQ3kTXZrQOsZ70nooR3Zz8Qc7r7w?=
 =?us-ascii?Q?vSOMhgM8hakW9W8Uz/d6J4/ZPw9KBeQRLziSVPA7CdzOR3OxWIFO/RQ7phDq?=
 =?us-ascii?Q?k3ZHweOZvFeBA8otZRl+O6MOXe8s3SQaPhlzVG6WSZeQ/XUzOoewXZfwVn6u?=
 =?us-ascii?Q?h07uFJBC9baiLBcFikI9dZpyugHvdFNaRuLGqWAGZdmh/FQErlS0ndlrmUET?=
 =?us-ascii?Q?CqZWeR4NoBDmZej53quGyxNDNpiEgupfx6lUPtKFxahizpdPY5dg3zmlppkH?=
 =?us-ascii?Q?JxSFf5HTLLIiSL+I6Jb40O2nqJZedC5KqlViqEVgQISNa7mvO520b0BippQW?=
 =?us-ascii?Q?CKtm29HJa/PkG7RHicSgDYzi0IRt2R0N+PfiggIpXnw+Eb/p3mdacJlMshE1?=
 =?us-ascii?Q?685x5VfZWRHQL4h/ZCS7jO8S5NOMJ+WmSwO4+fRYUaUKL6ctFDELr0l6y1bG?=
 =?us-ascii?Q?111XvR+Aej/rUD0aq2S8p2XH3QioLQDLrnBKa1XFZwVQDr7kndFVNZ9R2lZu?=
 =?us-ascii?Q?dlkqgrqk5lmZBdbJTDd1V4b6EOEQ1OItJ+N1QUS7OL64pJnZcPce5kbKcsqo?=
 =?us-ascii?Q?m8pNGQQtV1JTbQDRSeAI9cAMbCcKVbmwQAXvhXk3x2Bz/yAUXlFBOmS01LWM?=
 =?us-ascii?Q?B+ZvHhDkhAd6slWJSWJBKlOy6KEa4X+5tnU635U4uVXcob6c5gzQlsN803/c?=
 =?us-ascii?Q?J4WxkgXalSL5WUlmrVpnz4U2U5q+qQM8qfdjCILvvjcnTIUJVeQgxpbIH3Sa?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29341fe-a787-49ee-0884-08db0624d14f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:40.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhs9QYAux6e7FPWSPdpCWDqcZjirpooKxM3U5TxctEUe0mZ27IwagQTizr/jK/PGALI3JUFnjW/dlzUQBQJsug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 22/22] drm/xe: Drop TLB invalidation from ring
 operations
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Now that we issue TLB invalidations on unbinds and rebind from execs we
no longer need to issue TLB invalidations from the ring operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 40 +-------------------------------
 1 file changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d08f50e53649..370ab1e729fa 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -83,31 +83,6 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
-{
-	u32 flags = PIPE_CONTROL_CS_STALL |
-		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
-		PIPE_CONTROL_TLB_INVALIDATE |
-		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
-		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
-		PIPE_CONTROL_VF_CACHE_INVALIDATE |
-		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
-		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
-		PIPE_CONTROL_QW_WRITE |
-		PIPE_CONTROL_STORE_DATA_INDEX;
-
-	flags &= ~mask_flags;
-
-	dw[i++] = GFX_OP_PIPE_CONTROL(6);
-	dw[i++] = flags;
-	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR;
-	dw[i++] = 0;
-	dw[i++] = 0;
-	dw[i++] = 0;
-
-	return i;
-}
-
 #define MI_STORE_QWORD_IMM_GEN8_POSTED (MI_INSTR(0x20, 3) | (1 << 21))
 
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
@@ -148,11 +123,6 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 
-	/* XXX: Conditional flushing possible */
-	dw[i++] = preparser_disable(true);
-	i = emit_flush_invalidate(0, dw, i);
-	dw[i++] = preparser_disable(false);
-
 	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 				seqno, dw, i);
 
@@ -181,9 +151,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job->engine->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
-	/* XXX: Conditional flushing possible */
 	dw[i++] = preparser_disable(true);
-	i = emit_flush_invalidate(decode ? MI_INVALIDATE_BSD : 0, dw, i);
 	/* Wa_1809175790 */
 	if (!xe->info.has_flat_ccs) {
 		if (decode)
@@ -244,15 +212,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool pvc = xe->info.platform == XE_PVC;
-	u32 mask_flags = 0;
 
-	/* XXX: Conditional flushing possible */
 	dw[i++] = preparser_disable(true);
-	if (pvc)
-		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
-	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
-		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
-	i = emit_pipe_invalidate(mask_flags, dw, i);
 	/* Wa_1809175790 */
 	if (!xe->info.has_flat_ccs)
 		i = emit_aux_table_inv(gt, GEN12_GFX_CCS_AUX_NV.reg, dw, i);
@@ -287,6 +248,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
 
+	/* XXX: Do we need this? Leaving for now. */
 	dw[i++] = preparser_disable(true);
 	i = emit_flush_invalidate(0, dw, i);
 	dw[i++] = preparser_disable(false);
-- 
2.39.1

