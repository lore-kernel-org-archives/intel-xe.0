Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEB1C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FCA10E202;
	Tue, 14 Nov 2023 13:03:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3210E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699966992; x=1731502992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r9Ju4K+CkMIkMNPbF6/cSMNA4PQ2GKk4hKJ1Vyi/Ly0=;
 b=T8iZ+mYw//1HjLhG/+TR0gdcTmIyzzZ27YsYJ2KFafGqDYvdSBGgmxKr
 jI5LLBUjthuK4eHEGyZO1wr2eN/+V4O4+HpdMbrBUsH48q3LhlOgIn2fL
 WtDmgJ8sHH7I2axF1r4jYvdJDcBR6JmoPGMt+QtdzoYPCRjvM5bhp+d95
 cl8+IdlZDhhjNF3w0EDZDI/qHCazarfksqIWpkN/eVIjXgNobQdMC/l+a
 rvsGR8KOoCLKQHSfwsytxcagHoZ9Z6gbRqTZNoHdG3lKWeH/z/8lpYWpu
 VoF5EpmJmja/9qNy8wjSTo9eszz/ikMJ5ngLXMf2o/1klOk7UM69MNuhS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375691801"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375691801"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799517915"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799517915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:02:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:02:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z208iqvv57P7wSB1aVQCeTI1+8hLfVuhDOnnGPQ3tbd3vbgcv523TECSgfd9myQZYDFxlAxj4rnhq1JxA49XqQuPkzBcC6/7k3j9SwIKp9Wfr+xTczV/AHXd6f+xyzHvilclGXjkI4rkyjAmJkEb6KAuUwv64pDL4Dca3I2vh7DeZ7JM24MPazsk/kepXFh5dAEvMHxCWZJzzaS7ga15YTn1f+1JZw6Armi05sR76K+oZvR1Vw9iseXr+R6ScQP+nY1CsFe7lnegF945rdvFuk276Trr7/uh5COGSdfK7GyYCDEFQN9/nsTDNAKVsheaVhlrdt9vgZv0JQxq55vE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/HgYK2RtRWCP2LIxc93eITIux5phZhUUmcSYCS98kk=;
 b=LM4hcD3HbMfoJdQ7y4DwMJ6GMer8VKBuGIV99EaSUPROUUCwqfu6oPoWMSGrKvX3t6T/YJ2CCgMl3h92MwNn53ts4CZLQOonadw0JbI1BPZnoEImNquT4ZyIZSd0p8dWlKpASc7kF+kSYxBtzlsi5vg/vPB66wfJRzRfVCwbFagNE1dLSy+/0oYU+UIbUfa13J4Ntll6lAcUriYiPAoksl167MdpgmMQZUvOsX4MxO5UADwyJ+SVgZBaPQlrif8mI+aof4SS1Mxt2mNJlbKSeCP64cofvPjjVOS0LJD0u/O6sXfdTZeB3HmCkZQgvayB0bvEh4mJw7RQ39UzpxRCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:02:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:02:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:13 +0100
