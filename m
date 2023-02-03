Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5CAC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C31A10E09C;
	Fri,  3 Feb 2023 20:25:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C3C10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455928; x=1706991928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=t8JPVk3pIb+uKPcj/Zsbkq0DXfqAqwOgmnPSdEH5e3o=;
 b=kNi0m986tcbuB919zr5w9lm5Z1sU8Z8N8IM69gS1BkNcowYK9GVeiz3z
 kpv/Gha004Legyk3nJLOSR+UAe9pAvniwkRiQrk5wVlc+vcxSUeOwXJ1W
 s7BUn6U8CSWjUkdLQbgTWZ+1UPA9MUAU18cDKf0YlpdvA7daLJbsQ9vck
 XJxFAovdYFfPBNXS6+tIPND/p8Lz7rYwwNT+tFsGmeCDK0eNOrEvL/6aC
 yadntri0mn8V5TTnD6zwX5Ir3I9ELl8GxNcuUHBAmk9dyhQ/iq9NE+Wbd
 Jxw1+Ju1qLnvQPc0qLnP6PTnsELWlwzMdGIpx/bCqJi60TkIqaQHRoYz4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503140"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503140"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789809113"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789809113"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:25:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8nCiqfBxriAdAGFJGVCCWafFM7YI6gW3b2JUQxplSF4kIz5Bxh7C9dA8BK/YaQWT/kRltDqVSRK+EqoV96tMQrxMpHynEhbgoIkZviDz7MLqq+jJfyX94wVQS/0JlOqKVOXRJqj9v5w6Y29IqIFu/5FCAQW3y/w7iAvUOG18CTVvlwDq4/nWwzvNTjXxuc5UboICdwHk4+kIt3ey/Q+VlQOEABTErd4o5BfBLuc4PK5UU17xiPKLol9/p3ZG0lNp2K0RXSbL7F3DZKFDgsIH4KTdZsOo1m6ynJSUp6D+wyddfRcBBfzgcm4WTr4r8y96vzILWZFhbJqQIoIDDhXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bffui3jWPBNtubdc2Sw9cl+GWyiIKlAN7/LLT42aNg=;
 b=kC0T/ICkYffMUAN9Z1cr4C9jTqnEhVhaPwXvwnqqbWM+Iu2YmyjOdZHlzV8HhKA/ogU5TCa3BHJCFA/OLMBB+Tw3riP6n1F99JTlAsqsOhBl+iKNZgM5NWNKL5BvclYHdHTXUeqrF8Kytrk/U/d81ip0U51IqdwAnwjecv+yW+0TFp73LwEBN6YBG3UCfSmqq8HlKO7as2bocaks6TMiZDzapBwW893ma2iuhhNZsN0IXWaoIMXMbuwTicSBYMn41PqxE9z2x6hsIn3WJGPJ4SxFzO8/VW29/fWi4Be8BggFkBR+aEw3nDFUJ4OTvP7pPhx7xrkud9+/tU05e9QV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:25:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:05 -0500
