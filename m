Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D6C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C5710E021;
	Fri, 19 May 2023 13:18:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0F10E0FA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502313; x=1716038313;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=wl/nFLTNwbcmItwZykRR1/8mb/92BgK3qaAZe/gPREQ=;
 b=hSolGSWl/0ip1uFoC4etoQZ8a3HlAa6SHdkrMSpgoCOzZgO0unjpL5DB
 amYuTMsw6LYGZKc5f2YLnNQKg2V2y0ZzCjJIJOBI35BZ1LXOFir6rznS5
 VxwjbMuuvkKh6PDZUqZSVjahDdq9r/M5SFPCYJDcoD8CGmjpRJpCwqZoq
 oQDW3N2BOWi5sOOo3wvwWMpuBzMouPQpclSJPGXm08D/XKDHQZo3UyMqU
 mdG7cCTK7iooH0Vh5l31/tknag4Aon1Ks4MbKrHKcMR1X1g+tHkIhbTFk
 MCVnGIDopOVJt/gmj4pMGqnEUaYnQaI4P5+WwwEGhRwgNKFfZQEQnVp4j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332733926"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="332733926"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="705615760"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705615760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 06:18:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLFzA2jdFndtS0XfiU2VPxZk7zGlTDODTY18+C5kWcMjBg7O6/9zsO3YLq0W1AfnPMpwxTOXZx51+9BEDj3rwV1WzJCDxRzC06vsFdSEW17Gg5+z+guhKIRWBFpgeNoDyI3G6pHP6ltO2zo3+DKFYLHOQXlmwgX2AdFK/1yorSOiBGtpgHLZfi8QUeILVdj6A5ri4Wr2gCAbcRYcLcsTB1n4w4frr6Be9MzIcU3+BVYqSliim3w20+CL7choB2YP9aa1+uL3zH+uvfBD9qA8r0DTwb3TLVDgEcM06XURtEOKWuudSs04rIZtYN8AqvuVASqu+JUUrrlnnoaTFS3zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkqLrx7RD5hotx+D9YS6WJPeKBDMhYXwI21BfZn7tNs=;
 b=mcdh7NI6PV9cLdcOwi2cMNhVfhQXpG3aRfU+P95JiptVA/IuggyKLdT2kkxafS1ZA3uYXYmdnxWGLhUuP/26Q9ISnNn+Wqou7V+o/Vxoy/RuPkRfYQus00OXnutzLTCiZeFRldcfhAmhU70YVQ4SIf3gN/hTMzgkVEneDh0opt/GJEFiRdr237/io6fUxs0tSz2UkZRQf5gvkfy4rnRBpt48rqkXbdaTtoTRVBm7q7JMGCxs+zlz/drcUS128RoxgjjGwKg3qLZEAf7ikfSpyJZoJXq/1jINLYdY1R8HYDDIcSDAACxyE+4i52KNYaG4xNV+03/ius5DCaLaoPvs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:18:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:11 -0400
