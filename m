Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A04EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62EE10E406;
	Tue, 25 Jul 2023 20:56:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FF810E406;
 Tue, 25 Jul 2023 20:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690318613; x=1721854613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W6bjezUfRWhiDORF3yZt14dD7troqt8z6d5CRj7Uw3c=;
 b=L2AjACFvXJvHdaZeja15wmUDehVfoGuo0N2csUoG2bCfrWmlWhYzMtdm
 IO73w80ZEBwBg/ykIe0kn7y4cXEE3ZujmRoB+NQQGQT1LHXvfnEHwa9+U
 5ijlsS0DWcl4EWDRBAoHcF/jiI4IYGHff88m5OUU87o+I9zy6MRcI9jVy
 zUWYXUD/xvPhwzZsTHNHeaoQPFQQRt/b9FaYp/iRZYsJlZ6r7VM7xdYme
 1OMUOm3Zq/o+ukV3PT7pT2GCW0ZvstC1kCIPPfACgTKdc7KX36WV+8ifS
 xQQ29NYaABMrHnf6HuBh9DvKFbkJgB+3pXKoVGEkWIRgt0iW04WsS0HnR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367870816"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="367870816"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720173857"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720173857"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 13:56:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:56:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 13:56:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 13:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIAAOtMjZxueh08BYp+nQKUMri7g9TV3OzWFSvZaev8Ng+5gP0ayxO42naTRZnEt5h7CclnuINfKNlEK+8knRriesUnIBFDP7dfPZ80fJ0R9/Fscz2r+xsQsS0zViyiIO3U/LLXA+p8UAMoJFR+C/azxr+P9hLPWm6QTg+ffhwoQRQS/rolAoOxon3VRuqKd81pr4CZteQy62m83Grm/mNe/trrJh/X1PLDs1dDBkVCRBaxb3AMvhWmQnufNoYb8Nm3HUqh2TzNB6GmZhPn3ix1wF9Pc+voP1+VLAXHLDEgL2TN+Y2JefRwuaoZKvhMlHWBvChYyZy6BeuELYYHssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rruWf+DtKii5MUBZPsTZfa4Wj2QdFZY38obceXxQr0=;
 b=Vo2GRWWm4j6Fp0gYUtDsfOojQP6cDWB+5KKyN2H4KjOruDaYtaRDsY3J9cc4QY4yMpwEoP8VXJeRlU8eAzbwk4y2Wa3Y2IN+X2Lx1vI+HviVHiT5BorvnVZrqUh7/wNmkCq2lPEQif5+uipwSyYoQrRXjLnnnrh78OeDJa+AEznrTwqHr+zfRk+EuIF4h+d1/cJtkF4pzFAeLtirYWZGtTJNzLeABLrF3DUJejVUDgqt2daCkGTse0rekWxyZziKL9+8vWfDwu67Q/fTk2WTGJBX4D6vbm9JXtUlKZN5lOE/keHhe93db/TPZuEQXfcXSMp9Xu9XjpLMPJAX8/B7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 20:56:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 20:56:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 16:56:25 -0400
