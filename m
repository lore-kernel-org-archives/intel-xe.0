Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C60EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 03:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E0510E0EF;
	Tue, 12 Dec 2023 03:19:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419310E0EF
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702351163; x=1733887163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A6o7xZ30ENcJZEtjqCUbLjhf//LzgbFpUzIiOf6TVEc=;
 b=RfkRKnGCzhaAWyVPYz0IMQhBqBAQVy7AYcW+7FZAnVMGlavaamBLSu/v
 a0rR17eZCKmbiECkMxWO6VHJAFVJXVlUPm1ntjPCW+APF0Yey2XEiOv/f
 z7+iMwbbHnluQq0YJT6VTvpRwVVQ8GRWN6ns6+/6LfAUHar1zMiWMQ/+P
 wYbtUsiqOzJ3PpPU/Gn1avh4zmGaY6c13VghgL6HGzDwY+0PKBfSliHTX
 cjfdCsVazoW9JqtMvbFLmL55NCYfiR9yc/SnCP2WEJAAjdUvR9Jfaaecw
 lCtCgNzIIcKB/8BwXLNKo6IAHdlmzE4jCVQmX8TNveLHQiUWpM1JSInlT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374253021"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="374253021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 19:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14783768"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 19:19:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 19:19:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 19:19:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 19:19:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORkCzJNUo76eLf3S4Eb+ohE5LSq66QNn9tNZLOreWqnZvkdzURSm0D1XF0Blmcp20xA98OKObBQrYPzW68sFNcxjFXehAWLM4XJpKDW7YYF6fJEJGlTNsRcJN6AcSab3uJ6OBVCKqJK8TGgfqBhvIQPfhdvBAgM8bPjjW3sQHtooGAPmmTMNeSBEHBnPXEK0p0DbVWqczdu7mOzXk89+bPaHpPIcJVznMCCqntGWgSN7lZPoOMACS4hcjNITKm8Vty3MlqKjJ00seRcMbRpamIO5d7APsUaJsnvZRMZ1cnAgORG8+7MP4d8FqGGvW1V0Vhl9hXvpImKZTSk4C9x6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwpNptRjCA5z3V8fLt8E1qw4hwIsMHG66n0h2zkYY1M=;
 b=S2ToBHzuXjjtexwQ337gpcvpTOjN36lwuqkrx//fUIM0RYxo0I0BMbEcCHcofy50NSj/pBNW7hvAyJInSu2PycnuwzJwDY8Cqlum9jAzZNiYvxZsH2OwymFXN5b65rMawaKZNmN8jUwiInn5UlchWJdifM2fxeHK4USMrkokVONdxz0A199nRGSBQzxEsasydAspPQ9EGlERe18Qp8mQOIsN27fpwbqc8wOkBSnHXJggKzRY/+tFXjGrSQB3o8j/Y0oYAYMOCRQGDjdcW1bEor9mQjQ+3pqGvg9SBNHHJznsDVm2yM1r2fMu6JJtZ5Pll3LcaHOxyynrBP+Sf2vXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 03:19:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 03:19:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] fixup! drm/xe: Add PVC's PCI device IDs
