Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DA1EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF7A10E19A;
	Tue, 25 Jul 2023 22:12:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E410E19A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323149; x=1721859149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DO6KouYXooEfloriYnSMmeW8X5zUSh9kn/kqtbbjCy8=;
 b=nQf4XvymKdpWiQ9Uc7IcPJJhhBphJOk2ASHH9ZfqrJOr3GwUZ3paZLkP
 QoMOkrJ6dcGwrqRoqaEg2H8uRhmj9jdNzwUkxLiYpLQQjF+tmbBL+pAmp
 zgBMNe6z7P1CE5c0CYaaDLeiHxR0zW2B1pKi7Ch/r7WcuJ2USwiowuE9M
 evwoY7lt1Cux6YmX/cv25gNN1ypqM6c/pT8tUjkE3a8VuZhybh3h2g/Bg
 bzgVs3Y7Tryle9bzHWWHimGOiWykyKAdh3PAXcKISznzCERbfzfWstgid
 UG/Ew2pl/YqQlufBftxKsCxWY8NL6yj+I9n6TjV02ftTF8j3ATilTKmx5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398775413"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398775413"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729552922"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="729552922"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 15:12:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:12:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhXRwZW2UPJ2ZCHunG6fBnhIhO51RxpasJpvi/rNnWSj+GQKqbeIz8JqcgfKaTuDeIchb3KRgfj6J4bnd8C3RGRlMFC2pPQI7YoE7ByN4xeS4zaOiFBfLTmU0tojYCFCyHfLF3jd9+shSPZevYOsTDcRyBMM5ZXoR2pFisjxvz2ATU5uqSFmrQ/yd8DqLn51WhdeZY9eRV2XbqEZBVshSHV4EWVeO22J/zwU6k/0cXrsHxrgL8Wl2c8Pkhe9qKrcrEEAm9UfGt51EkpeGsxB9nHrc2stJ8dHFhBZ3L0X6gtsB5gNNMTxy5/+ol/l5+szSGsziYvqVa/HDpAh8appBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fljlAXk41jx/0wH9DLvCnzLfrhpAjYN5KNHExI88Is=;
 b=oTOUvSsButMHx/3DxezxlNPkIWXH/8EhLxD4dCzf04sMG/unlF0jM7FheOc7xxPp/Fb17U3x82glKHSG+Pvwe3/035kp5e6IkIahXsKmbshnhhAQXPX5dAhbrCYxVyK/XX5RuhbkJKCl3wD9Pn0kJVEvM9D+6Gf3U/XotgRFnLlG07W2fv3kMaezUC7NXsOAvjG1wnlJW0N58C5iYP3GboWe/xNr6IebWPOVI2qpfpahDLeTHyEj1HUeNMfKmg+Pyy1XFA5jjvzKETgyLvgYMBMR/E90CFNBiDXoZE9aSBmmgsuJ2nzMD463W/BSITMXX5dK3aB0l+aDfnvMd4Selg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:12:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:12:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 18:11:59 -0400
