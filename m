Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E88CC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3C610E17E;
	Mon,  8 May 2023 17:07:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0710E17E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565633; x=1715101633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aIxCbibIO5EhzXortXqPxslOC23T2zgUyCzINdLiSks=;
 b=kHs5LqKlqypGrTtcEsWEufr6qs/Hv8ie1ZJuOi8TtyV93QJylpCaGUfg
 VpR5RnZNW4PVLcZxIFxP6tmar7SjcnveSRay0s9iHabyvKa0nlDTvPslT
 eY3QAqLOyul/iPU8+26Yyb/o0OVpQ0pCkkeRxXnGSj8JzNXBeEKb/JOeR
 y9TtXCDZU7gQN+BZ1YLahj4oqqc5aZY34vAfk6qDqdXm6pU28lLmLE8eu
 ytmcyecn2lPATPQbDo4AI0ItGnNhMNzGMM8pVRhCE5oAmdmiWHP8B7vwo
 yKMHq7K9iRwzGk35rtcfvqD+6VNo9opEFDlHVHCzh0E3XS4Qx21aWHd+B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377800271"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377800271"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028470049"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028470049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 10:07:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:07:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXU7mt+E55W4T5Rprr5IUeb/TXx7NJe3d/4fW74eJA8U2HtG6uUwNiYIdwKn6f8N8uAbOHJGNii+iUBQcmh7hUUNh6d+fvl9XMesw6iklqXaoi2bF9/mJ0SZdUpKGs0RH5DWVux3dBnYoA7zb9x9svXCvKmAVbYf6iHOYVRs/W37AQe3c1+Er/N7VRtFeIVe/Fgg4pbXK6smLTgoJa+Y1rX+ATsQs7iBa/vj/HLMNUIlQVePCDj2NU8PLcBw78dwmLU0qnMSZsDULuR5NCMg765PyQI+9GmAaiyX3BAow/e3k2Tgg7MclEAzyTrj6Kg3bHmvHJhnRntVWMM10vAu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qIsbchdmyNt/p5/5m3tq/PvAJOKIg3q0R91C4JvEws=;
 b=O6ugrpZpQzjnN33QEC7LhYdd7Qeq/do1VibR0U0jMBvXB3ipJHjv2g0WpOGT5IFAQuaEBmLCKeB3s1v6zNnNBF9XWyWV+ELgYKhSxOzcacYf2F5WnXzd/meMmLXpzW4gaynl3rZx3Wq0+Kgx7vXkMWbC+w4yJTGj9yE6/ESESJsYY4/YnDFO3KvnMlvWQITHfrhkiU2t09xKLmDXKehJg2k+hnHba4BhB8Yt0cNKDezq45sklB4zNQRbu9cmvm/gz3EeVHvnpBTCUJSD/ZbiR0pIgrLvZ6L3wCDMit9VzSe4U9rr1JZH6eFrk04cdLosZ+DsAR9UxeOzDt517v9BpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:07:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:07:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:16 -0400
