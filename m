Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D58FC61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F272D10E0A4;
	Fri,  3 Feb 2023 20:24:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474A310E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455874; x=1706991874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O950gITZajtwikoekk0I2cu6n4MNtCCbQ8zVpG9epa4=;
 b=CXi3IplztV/4sTVhoAts1a3UKxzCpmTurfJrhikVUIMTmGm5aZXov65J
 UaRM4qqHcbO1KHQKMKhHaYs15S1WkzGLtTtC2L9PzcSUpQZzuMVCzPnQ9
 /HCKoKIbgN6ADGcGLRkPeUojIK2Q/MKaLzggqpuR36oqEEb+ZgLEpiW96
 XeDIv9HFLFCRZkijCBZjPVGCBJy9u4wpWHJeuH+q/uGZJwMwgpV84UHtY
 a1YOMrvoAYqlUcehnfoZu35CBHmwzj4Dy2J5ir57fYiNlm6GnKOgsJdik
 8ntUXtNQ8BNAGVRvXzbJDjEaAkPurwOXhm01Z9gxYIPaysHwAalzIDJmY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327483392"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327483392"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774449898"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774449898"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:24:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6divzrmlq7SruMcqQB7ScML1dlNs1Z1eXjV67X0z5rMkrKsDHvBxv3fz9NbmHxs7wOBL/IUblS0CXyrBIACBo8vXR4KtHo7zxmnKaVczunkqgptZ+0ck5aWr9o6H3+IVXjHokFdgYDRRf7xPiyRFA/ZSGAUfyQUwa/6lhEzaZ/C0leH5BsIbk9sbzW+WAjOMp7drDeDSkyrn5AQPd52SkDiRL8FzuCnayIkc4Ydrphi16oT0WhKIY5hc+F+HybtIx2A2/RaDkqJwsKmfz6YbZdFv/AdHQi6dI8bW3FY5aGRnqADELHSvgKXf6FbX4LRXn4DlbNsOKBR09faK0A1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYI0gSmvwzPMimJP0cHjPCqh7Pjw0h84V6WQm1SXvEU=;
 b=Uit0+CUjSlaz3JHQkybYXRhYmMgGl5pcU+l2LKhtEuQw2ydNnPoqa742iPPVs1nqSN2A2AjTpaBm3EI+ph57Jb3hf0noT3tvEtgvlF4lo4fE12zNUa5rn0KYuep3/v+2hhB31LL4hXO7LLjrmxb1bIMo7lAjy+o+0ZJW1CIDz1arI30Zz0KGGhjJ54m81qJNieLN8ZmkNn6rADotQ2Ip63rb9popHHsdRk5BOI2iAaUuqi2ZELGD8Uqd5PO9jOu0gjTRzT5YwqLKnFWHkJVfXtN/D3UvMkDnPaA+VT1tz3JuHMyNWjHESGZMjzVxq40LapPHHvQhlSGzE+ciCrWWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:48 -0500
