Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D57C7EE2D
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82F810E248;
	Tue, 16 May 2023 14:54:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA7A10E248
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248870; x=1715784870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wRNIlaQDk1P9P6nv5D1g968V2CeqpOb9KiB284n0Zmg=;
 b=MR23PVp4NIugppir7hgCSAQWYnstMlDP5UO+Gn1zQmlZ/+YDuwO7QBHQ
 vtKFyCreCxF4Vks0QHEv246RG3f50kbfpgJUD/2JslhdCSavuQfgk/2kt
 KXrDOzgNJlEcsDWFcapsRbvTxM+cmMO8cm+P+d4/Gnia4p0Fwt2ZbiA2p
 FeRdsyrTFINihXPF9MVmvXOcO4TC0aPP1KIVqGu1SiODBZyNwZYv8K68r
 ICLBlQYlWgwo9Sv/TKrORwaXDfBGDkRW2yIYdx5ezhWt5rzOoS+d5xcQN
 aWjPvmm+QR3vWkPNe+EgvHHn2bscm8zWbfEjwuggjISMtIFKKqehJY2m0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379677065"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379677065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771095011"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771095011"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 07:54:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcEISjm4Y3Ce2sXLmMEnAZ3zQb6x3rUdW9YfJetxOpEHtJCjqoanLPdqQaBCt/g9qqEMjAr72jf640cCVRWzWTlE98ZMeASz0Jwk76/AKkh58qfhvbsaxTQSfamTc2h5YcnyKuEsNjfLnTAWIMSyxO+rWP1vIhboJrXX0xhZyRTTkSzpfJjNSe7HtZeP+byCR3iXZ7aBZcuzyMYkkd85Rsil2sSbnz7N3AHEm2/aESLqHulLwinAIJ+SG27wFk6wufm683FaqQNytlCek/IocxPFDBJXaMGSu9kssffWDmY9dRVVKMGeUHqoZ9trhdwxMcjxP+R+xaRs+p9mUsS3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mc3z8AGOUS4qDAyqjSs6FhSZ8c0iY5MTfdu2E8zYwE=;
 b=D/TcF+W41SSx08kDO/r2bu0JdZe+vnxnIuj0yMhWSLvrnkLa0HmXBzQEetgiGfJ+Ormp8mJM39tKGvkGiYuuqMO/wSKUev7Hx9SJtjTzaHW2IJEfGgTY2C5VixIH05Y5PXweRzxw1rOufMiacmzkTGrwKUb5WqwzlYgMbaLAn0QsZY46HxPS5qK9RLg8kfua+8BPDpgAbzZEGuLsURJiMC5l81yx08VGSfzsz34z/peB3yBYVlr3idzbr9AaTBlN4CK/v9HabdpEffVCyOvlg/KSTDUWf7ucGg1m7RuU0bmOEptHtQEovwhkq/JPHTTNqaCT7BXaoKvSoaDP2idJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:07 -0400
