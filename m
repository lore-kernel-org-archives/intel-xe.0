Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C7ECD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC56810E292;
	Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1EC10E28B;
 Tue, 19 Sep 2023 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133599; x=1726669599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BpiaLqBL5bgl5yyq/pcCdexx3hNQfx9qf0zQMR96dDs=;
 b=UW8JU+WTrNi3l0gxCmGfIOqMHrdPCpzsL25z27NenGYUwXqY2fFr7g68
 TqW8dGJxiGkHtHpfh7mjJxqy7SqoDzacrmlOlTa4JGTi1PX0RxvNlPmSH
 3Wsmie/DmKSDf8PF7RQtnTAM9lyQlAc5EBPuj8H9Se24VgTaO7jTyiawg
 7YDiDRy6mfb40ftcCeJ/n6KS41/yrThZvJ1Yi3Xut5w13DsrtyuOJ6X2i
 teQ8TALqbZTtbhLYyW8kqAi2FOW2JTTctlnVMVxzmC/VkLOXab/8EMF4C
 GrVTEHxc4bP0eYsXpQu1yGdK26Gr3P31HPUXunUIfypz5wQ0ze0qw+yrr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278969"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278969"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924457"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924457"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIgoVnj4Ya0JXdxVoMGYWPFn36TC6hIXgRnm0+6pd4aASMkiRn46CXLGV7Lry+dDuiucw3NZRNBUWcmoNLoLcnxlMRtAwK4jdTU/zm2nvot0rPsEYhtYrqbkgDmPE8bI9AWxziBDVM97+0tFVrOZasexShDdZdwtQYR0GKm/wAw6N1ezzohGgMrPLYPLJBd8aSG5dirGeSLVDnxtwygFXjDLh6/007YEp7Hf9pXnveuncydm5fL49j1vBnFRBQRxFLYoyz5CiBjSLDDWDwSf85D9RaqN1OsFXT1fz5TOaQVFJsbxYajaI6qEulFPrO6YQzx7as8RzG5QNCaxD9eoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/u1MY9E3Ehd+WZQz8xuBs4NtvksG5p1FtAHlhWePCY=;
 b=aeIcNnRYzLfIudfawdWtHtzK1qcB6Y7BBOUtouB8iSX4vxoedPUiAzrACA/zN6fdJ0UMADsGl6t5hlIGkXmmjxFhCOp5+w3WgDc6yQB0tdTwj9tm4pE0TkiQ4exf3+sJae2t3YDdZj7A9ySwS4r2YjBaNOASML3JwFH0/2+CpDM5PCsTckZ1GBacTpGOzv760fJ/tug875gv5FT284qBRnrxHhyQ8Vt5/XBEvADY8HqN3ydvMOFh2W0N1UdEN4A4G3ZXyxvbqDXQkUNn/nAcqCJZ8LVoJ7htcm+U5DVbW2LN2RLRlHEHmauHCF7fHpASVaAGcpBEu9eMKolgQjeLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:59 -0400