Message-ID: <20230519131820.2020660-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a96ad34-ca7e-4b45-2558-08db586b8835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zD08C17ykffo8No6QdK4f7B2H2JFNoWdd37lt64Gm2Tcff3VfizAwgSPVWV1sJQ+XZH6sCzIqjhjQV7PmJAnDeBz2fkhSuKaygavY7ZcEcPDA8/2kaery92DvosqWtIwGs/WqRP3/c3ehobcOxziMWZwvV2rVi1kMlQSv97xlrnCCqsHw8HC4cj/tJY3FUFA5iU1u/lTNATE7I3lgzt0RBgQqqlp4zsCklpexvXafSsaxAh3XIvGRGC3l4+0c5lvZcvXoOfiwxLGcRnkerOubgIBwN+LWCDc0iT+VkwzfLMpDinH0ydT1E0OdZ46jxonVOJwTjgKoi4aBUaofG8rCS/CeY/IM5ceTNAwJlSQHA0RdQ347DBmOJQNXubTBUl9AD3dvdprhGpxMO2XhpeJd5uhcGrKzxX3p8MEhmOq0JAaWAvOw5yTloucd7muGLIBheB4Gnu6vn/Kmjj6RudXzv44afs+RArEm0+9JsYsJhXRrFK3PDP5PYPOEFLPq3uuRKrllfxP65EZbSy6H46phbm79tLcHqYNtk2W5/jhQ/pMhHpx3oJ2UjZAxR+yVVmf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(82960400001)(38100700002)(36756003)(86362001)(44832011)(8936002)(5660300002)(8676002)(2616005)(6506007)(1076003)(26005)(6512007)(2906002)(478600001)(66556008)(316002)(66946007)(6666004)(6916009)(66476007)(186003)(6486002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ic2MXzrFBaDl1ixBxz9YwUXM4rxKE8xPc2Ath/U5yqah/YmqBrlt0xMrO5cF?=
 =?us-ascii?Q?bpfSqUjnxFVlNQWRWOuel7NpkbXTasLh3gA20RdT9Iw0G7p9ja/ieL4E8Ir/?=
 =?us-ascii?Q?RL7+5+kn3A+aNWnWnNIpLd62cxGnqXoZiPAlfyMT9kFPzQWZ7q+WhRn8P2dG?=
 =?us-ascii?Q?+ke6+qVt9AGodDyYXLG9uJmXMetApnIjGkL18yms2ywRaLAWB1rN+SYd8M6G?=
 =?us-ascii?Q?nzQBrwJizdxZXwrk6m8aga095amv078zlHjttEYrcU7cihZp5cqAsnNuEXF4?=
 =?us-ascii?Q?FzbGfllUQS0jhJCdOeiuikvkY7zjvewMJaDOuYwV7czMvBwc8hzHAKspolOj?=
 =?us-ascii?Q?klOy1HBLcuf0QkKYj5OZzWfOpPhCbUXRQVgxHUuwenEXNgcZlBFuSEtYS+6a?=
 =?us-ascii?Q?88CPzKx8I/FWSRc4CRZy/gxhMD9STptse3AHMAmq5QFgEpSc/7e8gd4SppDh?=
 =?us-ascii?Q?+7IfvrcxkIg7QAcv8FPUYdu907qDXHoZc4MyW3j6xk3PdjQLW1YkMpct4cVW?=
 =?us-ascii?Q?H6WaIyi2N7Mv325jMes2RFZCNur44hH7dK98C8WWxw9QNS4CIwLHNPqjB0bt?=
 =?us-ascii?Q?eL3knrNjX+PwLJ2ngm0TNAVxvew+QfDHPxaivVbZAIih7HRMY2ohaltEn1Or?=
 =?us-ascii?Q?DWD0ko8iQpg2R+aeWaE1uFpN7G0n3XQcq5qS/XfyYSqc3LU6Ch9kAhh350fq?=
 =?us-ascii?Q?xAIfd8BA5BE2jCL1me3mHMUnhatayYp3QLYdUkNGBVFeZSaE5rGl7LF0LS/z?=
 =?us-ascii?Q?N5cxIFKi4XHyxuVeNwl0CTcmkkTaLTpxiphNBSRBDV1sYXnHa2/jdlWVoLTC?=
 =?us-ascii?Q?HLwYW3HUoh3U/A7dJBjHBLRZqWuAGsZuQGQVsB/Nw+WYx2+QTRKwa4RWTHv0?=
 =?us-ascii?Q?BhAHp49vHEDeR7+ZWGDIqS67jrROMPkkqLGSa5NSVusN/Y8i0JtCcPhOjIwq?=
 =?us-ascii?Q?G/TdVXKb4HCWqEgQwpUF2py0x3S1n35l0/8UAwabFASdQKlXUcPgPAXKiYLf?=
 =?us-ascii?Q?9tRCmS6xKvvezsOLjyAT/zWAAJQvuWMNV7GsPCM1SXgQl6ZdA+JlLf6MytoB?=
 =?us-ascii?Q?6VdIBitdzntVoEOFXC9lY+0YTNHU7WjEJKRSd/WUW2IFW+Ypc5fd1Eomivzb?=
 =?us-ascii?Q?5hUY0IttY0Nqd8ZzfFK7TMneJGuWu+XC2Ui+ZFE0ayHdGric7cpmD/Amah8Y?=
 =?us-ascii?Q?4nlAilAWvNrfJDu3T3zI+aazZof2ALq4rCcgdxYCHWYxPz7VoncmxXpf3LgF?=
 =?us-ascii?Q?gU3wt+1pBIeStZG6B6YgedF3qOLrDQ4jcucdIjaiwjwzOYVHUBRAB3YQ6q6L?=
 =?us-ascii?Q?1vYfO+2K7uz1cv+veynWkFVBvIZIyZz1i7B+q3ZBegRfkC9FK25IA/6S1OCO?=
 =?us-ascii?Q?LPA7sH04SKmL8PuY+GEtTaB9fmgppnYjJ4KxzujZ3fgmSnvPwdzQvYI6+Vwq?=
 =?us-ascii?Q?vQ2yJ3wIiZIKnksdRrwiyitweLCRx58ZjAk2VtYiQuPkk+taA/OlRFkZ0DlB?=
 =?us-ascii?Q?2oJWjX+Rsi70OkqDZHacSQbyPQot8BhpFcsiURNTgkOPlTE212+icNrUoDRo?=
 =?us-ascii?Q?z0J50u7p2OEocXZnxTEPecUXiqEc7nqLVJUM4wOd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a96ad34-ca7e-4b45-2558-08db586b8835
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:27.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq7t8kT46EmaCUX9H+2+3bxVnoJYR9D3FdMu/FHnfUjAL+VufnE/jp98mF76JdJQxWzCIRKQ3DVRiwPDAuyxXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 02/11] drm/xe: Do not take any action if our device
 was removed.
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

Unfortunately devcoredump infrastructure does not provide and
interface for us to force the device removal upon the pci_remove
time of our device.

The devcoredump is linked at the device level, so when in use
it will prevent the module removal, but it doesn't prevent the
call of the pci_remove callback. This callback cannot fail
anyway and we end up clearing and freeing the entire pci device.

Hence, after we removed the pci device, we shouldn't allow any
read or free operations to avoid segmentation fault.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 561db73a3c8c..00b9cc44c773 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -57,6 +57,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 
+	/* Our device is gone already... */
+	if (!data || !coredump_to_xe(coredump))
+		return -ENODEV;
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -81,6 +85,10 @@ static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
 
+	/* Our device is gone. Nothing to do... */
+	if (!data || !coredump_to_xe(coredump))
+		return;
+
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
-- 
2.39.2

