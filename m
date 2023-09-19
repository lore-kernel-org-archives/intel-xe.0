Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40D3CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42010E293;
	Tue, 19 Sep 2023 14:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4C510E293;
 Tue, 19 Sep 2023 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133579; x=1726669579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cHkNKuYbmzyhslV/5YYIhkG9mIPw1nVQ9EiUqSSLY1Q=;
 b=jxdKuIMqIwMjeUnmW8dqxunpEPvMEKQxXfCw8UxeK9A9nGiN0rziKL1+
 JL6bNgkcJmMktRa+hvdzLqUiDBtdeDQ2efdp6a3abESYsZOFE2ulOfWSM
 aeoJvZZf/HS+MYn8pFv+jwyImuF2PQKbJZnaR9ej/AaNJak0uhCYANdOT
 fGP/Afp872rxeEhKc/4iNRB2rxjP5GzicSFgSYPd+cGoKbBhHYEapY3UJ
 qVbq2ihymBzbhA54ExDhqrNNNw/i3QjlwwY85S4wNxnGjyf+Eb7/AbiaQ
 TjVj086in4MMmZKyL2zTT6nBVB9GbhfqOZ+VoLkWvDqeuFtqcpby54dd/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383785969"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383785969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319610"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319610"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPxwm3+kayy1ZAVYmN+FzSYQIn5qqGKtKGLYVyY/Y2ThKWAMSFczkEirj9Y9nI9fkAsRUh21i8OTjgyWsiHSmAiy3zz/XgU7doBzu9GNVP8e9tmgQtGImLm2RRPYTDBAlXJSk/PhSCAFGwewUFmCb7RE67v+Oip5K3QKCwcQyQZLbhN56Dttm2l7+HnMn4sW0HtrhC9F6vgcn2zfU+6fXig2ehoYDX9tC0TLtD1P1IJANXTnkMLC0h9IfX7HpDuwX2FaX+erX5Ie+tthjJ9YiPaXMTeLzLs6FewFx2KVoZr6IH0xjUtnBy46t2VA+nNwnLJ/roJeGYzTael23/zH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBfxn+21v8/MC+OmoWhNdV+hKJdwpH/qbOBfkVW8+r4=;
 b=Z3IgSVpXLbFx43CJ9v00ft4aTni+sT5ZzyUc+mwuEHBYZ/CG0Kg+MOh/1tIH2H7LIzrXOG2GQfgo3J+iJdP2G9RF1yh0yz+7fCbNvi4KN1SoyKqQkFaaqnUguIM2KwHUgUyfeKPrNVg8DYsq7ZePawYY110de1yustcIXKOwnmdgi3RTuYmM/VhRG2Yah1fN1fELrzEL/clAS49o5+3phCu1whpp3PWpnNqvyNt/gKiFr8dbu+xVcxsUlOE3f9laeZAk8qiJt01I/9xrTfYHtgmEY4zegiM5b/FNgmGtNQ7xobeTr92GCbTZqPUTq1jjB+azeovaY/br/HxoR2eJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:49 -0400