Message-ID: <20230725205626.346256-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725205626.346256-1-rodrigo.vivi@intel.com>
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0379080b-745e-4399-303b-08db8d51a1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/BF/RpRf4b/R0l6/wJREKbE6Jk3KG99oER2qinr5NHHhmUqc4K7vOPdI89G11VMa/3b565aXBpDeBhWVx/cvxIYvNa96UMjzStnhbW4nPm8A6iJ4HXJnv025BBwgzp7TOFtfS9qbViRpMUMVhLnat84Oo0M3s1ITmiC/nGVThnU1c3UW0EuiytVrg0fLtyL8HYzVdAFhSShlEbk895GzTQt9LJS6jdOum/07m95OsVvzmITAQ37FbrRol1cqxAvc46ua1WZ242m8aHELdlVMCxj5yl+5BvbcVXT5kO4QAtLM5J/Kqz7oDjPDT4x7rJnm8UdfwNHS5gx82bXRMXidPpuDiuo5SmAaEIZQr+5/zS5ZYudyXHtsleaEXonALZhQ2rgEhfHfS4mFZFerT6InFSe1vEybbWFLuax/Cd84rUmwZj0lZ16PHptEEixVWBzrM2+SHvpD4gtrPy1ZNTnYZbtjoLK2E94ob3i++V05U+a6HC/RlgACwQRPJOfhPZa3ZZHFPOVBbP7HCOcDF4448pkNXovs1Oz+/zO/lJHNJoVPGx34OnuGwyXVwN12yOr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(6486002)(450100002)(6512007)(6666004)(478600001)(186003)(1076003)(6506007)(2616005)(107886003)(2906002)(44832011)(26005)(41300700001)(8936002)(6916009)(66946007)(38100700002)(5660300002)(4326008)(66476007)(8676002)(66556008)(82960400001)(316002)(86362001)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mdWMVhoZqx1wDAL/tmCbhL7yUSqo3vuJ3foxQaA96pyagw794bkBvTg8NSZ+?=
 =?us-ascii?Q?GBjECQwoCnP9aMQwu/v5xoX/wQWeowBSTu3CtdpjQPtDOQhLJnr0ucxDL3ff?=
 =?us-ascii?Q?/vRBkq36nW0uBnU8tgWQZtlwy57hM5feONX4qz/OiFdo/o7g5WA0CRyTQdEp?=
 =?us-ascii?Q?1otUmce1nTvTGweET+vEXVA84kHcKeegYzTaCXxEfzG7/jJJm/m9scEVpRlu?=
 =?us-ascii?Q?YVf1+jQGU2C/qzv6k6namzkjmUqpCJwIUFWCcLZ8AgpdMxbf5C98EOfdJzqw?=
 =?us-ascii?Q?eT2q1QID1r/M0mLfKI1CL2DaC/x+ZQDLVSfVxcDy6SAqvsi64J3nbQ/sG4f5?=
 =?us-ascii?Q?pZUZm2+NksLNxsvyXDKk9ltmUZY2D3upaDc7LaojqR8UXc0TwlIPFBV0vnuE?=
 =?us-ascii?Q?E14j2h3XOHgRMkZK6LvHATZYTXwZWrJuSBvU447hoSgl5jAUk6CyfMF51hbr?=
 =?us-ascii?Q?ioWClizyZNwim6D5k+wqDhp171zhkOUWP/seCXHRqKngw0ht39ydB2usAyJG?=
 =?us-ascii?Q?uMyxRDKODIrpynX3xtH9FbRdTU+1QT33Te+h/S59UMqTESy8uLl36MjX2pYg?=
 =?us-ascii?Q?5SKbecDgW4zYv0xJOlNrvvz5z7gQqF59S4xpHdazK0d0pM7e/NnjSongvKHS?=
 =?us-ascii?Q?RQbpRQIBALbCVa55tTMelk+EGk6UV21ZBIXm3MhZh3HbaKqZc85vE00Vz67T?=
 =?us-ascii?Q?OuYQgtRTugYebm7mrd35hDTbJNG/qUCPSJSEJBGGsisXBWMmYqVTn0yN9M0P?=
 =?us-ascii?Q?karwzGabGaDTqgB+ZIyuNy2AToHmAPUBsnLCeeLGrBS/3ddHdBA1+g5eU2XB?=
 =?us-ascii?Q?UmOPTUxkiSeo8/ZcRJIjRg/w7APmTkiwzKWg4KERvKrhlGewg1syA7KDUNUO?=
 =?us-ascii?Q?cQDHqDnGMr0dF06QLV2UYbs8+pb4f9p1kCN4zHFHP8V4nVGANaLp+bQIRwBV?=
 =?us-ascii?Q?NrkSOL52zJQfA9C19QA91UKZfZw3hD7dhfPxPk/lc94Z0tTYA89Bma1KGBk5?=
 =?us-ascii?Q?KdKEpUlMIDekuNgzvdSZwJOtxB/KWZCTFP0qYJvh9EhMlRoD3r5pVMLqLqw2?=
 =?us-ascii?Q?62VPuNKiuhqgbOdMZ65tyY/qro0kq2sQw84fWvPFijFkqiREC0lCn4WIcq7Y?=
 =?us-ascii?Q?MDFq/Vfha4PtuPf0NimYAWxoC3ql1M0PX1e7wP0HnAs79nl/qMpag81P5x3M?=
 =?us-ascii?Q?ULdmEpES9+VumhxApOHIeJtOkABvBqI1tglVl1NBKAuYGZZMo0mi/aZ5GRnw?=
 =?us-ascii?Q?lV1xt1i4086y/Te6huHrkHojFv6ETNWdvmSZBdJJRnj/dhoaI1XWIfJg9uPg?=
 =?us-ascii?Q?lf7jxhJn/Sh8Qsc1LmVqtB+C0ppT7K17t9eIZPm2o34PtkDWi9Jd8gApbPGu?=
 =?us-ascii?Q?ClTXtUO4qJul+SC9v75P3wRpZk5XWwEvG2q8lgRym4+JRpKEYtfH5AH2jUDM?=
 =?us-ascii?Q?7tbOJRKC/aMgLXmA6c0sPTouLmubc6CXJJBMPq/EcoSX7GDiJuyvSYf4p3Sn?=
 =?us-ascii?Q?bS6hjk+zfKVyrEG91g7V5+/xAAjz1upP/K7x8VrXHlG97NN6SViwkzqBsyTD?=
 =?us-ascii?Q?hyn8LItX3E1sAMm+ToBoAW34yPyLJDeeHhkilDI9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0379080b-745e-4399-303b-08db8d51a1cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 20:56:35.1944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZjawfq6K2Rs2VyyErQt39m2CC9okMimD65F8qkPiNayPsLsy2UM5M8gM/MgO2g7dtJFOyaSts0H/k8uTk16nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 2/2] xe_debugfs: Remove guc_enable check.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm-xe-next commit "drm/xe: Invert guc vs execlists parameters and info.")
inverted the param to expose the status of the non-default config.

And commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
entirely removed the query check.

So, let's simply stop doing this debugfs check here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/xe/xe_debugfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 5e16a71a0..5434d4645 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -104,10 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	sprintf(reference, "enable_guc %s", config->info[XE_QUERY_CONFIG_FLAGS] &
-		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "yes" : "no");
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
 	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-- 
2.41.0