Message-ID: <20230516145416.1851984-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: eabecb5e-e9cb-49be-f38f-08db561d725c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFcw2FRLzvlS0Bs9gWtquMBUUEoEVqxOKYuBuPnEMC1AZbRFCjrOlaKArAmpXz8/Z1vunGCC5jWwrTegAWlFnKVVu4e47A7PohQoBo/nfUUSjoZVkchcO8XBQ1rh3U9yzsrpvEZlko1OloYjcbL7YFYG51B0nQQrbAYxQxlyWl6oTyIDl6p5I6h0t75KZFk79QS9+xF83rhvCk2yHeytW4IvNemA7+pJ3qsg81iRc9gsbI2UVpUW8nFsJA3mM0UbYg/YocqbiNxc1Or8hiqno+ZsY9Npf60kgLYab1fIN0+1AjwWeBMXAOqycMQ3k+rHqpJzz15LBrozeyKR6yhTUOpR3vTPED612H/WRkjDT+ylyweOc4Dfxn3lxCQ6d0HFvizazYSXzt2mu2ekAFI51WZfibq7vqZsfzFYPtfXpN0EgYyN+FhABCQkX4d3LZTn0aKXHwBcCa73PqSYXjutxAWk+8B5xYaByVVXAkDFrJbcPrfo3eu9kxMNvIhjxFDJty4Chhmrv3a1QDCLiTSh9WPWYBiTctXlLffsXzOtB9En0lJvrTxVYiuWlnAKM2C5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s/8mJfDsBdmBHkAMPbgZsqZCFfMDu2HWTW2YgvnNM7nNuYVsHz2sy+LieA0G?=
 =?us-ascii?Q?4h+ItwWaDy0dR1lReeW0pe0EjHktmddnfVWjwjSUxybNdIEBBM2wY3X5laXm?=
 =?us-ascii?Q?/ZdkmrZMzGsyztt0OEdCgaSy0ahA2H6IO3CIj5AI+nwF0+jyQmSQWj3jFilf?=
 =?us-ascii?Q?8uxvrqAD/Qk8fOeM4+8VQSRhwRADO0cVbpDqxpxQAlvQSPRUUUoCeVdOo5Y5?=
 =?us-ascii?Q?aFiA5Mgt9qQqUCKhrTNyZkdO0QshlsWDDPjm7AjJxwpBWLNX/67oYXjE8lDI?=
 =?us-ascii?Q?XZkB6boXcUDsediJJJOWGGvxq8tPXUjBG6s+Qd8ZB4lzibz2msqRALYlZVWg?=
 =?us-ascii?Q?y2LT09XsdiIKa/ROe9B8IiPC2fFvDkhKiJezyJkuexR3cWh87v1UMkQZldCy?=
 =?us-ascii?Q?nUfuMnR1kz31XidSHdjecPuxCUtb377M4r+pMBVgCwERkPZAeQHWTWnh5I1e?=
 =?us-ascii?Q?Kx2Dr+atikIhS/ZAJ8t9hEz24oH2yH3o6UZeE0J/iCW5E687MhtqduOYM1m5?=
 =?us-ascii?Q?h9nIH1gkaj6jG8two373wfjGC1axZrG6+lpkJEFSoxM1XRQnNEXj/cDIgVxI?=
 =?us-ascii?Q?XD6IrSAB7jInxEJ3yaekR822+GoIo/IA3oyW9JNZBeUfuRllVJG3ghhlJRoL?=
 =?us-ascii?Q?8cszRxsbn54Ezztn5oJwCGD29yAkDH9G4FRFUttHmQYqaO3UrgxP6m5rW+JI?=
 =?us-ascii?Q?l4SkJtpOz6TtnJA9orQ6rRmCmnIRMbApCvMsow4bAg3lIdqdtqM3RI++lQx+?=
 =?us-ascii?Q?9AJ3JrFbrd8ljS02Jki0jFMj986HIUvjPQwK/zPSvzmvwFLY7S4JwFrzWJaM?=
 =?us-ascii?Q?WN8Uy3vWGLJEdlRR5pP5miUzsFR69JrUczpA68J0lFlLTkyFrR2IvqDJZJ1c?=
 =?us-ascii?Q?c40jKcf/mMEyDl9VfTpGMAfPt91cN3qkwlKMsrRFa2jyB1WJgY9UEY2Xso93?=
 =?us-ascii?Q?Wimev767Zg3E0ALn6H3qDw2tDrr3euNdsorZ6daUnNz5o0pyF4iNL/oXJRpE?=
 =?us-ascii?Q?bP6zLO1XzIoPnd0cMZEvmFKL4FElNmhGe3Cs0xJRkFgnd6NVg4k1lBB8r0Eq?=
 =?us-ascii?Q?jDCtrkGfX7EnwbRIaw0DVke1gIouV/ziLGXYgsxipPeKXX2tVbY3dUu8H/eF?=
 =?us-ascii?Q?RfJguFzeL/Oy/BkVzo7bSxRsBqQrAQK+7Igl1A1+fMv2xU/qgePUWbsVx+F3?=
 =?us-ascii?Q?kyRDQ2S+Uq7fjZoGfwf1OalMFzA0jFU3O90y4V79F6rlQmbrqLfS/kU52/7r?=
 =?us-ascii?Q?WrlCvPF5CkrdGiFBLrVDoUcif2u1y2CjmbSd6AkZ7UTvXcea2yjP92Ft53T6?=
 =?us-ascii?Q?chemTfgFS7iCcU6hYYxpgNyb4sQmgqfSoKPRlxCHw9BauFnLS5Q9FPYklq/d?=
 =?us-ascii?Q?q3NffQmMCyQ4aEzX0W8lOuh17/A2tGvWjKNJVHtcFUDGwKlWJf3DSX49gI3e?=
 =?us-ascii?Q?uNH4YpjnIHAfzU7qblvY2PXZ9/MzTaynzWDwkc/v/EuSg+NgI64cka3i7NhS?=
 =?us-ascii?Q?qkEb8fa8ot1wZaLvmQA4e5vHSAjvrCtY9Mpi4XnkWmlylERqdVRopwhw5P1g?=
 =?us-ascii?Q?i5B3SmZAs2UQymjxnjLEMH224ozFQEERgk9KmxIH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eabecb5e-e9cb-49be-f38f-08db561d725c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:27.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxXpInL7E2Ed9nTL6LKZNhKgql0VvPtwhtqEE+h76z6d5ingiP+97dqVzUom9jTmzKzoimtA8D0tRWHcrjDllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 02/11] drm/xe: Do not take any action if our
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
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 56cda4bf35d8..566764a41c57 100644
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
@@ -83,6 +87,10 @@ static void xe_devcoredump_free(void *data)
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