Message-ID: <20230919142000.91363-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: db533eba-74f6-4c45-e3e6-08dbb91c5330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVkTViS0pK75yEq7AfAkIi7LEC+eP8lJMf42Ccqv87Xb2skITufTWjY6QG5e7j0iCre0twAWOf6fFkuey6sOf922N0RmFQu0lNAO8KO60aCrRbgmPhLLz7dNO9wbKeSRR0xxp7GuaO5lpn2TcRmK1umnKcL4DedTEU94i6SWB+5aZaadaMLQFFWbQIrDDSY9im8dlxo0SylcJrO19zD1u+kJQSsyTHhk9FiOKHFsm0G8p1a6/lDWa9cFkk4ooRpOq0ZZ132eqFY3dVyV0JOwM1+IHIA4pVRS9SlJzVFEbLum89ZzgHKz/ZCFMxVkHvzO8g2LCzrKt1KL14rnqNmeApY/JTLxsR7K5pPIia0G5bRdYTmyw9oLagcR3nMKB0KH4XJb3neGBephV/lMKH2gALUCcF/BiSRwH32IE79k8kG6F1BLZ0lV5JN9OTGMblmqOoUY/lvRcBMYstHaMz6Z8b52WfLAqZV/o0ealgn4nnoiwvx9Zgqt9wRF4yepLKDcCDNhtpW22rUbuHyX83Optwrtfv9+Xnr0Bj7MI5rKRMeQpZ8mOndKTrn3Xa7dvXV4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(450100002)(6506007)(6486002)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9YJYiK6oJsbiKUja+r3cjvvUjt1Jz/IdcwJ02CYuoW/4VtV/nyHIDLmPkdPH?=
 =?us-ascii?Q?F+cg0eS/3hOl7dYfsBteotKkafhIHwGqmIWlYc3O9P8PJY2rkh+y6Z5btGe9?=
 =?us-ascii?Q?H6+Wu+s7CD4M6KjLAg2loWJ+JEICJ4huI1GhVxCA/HJrLFGl8AaQCH3EUys9?=
 =?us-ascii?Q?SSutenHjTmhuCuBB0mYe4IqrkvQb3NY8F2O/m9jTRyHfW8XZ8DseLTWAWsTN?=
 =?us-ascii?Q?FDZ+rNi8I5UxtpairmmaBDoF6fi2R9umdS6tZlww+k+Iae+UA6ysh09OieeX?=
 =?us-ascii?Q?MqlxOCjN6LytQFlzV/po2BurRMgniAmXxDjE2olni3NVgqH24DPzX2vPFSJ2?=
 =?us-ascii?Q?cC9qjRHBt/CFgOonNwtfrGsvjJjRH/MIBVJf/IbRXrRUTEGXAIXbUNzvdQiJ?=
 =?us-ascii?Q?vq+X1lghjC7WEnW2bDpBysYK4yyGJCdwRO9COXcxYkaEa6HPR9D0BIgtnKLS?=
 =?us-ascii?Q?OCP28i0Wi22lP7I6/0mpewr10WJapz/SKcO7keQAwojAKq+TQmHoUFUcWIEz?=
 =?us-ascii?Q?vuZHRjtwNm5VMzXFHisLI+HOGTZhK0cJZvfuw0ZX2w25JWVrUnO3fIN6MMWw?=
 =?us-ascii?Q?JBRNISA9zYGkHezOmgAnMbIEj7axY2h1XH+TXLbovve7AQ4rRJ1BuOcJYwJm?=
 =?us-ascii?Q?jYlgW3tQm5L/Xadw8ivLaZSLSTKIChJUe6oTFoU5wG44IAxb3MjOeno5Yw69?=
 =?us-ascii?Q?1ZvFyZJhyt4F5v/bc6BeH8XwzCYil1YYU7L+I3cOSi1Q56YItPNP0KFMt4kc?=
 =?us-ascii?Q?zb86sBb5Kgw1Ox9CPdgdOsN7KHnh8JqTWBlFtCWK269cckcxZOdFUN7af+jQ?=
 =?us-ascii?Q?2yTzujEfh+xAcL/EFMl4VzN3heB7mQMa5UQ423OIebWVkj6Zn7hGtFwqqS3d?=
 =?us-ascii?Q?UdiygYjR90+U1gLzY0/BzSs9Le6z/8u4T3qJa1ln0tYFVInv2wPcDVWLpFdn?=
 =?us-ascii?Q?NtcDU/mQV+CRYtiY5zU0sIdYAQwL7G123IF2t+rRLUTJ6HByMhjx5IYizgU9?=
 =?us-ascii?Q?2FM/uXFBZHehTzloY7j9TrbwnVbKvB0uwKk6AFwXrmoXJNL1P6Yaz+8aldOr?=
 =?us-ascii?Q?ryo1ws40s+j0AsttHI7Ho/9q0QGWmhvFJkxnCmatHr/PJlNgbQKfc0zuWYyA?=
 =?us-ascii?Q?8hxVy5Tf1qXyvZstxynPkSeTFmMIVOXh3HuZ177A1d6ettbYXwyTtFAm+ob7?=
 =?us-ascii?Q?Nt3NQ7rdBHl0I6PATKIf8IyNMqdJ9TDlR+euZs8McS/bW82K1Ww8ReKY+8ph?=
 =?us-ascii?Q?svW5jjiFnHY91MTwyyg3pjuvgebJz8Rxb1mqOPtb3cqxDrAjO0txmAsegJeE?=
 =?us-ascii?Q?1X7AnsAftRbtamEiSELRQnZrE3+hWIe3a68I8IWWZsBehdI0veDTQzdRSynr?=
 =?us-ascii?Q?yhd7ghR1VWn6puV854ndLABkaTZFLorJrf1gaZLUbptSxtVqOt4vrWp8dOLY?=
 =?us-ascii?Q?Gyiii2dbj1NZB7/4JdQIA1DvEWPsF3KbBcnafIH2K67zp9zFZJbjBpAq9d9f?=
 =?us-ascii?Q?8KPPiVQrhQMgzrV74EqQZne8txSgtQnOw+Q5nhjezzIDP04RzmO/uV9OeWI1?=
 =?us-ascii?Q?YkwSShKwJ88tm6VfYfc31kJzKXpODQcHrMPW85dr1xfBu4kyC+qlqtPoKhs9?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db533eba-74f6-4c45-e3e6-08dbb91c5330
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:51.0822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTLjZ+NpnO4tMSdesJZn77OUYGGpgYE0SJlhR/IH9LJqhC7ajlcZdTen3Xc6GjIQ8QXnMCUpxh9j4zvrlLxjxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 06/16] xe_exec_threads: Use
 DRM_XE_VM_CREATE_COMPUTE_MODE when creating a compute VM
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE was used creating a compute VM.
This just happened to work as it is same value as
DRM_XE_VM_CREATE_COMPUTE_MODE. Fix this and use correct flag,
DRM_XE_VM_CREATE_COMPUTE_MODE.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_exec_threads.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 1f9af894f..d19708f80 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -286,7 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!vm) {
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-				  XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE, 0);
+				  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -1076,7 +1076,7 @@ static void threads(int fd, int flags)
 					      to_user_pointer(&ext));
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-					       XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_COMPUTE_MODE,
 					       0);
 
 		vm_err_thread.capture = &capture;
-- 
2.41.0

