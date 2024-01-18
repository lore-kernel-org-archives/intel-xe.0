Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB26C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 21:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF60910E1A9;
	Thu, 18 Jan 2024 21:49:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00010E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705614546; x=1737150546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yyuLtwkQoSOF5569GgM8Ig2WYX8O/vMhVXNfKrLEDcI=;
 b=nr/UHzJFCHMYgVH77kINO+/fpEkcXN7SKaIIqbQvA7vHsnRsaBFiLmSs
 BVx3lk8wZbfBJnU/+61pZD+AIF9Nh1K+vyhqwqQmQQckXTPQcvWRdMcbb
 JoTwXRvXvzl+npVDEng88azfTYR/fxu9JWKHiJgyFOQoGz3cmhr4PX+uf
 PdQ5C9PM0ZL9jHvJyKmNg/WRkn3oWhlouW5YsZbp4oyXt0DfYHzLI8qjK
 C9KIXXAjaDWWjE060NjTFzB46QsQF6qTFJD3Tpk4WpZdC5FZO+8CixDJt
 q0j1sic+ZaOgO6y7q+07RiTcxD4YWZK8xFI+w3s/M+A+BOvgMciBvK5EX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14104476"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="14104476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 13:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="26586126"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 13:49:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 13:49:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 13:49:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 13:49:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 13:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V35reEnHy+5ZqxaU+FUS0fFoKX/zTiG+8TMXs5IjPnJpHffri5Kbo7zZ1AQkv4auPFujTYt14jeacczunI+1VA/lJ5PZF47l9Jfs0TYkAItxHLUMyX40CnezCOlxefr323bykXoTl2XFwXEMdauBwDM9UGM9EaXuqpDVFaXpTmt6bf0WP+vIoP7IaP1Y7EbRTN//OFVEyHUia9+Fdq2Zt07Cq33kKnRyCFTa7SJ5bTZy2mvLr0UbPnmVgKoeZx/BcY0ZMT6H7O7vJL/pt0HR76Kuy/xEcLG+ZobGpZsVClg21jsoITZI8O9AUscGW1J30VA1nEOtsMR35sksV/1L3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+PVqFYi/aA51v8iv4/4qFkc0rFRFKDNHf0gjd8c/8I=;
 b=XoEgubIj78tAX6xJok0c0MS5NO29jUwE0HnAJk2FwauJnjCEo2J4ZM9bQgk3veuw/cRxDEyspypOlTUrB3xz8XksDFn3oYCpSBimprZl1EXe6UVG9iGqM8/ovDtIuGAkalJzwrYlrmdbykFW2Ei1fnWEVIhf1i8hGpkssNhKR/hJgyo8Rb4zTMzoqhsGKj+uXXkTnuG1/VXEBiVuahgCAhJlwB7Lbr0rqAU1EqTf1dYZmAMX5Kl49xyPz5hbwvlX/UvVqBduSMBsyJ5tOp3KPa8wKkOVhUuQU9aI8lNiQRjcAGcNXyVxeMPSqbASsjw4IkgR6iS2Mm0yGLhu4oFSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 21:49:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Thu, 18 Jan 2024
 21:49:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Do not flood dmesg with guc log