Message-ID: <20231114130231.2299661-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: a0010665-f9c9-4ff8-50cc-08dbe5120346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UAJkPSE31L/DIYqk0PfBDsCM6ZG7fd9acYUXDTbFhXRWrWDd+9xFuFEODrH6+ZMiiYWg9x4SmeJO+YnUjf1ghg3qqF7yptVhh4kcJMJw7tur+xonmXt8ietF013L2cjQUslqW6EALuvFRdf9WHR5lAvh4/2/KJ1FfNIA/j61HcMiXSO1OgeLRvOePN+wo2KAF7kC097ZasW2MWeku9EqsOJSBACAgkSJAE+T4diUke8v+MNzkHapzLlJheI2P5w1gPIN4W9P73wIRnpjg1WaWdC1a75Cei/ABn0aFpI6hpfMSCQltLW+lkeIDInb3QKXeTnnKQv+LE31e7W4SihAa+S+3tRs6gr3MVKrkHHv7Hg00dQkzLmBhYdBVHsl7Zg33FqiYtplW2xPAY1ND7kmQxCe3q9MtvNba4gTiaW9oqnfMXDSkOHg/JxrPNWmXLw+5/d9lWV2Z3307RaqcSCAiUs63GhMmget4TrQutpUGNG29Y8IMByurcApjK6w5sQPX5zn7tj15ayUePA0t86WEEI8S5DqJihPZ2AbhmhETzxh370o0lHftsor37vPx3GEBKWwUs07qroT3Q3WOqbLRa/sVnGIDgfT03y20XuV5+7Z/vVW2lXtdX86wsmHpUe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ZaQXptMHlDR0dSOHdkRmV6YWUyUnQydWNrVkhvZGFnSDl0VjBoVlVEaFRX?=
 =?utf-8?B?eCtCcmpWamhMSlYwN05zaklMeWpvT0wxMTdBaktId09DUlEzNDhsTm5vbzNF?=
 =?utf-8?B?MDFIaHB6enI0UzdqNCsxNDRCQWV1MmZuVWlQUmxJWTNVRFhMQTNYRHBzajh6?=
 =?utf-8?B?ZUw2VmZXRnNLL2xkV05YQTVhajVHY2N5cnhHcVM5cGpOZ1MzK2tVV2g5VzZn?=
 =?utf-8?B?T0JraGdFQTR2SjNTS0NQNXZ4YnowSlhhc01sQU83Tk5JTkRPOXNzaVFWNlgr?=
 =?utf-8?B?RkFYUzBKWlp5d2daajlUNEl6V1FRbk9aN1krOEtpb2wwby9pQ2tjQ2pVWiti?=
 =?utf-8?B?bERZTmpXYVc1SHRscjIxWkdFQUR5UVVONzZUc2JPTlZHRFR0cExkbXkzblRl?=
 =?utf-8?B?SVNJUlZrZk5tWXJLNmNaVUp5U2FIODVBSVhyK08zc2lqQmFDTlFYeGlPVmRS?=
 =?utf-8?B?WTVKNDNZeDJLVlluai9mdjNjUXpBTDRjbTJCRENaU2w2SXBTWGQ5RkdpWnMw?=
 =?utf-8?B?M2QzdWdJNVdsM3RzNjhsZWlqSE9XL3NLVTdiYmZsek5RUEFyRmNncXVENkFP?=
 =?utf-8?B?N1puUU10bytvenowKytBM0JNQWdCalN6ZGk5VkV3MGozVDZWT1dnNVRqL3lw?=
 =?utf-8?B?bWdQM2V0b3ROcHBqcTRPaVAvQ09rVGp5a0EvL0UwaDlSVGxpMTdkc2IwbE0z?=
 =?utf-8?B?VzZWbU00VkFVNmVXWVREMnV2c0tad3UvRWFNYnpHbEUxQkNzL2tQeVZzNWdj?=
 =?utf-8?B?dlF1TmNxa1pYbGV5QUJkaGdjVFJGWFJiZCtuZW9QZnpTYW5ENVhIUmZ2d2J2?=
 =?utf-8?B?dGtHQXlaUTJmL1ppYklPYThpdWpXNHpJOVJxZ2s5bkF4V0IraDNuVVh4TkJJ?=
 =?utf-8?B?dVFJWmsxcm9uNG4xQjZRcVlEOHhWQmk1RFVRSmQrTzQrMFBVeU5HZVVoSzJF?=
 =?utf-8?B?R1VVTzFjQTdaZm1LZTR3dGJrSGZ2UUlFSkl3SzA1dXVLV1VPODRlcEFETVMw?=
 =?utf-8?B?b0JxYTJDTXVyYmtTdGxoMkROOVBwMEo2dkF3TFZKUlRGTmRCM0RZZUxkNUMx?=
 =?utf-8?B?eXhCSTBndmJ5Q2RmTzBxSDBjWjNaTGZreGFtd0hmbzFadDEwUFlqaHZLZ3hV?=
 =?utf-8?B?cTE0bEtMcnRPSHVFbzVFbWNSZ0N5VTZNdmdDLzBSWEN1MWZ2TlRZOXlSdWcr?=
 =?utf-8?B?TDQ2RGJ3dkw1d3hneERmUU1zZE05aG5IVG4yZ3UyTFZCOGV2NmMybitwL3Ez?=
 =?utf-8?B?eStsRlFjZmVvbGUvNHNjdGlnQ3lMRDBqOXNZYXVIczJ0ZXZFdmowcEZNRzdF?=
 =?utf-8?B?N2dtSGIrN3c0cmFqWjR6RHRSTWgyNWtQUGwvNVo1MU5udTJrRTlIZitmcmJN?=
 =?utf-8?B?QnphZWphU2o1YVpOd1EvYk5hYWFBbE5VZnZDeWJzNEhySjdERkNYNFZRU0Vq?=
 =?utf-8?B?a21jVkp2Mm9qcDM5VktaWXd4dDNkVGVGVjhjQU9vazRXeHVBMzZONTR3c0to?=
 =?utf-8?B?TmlwN1pYd0xQa0E2MEFFZ1BVM1BMMS9MblNxS2tLd2x2TnlpOU5jQUtCVFFG?=
 =?utf-8?B?NHJacmZyQ2JDZGMrcFpYWGxyVkU5bWcvMmpzUnpmTTlIQVVBTVZQS1BqcVIy?=
 =?utf-8?B?VjJVQ1puRUxQMDYxOVV5cTZpQ20vUlNBZE1xWXQvVmcyZld6RjhsRUUrMitF?=
 =?utf-8?B?Zi9vUGpjTzQvUXk3elIvTEdTbitPWUt5bkxxUHlZcElmdHZ3TU9vWnFIUjgx?=
 =?utf-8?B?azV4ajhxQmZMdjRSTTJNMGlJcjFTZHEwWVpnQS9tUGpQREV4QXErOGNCMVJI?=
 =?utf-8?B?WGNzRERRTGl2aGRxMC9ZcDIxV2pKUTRxNHc3bnVjOEFacVVRV3ZZeHZHRkhj?=
 =?utf-8?B?Nk9oSjdKdW5Ed1dxVDJwbXpkeXYvSVBmbVNhSVdlMEFqZ3VLVDFRN2RqTWha?=
 =?utf-8?B?NzJBeGFqWjE4S3lLeWRNNXczcVJSa2ZpT0lXejV1bUd4NlBST0Fvc2tFaWJR?=
 =?utf-8?B?RzEvVE4rcFdXUGYvYW1rOXYydGtSOERFTjQ5U3J6NVpMTFp5MDZZMUhaRWRR?=
 =?utf-8?B?bEV3S3dCaUdjS3dnaVd4U0Y2Q1FMQVBieEZ3UENDYTY2NnQxeHNkRHdUY0NS?=
 =?utf-8?B?OExXR1pjNzV2bmk3dXYydmdSbEprdGtBUzBQa2FqOTN3K2xZRXZ2dStES05X?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0010665-f9c9-4ff8-50cc-08dbe5120346
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:02:53.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68060aGNjD2TEbq1WY8ByNRUbtlWfjWe4i4hVaZyFs/64WkgrYnpOUz14HyzT4FdhOwOc5WcBybm5m8tqc+lfm1KRz7DvZn73O33oH1crIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 02/20] drm/xe: Use managed pci_enable_device
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v2 -> v3:
- Mark xe_pci_clear_master as static to fix W=1 build warning (CI)

 drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index de986aaee3bb2..e6b59c4b02bdc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -663,6 +663,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+static void xe_pci_clear_master(void *pdev)
+{
+	pci_clear_master(pdev);
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
@@ -691,23 +696,25 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
+	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_display_probe(xe);
 
@@ -734,16 +741,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
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
2.42.1