Message-ID: <20230919142000.91363-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d71058-e25e-472d-58e5-08dbb91c69fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7d82KX/UtSqTY81IfMVvFyr/3cG0WXIyOikcJHwmv0CR2A/O5FyOxVUDaXmGTWJI7Yfr8yLVfr4RUloeUgWBj7Hopb7RAWf6sFucHRDUUAPv46z3QurBw1FqtZBV6ejHoG14wWp5H3rhEf3BY+3pSrli8OmJY85gbUR7qDXHHJSRxtQOMBf9jbEWuowhYcw8lrUtoiAy3dROT/Ft4JoRA98A7pDkY8dnxny1m5oeGegq3HI58tCMU2ia17OnoW9+16l8mLo0R1UuDOuvEkAHSNMeZxUsKNjTGt8Ql3XX4Pgz2PHTJG37Zw0Lilmru+5JV1YA3f6iV7FUrjVYkiH5wH70lofyCoB3qe2mjc9cWxgPhnTdZvoPnOxIxmk3oNWVHfYklo0yGpo4K2x5BRmiHFm/GZU7rxkICUjsRDpsCCHSZGwC7pX8auBHAeo67xJl5+ZtWz4uuXCOLJoPmqSk3g+Nc4Wd1ji8p6OZeibrGsG4anj5/efZFBSHtkIAkDTmj94qpVOK3mjfgAcmy8PfqUaX1+HGmm55TYF/3quiOlxd0VAddqg1faW+sdXvaON
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(4744005)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BwsjA3f/40RvsWQJEx14jldBOQX/rO0QrNUqhxV4TCyqGvP5kVJhXcBqZRr1?=
 =?us-ascii?Q?EezFuw0CHjca4GA7cEfi+VXQFo4tuByWzVw/ZuGsNdcIiIbkNWm/KPEpZdum?=
 =?us-ascii?Q?IeOeKXo8v3qjYXYAsx7KR+iOzlm04KGbBFaGm6KMwPi+Cu7VraHqLhU7s40L?=
 =?us-ascii?Q?UxMoaM1Y5E2Bll3xTHNk583Safw98VYHezM4AeGOldMUyAhtuZI8I+7LEciK?=
 =?us-ascii?Q?xEFC/kl4oEmthzhzgBDE3djsgU4AP94pBm5OMeyzryi9LCo+oP7PWkyw0+Ub?=
 =?us-ascii?Q?NsuuirNGuXBBvCthjuC9czf2e4LqCH1n48l4WUV5Bs+JIycEYT3vAMvi+HIF?=
 =?us-ascii?Q?BW34moLj6ViLPqxFwZnRnNmZCBc/yt85Fmk4c2mhL8s3h9r5trIBluGZ9FwQ?=
 =?us-ascii?Q?VgvXNnHiOKqgqXc+DEaRH4vKanyEHUFZR1ryOCU8gwvBbXQLeDRQGTk7QOJf?=
 =?us-ascii?Q?51BLhwKblJNp/YNkA7diocYBBUUenGTCRT7PiWjKDHm/e/9RQRLzLesbQzD5?=
 =?us-ascii?Q?an+AW/cl4qAorI++bkX4+g7KiRjwanqOFg3P7MAREvMMRGlJRnX89Iee0Y/Q?=
 =?us-ascii?Q?/f9OtxkyqUueB86oXzawLNcObZdNXGqG1XigAsA+LImqKtzXgxZ1lxupEnpp?=
 =?us-ascii?Q?HJVCs7IpvudF/LunwaGFQUXq0WwvG3d7uwkAbFuZ0uPHOAbEF8PrhXS6SfUu?=
 =?us-ascii?Q?4ENtRO6XyVzKpguRlgpAsTDXBbTWRHm//Hkk8lyK98WnVm1yqjzWeZih2tbv?=
 =?us-ascii?Q?KxpOnHaV/sPXtqMbAchyMbYcm1hBIQzvVItjF2K3OcUCFkiKMNjgESi+ZDFa?=
 =?us-ascii?Q?aLivCtJ9BhSZvpWBUd+mWM3PUPInxFJecUqJIZN36KlrdS019S0oKaSjrkCy?=
 =?us-ascii?Q?yP15Cc2TeApj9Cubm8FywfxlNwQLw7CPZWIdOl8sI64oD2EI3a4wiD5XpcxJ?=
 =?us-ascii?Q?tWCTCit/v1IklSkxlOKwCcXMcfhi7070uqxaegeQO3dQxZT0/pS3ovHU7b8J?=
 =?us-ascii?Q?7fP5Vuka8y+u1Pybrmk9I1b5F3j9vKu4ega5TKATkSkOGvuKeLCwENdEZ3jH?=
 =?us-ascii?Q?ij0oCdPIawfr01xM0VzvRpsQ0yVLwlE61MHw96j5hhWGvO6B4zigrpvWsxzZ?=
 =?us-ascii?Q?EJ6S+/wSxT1yzju4QFFq0jdanl3R/FBEvOMraWUXI4Tv8jsANe2SSgSh6XIO?=
 =?us-ascii?Q?f43iq3mhCy2epe20w26g2jF/GBHsj6EmMMk8bi608NDb0vFlklQYw6d+oY0Q?=
 =?us-ascii?Q?QNyefkViqHCNjIbjhxVyuVZBc2OtNzDMuwdjnwggf64Nlo33gZ9xOa4L9W8N?=
 =?us-ascii?Q?6j10C4JXiF13CFImSyZR2+y2OvYe43cVTiQXTx1USDGneL4r0WVBZ50hXbbd?=
 =?us-ascii?Q?ipz7o1u3DUEFl01ZqE6WM6JAjzfRajUOCHNZ5lyvZjBmCIiUNh/kGU+N7qen?=
 =?us-ascii?Q?3mE0cq6Tsm3EJ6Cq/Yws8juYEXKiXibo2jEQ6KMfbxOPqTtnNDew5glhRKPb?=
 =?us-ascii?Q?lgXsKqgyMgvVKcTcZ45X7MzeeQvlVzg5cUyyNzTprw9InqjbTlHz+IbcSkyg?=
 =?us-ascii?Q?Hich036yzc0Dn43thHOplti9JYG9jAUDDq15Jvk73GVcbnEKBLaRn5u2J2co?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d71058-e25e-472d-58e5-08dbb91c69fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:29.2235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2Tq6u6Dbn+3P+A1Iy2L6Jz39PChXSIh0vIlzE0kfFAl6zjYpCEVZx03czhZeZIjlqe1Rl9DEMKel1bUW3t8mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 16/16] drm-uapi/xe: Align with extension of
 drm_xe_vm_bind_op
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

Align with commit ("drm/xe: Extend drm_xe_vm_bind_op")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 090144c92..8fe422fa1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -656,6 +656,9 @@ struct drm_xe_vm_destroy {
 };
 
 struct drm_xe_vm_bind_op {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
 	 */
-- 
2.41.0