Message-ID: <20230203202409.577032-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 0313bb5b-e557-44d0-89ba-08db0624a005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRuymw70w8JdU+JWDDuzMyqZuEdgVmM6YB++QuRpPFp0vyJsaJEpcbJe72IDV8KO8TX+q/J2sj++jI0PBLT47EF2unMgTXpvB5sGZBGvW/5/vyPuTA+/hTjxuwOg3quZZ4v/qThNA/E4YY29Nln5FalKfn7gMiH/mjVb4n7Hz+M2qmq8CPB8u7T0sFEMjqMTf9CGooBM75WwEv7+tANQUyv8GxclElju9fzojxlrm7S1nqaaIJLMS5wZ8eXy9n1kloTLrT/FQvnDkAyRINskO2fzEUEhrft0aSzFPmdpPTT0+ix1NLXTwESg3cac8xVI0CIYp2i48qf3Y7WMzjjJ3qIbt4rEXUAIjuNsP8JzavwNbAitjB97e3ytR0R+uQ8YUsj9W4vHQMNSgM3RfaYGz8BDCespGSFk2rknJ5HnVisrO+XBV3gCq9+frKe0Gixr1q2PZsffLIq8E9arbLJorkD7SHfl5AZhdPr+5FYpx+h4oup7NAvDoD4bs/S/ctN3Kj+rG+Jf0BOcc5WTw5lU1iP1TF7WcERD1UUuSh/JMhdEwy9/fltaTUOPNwrZ1q/lByf/7KwiJETjq2o3r7kY7ytI1VCTvAWIRChA5o6vmzW22RlqhuaUnCMQ54X6M4tHDPYnLDo275EDtuNy7VAjZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(66899018)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2/ZHShx7Sj/NsJmzUu4/4EYNzhTTnYJ1TfF/Vri5avJWKhluQYD//zuIRMf?=
 =?us-ascii?Q?xZaU/Y6vEymRK3pe1Rs+2pf1Fl7ICBGPQyqFnBPK/fwCIivHF56T/C/ImNOy?=
 =?us-ascii?Q?TvtwXLFOtUwG8DHoWDCqxvVtaCY47z3/Ca14t4Grb1YvdI6c2hf9ji5dDs8c?=
 =?us-ascii?Q?rjO6EX2zlvJ92roUtr5x0Jg+C3K+G4vtr0Or4C6PY11WAZwELHWCZHBD2ld3?=
 =?us-ascii?Q?sBtoeaZo/TSAnRda54EVIXLm+uYVLE5yOD1jFEbN1rLgJPAzR3O0L+CA9cCZ?=
 =?us-ascii?Q?7dnltvUeCXsuJawxcXvmgKJlzI7iDg8RCqHQtZIqH9NZdAAQvWjz4w+/Z2SQ?=
 =?us-ascii?Q?gN1OYy8G5bn4lOu5t6JIwKYJGmK41e7jnfPcQwrn4EIiaAkWDDInxP3zjhmb?=
 =?us-ascii?Q?/2/rAXkWn9Aw2XKJJobq+pWvGegiAoiQkQqyNqOG1fZqq8VmqnRuktidDer1?=
 =?us-ascii?Q?Nzd9ESnoEf2AwbG8tqGaspfceWRouv/hXHanr3Zn9DiVw2819eMjz2jB2hd3?=
 =?us-ascii?Q?NxJQ43fvpx8DMHImVvV8vQ81t2OzJAg0EBZFJHgAOqRKco21FkTfp0sBG1gQ?=
 =?us-ascii?Q?wKoX8ZhGLXCvcpve1IbnAHpnx+zV1Ya69/+FCL2FDs88LuWyWoJ5+hEENKjp?=
 =?us-ascii?Q?yslJFVQiwqQrTpiwjmVBnyLQcnyKU/XERIVroyvoNkTL+5fo9Ah+75Qo0o/1?=
 =?us-ascii?Q?gTdB6WyS6XwHY428oLEmY76zX9s6DERI1V/MNu8yfHd6l2PBwbb9gD9kRc6M?=
 =?us-ascii?Q?U8tg1ZfDRDvz7sg1Ji8uoQyH4Q8hwo1aqzpzZsSUT4orw7gKjkeigK3NpnN+?=
 =?us-ascii?Q?4rn+gaBoD2UMd+zhXHjuxQ04R63MU+VUw632lR2mLsb8UP1c0JV/ZVnZGNF5?=
 =?us-ascii?Q?0EqMpjdkO/JqX1PxUZNVDr1LyJafzsBvck2R2yQLn1EkKu6b85cnhQVB7JXw?=
 =?us-ascii?Q?hI6tNMx3a2LwLBwEKIxVU85Gj8QH7ezst8q4CflB1Ve3331g2bzKw4s0yMZz?=
 =?us-ascii?Q?cWmDqhNBG43V3O3CO2bXu8dLO8dnPxKJQxsPu7/MgHb/Yzz+TPVn1SKPjgvV?=
 =?us-ascii?Q?qyrIX/k7VjXmJfFInGwl/Q1ckjzTw7GutXAY6btj7OuN5FeerZ7/ZCAm67Za?=
 =?us-ascii?Q?4mg8NUrvfmgA5KgQJcDuNLk8ms/sSFZLef7DB19hffkfdOdaazOPR7PFfSxw?=
 =?us-ascii?Q?bjJvmE9oSYGKv/3h5VVqZueClUygP4KI+LEDAD3aOYYQg25ewDsekXYgBBDz?=
 =?us-ascii?Q?5xsME+yaony7FBqKGnEAYgX2It+Nv1HNo0bA4XJKs4qxfX/t9XaN1tx70xkA?=
 =?us-ascii?Q?TScic+qBxIh0365Vb+05PTehQ7iDrDYaYs2k2yKCk50ROO2iJMtZ5sZKWkHl?=
 =?us-ascii?Q?4bqqvr4R+OxZWp+etgUGHY/gQr1kkeltqfYuOiKO6mlwFYOi8R1ZnNfukJI8?=
 =?us-ascii?Q?e2e/YL4cTA8P1C6yC5OXR+A0aeCWIAcUYx2lUNKFRMKsIi/fcv8UDV/Cgq9d?=
 =?us-ascii?Q?EXjTpyzobmPHpACpFRjsCDhYJ5CgeAVg4Kvp+a4jA+KL1qddQ2uK7CzYnRS0?=
 =?us-ascii?Q?UG7eBZlpAGrhcygg4P0saPHIxdb3lxnsgjfjrVLYT5pEf2Ie6pzWqzgwrqKw?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0313bb5b-e557-44d0-89ba-08db0624a005
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:17.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB+OoXj6Zk/HrOH85gRAnuMYHuDcAk65Ox43rjuF8T/Gcdpa+9+zysXYTrQO2tHi3L3A/QAnqRjQZPrsqyjJdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 01/22] drm/xe: Don't process TLB invalidation
 done in CT fast-path
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

We can't currently do this due to TLB invalidation done handler
expecting the seqno being received in-order, with the fast-path a TLB
invalidation done could pass one being processed in the slow-path in an
extreme corner case. Remove TLB invalidation done from the fast-path for
now and in a follow up reenable this once the TLB invalidation done
handler can deal with out of order seqno.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f48eb01847ef..6e25c1d5d43e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -966,7 +966,14 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			return 0;
 
 		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
-		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
+		/*
+		 * FIXME: We really should process
+		 * XE_GUC_ACTION_TLB_INVALIDATION_DONE here in the fast-path as
+		 * these critical for page fault performance. We currently can't
+		 * due to TLB invalidation done algorithm expecting the seqno
+		 * returned in-order. With some small changes to the algorithm
+		 * and locking we should be able to support out-of-order seqno.
+		 */
 		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 			break;	/* Process these in fast-path */
 		default:
-- 
2.39.1

