Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615C3C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3370210E362;
	Wed,  8 Nov 2023 00:34:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F328410E362
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403678; x=1730939678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8gkdVtx3CWSSRRUQW/K1MYaJWfJDsiQYBG8jxKe7IsE=;
 b=iKz4Q3SGWGiIyZ7ix8/3bK35o6rTrKXNe+Ec4ylx43/Q8t01FBAVnXWK
 vU+rC/Ct2Dw/as8XKaQKD6n+azc73WIiHvflG34Ct0kjAUPAL1E+tknvZ
 g7NntkGqUr19mNuZocASOr6fHltP/t4aCUPBP3RSzVNj8U9o6o5lCYgjn
 8sovVzFedPzbfOfelmSiy3eiW4S0qJXM5XwP+sxqjLDMzBoGgswQldZE6
 M78J3qPXSb4djPMvof/V50dfBdNQ8gLuPp/cOsaxJijAYuZGbTLWnAGvK
 Kgkh3QVQC6GuUM9vMUmOZTlOUKdvZ22Tlfg9M8PZxn+R2EKtPvvqW0/Gq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886132"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886132"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880018969"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880018969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj3i/xUqRdqrKsNOYlujvLNzpKq9GVFkB3Ht8iNkqnHEquEfHGWIzSVNlEaW0uiMO8c3XMOMF8ngAvua2o/SpQIffIlAJKRJ104PhaCOEreopTaDx1pxIqYaa6Lc6L7e8bUx04h2rH+OMz211EGItOO+nz7TiE7/YK/gNsg2u93Jf6Nf2ri2t5rLJfcFxT4dR3aDmVZFD1uSMr2QCRhoLnpNgrDzPYtu3q/BPBEq9TJ6BmV6ZjmMPh5rMKPyxaxqfjAfoSIpzrBJYJDnY+tgsP5uU1/3NnXJk8JEUzt/4nGDbNPmYgjxfNgfcgdFUlXdHd8F40K0xuwIh8XJg6ul2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny5V2mmyCt+XdS19TzBYBqZc/fIiHvXSyMtjPCifwNo=;
 b=kC5Qr0gXGBxEe710cTcu6E8PGjRxA98+eaj7s23rYIHQBllIlCX514Dx/a5TaDZC9404j703hEYR9DnIwQboZZ19SCACu5NaxZPbWSeCD+p8+5umWft2PmIfyrhCTlZ0Bpnz2BtnDgYQDLadXWQyn28K4Mn9tVIENKTTSC3kzl4/nI1L1r9QEtRjdVhI2KnPJ/CEv/Y/F24JfhQSRnX9kdOhCoJfHh25BwpUXdndhduCjxKOH47ZDKwIO10QSKCK409delYFOnGyj2o0LzRGantGtDuvvNUlNTEFqKbXzmUSMlmc2q+VmzWrRX2OYBAEM2wQySh68XfdRV6E8RcYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:35 +0100