Date: Mon, 11 Dec 2023 22:19:07 -0500
Message-ID: <20231212031907.1120896-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 92aa8360-29fa-439d-e4cf-08dbfac11e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfcYkXr4o8BHjsFOlck7vjeM1wWC+x9r9sFmexOFa67K2KIwDjU4KaQWtp1a8QCT31Jqt+ZyfSzduEBoWLoC4lkfhXIQQNCHGMU5XGvYxPpViZdTXrboMEjV5oV8ImWENOiKfFSc8uJN4YdQH+D2XXfXinnCRoDSFtW8jIBbJKcTEiWZdulY1NIxkXpotppcwWymRl0JLPw3BQYiZ1JR5MdBcGoI/hQWfE7B1Xb1mr3pswzPUYPdfPrFKDQB88IgV+odRNgrpOLe/CXzOSq+GiGqMqhlEFaxu4fw4zlmlbd1M6WL995ucHNticPbqglHkxsMZOKyW3dTh5g2NUq+RTV9gdIJk7K67gxQKv+MzWLElyk+ISqz6gEt4V1MhAQv0pkVzAsE/wsHOGDilJX5c5c+MD9t+9zRX2zL3yAK+71rfANZ6Lhd0OdtRwlpU17Eon6k6IOQv9AFGZ+qeh7cpF1sGLJzIvnBYP5IlZEolpvmd6twN+Znsu9h+xzOy2wz7SDsNoEG38UYi6nhY4P1EImfhmUlOflsm7Of9moSA+2it97DUhdUOYt6aPH+UkLE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(4744005)(6636002)(44832011)(66556008)(66946007)(66476007)(36756003)(38100700002)(4326008)(8676002)(8936002)(5660300002)(316002)(478600001)(6486002)(86362001)(41300700001)(107886003)(82960400001)(26005)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FncLZn2EuO9CI0Wquw+pQn0DmgHNKegdJTMM02LYLDgYXaIYtd/wXl140kn6?=
 =?us-ascii?Q?ClwtNsQB/FU3nd7NIoa7V0vnyRBvTME/86ieYpnDlnV4KZ5ZGBNPXctLeJkU?=
 =?us-ascii?Q?rfnJwo20BVEl8hiPI71gFlT9vSOQUZ6VXMSPZmMNLq+3yPjD3yc0W7yMfv4S?=
 =?us-ascii?Q?/MnMP5OxiMFHPjDpsS0HVUpCHvZ6wu9mMMaYAv0Gz+XvVJVuAYkDCsIUBrUX?=
 =?us-ascii?Q?ftBL88bABnzUo/HNbQ21BJLbbRUf8RuYQZy7vj7GhyevAwhSgBXs4EjkHIHQ?=
 =?us-ascii?Q?elwlmUtVaXZyFSUoa6SAZ+6esnrrs9Q3V8l1wURybDLT4C8XNB8YCKc8TMdQ?=
 =?us-ascii?Q?vZQ35P4ajwXe9/dQtKVkt0RApewW72KtdBQST8WYnbpguekAni8Soe7uCsHM?=
 =?us-ascii?Q?gov6HD8O+PjJ7INmlv+91t9T0QBkt2cV99ThslvS3p+79+MSrlJv/VBP8BRd?=
 =?us-ascii?Q?IYVp5n4PIstgzx59X4ELSHLvXg8Ql4Qo6QeqYDoPw0tjrsq2ZvkN9fY7XibL?=
 =?us-ascii?Q?dvJzdwNSpTlZAh56TKHYS2m1f7u3w/lOgw+YcQlIOguumMZ/fM0FUZsgOwEF?=
 =?us-ascii?Q?iFAaqaKFuQc+ZIWWZG77RnZeO0jRoKYtAeooz+xwJEOCmuroCDorSrWPS7rw?=
 =?us-ascii?Q?HpveYY8690IWZfyQsSD7edwJppSjL0exQa+r9JkC6YvPOEo+w6MKimN0U1Xy?=
 =?us-ascii?Q?JTRpu1pIWFNSunhwU/5u1cnu9sl22gCd4jMTTL3aHUC/MYAtum/RwNEb3/PC?=
 =?us-ascii?Q?pPqqBBIXHnSG6n04AhfnVqQPDUApzAPwFAcEAWKGubwzBkDnxsyZtnPDx7KW?=
 =?us-ascii?Q?xieF17lTC1eQfBuQcAp5ESPtgfd3kMQOzAdOx4mrXW+QsxC4hEDQgdh97WOX?=
 =?us-ascii?Q?cGUpR0/kGjeXz8eQLDWUsxrzXHSgXp+ivsx2xXQq0gPDgcWZ1BW6N/FLdnSl?=
 =?us-ascii?Q?AyhlZt+eJ95vSM8IID9qceRrEoZdK0Qcow3MrUVJrkl3sCkL9P8PpXaXO6yE?=
 =?us-ascii?Q?fbWk8l7lb2jWWF4C3/WNhYQ5x7LqUlBeVMzLk/g8jwWlrej13/IdaVKl8hm5?=
 =?us-ascii?Q?fXQLLiZXRQW+GE3SvD1uymejAFvFEiauzEUJb0jeKz3PITMbG0Hl/mVVpoge?=
 =?us-ascii?Q?Pom2vSLm0ikxsfxnlj5zpnCjTAQ6AG6uYD6/rAScRaapdO8Aq27UcczMnOjw?=
 =?us-ascii?Q?xRkTyDxE3xeZBDLZZ4MVrBjHykGhtWa3MxDluYLaLE7BecktwuMW+QyZgV5X?=
 =?us-ascii?Q?cSo1CRbyqR1hIdlQ46BCy/TJcQRCx3Wm7zyPodX7thvSgprjEUDB+NbT6zCy?=
 =?us-ascii?Q?/dDlJNCoBbvXCJJcNiG3pCSfrDEUtNOAmGaIFFPRHQ1dqe6x2FvDFm8cidc7?=
 =?us-ascii?Q?w45DGpSZb2/w/x38SN51KNbN82Ey1P8rFtKB3Lt1naeG4bQpolRuzp58m+OY?=
 =?us-ascii?Q?QrGqa78V5T6ACX9XJq7qnO/vA2MKRAI9pq5KankkyFh8eD2l9mArLqePG2dH?=
 =?us-ascii?Q?9iTZc91l01mhIIlH/sVhowaNgCZGnzzte3lB8pSMhAoWJi4DznSBVXNJI2Jm?=
 =?us-ascii?Q?mwu4gJa/30LM6txT5kLya/1WWdrcEn8wpcEjhEj+hUvDjsUgq5kBLQQ+HrUd?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aa8360-29fa-439d-e4cf-08dbfac11e5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 03:19:14.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCkZQ26sS2xTg82//rqF3YHlH/z3d3EbE3CVKPRycmMada18I18jM2DAeOXF8Gj+BP/A5+gSzOW1phOcoe1dug==
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
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9108e1d43c38..260e8a6034a7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -375,6 +375,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
+	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	{ }
-- 
2.43.0