Message-ID: <20230508170616.1289914-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cabf366-371a-46f8-4b2e-08db4fe6a949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGUIvIoeLgGUqLubfcPL1HyXd5bvDYKWHpFeW6UBhBlq3IKCGGXghL8ohVu27rwCuGs/Gol/pRwsiHP7AJ5LyY7pVXfSI3RBXn+C8ZFbYsoAIfOWFtgQQwChNCgARLtHDQRUI2Fc3romTN+UCYUsTpsHEYlD4gRymkOmORjS8/UQhJRYDOu/zu2aflV5K1dJDO4yDyRLlBo85XtPUWuTtx6A04EdlC5DNAgJYruX2dB4FH3ophfubak8DTv0FCgET/GpPHAlMdyHKm+vs9oKMYYErFpgv7CihpR0wrI4czXY7hjxUuddwArUOYVKrKG0sg0j/LQvieWK/0c+okwIsLdPORVphrcj3XdpOTzmzSYmD8TnFuKb2VKWhcU1wdrziOTemeLuJ3kYwGs3hGaHvdRJVDWKmaLsXqkBqJrMWK6AiNkRwZkakunekV8Y9y8ekI0Tx4XYAg8TSX+Fq4nMsZwg/qdSKux4tU3pZwTHYLYjt712G7TOY8WgA38zeQsFg2R8eL7Pn8RJ13wLGIP/QQc8+rXc032qZp8ab/gJucSWJJq8IxEUGRgu4uK8K0eF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HdcSR9qEd+14dMyBZ62bizHYoKEkVAEUaXtF1ad5W+sZXd51DXtMCbYQZlHO?=
 =?us-ascii?Q?xQZMPG6O4W8HRQodopV2B+qrXK0k5IUHlLNS+E9AwRVczTHMkwCNT9Fka0F0?=
 =?us-ascii?Q?MqOHJT1RxHC3vqZz28vmv6XiEeLoIVKDNLkE+tFWV2JHJOLIqSBNJtnHGYur?=
 =?us-ascii?Q?AO3KZdl2rTgqv43X9JUgCXsgBulx6V0pxfe8TD6Vto2hKad5rfunE6dhdh8N?=
 =?us-ascii?Q?wykIPpOugvzm59JrSuZiSJ5/CSDSeurqc/Kll5JASNWZQicuPz2eOxFq/IJt?=
 =?us-ascii?Q?9fWpH0vXma5AahJykrFxOUUPaQA0t+CZDIugnuOu4nbNkfek7muNYFxRKlTN?=
 =?us-ascii?Q?au8aj2q8BfIwgO8eUKnyTTJMax3lAuu7fzA6AzHroG0ozC0l98NPm7tMftZm?=
 =?us-ascii?Q?RZ6Q9mpPS8QVBGw770OKZQZggH7s8Oriqw+Or4V01eEv7lVzgvtUUoCGx9lE?=
 =?us-ascii?Q?aQ2ewQxftjBEz3UxFUBgItBVDEFzar++pHhs7b1YFSnOzr+90uUkcz3Caywi?=
 =?us-ascii?Q?F3HcYwwJlWrbsakBXpTFq1mqaExGDY5yxq6HWZXLejz9fmgdKSYFjKEvIZU7?=
 =?us-ascii?Q?BDJSM6yuQfl5EUS0/xsnB6G+nMFpWqEd8HuPIZmu7EOglNcYOAKWFexo1wSv?=
 =?us-ascii?Q?2QaKaFHgthVhBaU8VPGxOnsbv+vBLVbERpTZ7THirCIVKEpmDhL2G/dDQMMK?=
 =?us-ascii?Q?A6i6LjGfJyCisTDwFw6CNQ0T6GmBvXu3W+ECQtsSiE01d3DI1GutKMWZ8GUT?=
 =?us-ascii?Q?nHGy+dZV2V89xMBg8QoBoZFVGpkC/SbWtWHYK1JTsffmk2gV1LcQSZ62IDaG?=
 =?us-ascii?Q?3QjF2+aHEhu/dOUxzvZRleGQbAWsLxeJAf2ivPQW88wFfU8K/sGqgNky9ZXP?=
 =?us-ascii?Q?BnLKl1foDw0I+/2adb10zQwvMyZS9Yiu66b8Ig+4a9cvK3wCOzN4BXq+mJ6n?=
 =?us-ascii?Q?Ooc0I/Yd6sMWuYeOGidkGJDQHTh5kDH5QAbf8KTgUjB8x4F9jgTZHcYLUkhM?=
 =?us-ascii?Q?dVBzEaray3VmiXq4Gsje5m0fopQ9GpIugPB9JV9c/1sNboRK0IYL0nLQbENs?=
 =?us-ascii?Q?tNEua+ZoRoUlTd9o9ePuFRpKxZE0rGB+CA0mB2w3xCpMR7J+C9GWUCfrXweJ?=
 =?us-ascii?Q?v+OYY0vQKYKUWWvl6Ss7yhjYSfNXevp51ij7Inh/Q19UZXbFCp31iFzn9/Tl?=
 =?us-ascii?Q?VFoMrBMY+iRBvrCMkWfgGg4/xKvFwLsPfosKIZkS2gs5gZCdgPml9Uzl9JH5?=
 =?us-ascii?Q?vSUIBcWuvbFIUherCFG8zVgj/WoKW3SaCA9TWPwhLidWxiFIwNCDldFFyq+h?=
 =?us-ascii?Q?fGcCBWLOZx9z5EeHbmHpNJyQX8EbP4EG1cSewUSMlW3LcUmvQa6S8j17Zl+P?=
 =?us-ascii?Q?rPAmo7zIK4HIXCMcXPrWqh+8LSwoSvlPKJ/MDXnI5O+88gi6Vxp9rAbk5yeR?=
 =?us-ascii?Q?XQmDJmq4NY64Wsz2lD58KXJf3AHl9J17pht2Q8zYhJD7L0eDwv0tF2sM+U4U?=
 =?us-ascii?Q?Q2IQG6G0jQIIH/VP/fEffSpD5VkCZBC0CGWBPTbBTRCynNot1x031yNBdFg/?=
 =?us-ascii?Q?3zzeOkE3vkJrG75yqMc/VEcAUSt9srMdAcda1PapQu5Agi6bWqminUdFV4il?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cabf366-371a-46f8-4b2e-08db4fe6a949
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:07:10.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD98veEC2BbjVFP2yrTmNY+PnFS2/HNc0MmdIsBH4nNRVwb4icey//HedsBH41TtgCQdeNVoyEEikBeAmCvudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 11/11] drm/xe: Limit
 CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
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

There are multiple kind of config prints and with the upcoming
devcoredump there will be another layer. Let's limit the config
to the top level functions and leave the clean-up work for the
compilers so we don't create a spider-web of configs.

No functional change. Just a preparation for the devcoredump.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 91576cec000d..a96372140b79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3369,7 +3369,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct rb_node *node;
@@ -3407,9 +3406,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
-#else
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	return 0;
-}
-#endif
-- 
2.39.2

