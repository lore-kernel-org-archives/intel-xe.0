Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD9C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 03:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6364D10E002;
	Tue, 12 Dec 2023 03:19:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7542710E002
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 03:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702351155; x=1733887155;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=QEAetJfH/2TwUS9Ad5qltKY7luM3JR4HJRF34//kUoA=;
 b=BdSMYMfcYzhXvP1CGPzyhK9+PutaMuzg5r27NzrfegH1+pa9tzZnDrbW
 B+/aUJoIXyY0/5hoBSsHX5FtYE5r9yKqFPdOpk6LWIlIUuhMrZdlHbwpg
 PEJow6mCoFvEhhlDNlawy224hDq/QKA5irm0rr4iHG45yW+vzPAd67uvL
 dIhtk6mFJ5r8jRs8dFHlb87kl4Noi6h778UbsvXA725eAY7yPuCKUhDYI
 wZmYoBW6Iv/uFI+zCBETi0zFXs4YOBiM9tpqJhh2L8kVm5lK96zwd92qk
 VfNoDZ2H1Pknhf5TCqSgMAkGHE6F0wWT9xK/jHvMt5YI/lVRH543xDTJL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1560556"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1560556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 19:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766647319"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766647319"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 19:19:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 19:19:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 19:19:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 19:19:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 19:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm2uImwoQDzshrSlJnzCpUiNgqezz4gRXOQPMTTkIVMT3n46Dtd11mwVpgbSYtERxl8jua7cAwwxm7rG3NjcpwJBF+bzAt/DMJ35YaF7sx4NBwE5nY24bSZTB+YFQY+WndAnXvstna4gVfdAL/xwdfSNze/gjcQV8g4MzyH9PFrTAzcIQggNqb4vmOyN4K9/EsLrr1SdYhPzMIpc1Iy+z6qpdOB/6pxNYhxp+gc3fgW8ZTurixbnGr/zYq0R6mY1+l5td6tIXB5vojt8yfhJjDZIuZSjWt9l0N0pdN62A2QtPPR7P2lbPtvPcRyHuxGi34/iDyTtRYLX5q92MHdMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB331seSaOKmm1vuxy4X6OMuzfsnqUdfjv1taf1FBVY=;
 b=gF5XgBtHXpt0kH9roDj63A989dBkJYnqIwY7qtLGWuCIlBo4xrtPgRnW+f4GuCA6d+kcW3j6DY/Ig9v9ecf7GX9OTHcRdVzdSjO/swSZQIg7Vo4Ac3mMUf1MTKFg75xbVDcr9vjUlwYBdmbpjXmEz/HDcuqA03v6gwwpJt1kKWYtIaS2AHGUCSDDsNSPr7uxpC4NyLqFOWxZIWpCvXZNqPyD6INPUmZ3A82CuQWlRKArhReMSH632zqFttDOMEhpHPINzh6hOuQ3LU/SeNr9Uo4utJvEU4OOZJ0ozQPVRnyI1tGxZRyTcGvI8Lywdk4x18WVCra96s/IkNJihbaLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 03:19:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 03:19:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Date: Mon, 11 Dec 2023 22:19:06 -0500
