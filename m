Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E140C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 04:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03010E5A2;
	Fri, 17 Nov 2023 04:06:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1F210E5A2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700194005; x=1731730005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W1cuLmDbXQiKndDt04XxU5vURtFsqFYQXOtvWMWTBfw=;
 b=jGs+SQwomwTglGHqC715bdNiiHmrRbuHnYxYxKPpBl03nIPoa7PA6I7t
 7Z7nD0ioTIGYysH+7Vb8JAM0IKuhfW7JSjtbivaDifsGUV5AJFGw67NJY
 +fLWBUMlr/p4rSntGccTSVvFl2VVtkvSOvKaQNEzI03Im6xPRid6X/djH
 RUKF2xsILYTcdnr7BWZXq4V8YQOXzv9kYYPXLzXFYFWouwXjDFlZ701rz
 k8yz2PtdlLwiFuXrN4zfTl6OMvMiLM1Qr9/1qY8yWKDDShxGUR6XDG//f
 u4k3AXwX6+SRDryGd4d0Te+fhacrx1awudRh/TqKR3jbDEiRz52ryyKEM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381624084"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="381624084"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 20:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831488837"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="831488837"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 20:06:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 20:06:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 20:06:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 20:06:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 20:06:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsBRCRwCJg+mczSYlyw0RjmEMcCQcBrYn0A9LMs2JgrJQuaF9dWAieMtddz5vcDEbGl9CJ/t9pxFkp87cPmL668iYAN7X7u5xPGC4ptRwGT1MS1MSgD690AfewORk6HcHEh2Sl/h3KjXN8DWMFPctfI5AYchKhSsTP6TFhmSjic++rnEiCWV5MdWGhDvtwwSOo3N1zIfEI0DQwnpVAA1LFS0I2XkqtV8LaV075NqoFOXXy/RT4VlmDwNSh+jscddgM0jqltSuAk/mBY9hvwOjLxgU9k4Csb4XKNiySGSSESZXaLNXfxUR3CzLURvAcdh2neourTZE+jRlkPKAu3DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqOrNLMLL9YFVc5/i/uP4Szqp+5KYJu8OvIZrRt0IKI=;
 b=HuslOav2MjeL6TxF99zdSixYGQi7qn2du37cQqRc+aqAn12IwTFiqHqjriLpcjFhZt7Sd/w8oXz8apr1gxgdyh+PxyHTK3DGRZ2N+ilfNIjnzmqMyb9hKamNV2qU2uH1Y/rkQHKqfhSRhAlMp80KNgoFJ7nBNY29tKljHgDjCJbuSF4o3iUr7QenNcE7a+DibcYMoCFMIC0mK/1iSzztTV5Mf7pqb+V4wHnMSt50vNoe8pJUv6SNUgGObgenetGxtiPvOjHvvbcpgVuSP4NJ+ce0qVh+3/hGiORdw7FcLB3wwi+4Hrjoe2czKbt/qTwxVtuocWgFfl6EnMwQf6p4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.32; Fri, 17 Nov
 2023 04:06:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 04:06:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 23:06:25 -0500
