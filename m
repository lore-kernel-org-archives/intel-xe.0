Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C41BC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35010E686;
	Wed, 29 Nov 2023 21:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15BD10E681
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294413; x=1732830413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XVEz7YzLTK1BrORfkUbVN5y5+rnXIbLC/wujjA2YqkQ=;
 b=cVJ5RYuz83txEU0qYIoAMueuSw2tpFnwQl0+iDUHmfTnUTKAKWEIKFN9
 4XgFHI+EkCDqe3UzjB2CaVCVo8qrZpBlB1Izz0I6JqDByyeyP11rpEkRr
 2VdRyZ2LDwMJaGAPSUQa1Nb1nBebKHFgtEoX5SYTa0ow8e+jOwAHKiTZ1
 s+7/YdKaIygxWtuALUOVsbPAfyPd+VSgb0cALTeVkVvy3BioUJAZmPsCR
 qxuNGtAhXmergyfImGqMyB6uGl2+RI0gL8GWaNt71axM7+PjlUY1f8V9l
 LC+MGSdqKHBxN0O55e9ndv6U1RjDiRaqgAsRQvN12H/f08US+g2FI+11F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397123963"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="397123963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798063820"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798063820"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:46:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBcSBBPVLmYWQs6sT5nI3/dgddkeWt+BYPNtNE5HAuElcNYdYd6MUi3+3X+GIUr8GFRjKNiNaUQuClPoSNSXINSF23Sq25zqZQEdOFUf0lktiqFdeLadBtuYWYcNe81o8fWOp/kZoO5NV6MR4g9coSpNIQBY7ezGj8ZzrcOSgYn8vAeIyy3shbdBo105vt4xE/9OH/JM34dSqquYNbde7JvH/Rna5LuaXfDCpvqZhKawWk5pq5ZVawx/ucOmg6WHZb32i+LY2dNhzSGJvVYDGMPMEvuBXkXHzlRqLHfs2M2JGySAwEW8ncE261vgSQ2OtdHrqeJzug20zUgHpyPWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl/YkHNmWKbJgUDLFxdaMDmaq0C2InM6/uhcJUHqC4k=;
 b=NP+3ZS29rbXes1XdXCq7kTHARWrBrlI1NA+29omlswoOBzdx5jw2x6BUqEv2azsYxUH3LW+Veeb6BV2YrUzKick2VwdgM2iUuoG34Btl/U20vGJkOBKS3yS27wavCoCzY00GxE8mIzHha11RQ4QDCeBvJAMa8wotwAffkvoeiXTSy3nrWBni1Zj5/GvRAPySNC9tk+EvPzz0U/cXFO7tC8YyqFdOmhYkHXk/WO6Y6vCny2OaDBtM/R0WjAGRbGzd7i5EokVhfhcbnpukcM/VlC3CQRFht5aAyRB+i/zqIyhw5S/enZInmz/792ntZvOIJE52SQtxU/Z7QNN91+8XgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:46:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:44:58 +0100