Message-ID: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: d239341b-6d7a-4230-e61d-08dbfac11c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdidPK5HW5tlQTjlfRMOghfWCnYa0LggCNtNnuqleLwfUmaknNkXHMwvfsflEyAzy32eglxeqIyqwjaTJqAAbUXng55O/Iwd4pv3ZXhg7rVLMJ6dBHpRzkZMzX2WJLlSTxaeBl8cK1Rm8FzZm0049eRJogTTkgAy9CCshCsmvYux4XJSaPaOn6CSeJcvXMKGCYa8a+BWqMki9YFu2NlTFWb3mAhNIEprd1WF0kmi1Ua6DEuKDeRzUc5wRP/zH/Wg5MMegoYLgN4bx5PzdGvcGorSpGL/2L3x90dn1L8tCYWPruTwuBmeaKv38H+pEYFr8f0emxWbMOe8pZ1vvribJ+eTcrBM4N1l+9BsDCMNa0bSf+oNi51uUbGb93ZbN8nMON8c0z1a3hgtpSPChtelJNulxRvrIgCalkCiofMwMLlSe9UFcyHRMIcklI+hcLOGk5OWZ1R0Mhqm+sGv1pFlgM/cjaSsE6KY8MVuH93Qv4InrxuI7nIwFnGYJQ3t/UUDx3orDimt4EM3mcTnPfbdwGXP3vgZAtiZ9PWlwOlGHCeNHGYT7VdwR9RxySk9KyIz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(4744005)(6636002)(44832011)(66556008)(66946007)(66476007)(36756003)(38100700002)(4326008)(8676002)(8936002)(5660300002)(316002)(478600001)(6486002)(86362001)(41300700001)(107886003)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ushlUJpesbHrdNxfBBuXkWI5+0T+Jc9Eipe9WPdP8CerL6wF1pjhn70I0UMX?=
 =?us-ascii?Q?0BgirXRLMqZfTARxBmg/vf+cwSbRalV+ikPr/zv/d7vSBFzbEIn48hAbWChs?=
 =?us-ascii?Q?uZppN6v6+jcHW+Hdx7fxWBr595Ud/n03cImOEJtTrv2I780rj0yeTyrjanch?=
 =?us-ascii?Q?+qDCCwBMhgLBgcy90MkYuicfHSXNNm4dXgHDMpCBjp2hbFsZWWRCaDeT+5A1?=
 =?us-ascii?Q?W/KEdv+Qzjguk/gx9X3cOknJJMHAMCVn4ul5PKmon6/l4sf9ouTdBZ3znMRy?=
 =?us-ascii?Q?WXyAFcb2vFziLLCwquwr+gLfJ/v7/pUK3CUIHBer6w8Jwdi6q2pI1asBZShN?=
 =?us-ascii?Q?uMwBSHHEOMfTwFYsX3fELLymaseVo8nOxUiUieVVJG0Q29vmAciS/DT4RHIE?=
 =?us-ascii?Q?Jjl2YtGqoWK/Uw3JUcQGoCnbpP8cltlg2nIR3msUlaGxksqOiF1+v7osHFqW?=
 =?us-ascii?Q?dR+hhTpeqLCqoOofc+BaGTJUDaZ7ZyVXKCdB7foce03afxB4ZzlFyamj8LQV?=
 =?us-ascii?Q?Y4vm9nM951Mt4Ru5QXl1cPZVybWFGwAYWKbiaSNnLczWO3aV4QSNtFMBCT26?=
 =?us-ascii?Q?5YFZbo9BlsPSek/KVCSUu172yDcVUYR1IjNwuG9yPJl5ZIsk529J7GvQESo+?=
 =?us-ascii?Q?f3ZmdJBCH6up6GzjLPhzmGMhRsVkJg0qSbP2Ag08/Sovm0Pd7yDUY4e44dKQ?=
 =?us-ascii?Q?rv3GD1qrskCKlHEXyXTZH43eyJQCTUTUuQ5G2JwRYma32eSH1Rb0aRieF8z6?=
 =?us-ascii?Q?nXbuskLwxoSeANE+Qxd055dqug50DzKGKk/By6B93vWnH4nWLGu7KJ2DOfSs?=
 =?us-ascii?Q?43FGEMacRCToRPP1PSON+MVDIsRouzb4PAHV3iJGSWZ0R4GMkpwiAo54ZzfZ?=
 =?us-ascii?Q?h4DTR6R3tuTtUQ4k7zCeHbRX51dpspsyCnRB79GYuuZbah/F7fM6txFuumac?=
 =?us-ascii?Q?WDQdrGdTgRZJAJvISN9I9QbiPvR8uOZTN7QgQbrwPtfeLvt+QXT9AM/Wzq6K?=
 =?us-ascii?Q?lahXnVen7g+uWzPW11WPaZPhioWsxz7m39psi4C2kpIAlgEXD8WCn4SMHfaZ?=
 =?us-ascii?Q?LoYtOlhPB8bd5Nk0JYxhj+A4CZeYzaXh1YQeM8xV2uHfQTkFmY/pZcHvMLMS?=
 =?us-ascii?Q?fEMrH8W/8gklZMHnccDJ8Yq/AABIHaNoVLCFK3YF7Z3+Lg85a+5x0n8DWtoG?=
 =?us-ascii?Q?xJIhJGMA8enaapBBZEihftuURU18XGef2upPl0mpdR0I5x1l6MYRo89P3VcF?=
 =?us-ascii?Q?RW26xscmFaZOXXbeKc8LwxT5Hh6qBhNAq3H0SB3EqkCqOyXDn/YdRGHvSr8q?=
 =?us-ascii?Q?66035+tEOxYVnfBctwdZTQJ2mSrPQUr1MCc3/Xf4jZAYyiK5iKiJiPbARs3f?=
 =?us-ascii?Q?6fEMR7/qIUfBahqZmvA+udGhXfKbUQbhcyZbwbNQO35QQRoZdNyapUQg+geO?=
 =?us-ascii?Q?hwaNdER9AMcWoTQ4vt/RF+o+0iSP2EJ977t50pxcs0JTJVGfGZ+0ROgze8Q2?=
 =?us-ascii?Q?4WvVJ/3TDfEyEnI1FeY6clrZHblKBLJbnCO7v8Go9y08yud+WfeFcBYMRkvv?=
 =?us-ascii?Q?0gAiw12U1q70U0yA+XB0yPSm/MMihnm+eaOwxcIv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d239341b-6d7a-4230-e61d-08dbfac11c5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 03:19:11.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fP0/pcPcDOLTg8uItvYnYTz3sOARkNNCGL9pgO888tmPNc8YrrVh3ojkwz9Xsy9n1A/Xzbw/rlMJ8vKVf/NPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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

---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 260e8a6034a7..9108e1d43c38 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -375,7 +375,6 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	{ }
-- 
2.43.0