Message-ID: <20230725221159.354618-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: d95f132c-c05d-4a98-80cb-08db8d5c35b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSXgsDekeOI55LR+G/XQTyHt1e1EA6XyzksiKYxq2sq9ZrAzi6+oNLg8EWcQ4o7vOaMYATLT5vJ1/j55VmRkKlZlWvXJwS5b5A2aRlY6ogwUGlZ9XliB85MmBqsrbx1G4EFJNwpfmJ4LUnixYqfTV7JpItvfXHYA8CDKvycsF92KFAQCRf3eVq5RMW59lXFKy9GP2rwtY+br/bvMXmWtMijJFnMQiWku9Qw6J3lvXtsyKjC+u8Ppn/8x+KFKqfnfaFMMg8DvBz1/NH5q79R1eRUzu4xKMf3Bt+hmpjISiCcCbNv5mmN5yNPjYNMm+E1CWjfwkz6c5xMISIfVsSvwaSx6oQYFRU2FP+N0xCV6Zgib8RUivV0jGiBufuEwqxUlGgDYmKiULMHzNeAID72Qbb6tj+aWVrlh+dh1G9SieR1MQcCKB3xQArZYaEoHDL6b5G2ejzWH6eeff5uLkM5QhZqoeU35Wbjv76+zc/e/orMqQWhHHQZ0iTyoDT3tYr3hx8XnoNBBcsveaXcR1nS4TJe1O4DJiIF/Ipg3qmeWTEKIpYjDpVNIGWqzaNRNSbei
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(44832011)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66946007)(66556008)(66476007)(6486002)(26005)(107886003)(186003)(478600001)(6512007)(1076003)(6506007)(6666004)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tta/lswBtX2Nc76qSKlEwajFWHWJFdMLGiLMlYdr0BzuPNx+z0xbctVoq6lJ?=
 =?us-ascii?Q?OW6F1hWb4qeHQ4EUQmhhH+CbFC7S+RbdRXg2qvhVFEoTxgL+H3V1qTMgvUvN?=
 =?us-ascii?Q?kch1GfUEpUL+n2UhWs6eJPaWwhXLFReAjtygj0l4JbpjqgYxWczJfn0DC4Ft?=
 =?us-ascii?Q?3vKV8clwvbRcLwNxDB2ZIP3+2mcIa2A475gTq/X4a5YMpEP60E34dfbohMme?=
 =?us-ascii?Q?eR4MUCN3OE91pckqeIDi5ueclzYi8OkZcwYkNRuLQ2ZCfc0MZAaNLUb2Mtry?=
 =?us-ascii?Q?SL2Wv/TEGlwDWeci8cvBz7ogad2EX7GzShrp+78TaHYrUo3byaHqPQH3VzcI?=
 =?us-ascii?Q?/W3SMZNLwt9mxnd+lNaTEjGezrzno9AUfrVoll0WBijRtspYWTsAq7+8t0W1?=
 =?us-ascii?Q?GwTPDZ5KmHNMgaAesThIEyqHGS9tEcyWtJG6SkNGzo2RiOT7w7RtvcSUveeU?=
 =?us-ascii?Q?2icNlFTn7ZIRUnaitQxnLOdE2JqNkEoMkjhjNljuFpywEH0us20HSXGHrSyX?=
 =?us-ascii?Q?gykxcbi267f7qR7cbJJHcs1YEFhK5e2ebBsMAvZeub/dZi0hC64Xi03p3rqi?=
 =?us-ascii?Q?cb6+q1AAsIf073Lj9usy5ZCETTW0pmeWivUZMwk4mDV0JJQVLoFaYMwwNVwE?=
 =?us-ascii?Q?hVsGQHTOi4HVuKO6SZJeeZ0WORf936ciJXnQPrrEI8MAEw+4TwARfvRvOuIy?=
 =?us-ascii?Q?QSj01pQ0hk/DrRCxe576uL7473W4gM3MDjDgRfEfs/iSohK9WdH2Yv/wR/ow?=
 =?us-ascii?Q?Ect8Mdw2IkDhpZM1gziknLugx7a7psnezs+ob0Tp2EDy58AvjrCoaI8tdmt5?=
 =?us-ascii?Q?AvwTQ1wgRBwe+kRWOuZT1ehu8jdFfefphL0b+2/Akg3p+2H/3VjL/sSnd2/W?=
 =?us-ascii?Q?QcxLBnnOgU03YE5sx65AYGkwB7HYGxCCtcfQrsqEIsFB98F6n0/gFuS2daKU?=
 =?us-ascii?Q?iQ9IKLp230nzDMrNhfwSzMR/dMrFLgK3+GoiEeoMPqWaSFXJefHTAcAajHPI?=
 =?us-ascii?Q?mck2uTDtWrnZ42vOGt/WHSCxzvn37lxsopiWA2kSi2ppXTE9ux8nn+uz5E16?=
 =?us-ascii?Q?sJNzOy9p8HkACN1dzznfrTAUcb7FkqllZ7pZGtWdmToMUg5lZ+/WCdtBMwMU?=
 =?us-ascii?Q?7JIMBqK45lPZOCiVOyybZj3B/axSGdV1BScgYVXQqvC8RdmkVavCw7cezdMz?=
 =?us-ascii?Q?WSXtbxQ7hTCTEV1s5MsRqzjIKSosM+USy/nS0Q6PP9ai9Vghjgmwi/T7eUYM?=
 =?us-ascii?Q?RtTXuVEmtQze8UXWRGu09vSNae5lJhDajDevUD/GLtK0vFN7MSz7L6AOVzTP?=
 =?us-ascii?Q?OIR3cfxrfNurnzNIrws/NSVov+6ACrd62mJScE2iPVJ8b1HIyh0gfKmKyuxB?=
 =?us-ascii?Q?5wQlfA3g7JaYp5v2GUqEsXlHKRimbfkFn8RkAoB8ammUpoNfbny9Cur++7As?=
 =?us-ascii?Q?aStVRM8Qvo8CCQnaAAGT/j7YE2hPir2kvVXPwCfVjOpSmd1o/huMLlEFRgtU?=
 =?us-ascii?Q?sM5sfkCKGxFB98tBa46ParaN+N4FGGyiyshZnc+czksyfafU0XQGhe8iGaeq?=
 =?us-ascii?Q?pzMIvTInpiqOuSdiXoFuiKx4+x6vSPBl4g4prS0J9oS6BkYG+GkOeYyB8Trk?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d95f132c-c05d-4a98-80cb-08db8d5c35b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:12:18.3011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+klGdf0nCzG2MO+N9DlaPfHsXdTQhOnMCKnbqqtI/Hm7AliF4Zeq23SlIZG6ZViP9+WEReqj6A0eMRlDpjUUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Ensure memory eviction on s2idle.
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