Message-ID: <20231108003344.1169016-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0356.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 5643cf27-95ea-4f01-e408-08dbdff273b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1waxKUeDtnM0Rvc6NauxHCyPY6GRCxfhSwpMe27lCjbHl4lVCg4pVlzO/GLQ0MvoytART5ly3mV43OBzeuv0Uu4F6LYBOCjl3PyZ7W24YWDoLzglbMofJbcRXtF8TtZzrMaNdCQBO4l8IGFkXyDHgQJuxER/zwJ15hSoPm13thXvn5mk3WZSZCz/V2V5/D4l3xiPLL37tqc43GYJwepMQz99/gCRnQNDxgRKoJjt4s9rLTkP+JCEC/F0l18D+KBBNZrvlU84Z/mTRtfXIqBnjKYe49Hqtd4473atikw+k9+9X16zBX86Cdlp250k6Zq4KvYRXAMFSTiDCw4VkDI5fxPLavRfiryuAaqyv6BPobrTMyPW0cy1Sg6ksfhif5VHKvOx2rAWS8eu76vfr3TxxE/EK9qE2DM99W9DikhTNmmOdFoKY9Zq/1k1UJb6m9hzctCz66ypV7RFi3yd8fAuApEiJDzDH4fvbie3LUyMWX2n/dZugeFHaN8/jKFnUig9qb32ZLD3T9MP4/yA9ZhqMPhQgH/Jwo9A/3YgBhC2gZI/nriBCOT0rpRQEd1uwJ6y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3BPUzZpV1Fpay9nS0dVMHBSaXJwcmIvRXFsdkhFdlN6aTdkTVUvb0J6eHFK?=
 =?utf-8?B?TlU0ZnF4WTErTHhZeVExVllWOGVkdC9ZbkppQnZxSWxuT05TZktmcDBMVDFE?=
 =?utf-8?B?MUxPUGUrT1FkNFUyTXNQT3JDTC9qVGx6bFFGYlZuL3lZOG9vck5TY0FpRkJI?=
 =?utf-8?B?bStHa2JrbHZGZG5wRXJPUU5UVGx5ZEdyc0JrS011R096YWFabG5uc1FwUlNq?=
 =?utf-8?B?RGJtczNTQmdZV25XTktWNU54eFA1TzhPRThERHI5bmlxd09ScWVObEZVdGJT?=
 =?utf-8?B?azRDNzdhR3NtT2xwRnJVZVRCc2lDSGtpV0F6QVBRdmM3SDRTdkRCSStzWGNC?=
 =?utf-8?B?MVZYOXFVdmNlZTVOY0prUkV2RFlNdGF0b2FETG54U1RvdkVHckU4a21jQ2Jw?=
 =?utf-8?B?SUV4cHRHTkpaejlRRUhQZ21QWmxPeUwwYWdRL29DNFZOMzVkQTlyVERVWFFN?=
 =?utf-8?B?TWJ1T21QcmIwSGk3WmY0UWpjUklFcDJib3JndkIydHErRVRiUndjcDZyOERL?=
 =?utf-8?B?bzBRcWxENWxhbmdIenQ4Z2FGNk1qaXNVa2M0aFRady8yZmNNQTBMWWJKUXlW?=
 =?utf-8?B?eUxjdWZRdGZyV0FJZmpMV044R0pQYW9jaWd2dVM5cHJ3L3RZUFVNbkJJTHlL?=
 =?utf-8?B?cm9SVUZveE1UdzVpYVZra0RaVENvd01sMnJBR0VpbE5PMExHdmRla3JiT04w?=
 =?utf-8?B?RjEzSWNrZU5qSDZNY0VJYldrd2N2ZXl2OERnWmpiR0VoS1hKMVdpejZsdzdh?=
 =?utf-8?B?eEdhRDBaR0V1RXlyZXRWS2NSYS93NFJvbnNlM09yUnhvQi93OWtPTUNtYmJF?=
 =?utf-8?B?MytNNFQ5aEZqc1NlZjZoVElZbVBkMzJCU1ByMlRHdnc1V0tPQXdVM1FPVkJ2?=
 =?utf-8?B?YVg5bTZvV2xyMURWUmsrRlNNMmRGWDh2aDZpbnQyNDdLYnZJNnIrY0VkMlBG?=
 =?utf-8?B?eGRWdWExZ0xUVFYxTnFHV1hNbFI0K0NMWG9KK3JObzZYWHdrYmlKTVNUNjlI?=
 =?utf-8?B?UzQzYzBVWEFEcnVobzcxcU41RzlmdXNWMjlBSEY5UjV1MGg1d0lab0Nud2Nl?=
 =?utf-8?B?encwUXRSRGZ6OFNaOUYzSVU4djhJVnd2bEFoRTFsSVhpWHhpL05veHBrdVJu?=
 =?utf-8?B?UURjZnlVSG5BR3BPbjh2ZnZNS3ZETkFJcXZoeFUyZWNQUUFWYjZ1QWJPRXZo?=
 =?utf-8?B?aC9yK1pWR2VxSU9KVXhnejFwWTBudU5qZzY1YTN6Q0xJcDMyVitZMnhUdXpH?=
 =?utf-8?B?cmlobkRGZWxxQit1U0VpL2l2QjdaNlh2VTN2Y0t6TmprblBzTzMzUW45aWdu?=
 =?utf-8?B?ZTlHVnpWeXVDV1FXcTIraXJaa3djUFFFTktsamwybWRKMUtKNERuKy8rTU5I?=
 =?utf-8?B?aURHT0pEd3pKTUxEK04rUU5nZW9waCt6bnNpRVZJNTdQR095NGgvY2EzbmxE?=
 =?utf-8?B?TmxDM3R1NWJsb01zWDQxSHVuaTk1Tkl2QTAzSFJtNmdRYUNnQ0VYZDRUb0Fi?=
 =?utf-8?B?MDJYUjB6MkhVbTlDZFRmbEw3eVdXUDE3cWlUbEFzY2pYOWtJWldWMTJUT0p4?=
 =?utf-8?B?Qnk1eENSa0pWd2ZUWXpnRkdZNnllK2pXb1VDaWNsSVEwd2gwSmhGeExRUDda?=
 =?utf-8?B?b21wemhHdHp6ZUZyV0JaT2d2NTMzdXEzTjMzYzB2cmhwVktvemdtYklxT1B6?=
 =?utf-8?B?Mm10Mm9zSm45TWpYN1pOdmFWUDIrZWRRZUw0bnErV0JrbUwyVHlKVUMwaXFt?=
 =?utf-8?B?cCtZMVRyc1FVNFBGRTRHUDZERjAwY1d6QWdnOWMzMmE0SUh3TGtrNmpOVitV?=
 =?utf-8?B?RjhVc011aW1WUWZPMVVoOURsOW5uZUdQMmJhQ1A3RVZVNTVObEI1YUlLTXl6?=
 =?utf-8?B?K2k3MWt4NFROVlB0Tk04UHhRK0dOT1JsSUxYc1FJbWV1dWRsamcrc1ZuRVpN?=
 =?utf-8?B?RW1jQzdZdUg5NkpSQ2R4RVY4M2dDWHh3Q3U2UW1IYmYvWGUvUGdkNlhtMnUr?=
 =?utf-8?B?TVNLL3RXV3NXU0FLM21KaTZ5QUkzQ0crQWlocTN1S1ErYm5pWWZ1RmxiS2lQ?=
 =?utf-8?B?QUJzRnlDNXBLU3RJZ2d3ZGNzS0U0dFJaamZ6MUJxOXdLc2g4Y0pUVm1pNmlJ?=
 =?utf-8?B?T2RnTTJKYmovOXlvMjdiTk0zN2tIbDJ1ODdqbHpsZTFsZ3JHUTI5MUprR0F2?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5643cf27-95ea-4f01-e408-08dbdff273b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:22.0194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drGgrwI1BrhCmQxfslAm7jtHW9eycU7r1+gIOY17g+gguEqX3khTbz+lwERZpODiDREXJ9xKN0R7INg1geF96CC5iUgddL+LKWqYUvBJY/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 03/12] drm/xe: Use managed pci_enable_device
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 84f3e4d901502..f6f7ac390164c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -662,6 +662,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+void xe_pci_clear_master(void *pdev)
+{
+	pci_clear_master(pdev);
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
@@ -690,23 +695,25 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
 
@@ -733,16 +740,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
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
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.42.0