Message-ID: <20231117040625.40843-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <838c405290912bb923c44b061d0eca4ca347f07a.camel@intel.com>
References: <838c405290912bb923c44b061d0eca4ca347f07a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: be0fca39-8742-4e26-139b-08dbe72292fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6AYlMzVgbFKZ3y/wEppcLP72EtYxTbXecMkgCyUchjFAzHvaHCYlJoZ0k8cy1pon+Dga9vpd2ZVkSfRJ4W8CqUu9MdaxkRTh1AvvKn/Buv3XMIwwiusxyLdrZildL/UKG4CCyQ6kOm6W5A3otQEDO18nnI7HN9a9ZmCWBUG+xNgyXnznibWYc88weT43QjSUFyoiLPMOBEOiX/CwJpmtqk9woGcMKxsPkQdUlObn3D4e293hF/ILM5ZCPN96H1wyJPt/Dg+XCOWv6igR/3wB2JWcm26Cq1Xd8XnBHoT93Q6ztZ64GMGORjAmQfxTvfwrqEIub4u0J1IcbBNlNNJ096jKov0LUfJZtENz/bjrHzwAIqYN91w0A2Om67iuFtEozV6Me3qPGsr97WY3FmhllBOKRBtl9ohNdvLWV/RJ4/FnmcYgPcLn29NXqVLJGgY5EDDDP4dfY2XCoeFYefHA/5ctx3bWMkanhKdeulZGXAymSOoo/zCXHULVJUe+qJNcAhx9X7wvvPf4h92ZVii9HSct+NZXJ6dtuzRNLO4vJ5jRvZQF2BoQ49G2OULuqNW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(83380400001)(38100700002)(82960400001)(6512007)(1076003)(2616005)(36756003)(44832011)(41300700001)(5660300002)(2906002)(8676002)(8936002)(4326008)(316002)(66556008)(66476007)(6916009)(54906003)(86362001)(66946007)(26005)(6486002)(478600001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNrRUVTYVhmQlFjRjE5RUgvSFlmajRXOFk0cU9WVmZDc0llbTk1cjkxNHlv?=
 =?utf-8?B?ZHM4WjJqZ3ZEd0gxQ3QzOERIditYcVBOVEhYTDU3VGFIOGZhbDhmVk5hZnZF?=
 =?utf-8?B?QVhDL2NleW05Qm9vcUsycnBqaWw3d21PNjUzdTBXaHZTc2VFQVhnTndGYU5D?=
 =?utf-8?B?dUVuRTYyVGh2WTc1aXA2aDFSQ1A2ZE9OYjJ5SkZiMVZkQ1NMeDRXa3pKYngz?=
 =?utf-8?B?cGZyclF3M2V0MTBLVTJnQUUzUHhBUUN3K3ZOUlhOamhqWHkzN1hNV0FXdTFV?=
 =?utf-8?B?ZzZxWTNnd056RUI5WWVjeDF3WHJqS2lJTlgvN3Q3dXFZU0dlRk5tU29zTEgw?=
 =?utf-8?B?bzM5UUJFdHVqMlJ6NWFNdW1vcndPS0hkZ3F1UWdlUUhVck1TbmdMWnozd2RJ?=
 =?utf-8?B?RUFneWlJY2FjKzB0RVJXOWdrWU5YL01rQlZFNS9QK0RON1k5RGNJbzRTODdi?=
 =?utf-8?B?eHJvaXpQUTdQQ2g4bGMwMjJhUnN5SUFCb0FxNU1uTndjTFVkM0FCMTFNcm95?=
 =?utf-8?B?WkhjRGo3U20yNFFrYVFWS2wwditBZjdGMFBBbkt5S2pjK2lJVG1Sb3RrQmFW?=
 =?utf-8?B?RURaUW1NV0lNZzJDWjl4ZG5LZCs2Q0pJV2VkQml6ZUFxQ3RRdUppaU01SDM2?=
 =?utf-8?B?anh0c3RaelFaTlIxYjIwVXNUTGhVcjJSZERJZHloTUt3V2lxTlo2M0J5T3JO?=
 =?utf-8?B?cG50bzc1QkwzNUdONGpIWThnV2pzbG1KMVlFMEowVVpjQVNiZ2tBSmpJaG5G?=
 =?utf-8?B?ck9DM1phcjNLOXBYT0RtZnZ4aTZ1UFVPN204MDhDTWd0blNZMDdPZ0hYTTBz?=
 =?utf-8?B?c2xiYkxueFFiYkUxSE1kTHV2NFl4MncySlNQL3Q5MUdzeUhPMGVwMVVVcEVx?=
 =?utf-8?B?eW9Qc3VUMFhMRjROK1hiRG1RdGVCdkt1OWxvWU9LTHNwRDZRaFVUNUhaY01a?=
 =?utf-8?B?dGp1Q0laV0lmY2NzUFJnaE16SUpEUmt6bjMxSVRBOGlsMk9OT09MTlFlbjZE?=
 =?utf-8?B?eEo2SFRNaTREaXUxdW1Fa0doZitTcjJXZ1RNSEw3ZFQwQTFSRkFqbVhyZ1Jn?=
 =?utf-8?B?VzUvK1BvSEVhZTFZYlR0bEh3V3Q2TUFSK0lMa1hHZEFTT3dQd2h4ZHpKaFRk?=
 =?utf-8?B?VHpOYlo3eTAxcXUzemJlY1BRZEt3TGRNaTBvOS8vZ1VVNGIrUHpTMzFvdjFW?=
 =?utf-8?B?bXppYWhoV1BnK0dyM2grcDBycnk5Y0htTXJGekNCT1NPSDdxQzBSSXh4WUJl?=
 =?utf-8?B?M0FpbEpPb2h2V0R0T3pYM2hxSjlpdWF3N0k4VmZKWHJlSjg0NGdIMVZWdVVI?=
 =?utf-8?B?cCtEVW55NjlaTHk5ZUw1UXlJVnF2Uytva1hWZ0k1K1JVekU0ekUyaHA3K2w1?=
 =?utf-8?B?UmdHaFVPSlo4T1NoTThoQyt0cHpKQ3F6QmdlZHd3Wmg2T2lKRlFWMjdiZUtL?=
 =?utf-8?B?cnIxQ3pTa1pYQ2hkUmFjenJkZmZxU0dlOHVJemIrUlNqSEdLN0JySTMrNGFs?=
 =?utf-8?B?OGJYN2NjOEEyT1h3SEJtcU8wbUhrRERxSkhFOXpJa0RQVDJmS0ZiTkNGK2ll?=
 =?utf-8?B?YnN3MHNyL1ZHc0paaWcyTUw3bGNQTHhUdS9lZTdCcDRhTG1mOFloTzlZenlp?=
 =?utf-8?B?SDB3WlRZT0ZnZFJXVU8xV3Z1bU1qZ3BZSGpaeUtEQUpQWExIRUVrWk53MThP?=
 =?utf-8?B?UzNoZXpObWZaeVR3eXo3MnV3VXRLc01SQlFvSm1zYlI0bzM3OVVhdjZqR2N4?=
 =?utf-8?B?bVh1YzdJMEthNmRSbXpxWG43QjVLZGxSWFFrOU9BS2M4S05yTWErOFNXSk9J?=
 =?utf-8?B?N2haUnZ5VW5Vck1tWDlEamZ1U3lvVVR2Y3hha1A4dzVoK1FOQ0pFL3FydHc0?=
 =?utf-8?B?UkdnUE8rTU5SQTRJQzBUQlhma3JZQXpSYmpHb2RkcXJEUzEyWWpKWUxxK0FZ?=
 =?utf-8?B?dlo0T2IzS29OMldERUoyR3puY3UyTm10Mk9zajc1dUZBTXhEeTBCa0Y2THlH?=
 =?utf-8?B?TW9tb0VjT0p3M2JMWkdwOG9rS1FISHVuNmtISnQxWUJBWExaUFB2K1BqOVQ1?=
 =?utf-8?B?NnpDWjhOcUcxZUtUU1lxbHJSMmNySGd4amlxbDZJMCt0SkJCVXZ5QzFETUZZ?=
 =?utf-8?Q?bSRVZLmen3S7PcNEUCR3ldzwg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0fca39-8742-4e26-139b-08dbe72292fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 04:06:28.7642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZxKieK4CqEEY3E40eXgRT3fBhF6wgigqM1xRPI+Nb7EQbmxA94aQ3HWfKMihCj2WuT9dcxd21aQCTUqRvDkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Fix various struct padding for 64b
 alignment
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's respect Documentation/process/botching-up-ioctls.rst
and add the proper padding for a 64b alignment with all as
well as all the required checks and settings for the pads
and the reserved entries.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  6 ++++++
 drivers/gpu/drm/xe/xe_vm.c    |  7 +++++++
 include/uapi/drm/xe_drm.h     | 14 +++++---------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 838f03795841..77c3afeaf4b6 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -277,6 +277,7 @@ static int query_mem_region(struct xe_device *xe,
 	if (perfmon_capable())
 		usage->mem_regions[0].used = ttm_resource_manager_usage(man);
 	usage->num_mem_regions = 1;
+	usage->pad = 0;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
@@ -335,6 +336,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		return -ENOMEM;
 
 	config->num_params = num_params;
+	config->pad = 0;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
@@ -377,6 +379,8 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		return -ENOMEM;
 
 	gt_list->num_gt = xe->info.gt_count;
+	gt_list->pad = 0;
+
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
@@ -392,6 +396,8 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 				BIT(gt_to_tile(gt)->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
+		memset(gt_list->gt_list[id].reserved, 0,
+		       sizeof(gt_list->gt_list[id].reserved));
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f8559ebad9bc..6e09855f1e2f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2850,6 +2850,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int err;
 	int i;
 
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
@@ -2966,6 +2969,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		return err;
 
+	if (XE_IOCTL_DBG(xe, args->pad) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (args->exec_queue_id) {
 		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 		if (XE_IOCTL_DBG(xe, !q)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8610ac461619..777d2564bcdf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -384,6 +384,8 @@ struct drm_xe_gt {
 	__u16 tile_id;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
+	/** @pad: MBZ */
+	__u16 pad[3];
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
 	/**
@@ -662,9 +664,6 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -744,9 +743,6 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -761,12 +757,12 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
-	/** @pad2: MBZ */
-	__u32 pad2;
-
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
+	/** @pad: MBZ */
+	__u64 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.41.0