On discrete cards we cannot allow the pci subsystem to skip
the regular suspend and we need to unblock the d3cold.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 54 ++++++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_pm.c  | 11 ++++++++
 2 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 06759afb4224..ec4ec769a5cc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -31,6 +31,28 @@ enum toggle_d3cold {
 	D3COLD_ENABLE,
 };
 
+static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct pci_dev *root_pdev;
+
+	if (!xe->d3cold.capable)
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return;
+
+	switch (toggle) {
+	case D3COLD_DISABLE:
+		pci_d3cold_disable(root_pdev);
+		break;
+	case D3COLD_ENABLE:
+		pci_d3cold_enable(root_pdev);
+		break;
+	}
+}
+
 struct xe_subplatform_desc {
 	enum xe_subplatform subplatform;
 	const char *name;
@@ -725,6 +747,13 @@ static int xe_pci_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	/*
+	 * Enabling D3Cold is needed for S2Idle/S0ix.
+	 * It is save to allow here since xe_pm_suspend has evicted
+	 * the local memory and the direct complete optimization is disabled.
+	 */
+	d3cold_toggle(pdev, D3COLD_ENABLE);
+
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
 
@@ -740,6 +769,9 @@ static int xe_pci_resume(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	int err;
 
+	/* Give back the D3Cold decision to the runtime P M*/
+	d3cold_toggle(pdev, D3COLD_DISABLE);
+
 	err = pci_set_power_state(pdev, PCI_D0);
 	if (err)
 		return err;
@@ -759,28 +791,6 @@ static int xe_pci_resume(struct device *dev)
 	return 0;
 }
 
-static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
-{
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	struct pci_dev *root_pdev;
-
-	if (!xe->d3cold.capable)
-		return;
-
-	root_pdev = pcie_find_root_port(pdev);
-	if (!root_pdev)
-		return;
-
-	switch (toggle) {
-	case D3COLD_DISABLE:
-		pci_d3cold_disable(root_pdev);
-		break;
-	case D3COLD_ENABLE:
-		pci_d3cold_enable(root_pdev);
-		break;
-	}
-}
-
 static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 67ca7cb7e8dd..8bb8e154e5f8 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -139,6 +139,17 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	/*
+	 * Disable the system suspend direct complete optimization.
+	 * We need to ensure that the regular device suspend/resume functions
+	 * are called since our runtime_pm cannot guarantee local memory
+	 * eviction for d3cold.
+	 * TODO: Check HDA audio dependencies claimed by i915, and then enforce
+	 *       this option to integrated graphics as well.
+	 */
+	if (IS_DGFX(xe))
+		dev_pm_set_driver_flags(dev, DPM_FLAG_NO_DIRECT_COMPLETE);
+
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_set_active(dev);
-- 
2.41.0

