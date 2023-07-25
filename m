Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3A5EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3847D10E19A;
	Tue, 25 Jul 2023 22:12:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D291810E19A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323131; x=1721859131;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wovNgzaLlFJ9KRIPLPP4zkc0eEAFwGfGh4N4y0oHav8=;
 b=eP9x+25X5Xn5gF9h3tH4Ts7TIQ8CaO9kHHZjteBN+JnfQCFjcsvHO+Yy
 1Ke0E5VAEkMD9jtS1DYXPYzAHlg/54c4vbBBYUI8tqe4adUty5ZCqmVFj
 mED5c7U6iMJ1K7AviDlYPTT3QGXWfWqpU3V1qMEsZ23zSOhTjN2EpC3Qj
 gKNwt5sslhkisbrMD2BOstsiP/2pvWjY7DYK3Po+jI6iZ+u9Py3XKui3E
 CLYuCteoZJ7SVwk/kg5UsObAsTzghg/UNCI/BaGcuw4+r1RnIlnMLScSw
 2zCeUxZtzYtLxkY46nZP6U/06kZubs3wFF/29nFy8RTXInO/s93XS5WTz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398775331"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398775331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729552500"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="729552500"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 15:12:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:12:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDOPTjOz3S3kePjx2HisDhm2VZyzP/nr3SxEvQzCgCrn1IjVduYK8URI7VPNmLBnS1f6+mstjWigSW0qGOpJF1fBqVMDEAQmgoWvB1cK+GKT/tnGItKIjeKJS8VPR8WOzwoltzlLWH+ptB4RlaHDBtyi/BGmEZChb90E9Rlvw64L0lD6lSY2crrCymY8gVSY0V0Q3ce4Dnf2iC+uCNKy4Ng9fzfwGm/otP1lX6xeED2cPQt+QoG4zkkPUxrXwQxYuDuIxyqQ1dQf4rSK+WPJOW2Eg7Ar5Kn40XmPLCl70pXY2+1QBFbspz16mPrxMJeFCgEsxjYybqgyZkybZr9cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMXlDWvz4BwodBCreoAGLArkDt2oVsTkOUMr7C15/yA=;
 b=lUrUTOS5UyjkTT/Kc956gtU8cmS5DYo+OfgLO16QQa3F15V7DcDl7DKzpJVVNhAk/oO1QZXJaeQmSb+PFoSP8tr8WnojmWINSBDQEUicleiOrxUsV+zoW2gAdME6SGo2EGg8FbXNfZgQZBaLX0N4U5loTaLZeYHIg8rDcmcjxrFINF+hp5yO6icIyZ83NMJ8FPLKOhEN4llbK0f617yTA7uIfejyMD4EJKWOtNABVqMZJUZAmHB6T67DvgBlGEe5ziYsNsRRVX0LBw/KNXblyQrVMDo8NK0tLjMBMrt9DXIw6mlLrxwXkWmXp8G81Mnu8n/066goOM5dyJaHowHGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:12:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:12:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 18:11:55 -0400
