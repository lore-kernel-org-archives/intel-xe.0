Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8777C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B72110E038;
	Mon,  8 May 2023 21:08:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2BA10E046
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580124; x=1715116124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hZQuFZn2nKfxuZGR+z6OHQCZko3oZjS/UyTLeB17kq0=;
 b=DPdOEDzBPMQlDmNEiWsdcyoDV3dGFCBMc41pwivlX/dVWYnsIPoAkK/I
 Ie7qWEx3anAkr7KGNL0ajkqrvfiyCjuyd0X43lCyi2W9l7oLbV9Apw273
 2Hl2GaVhXXHeFybxilFqaitRGuGjWpkkB/3+XkjcKb0CMAMsWCHdh/JjM
 V2xd3P9eHZ47PLWQ4Z0QdB5+pdCSFcQVGW/hVSPiVl3ZUoYIx98DicXII
 NFTR5B0G+mB1BXU2rqFZHdaJ+udraHL+GSyuygRNXMkyXUMJJvHyiAvVa
 7OiFnkcQwQFychTnJupYglEBjl+jubCjmztpeqrlHzpCv2s7YH713sgu+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415319277"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415319277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649029213"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649029213"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 14:08:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR9epuh1MVfWSTYvvxhE7/1Pzp99vKOWDQ7F9Nhh/APcMPHtuSO2htLZCbeGXk/mPiLKeXTOJ/CZY0ncml/y1xPN1u7uE45YHvlselXOZr1vwwccdellTVqumHAyGQpXi0RRhg1mNls8/FDDpo7rIO2Dd04Wv+pVuQ+7uhXAfLgV+IWW6ckVm97rrJU6aHKO7cCHKguxOMte9+Qd98tLoMZ2zq1agBn19qCVqv0wfHb56e2QWwVR99d5pHmhd0Ccef01WjyLqx6PsXEs0YvpLIi8axvMqAcFjMCLZQ7MvXN/Oz0IX0NS5IP13zWETGGms72Ddp79Y6P9YSblGq2TEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQGDPjuXUSZQnGlsy6raMkWJKLYmdSQtG0Wj3cCcgaU=;
 b=Dn1N3Kh5P52oIsDouwRGZMgDtzs2yZQThmteQzYLYovsBZu0kgN/qdaxNFTHs8etq97HJNM50lG03nD0W7v6q+CBDGHPLtiWHjAS7FAcUwrSn4waTQ1bu1Yf8+gkpebgCKRDk9ahnYfP/C4PEDpdFBwUKmzVwAUJNedKmn9aZPy0ubn/uFLGOPi44CdJyo95ZeDKbxOQLmyGvd9UZbX3Ffkom4tXH9B5iR7xZQ5RZ5SgTfprgIq+AIDo4kcZKaoUm699hZVzAHdXFcHoJ44vnYcufD72Mb2LCrXxtY6CNVhrrv6ZYJ4edLKg1nL7277+YKTUyRvdqw7CQSgdsE/k8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:16 -0400
