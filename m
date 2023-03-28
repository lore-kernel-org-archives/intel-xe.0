Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8EFC6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4467210E475;
	Tue, 28 Mar 2023 16:11:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4B310E082
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680019863; x=1711555863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A8dJckFtQd0qoVXEwZcEU53yrth5QyI2pX8KIhIbTT0=;
 b=eEGKwvNGVOAeVyv7bwnizfhlIAlVzkAlXi2OQJIK3j1vrzxTybKrfbJc
 B3Ur8R3j2hYwC1a3qS1KXLUjBPAEHmDFelk9RzYduw6ZpxH4RjlL7JjNG
 UicWY1CYY9JDtaWSKnCsHeZXU11aHDpdfs7/ibg5Fd/BY16oLCnHSrS9U
 z3wUMVhlX5yjkalrVHxRnbWCwNvFEpkrxYsJyZ4Wxgi6R7/xo9v8aoB07
 oYubV6+EYQdBuo4LBuSZ2gj0jdoUfVjRBUhdG9ZtYwjkuuABLVI/8vXvH
 M5CHkYrCyM9gMkZGopS5sTG8s1NXhtIi400C+6PxaTEGeIfX7H+Rs3aeu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338115907"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="338115907"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807896468"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807896468"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 09:10:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZwovK8N4dLYYA6CykBG7GuhbuEH+3udLr3NL28e4+wfG7VjxqztXHhwOR9cNkYXVL/RO5dzgLFM8ggZcqKppn49VAv1KoigK6qAlFvuSWIAoIHUO2V93pXUkD8Q9Mt4TFScQAgoOO/YUS0QTgCOxKcfgnNtIU9CUYMTxX865KpdNE+d0Ml2nTkNH3ezbrFJjww0U4OLvsn368F0BXndwziD3L5lb3wKEfXYZGw7uUVmSUdLLD7zuMg9vW4Mep9uaFIpUX8wGZH6OTFjEgNOIjv7Z4Uo+nxu0eqfRlei141fcfxCpAPHhlPILwvs+3kMdv8SBjRoRjh5fYbvN+RIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUXgFTrX/vWxaJAEnCJtxVgjtZB1c7+3bKstqU4x6vs=;
 b=hTbARJqeMJai/xMqN+HUIjMv9de7LOyY+zTa0xW36+xGiBkovjQNe2LGGdD0skE2cmQXclaWnsYMrqOk4kID7Nn2w3N2JSUKZIfhE4bNjlwq8rjOGlIBenPF+uTrLruAyH5ydbZylK1+NR8Eb9mOYvpoIg6AXmG/DHOJywsDWsz3VBc32vp+rhBuJZRo+vi4sJuq1oYoZx+v4ew9YyO7qvZ3v/bdBq1tLqU9Hj4gKEGnoxxvevA+az02EW1Bkjg/4q2LsGY9R4fs3ofe5xZBwmmItRcJQdUisgbpeXUpCls3yoWqUOyGa6mzPbzA+fce6C+TJQi+H+0X2WH1j67b9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:10:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:17 -0400