Message-ID: <20230725221159.354618-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1984bc1b-5c28-4e8c-4fa7-08db8d5c2cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/+Wxu/g9lIEwJFmnXFi1WjWjQT1Zeen7gq3P2W9H3pw3o40TSGXeTF8aoCww+ul3U83WSUYeng3OIroyKEANlE8B9S6PAFtlOZ77Xd90nvHcex6gogjMsBuiEMc7idNEXZJa//SKBA84hJYD8BSqjhbmJDnJge20kgyoe/opljvT1W5El/Ua1r1Nwg7MH7SzZXuRCmGIOd3Ksxv4hGXG3dFiXDhcKQ0+ettfm0O3sNawY/WX79pwJZixzhYKTX9sc/XALADDL5yf/m+KN+CHBExTspk+azRVWa0xklea9NWwYYA/HuHbMUB/7p1g+W8606f4tek5dKF/anMf1FkHAfCDNcLH5UNNkU09BmL/yypMmbSpw0VvRsCK/Z9g3Jj+jf5ndQ1nsr1HbwISmg3rR7xpb9Y87/vmEtpARkU0zXCfvKS+hR6cRwSzvxTbf62xm4fK3vy6Ln7W62E267BSNLymBHy1+ER2BL+hUcF/A+uETWd6OJkgS7Bz2PubtkiqRAAzemJ0FcjoQOP6qeyqQAiWOpoXKxJykwzP8ZLimBDFMLIbd9VZGFSs6JvWRR6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(44832011)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66946007)(66556008)(66476007)(6486002)(26005)(107886003)(186003)(478600001)(6512007)(1076003)(6506007)(6666004)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7mt5sMQdYDfjWP5I5pd39P+FhMQYK2hgf9vFmoATSj35LDrZjG+TubRxPg9?=
 =?us-ascii?Q?KQ9oBDM0AnqywKsMY/TSOaMqOtk4NPTVDikX4ub9MrE0J6988LgUMupMOjTL?=
 =?us-ascii?Q?EvwMPcwL2uFegU2ZvOxmOOgURVmKk1qgtKGDUw3T7LnzZJpC3msm10lZDMLQ?=
 =?us-ascii?Q?XlQHIRmKAUGIBtCemi3k1AlqoSCpBKkzN3AWGvx0Gnf5M123cirt3xOCxkEu?=
 =?us-ascii?Q?H6iC7iX3BNPHXwgwqX6alz7D7LHltfKRgvrDnxJUgmsDj8TBKb2W2H8dFFuI?=
 =?us-ascii?Q?/sA8unR4lc96uUyxeXji32PfldqxrSy53cYHleQDhjw73BKzdKAnzDehXxyQ?=
 =?us-ascii?Q?ywYcDPwhnLl71luAYEjrm+xK3Jy2Xss4t1taz2FLNuoqVn8qQfiD2BdNdHit?=
 =?us-ascii?Q?dzpv9isZnSZlYGAA4n/SJoS/dzztO4Tp0QjKZxJ9dk5ObluRJX0RWkK0xW2E?=
 =?us-ascii?Q?6MbIcGTtTB+9wertQcgByYCdohvLi0jeRpMqkRkwRZPJnPIjnTbKTm6LSV8k?=
 =?us-ascii?Q?309hDQnAJlpYs+jh2eYq0P+w7t7Sj5KaOAU9tKTUir9MkythWEadtytYovha?=
 =?us-ascii?Q?zJMd2F6cuO462Gn9K2XL2csaL0DD2osfvTkp+fHAjr9tOdqj5hJdiHhAUE9V?=
 =?us-ascii?Q?ridkfzfXyeFPvjkmtcjhyP4CP0w0MG2/upGp63KGriLYxRXTVuH1DqSKHL0w?=
 =?us-ascii?Q?0ioeEOA9Z0W7RVN96xAiCC8CD1r9RZtuFSUTEFaeOUz2S0e4tPVR961vRSLq?=
 =?us-ascii?Q?8kqiUKIEyzO9bnj2UIlpccewmniCJJSlhm8aSFzChphqmt0SCib7XlSbeoGs?=
 =?us-ascii?Q?oxpyk2MQXm6rnCx6FV7Tg44vtD+rbQL1kUTFkuvNoy7hN8iy/QyJfXbnG3Zx?=
 =?us-ascii?Q?9CuHRr19liqBzwpfHoNRAIC28D08wQNyGIZtC/zRd5ZsAjGkm+pJ63d8QWA1?=
 =?us-ascii?Q?U52xVFZg+RCP81iVRwODtDFbnH2GBfQCPmBWmPPYC1uMHE1D6FQAX85gv/hV?=
 =?us-ascii?Q?RoeP/l6VaqHIpttYgpVnhbA1eZ4na9mQJuMnprhqwy5d3oRc3pqpI7w7Bqrx?=
 =?us-ascii?Q?yjjNe8V7RJUhglR85lugEAttA/OB4lKOEJQqgY6NRuwiq1F7C+FMMKxn3/3Q?=
 =?us-ascii?Q?KBsB7mYLIbdwZnjuxExhNV1ij6sw0IIIwrCpNOmjeQCEq7kimcIcjOESDxT3?=
 =?us-ascii?Q?T9kJlv0UvhLFyVkY/+QnemLFtaL5SWUodYu79I2Gb6PHHfyNCrHTWeg0STq+?=
 =?us-ascii?Q?w9vsQWz8lKKF4JM1ycc+6Jx9dOq9s6ynhabp8LCn9dhQZx4Ce1HHTObjwFTN?=
 =?us-ascii?Q?UmOKWBfZsKky8jFtUvum7DM27FSj8oqKTYqzyfTybbU0Z7Q7aBfMYE6qOUHp?=
 =?us-ascii?Q?chCQswDw6Ikp70ARjtq32TTpvtU/FRkemosT5DCcGOmP8BQH9FRxncN6jQt3?=
 =?us-ascii?Q?tizxyNnm3SV8S6cnJsW8tOYMqZvGjhJDxlTQXz/YFmGqVGk27v/OEtWVtkC1?=
 =?us-ascii?Q?LL4XKwnLGB7QvBCs6iSEaZ8/IIprnTjKZ9/d535YxXEbRy/IGgjoVA4buaAm?=
 =?us-ascii?Q?uZoYeRRlLOiTmP0n4Ywgn1C58ozSWGFa3H8attBpUwEhc1yD3ESDiWWtOju+?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1984bc1b-5c28-4e8c-4fa7-08db8d5c2cdb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:12:03.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4jK5wEQdC2CPc5OGJcsDGZTc75YycSyw/re4cmvNxKGNNZ2xGw6AtE1Nk+TJQ97fqlbmUxC81z4tqVqPZJBJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/5] drm/xe: Only set PCI d3cold_allowed when we
 are really allowing.
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

First of all it was strange to see:
if (allowed) {
...
} else {
   D3COLD_ENABLE
}

But besides this misalignment, let's also use the pci
d3cold_allowed useful to us and know that we are not really
allowing d3cold.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78df43c20cd2..0c4051f4f746 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -794,6 +794,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	pci_save_state(pdev);
 
 	if (xe->d3cold.allowed) {
+		d3cold_toggle(pdev, D3COLD_ENABLE);
 		pci_disable_device(pdev);
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
@@ -823,8 +824,6 @@ static int xe_pci_runtime_resume(struct device *dev)
 			return err;
 
 		pci_set_master(pdev);
-	} else {
-		d3cold_toggle(pdev, D3COLD_ENABLE);
 	}
 
 	return xe_pm_runtime_resume(xe);
-- 
2.41.0