Message-ID: <20230508210825.1405432-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 64777e46-60ce-44df-d546-08db50086345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qVLVXPE0GXEuM12MYCMvph7Tlhb7QGrqrGlNbdnfXB9FB7M7kBiyMw0Vhjh6MNbKYC88bkLz2bCkW+CEzHIhhlt1B6GzbfAULBMoTd4HanPgEXwyG8XutmVENEM/07irLpahbyi23STKcF7zfkIRWFf55N+cU/JhMJmLJpEpnnCr92yxyoyO9JNQW4wcQYy/k2fg8slXmr8DYIloH3jgztKi4SR4DIEuYVOBvcV6C4a3RbPNwf5r4OEhfyhwLrj+Y01kAgx/bHCNprCBAUuYUmIOykO/PIUaX0DZr4BLzRK06BybBvXjE3UnTERvh9QkcVwd9VA5to5pQoECYd7vxuj8n18F0Jvm15YX6mI3vrpZhCQWiKXkqDLyAigJaipgrd/yj4t/L4DqxPBf4eEcL0qBhq20tE/HaNoCv9xLSBYU9a1z1VlS+EkUmUlq5aXVvi8Va6cLgW2qHCwztaeRvG5ruxe0OZklkd5AnaoBeWigzQ8LJe5E9ZcYPEP/1lgvg6SaOdxpoadgfpiYCswBLJUGAlVyfpZBXjcCcdq0OyksIwcFkCfIiwzSWU2NQoI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(107886003)(478600001)(6666004)(54906003)(6486002)(2616005)(6512007)(26005)(186003)(6506007)(1076003)(4326008)(2906002)(44832011)(36756003)(38100700002)(6916009)(66946007)(66476007)(82960400001)(41300700001)(66556008)(86362001)(8936002)(316002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUFJt2yIjQJLX5zQd1ksbHPPhOm8rMvN2glITngNMFHft7txQnRq+D4d9bON?=
 =?us-ascii?Q?M63g06ZJrwYwVmY7gb5MmFJWsFk+9K3i+VXj5KN9BSeM+DdVGXzP2pP5GFKq?=
 =?us-ascii?Q?azS2UO5gGBTTHwSICZvOCbjJOY2+rhwK7y7uFVa66cLj8o3QOBzeO8xyh5II?=
 =?us-ascii?Q?uImHHKG+kA08SPudfHc8MFFr0AaLE79Hgi+eh0Uw6FCaBQwslren5j5+ZH57?=
 =?us-ascii?Q?ymXGzEAOBNc+bIm7pz11HLHGDnfGfikYK4VvIcfzQT9bK0B5uN9cNitOfAyg?=
 =?us-ascii?Q?fWobKNmxxnYwBT7mFZDVcK7cmp4Ii+jbhZ8oEwzOSav2lTwtJG+0dnym3Vqi?=
 =?us-ascii?Q?qf05upOyqhFlVMKzT61eJf+n8ZwhLMtdQvjKgVPHuuWknztoLtltXhWAuavm?=
 =?us-ascii?Q?GvsbOwsYTuINefvaslFpni+0w0WrLM1xiGOZF/lFAqXaVLSaGYYyltHaQt0a?=
 =?us-ascii?Q?i5VZLjPNIj7RkpKiUF5encCv5y5Cs98d5hucwWlqX2W47/05t7FscdvBVOjd?=
 =?us-ascii?Q?VhRO5jNSqtF69MD2bmJf6uNTaIk+IfGigKoIFbAuuQpMmjj1axR8v25j6Sy8?=
 =?us-ascii?Q?T4dgsI22yB1eTrqDibklbmZMtaAzinzyMcR6t+ETxkRqQOYaO+gQ4+M6l8OC?=
 =?us-ascii?Q?Utyx+xILaGcCwk4leeoWAKpGINjjC5+Iig9oYd4iGjSqAvh2r0Y0qdngshCN?=
 =?us-ascii?Q?2ivK6jB8cKcF7JdyrE8zESEtM4eIkmUaIeEmiGR/ojIMLEZ97vTwH9WOBHJn?=
 =?us-ascii?Q?Idp8Q4OSx4mjai6eAugmcn+GLas85fj3iGIYjQUiaJ1Oej1ByzJ1XbF9aD8N?=
 =?us-ascii?Q?DHWsv3tW5OGI9pg6IRAMbCEpdB3e+Eq1rjVq8DbYZGOEruIyVHwdEP5KfH4J?=
 =?us-ascii?Q?q1fkXTRPTC8RBjvBzl62lkFdM47hjswCm01yN4UP6eb4+KYW+e4CZXmel0zK?=
 =?us-ascii?Q?7oXTRCXsHY2gnw4cq8y55bTz8rzzpfo2KLNxKVzZKE0xoaABWjxXLk5Y3hX1?=
 =?us-ascii?Q?0gAzvmV+C1foHhCfo/crWEn6xG258HQJ7E7top59gOlFIb5SRo4DXqmsmyeq?=
 =?us-ascii?Q?HzKv/LiOI34MNdhJdFd0ltl7u7GbrNLyJHR9GLDkLbDIM2NcqMUgABv0lR5l?=
 =?us-ascii?Q?le7Y+wMwrX3l08sZZUZGbF8q4L124d3/0zMuWQzRvXuvUpF9xXX8KXBamhWf?=
 =?us-ascii?Q?uGzpTPPFhZpKD9zk43x6NXnkf6D1aPaY5SmNyklc65RJa/RkDDHehQq4otnZ?=
 =?us-ascii?Q?eCQ+pmBaexrhdLBJutmcbdhOasYlpDIwx/pGeVuCF/aBSpSEDJkylnNwE4CH?=
 =?us-ascii?Q?d6RZoSUkAkkh0BfH9wczZvumQKj35SlXxM1Yg0fNpWwP+0XvEjkRBTxLvbeP?=
 =?us-ascii?Q?vDdBBYFbJitbSRf9giKGoPwFYSMgjTHhN/NtvbfJgUeWCT/dlDkDMPzdJZos?=
 =?us-ascii?Q?uMXFpEDvh5l8znSfSsLTAy+jiI3cmmU7AdHAzgTCfplucRAAoqbP4tpmp390?=
 =?us-ascii?Q?T7yVNW98FcQfDMWBZTC/Zpcj8nzrFXCIw3A57Xss6pzbqzZ1xBTUxdcJmvgX?=
 =?us-ascii?Q?bmmPq/XKVKbppeG8b5xcIouVqqeBYXwVcytiphDMGnJA4np/C20cgeE16c0O?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64777e46-60ce-44df-d546-08db50086345
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:36.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7uuRF5DH32DQZSuH7FIZMYH4AS94B1H9W7SKkkZrGfe7DbRO26iWuTARR6T6yCPzXXMzf1GRsY/qpcDvpF1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 02/11] drm/xe: Do not take any action if our
 device was removed.
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
 drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b1b4d2f10c7a..da1b010452d3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -42,6 +42,11 @@
  * hang capture.
  */
 
+static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
+{
+	return container_of(coredump, struct xe_device, devcoredump);
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 
+	/* Our device is gone already... */
+	if (!data || !coredump_to_xe(coredump))
+		return -ENODEV;
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = container_of(coredump, struct xe_device,
-					    devcoredump);
+
+	/* Our device is gone. Nothing to do... */
+	if (!data || !coredump_to_xe(coredump))
+		return;
+
 	mutex_lock(&coredump->lock);
 
 	coredump->faulty_engine = NULL;
-	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+	drm_info(&coredump_to_xe(coredump)->drm,
+		 "Xe device coredump has been deleted.\n");
 
 	mutex_unlock(&coredump->lock);
 }
-- 
2.39.2