Date: Thu, 18 Jan 2024 16:48:56 -0500
Message-ID: <20240118214856.399952-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
References: <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: b6798f67-5bf0-4742-5d4a-08dc186f4837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5d9FrqRSLbYyNnLbxDQTswYBXRBpksl1X3CbgkwWn0pId3b5zmdrsCCimRiiYcCTqBSWfKofaZNw4hVztvFNAge61iIeupiHwisX2/9iQhjv5Ple/+y27fSO8pSuYBVG3A9LZCegq4FCcLmmVEnbX9NvonJ4p6s6ZWhpBdQ3cJiY6dGph5Lssr1MedVlTDFh/JCDo4S91NqG1Mc5s4uTVEU+Lg1A/hoEZeVkG+yzCNRwUBoThkrb9SgK19ILTNTsjGl3HD/9HMDhiTX2nOAl52Lp9nxlelx1M6fcYQIk/fEm4U33F/9kXdVMjYok3kIgrcNk/0jFXptaQ4rsMYI0wSh43dlsVadtZEyltKSCAZysfuofXszo4RuoNMmsiBH9HJcVyRBW+UQjybUgLcmp/FOtHxUUIXPDzJ9oXMKaacKZPETjPloDInv9ot57qA7Wb5KG2WxbnVfMaTIHrltqeIjeI9Rl3yN+8z4LmwLvsz9/fI+8cynub4GnwINql2RkbdhN+BOl8nzLD/ArrLNGdOfNiSt9NIrxiJT5DNTpP09hhDrmuZZeyrh9jFbxryT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4326008)(8676002)(38100700002)(8936002)(44832011)(316002)(2616005)(1076003)(107886003)(6506007)(6666004)(2906002)(41300700001)(82960400001)(478600001)(86362001)(6486002)(36756003)(26005)(6512007)(6916009)(66556008)(66476007)(66946007)(5660300002)(4744005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rEIR7Ciwiv9vsjoo/nm+M6jD1jB4zhlFUYIPIqaBneDSuUEREb7BYBL2pR1K?=
 =?us-ascii?Q?TXLEK7H3ne7POip9ouvZmQtn0kCgdXRNTcpjT6QwSmQ7zwv8gVWgtndqfdLv?=
 =?us-ascii?Q?5JAVakg+NmwwQIVpZrR/tXvOUSNuJRAz+/JaWwYYc3luUsFX15K7QeLiZSQ4?=
 =?us-ascii?Q?sF7V8xKEEp/L9G+0MM0VHiCMJlXaH6ERtJ8lly25k6Hm4sg2hvjvHeQijvME?=
 =?us-ascii?Q?xlO0+0n+XaDHNV5W5n/nAVioE/jHXidNAkRaN5pLjHWwYsBZ+yBAFHjrknaP?=
 =?us-ascii?Q?Gu1TUY44Y46YOxZ5kIBuQ7AwhVpX+adk/t9MoIV4k2jeoZfreZdfpjmVnYf4?=
 =?us-ascii?Q?KMSfoy38QNSHYrwGHBIFEXH6rJt6gPE+c3mGfhwq74nVuhY6whbgA9xdX07d?=
 =?us-ascii?Q?m6LNLuGGLdAxcGAQ2R0zRVivTGrhaxYNy1WIhuzYhiD5TbRCQS6DvXTccQQg?=
 =?us-ascii?Q?PcXvkIR75C6YV3ZHs11ggE6HXy2n6roKfR/kLUBRwJ0EB4Mhwok/ywbMv6FX?=
 =?us-ascii?Q?hoxh7b2lBSkjoBKtYh3I8RiHtBFn4yikY6jWZ9M8ZGmUu1Qc5OhZef4rWOzX?=
 =?us-ascii?Q?quO8m7S/uNiqvav1HuKmMyw+a85aN3wZTv8nhdLg0d9AiFkV56R4tHVxfcGi?=
 =?us-ascii?Q?1PTY6C94QeYipwtHjweqGmwh/AI2Z/QDCaBRbGpMYMBsuwLglSPDJNkLnTAS?=
 =?us-ascii?Q?7qr/gGkTxLLTx0E25dDk1hpngMl3yJT8hxbnAp+vtDEiZZl7v+vmvGOJhxBw?=
 =?us-ascii?Q?4Za6YmI8emwjxBcQ9FL8SOaC3Axsmyx7L36fHGR2EjLqocx9V2cUqaEnlp/2?=
 =?us-ascii?Q?smL9emuDPM4CO+xvAYvFAPBQzF5hGudXh74pOL8rb0w26+5FUBbvhntlXAuy?=
 =?us-ascii?Q?kcQ+ZM3hI+ZS/fwkMHLOJAu6A3x+zoheCUhjbkgM1HmCX0h6geYvIUBy9vvO?=
 =?us-ascii?Q?r8WK6WblLudhsWI7kFClUtGPQ9H6Ihe9RECyepQSCJvov+LwXUTod9XF5EWc?=
 =?us-ascii?Q?/Iom1tJi/i/MUJG4nrwJsl1K65YzdY1h6JuhdAtLLDsgworZX6bVjTl5VCUX?=
 =?us-ascii?Q?ceBGAaNPG/8p1P/+v6/YbhzbVHR166si2+TyCao/k3ZCFIi16lOuOu1dOydp?=
 =?us-ascii?Q?/7eNZORgrZcnumvKkJvWZnFX7hLhRo5DndOOYGW2ZUY3XVRpRD47/P0g/vcR?=
 =?us-ascii?Q?WpntF4j122Vfe3Qm/xTEEsXIEt5sKuH2qf/MYCTUsRPzODUMPHh5+SzbURLi?=
 =?us-ascii?Q?a4NEXXV/QeV1fpyYxO2W3wUb76ywPNn+w26IH3osyNBGqkhFS9GSpmDuiIsB?=
 =?us-ascii?Q?AlAUv8tGA8c4NLirDptfcy1ZxCkylT1WvSviBK5BuuCkoR79YYAlAzk+DMh1?=
 =?us-ascii?Q?ZyM3OC0vXoDCnootXNQP54bmA0CBjTlb6T1ZGYzqLZQUf6I4zL9epAGKQIlk?=
 =?us-ascii?Q?fX5H9kf6KkLiwddRIugYaRkEdTtBgduYR4vWB+Ut8g+UoOj0Z1xvLEk8Af7m?=
 =?us-ascii?Q?nCvv4LZriH7CFzgzFcjKHCC1H/RkP3eKTqZS17895c9xdBELoQbpsBkBngck?=
 =?us-ascii?Q?cu7hMS4eqNppDJCjgtL3Z8eUa8SCe18diwOcEhd6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6798f67-5bf0-4742-5d4a-08dc186f4837
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 21:49:01.4155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3/h2ZIrgu4LJTasJSo+5LuqVrBjBpCoQrLi4+VsU3NXpC7mvCmJgEMu577EnlIejiNcr5DyPWaZHGIFmrwfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
X-OriginatorOrg: intel.com
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

This information is already present at
/sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.

v2: add missing chunk
v3: remove spurious line

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2891b0cc4f7f..576ff2c1fbb9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -456,7 +456,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
 
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
-		struct drm_printer p = drm_info_printer(drm->dev);
 
 		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
 		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
@@ -478,8 +477,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
 						SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
-
-		xe_guc_log_print(&guc->log, &p);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-- 
2.43.0