Message-ID: <20231129214509.1174116-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fa31d6-6372-47fd-8eb1-08dbf124adfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uW4eZ2gYmimPFt7+BeMqpkjeT8Gu9ZPvW1kTHBAJMD0FxGhFEASwkhezv2ml4WzPSbfSPPLBZqwpzgnmaX1Jk8t9dHInRSeot+v2M2ZdWMPxkoNEGvoOLf7/OkFBNxdgdJT+RRLqQPAq92YKj06zsz/j9Uac4HDuIEmOT395zPdD2Jcoy/Pq42nH0/OjJMB/g4sBgFHdF3NUSMY27+qCeQUtSsQ1MbSaTopyCVCpmPR1aIrARQASYMndGwao86cwHqv+KPCb/8J+uia11iyfShC16jw3bUerzya7R1LOyuS6KoMIsvQLGRRnZYcNO5N27hnaoaHEzaF+lWxoMuIYKF1k0LTuFpyVLc0a3o54CrqJ+CoO8l8VApfKDl7XInJ45mK9j/EhNUXJ1jdnVeY8xDhsuE3NFy2lF7cpb3sfQV/CTsaolmQ/NHWVGquFo1ulHBi4HYnFXYup2WfOmGqqhoylX+CEnKdEK+PZ0zn2ff1k6BTyTU+iyMNV8p53z0XO4TdaJWSMDuq5nVYKXHQJdYrs3xrGHrOcosCrpNcRLsfgxhUQS+PI9fmuewAGrNtl3conhaue2vMjLuVm345Du3sta7FR4BIzCZyMbsFC0gVIUA28FDD2GpWYYcKPec0r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(6666004)(2906002)(86362001)(8676002)(2616005)(1076003)(107886003)(26005)(66556008)(316002)(66946007)(6916009)(66476007)(4326008)(6512007)(6486002)(8936002)(54906003)(6506007)(478600001)(36756003)(38100700002)(82960400001)(83380400001)(202311291699003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1E5WFNWcjE5QzRiOS8wTkxpOWd4YUo1cm5oaDEyZDJnb2tXdmVKVE8vZVhN?=
 =?utf-8?B?dmUvTG9WdGYwRXFKcEx4LzhMZVVLdFpNMGlrT1BvUENWSEM0cndTTVJOMUY4?=
 =?utf-8?B?Qit2UldYSldjMDFvdTVYUVZCQTA0dDBGWUZDZm5UcnJ0ZFJFTVVSNE1UdHlU?=
 =?utf-8?B?Qy9zTUU4TWlwSEdSVUJUNmd5YksxS3d3R2k0ckxUU0RVSE56WEVZd2NrZS83?=
 =?utf-8?B?Y3BqVlptbW8yL0o3NDRTSVUzUmVpS29IdWRvbU5ieWRWV0twbmhoWm11UWpL?=
 =?utf-8?B?YngyN0QyQ3JMbUc1YlhaZnkrS2xXN0hNYyt2Z3RQWTBTem9tNUtQK3VBS2N0?=
 =?utf-8?B?VlF3VVUrY01ibmdmRzJFRjZxSFEwL2w4dEJkcjY2UHVoeHJQaXM4UzJ4eWVw?=
 =?utf-8?B?b2lNNEdGa0o2eU13SjlUUjdiMVE4U1BoMXRFVytSTEs2dzZHd2Q5NnpPTXN2?=
 =?utf-8?B?djJ6WG1LNW0yS3NibXhCbEF6dTFGRXpMZ0VRSXU0Mm1tOHFMY1RSbnlSNGx2?=
 =?utf-8?B?Y2FlYmYydlQzVWpRcUQzQ3MzeXZoOU9MSXdaZnltQWExQmlna2dxbWN4Zmk2?=
 =?utf-8?B?M3JnR3pnN0Jod2s0ZHJiSVlkaGY0VllKczM5dkh1cVM1dDNSZHdyTThRYVNh?=
 =?utf-8?B?OW5vVjk0djkvcDliTFBkRWNjdE9VRENOZFk2QmVzOXV5VXRWSGJPblpJaCtS?=
 =?utf-8?B?TWRUS29QZVhCRWM0b3BMcG9oaEZhVDlBRURUNUZTOFVOZTgzclJub0JSWGxM?=
 =?utf-8?B?eVNCRWRlcUcvMy9NMDZmSU96S0xIaTN5OU9FSEN1ZTh5REppTUUva1RtWmdj?=
 =?utf-8?B?NExxOWJQSnBjODlwZVhWMzFXamRpWHFsTE5BMURhOXRrU09CNERZd0JwcDV0?=
 =?utf-8?B?NmhUNWJZU2FEN3JmNVd0b3VhbG1DSit2M0VudGF5anVRMFJ6LzJqNzRCK2NM?=
 =?utf-8?B?RE9LMTgrb3p5WGZuSkdubkc0d3BQOWVXNzRLNUlDUk1KQVFvMkxGODllKzZI?=
 =?utf-8?B?b2JuRXBXdTRhZkFOUDFJaTVUS1YwVzBlYWxMSmJkSWxneEQxeVFqOEVySGVJ?=
 =?utf-8?B?V3J6Y0JFVTlWQTNQZTQ5QkdFSCtac0gvaVVtblNGTHU3Y3l1UnB4REVNVzBq?=
 =?utf-8?B?QnFCTE9zcXBYcE9jRFl6Q2ZsMjE1WXNCT3ZoYUk2QitjY3kwOXFpRy9NNm1w?=
 =?utf-8?B?dW84SkNJSTlKOWU2OUd6VjR5a0ovRlBvdW9ZS2lKN1c4akFoeHVkQlhaVFRE?=
 =?utf-8?B?UG4zWlJCYkVoRUt5UE1CdGkzQWpvNjZwTlRBSk1qQkg2U1hIa0tzd2tyRnkr?=
 =?utf-8?B?RmU5ZmtSZm5RbTMzVUFLemVzLzRveUdGQzFCamdSU0c3aTJrVEZCcWJ4K0Js?=
 =?utf-8?B?RSs4TU9mRkltdVB5ZFIxaUw0Wkh3RGUzeEN1Q1dKRDZTYWZlbDhRR3BBTU1u?=
 =?utf-8?B?d0V4UjBtQndDV2ZtdmZ1UjJWcmh2eThIVGpJdmQxTUVvYWtFN2ZzcmlTUCto?=
 =?utf-8?B?MUF2eVZDV0Fod1FDMCszT1dzVERvdG5JRHZET0hndU9uVGdhN2lUZmx4U1pX?=
 =?utf-8?B?MW1aaTAwTFdUVXNFZEx4U0M1NmhaRFR2bVlLc3VOQjlYYlBBOWVtZFFJbmxu?=
 =?utf-8?B?NmJ1cGZJWk1HcGM4aWJkdExINFc0VDhNWE1hWVJNeEMxeFpzMW9pdXJrM3B4?=
 =?utf-8?B?aUg0aVh3bU44R3FoQWVTcTNYL2dUcFhhMk1OVzFzRnMxYk9Da3RIOEZpaGFv?=
 =?utf-8?B?SElWNURPeHY5NmZDSGdhYXlEUkRaSEY4a0wxckV1R3ptRUhkc0FVT2pKbkJt?=
 =?utf-8?B?Y04ydlpVTXZPcStxRUU1UmsyUEI0aFM4Qi91a0ZvNlVNWmhGRFNWalpLdDlK?=
 =?utf-8?B?YzFPRThYaFJHVnJiSzA1RmdTbGNJcENIWGJqb29UMkVycmxuRUIxYlE2bTk0?=
 =?utf-8?B?U1dvYUhLZkthMFJzWDU1VDA0bVhhbDA4WjA5cVB0dnhKSlhNL3ZWOWs2Wnl1?=
 =?utf-8?B?QzBKbVBxQ1pnSHZaa0t1Q1FqYmtKVTJXWmxYWjQwSDBpTXFzdU9FdXFjTFdL?=
 =?utf-8?B?SU1udS9Wb1dicEF5dHIyMGNSOXMyR2N2V0hIamhwbXQ4NFg1NUNnOENBRXo3?=
 =?utf-8?B?TEpxZDF5NHlYV0J4SDgxN1E0VkdUcmJzS1VjY1BmUFh1WDVKQ1BXSHNUMHlM?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fa31d6-6372-47fd-8eb1-08dbf124adfb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:44.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Yvxpp9O0JlCP6PbNL2dG46gIdkuRnGaB1cDyh2UNECgk/haGYx5TrHNwkI3+ZmQwZZzA2kWeAQBMFJuN+ePiK9DDbIa7tcR457gBMdkuYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 03/14] drm/xe: Use managed pci_enable_device
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 08cb726c2847d..074ed456eba6d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -695,25 +695,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	pci_set_drvdata(pdev, xe);
+
 	xe_pm_assert_unbounded_bridge(xe);
 	subplatform_desc = find_subplatform(xe, desc);
 
-	pci_set_drvdata(pdev, xe);
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-
 	pci_set_master(pdev);
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_display_probe(xe);
 
@@ -744,16 +745,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = xe_device_probe(xe);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_pm_init(xe);
 
 	return 0;
-
-err_pci_disable:
-	pci_disable_device(pdev);
-
-	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
-- 
2.43.0