Message-ID: <20230328161021.669017-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a00af0-4b40-426a-d261-08db2fa6f492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: la/OSB5p45K9dbmP7AtDMH9LCr4/VNHaD1ChbIZq/avBNGhzstnzsawj/fKFL3W3FPeXXNKsfDFYluAiVbo5fkCXxCJjXb31rpx2MWTx1AsU/Bm0URx2Ifv6sIvTTMPSIAjNW5eslgCn81an38X0npxMzBaK9Oo63C0mjOk2tXfu6Q0bXd60E0p9lIVHfT+Egh7V+OK5qsvVs3RC9g7OMWZ6RzmgjCgoQj/4OVfnAE9ahiNn4kUNyPKwk/JyhOk9O/2en0wvCP7wpmEVFKvrDhUVO7QVpLmG7QcaZcqjTu8jMMu0M0qX24gjWwLrWE1CGFv+Ij9c4vHOLNd1WHfDAKs1jakt9nTWX/YzC3CqAB16hCV9B66SyfaBxFenI8WSD3z3L1FXQhSYGMz3uisiODYXBj8SzOjKnBnGwfHKvdAjAPlXyw4/LRzffiFxsJnlGLRNyBvWPcyLzX8y21J+1P9UsARjrdIv8omSHjKIpdbfHIzMO96FWBM7yKO+n++DO73WnabdYC/cgA0V+YhlmEAeaLDw9jMlHqrJqnGPVoIDWNCYYkE7vPsO8O9tq52Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(107886003)(6666004)(6512007)(6506007)(26005)(36756003)(5660300002)(478600001)(8936002)(6486002)(4744005)(41300700001)(66476007)(66556008)(66946007)(6916009)(86362001)(4326008)(8676002)(82960400001)(316002)(38100700002)(1076003)(44832011)(83380400001)(2906002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uuyRZgdL/AE5A82B/AsZBqhaOWfESPg7hQa7H6+8z4vuCjz6qAiArHoPyStV?=
 =?us-ascii?Q?7DwN1528Eh9ZRuCq1RfJxIBLZlJfRTF+7+vGUNMFgWReR8u6ZSGIX159ouAw?=
 =?us-ascii?Q?/LdAS76JcFEdd5mRCgfdkkzLKDcFGtCVU3u0yniVK9nyD+D9gwfBgB4BzNWH?=
 =?us-ascii?Q?+g44pGMsyyD3wt7W5tHuQ7t7KLiAoCfKGmbqTNwR+D7KCM5sHN8gVVkGEbHZ?=
 =?us-ascii?Q?FR/vTN/fJHULog6jBZmfc/SFchpYKW/eniUPc77Zds3pw+OwivL4PNMS3GCW?=
 =?us-ascii?Q?yirqDuNq8SW/hW3RGRaC4Lrg/4VTFj1174PsVbI31CWs/zStvWFo65HM7LAb?=
 =?us-ascii?Q?67T6fbgip3rSFSOj+jUYyaPdtsHISMenhJbJ39koB54QcnUpE376jCRTh6b9?=
 =?us-ascii?Q?yhqgiyBvyuJJZGKVVaW+e0xSIX46Wko2wbNr8HcVa80x4ECxxPi2RIGVChnh?=
 =?us-ascii?Q?TSqxoUhTJoXB8WW10sRAvl72w6oTteApXwNaeDsCkM1igOL1iVcspUnmZmNb?=
 =?us-ascii?Q?7BphcJEo9Yv+N+PLxawsqHmmvBIn73l9o4SsV5VddPSp8UnVZOy0APTDENfq?=
 =?us-ascii?Q?yEQDTdzmSk7fpVjGCNruqO+mjiGbMlXm0bu0pqy8/E+x24LwIoQF1oka8TwL?=
 =?us-ascii?Q?1TXBTSlDgucqwSZ3h2No+kh364P/1BRuIL3IXlEIoduzzhA+SAWKtZ6PQN15?=
 =?us-ascii?Q?LQVgstCSxc7SwwifxfWtFaMgd+snuAXh0Jiy2zQ5lM7CK2IpvBNWqp5/+wPv?=
 =?us-ascii?Q?VRXvJUTlA3OV8UDc5DvkRQV6r/pvz6xoAREup1WRSWayjX5wTXGfx8ICxqWu?=
 =?us-ascii?Q?oiPR0SUNXRhkLyo8PUrh2oc8dWcLpuZYHjDzGmb7lwtikpj7eDJZRZsVyoKq?=
 =?us-ascii?Q?7bUyb1gcJrhxm4sSA0DSOAqIFT/er1sxpMDFJSB4KnTcyLB5FvHo6DhkijT9?=
 =?us-ascii?Q?6kyzFNDUmUuCQPiM2beP8UZjUa0OAXsLuA/xX8LUubKYfCJJHKSy3XIUzWcK?=
 =?us-ascii?Q?mBFigqOJa9Gq2t4YUxQpvHvYDVcLrWUrlW+wLiiOBoZLdntdb8uyNNPQIC0A?=
 =?us-ascii?Q?kMltCyQe85gODOcBJF3gSQ40+U1Ric1a3P7VMpRRflnek0AW5OzdCKpdCgTt?=
 =?us-ascii?Q?gHDu2sPHeOu7a2bfxnXR/rhlju1+XE/UPqOHtfBhdFdcRnoywb9TUdn43nwo?=
 =?us-ascii?Q?tIz1HkVj9unKYg9ls0gnxa9B32biaWgPCUfJG1m1pVCBcsVmmpskDxChHd3b?=
 =?us-ascii?Q?ySCsNfnWJPOOR25oNQt+icSbTvnsuslzLesaBqu2klvg5tDcTAuYmN0aXyei?=
 =?us-ascii?Q?/GuxoU8bgUhDunm+YqQhCEotUFhfo13K6FUQeZ87yHZW0G6lY4oaHGlXsZnI?=
 =?us-ascii?Q?gQvER4hKo6IhDKVCUtb1Siv8esIp7aGgaiT7XSueAWctx3YmjC9i7YXvkNCh?=
 =?us-ascii?Q?wZamVXim6zFJWpWEMuvCNkVORMRgpiqzlfBXcMhFVH2RhNgNCm9As4MscOpV?=
 =?us-ascii?Q?2FFkw33Lrhr+1j1Uio9CuvKln46jEp9Lsz9K1xnD6pI1zcbEqWR6EUaU9G9Y?=
 =?us-ascii?Q?RojQkFV+yC3dyLsQCbi49EWgOoMyisyD+lOfIJjf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a00af0-4b40-426a-d261-08db2fa6f492
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:31.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuTGhkwm+uFLeW5xNVn0LAsU+RBvKa5180+hNUJcyuDHYG13eTySQKbPt+MxJUnYEXFHDrrV3wejzvvqUY92Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 1/5] !fixup: drm/i915/display: Remaining changes to
 make xe compile
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 012a7b90ea4b..7074297d931c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7414,7 +7414,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 	int ret;
 	struct ww_acquire_ctx ww;
 
-	XE_BUG_ON(size != 8);
+	BUG_ON(size != 8);
 
 	ret = xe_bo_lock(bo, &ww, 0, true);
 	if (ret)
-- 
2.39.2