Message-ID: <20230203202409.577032-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 38cf3aaf-efea-4f10-91c3-08db0624c7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkUTs7yz71UR/1j9T9k17vXzM/uLkZLjE7EPxIpc7Bt1DeQ2unMJgXDjLQlGxHhEYZ/61HxSVTvEn4g1/r06UnwvYCgFscQTIcaR7vAPLX1TXlOlTSKvR0MJk0aMs5LTH604QChBcZnTho5EgQ1vuttWjMtXSulCAN3H3fGjyCJk7+K64H6mm2TsHNcx8eWBwLljnihzZTYENS7e8MJ5+326YDX9GgmEH5aiXGJud5+hVHBC3p1kavOFRNmItyiZemKzOxmXC4hXn9Yl8KT9SjRth/bfhLKKLFCDjTIyG5Uk953g2yx/bIJ5GOeRkgMPSNFi2ltNYhjXDEOd/ihu/BmZ7sGHngPHzg9Mq8mU3V+NeuuHcj5eWc5SouNTUHgTUH37W3qlFx/OkFjaEbp1iQLoxhvseu3ugiIryh2NAIiYwqKeO0OT1569BSfujzI20xSmlVsPjqoVAXH3mYSaaohgFGpmM5O/pXDzAB19FcZcpJHzYtC3UuMtu5v2fPXu6d7ID7I6YRZG2zD6FrySf2Pqshsn7PVTorvDimAPL9TMEwWVPnVFE+n/MZZtmoUawTx4B8kd5bY9KycnliTXh1l2m/n0EcQHCIqPDb3IT4zF+2mIrmwfFF7Ca7OTre3Mp9C9N3j3YvRn3kg7XWQhBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0rTGTMCc3Q8n/7IvoaMxOf8Wm3Enzuu2l2BRNs3vxQ68wD5Zk4N52bz//RZJ?=
 =?us-ascii?Q?ggKPoSmiIFSSEjv1KgdRno5ZnDcR3zBBJhGvcTmmTrJrzmKJbj7JIpflxacn?=
 =?us-ascii?Q?itZxVF2jDa/I/5rhLxpBwW3Rap5ly6TMP23pCH2qBz3d8dhBABsLK3O6igWT?=
 =?us-ascii?Q?rsRL6k3wTY6A8ACfsifOGGYzttc737UHHptjWgfVjO2z5vf90rb3m8RLHkbY?=
 =?us-ascii?Q?mbc64k9SCNFosZWGI2H/Z15ZZJfSyJ1r01AvX+LTnIwK3JlunC00ucISPHVm?=
 =?us-ascii?Q?WwRwLAuJi1o66cfP6hfXnJGqWCm/jMAHxyXhNqXM0zVqlExc0I2m0CDSgtJC?=
 =?us-ascii?Q?5bn4Ne2SM3n8h7wfaRowQTxPgMcqplV8hMaKNJeL0TLukiHCy7HpFCIy5dmn?=
 =?us-ascii?Q?OZQV+Jdmdc/Tu35+4CHVBotG7vvfbe/hY8CNbrw48bQi4HEhelMwT8gyMnuX?=
 =?us-ascii?Q?Rf5pzeKeJ/29N7qNLBW0vpulwEh3gAjWBfUeLXUPlY4hfOZyIMvV3GVagLMY?=
 =?us-ascii?Q?2BKSgB029IjF4P6or6bhd76xZyp7Mm8gAwLE6iLLk22ijmw2uwDCiaLA7r8q?=
 =?us-ascii?Q?Ii34dp0mF3WFtooucwaBcV1zbMSIH/Gm1qMsWz6sYp1hHHRVjsokNsFlXcfB?=
 =?us-ascii?Q?P57Sv6KQljINhHiQXLKRKd0V1tL/otLNmlz3XQ0BEnjI1U04thcAeM3soC+c?=
 =?us-ascii?Q?PM/PJtcgHxTbjw2NWj2KkepZWjLujTEJ8crY1I8rrIxeqLgzhRB2naYu1jMH?=
 =?us-ascii?Q?+02jmFMNwrIuhYXw39/CYhxSAeXjHfG71seWoiCLdeel2zyhnudfuncaZ9t9?=
 =?us-ascii?Q?3RJRudN6vVI5S8bhkUBBwafzLoXPVmiJlLGhb8bQBcnDx//pHVhdbQAgiciF?=
 =?us-ascii?Q?ora4E1exLRaY+9oTFkNCX1PwYJWPj07ek2pWWNljr0MJHU5d4mdQ8yo/aC2c?=
 =?us-ascii?Q?1EqJMhSi7R6UKBuEgVBZPX78YyxbnHwSZQtf+v38V+DtAK9n3wnw/3ECWesQ?=
 =?us-ascii?Q?RctIHLD5aXspElC8zPn+IwMzUqu8Acizfc7GYv7BIw+SxB/+uIKiqTRfkVnS?=
 =?us-ascii?Q?0Elht4N0GQOXDHRTwVjaOykZP/ZM6dwuXTDHpM/niDQ6oWuCPvd8JZEXaIfG?=
 =?us-ascii?Q?J6EH+fwwV2i5hE4+ekIrMqWZowJlAxBAxmydqiK+KlAPNSmidO9ChwyqF6HK?=
 =?us-ascii?Q?vMEpTrCHhDcS0petIo/rikaQX/0VGCUZs0XME66712A4kAlL5JwlaHziPPgP?=
 =?us-ascii?Q?0veuFtOD+I4yPq9eKdNoxXcr2bYMKC+P/VsJXCKc/raQ6IxImqsalah6lGjB?=
 =?us-ascii?Q?vS+JPpIpUWuPLHmbJnfoRkjeSTVO1+GbEz0JNo0XpkyI8xKGAy6zOm8CUy1o?=
 =?us-ascii?Q?BAgBD0yn0m529sHvt5y3/+zrC5vUlaY6f9+4qskoNThcGgxu1FuNglTtBdzq?=
 =?us-ascii?Q?Y6x9A58ms5kxAoOm8LWtUNc+hDA6KaeKcEdBK63d0+sczxghhX0EFO0GtSNW?=
 =?us-ascii?Q?2EKWJ8ngVaaDWujrHYeOqH09MTLH6H0K6q/Iw817Tmp4A5ihklGX6bICh7tP?=
 =?us-ascii?Q?ddzliYbccsAOhNK0JH0T41RhM9H6He0jBgh31GBuDhzCc24W2NgU6zTw4STx?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cf3aaf-efea-4f10-91c3-08db0624c7dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:24.7423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBjyaXMfIwfCLNZT8OnNMzYb2sd4FO2Q1vShVcEha5I2X+LzfxfdVGqXV/AHW5yR+pLy2MfyxtwlaYlN4ipI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 18/22] drm/xe: Propagate VM unbind error to
 invalidation fence
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

If a VM unbind hits an error, do not issue a TLB invalidation and
propagate the error the invalidation fence.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9da5ee4b31f8..0c2cc9d772fa 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1500,7 +1500,13 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 		container_of(cb, struct invalidation_fence, cb);
 
 	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
-	queue_work(system_wq, &ifence->work);
+	if (!ifence->fence->error) {
+		queue_work(system_wq, &ifence->work);
+	} else {
+		ifence->base.base.error = ifence->fence->error;
+		dma_fence_signal(&ifence->base.base);
+		dma_fence_put(&ifence->base.base);
+	}
 	dma_fence_put(ifence->fence);
 }
 
-- 
2.39.1

