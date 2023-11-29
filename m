Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35386C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4A610E682;
	Wed, 29 Nov 2023 21:47:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327610E686
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294436; x=1732830436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W8U3RIPkwiS3h7fm8mA40nNP6g1lZd1UoanhNoFXqSQ=;
 b=ZRgJWOweCa8rpOlReKdC45GfHybRUdPBQy+6EWsKsmF1s3b7jYTxb2MQ
 GukHphj9YpoOArSeW+rT+YVz6dIJQ9BRxOak2AYaY/ZTaD2SPlHpRNGZD
 o7AXKQAa4kq9ffeyYpC4d4ysAA6bAz9hRG1AKoKPWehhbSPWLLUT1b5Dl
 gY5b6dnxKb7YRKQZdUKeTtQl4wLdELAWRJwjhqCWt+qhVVsWPdbMhfjbf
 eiMAygsLxUGnCOjEqdLmuIU22cL0/uzz5KsqRaAvwRaH/ijYFjKynGu3h
 nlRG6AAdy2XU2XkPX0ccMRA0JJ9JkW+xHd15rXgvAO7yld1kzrUkg/wWh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975286"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100680172"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100680172"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkWSMprljzPkZymwQLkjMY8y8Ja0+mO1LnLS6r0RmaoVnR+K+c61wQLskFJTud/mQUHnxKFZ35+rJ3FvC9EE6MuC21T5DrAQd5iDkCt9j6yZUuLSL0W4vSItxcYm+yzPaJj/YAJrM5OZHNTUvMnf1NvzMB6cjp8E4pWGWO9Jdyb/VGgDWRDQC7zCEVGMWvsDnO9B83bWN1h5nvqOe0SAGWBygz8awf1oXx0fGlV7zKyfKF8olRM+ka++fI7AChjPVeC/AhgVdxy+k9jnw9njVSiVuZlerf55thCepIk6UgbB+qB9kCDtuMSpB0f7Yk4SzehXKETyNabQDG3kKksr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE1HAsZeb3xBu9O0kQ6NkvtxVZX5mjtSr+W2sy/xq9A=;
 b=fxkxFxQXnciO1O4ot+xJJYd+adhlQNmAmu63RWafauRdJaf6xFshxnUjsW53Ve8fF49kSZHxY6uLx0oHTg2gvMAbO9dwZ+w+fveUBbIxgzR++/HbRyFNDMrfMB5cu2eHSmqApTESEPzJsdzODjPecIaPKDLfSa+7bfOKbRvvoIVACyfEYPUkgDCfFbjrHp3SKwiZOtVMka6rRj8G2yz2jI1++zeUyG1K6atCExcq/xP1bxukR2O/0mcmGbaISfqZdnCMr3Orcok53LGy3h8j4pXY5Br2l8mmEreqQYquaoHcyYYRGmfJYIq/0nKe9PAb8qP7lSI4oX27WRlTg16j6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:47:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:06 +0100
Message-ID: <20231129214509.1174116-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: b197e746-a52d-4af3-9cf1-08dbf124bf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tQxtlnQ7D9aRZEZniEtwuxH+jyahQoXF1LLZQctod8tLOy8FDdKAYAYnxCmZUHUtFM1/mYO5C9JlAbi2uEjS78v+OR3+axRDw9yP4M1BYGPWIJaZsjpkbMMg/RcUYSbqIpIigVwBd+6bLfCNposoOvZ+x64Bt/tR9X3Kpw4WmQof0N5o6ZIV+3XysN4Sfl+qhL0WI6rN7ttAJLbxRA3bWqnKzwxw1csIBf3Hp+D0p9Gl/Zc5JDlSFnbbuwlWNpYOohrqOd+YLhTEVKi+y5SW8ujJsEmJVxNeW4rjVmV92Z7OMcYnDiQd2gtHJ85gP4r+O/H1t0YbHTAbjS4XTsx2G7+t6uBCnF4sIsOmVl0LvWjwRQLO5rLg3DMxK8ypbhHnYAacxAl5W63LFt41yyAyu91N40SWgulDnJqBFTTJ+h6QhGZ8G+AqFUfk4nY/LDgNZEP0zE57VBA2TGOFozUjWNyFHIkeg94cSZtGnpD+ri7RIRtVAC+6aOaNVJhdIYd7IPSX78/QUU89TvBXOpc0NFqXaluZOjXIo+GFaxh5QLSBMxSxhVxol6Z3gl1ZB3KSTFRgmLxVyx4UwAI2qhGdvqWCaRHhN6c1CEPRC2YV4gEmIPH1Sq03LkxVyX9Hyjl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(2616005)(1076003)(6512007)(107886003)(82960400001)(36756003)(86362001)(202311291699003)(38100700002)(83380400001)(5660300002)(2906002)(478600001)(6666004)(8936002)(54906003)(66476007)(4326008)(316002)(6506007)(6916009)(8676002)(41300700001)(6486002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnN0dE5MYlJ3c1cvMWF4OGg0TjlYb2FScjMvK3dNOFFiODhwcHI4T1BGOHBm?=
 =?utf-8?B?bHFtWjJFTkJUcDhRZWN4bVhwZzJkL0ZxaituTHo4VWxKQm1ydFRlTTJkMGFv?=
 =?utf-8?B?TUpwK25QRGQ0VERDeFVVRHhXRjVzNzArUGJ6UWNZZG1TRnljSmFnMmpweHpT?=
 =?utf-8?B?YUUzc2lGVXdzRC9GVEthYWsxZUIvb2FGdVN5dnNsaDNScE9pM0tocFQ3bG9V?=
 =?utf-8?B?ZGRjdk01ZUVQZWE0Y1J4ZzE5YkVwUWNBS0cxaGNORlg4YjUvcU9zb3lvWjNC?=
 =?utf-8?B?V0Rsd05QTFBQRm9jKzdpaDQ3aGFaWk11ZkErMHJxdjVIbTFWaUVaMlZ0QWZP?=
 =?utf-8?B?Uk5wTG85VThRVmtadVFTM04zWlNiYnlTV0hCcG01aHM4MGNhREdKYmpKdWli?=
 =?utf-8?B?QlhDcXZ6STl2WVFqTnRHSlJFTXlCOGJtNkkxa3ZDUmphazJxb0xxVmc0RVpt?=
 =?utf-8?B?cFdZeDZhdEpoQzY2RlgyK0lha0V3ZG9EL2FmWEhWcmZtMkl3c1Nkdy9QTzJl?=
 =?utf-8?B?WDdWeVo3cmVjMGszZXRSdlhkZnZ4aXMzdjBZSFhxMDVGc2tPN3lEdldWd2Zu?=
 =?utf-8?B?OUtSWm5ab2N3RHJKazV2b0hOaFkrdGhKMVVrWGFQajB3d2Vmcy9ZMlN6OGhS?=
 =?utf-8?B?Sk5qMHV4ZnR4L0N3a2tDaGxqM1BOaUtuTkpxVGZnR1RYZmkzbXBtVVJOa0U3?=
 =?utf-8?B?Qk83dFZaZmllWFQ0aDAxN0ZTWUhxUDlPeE9sNDMxdGYzZklyZGxoMWcrZFRl?=
 =?utf-8?B?UlVja3FrT2VyZDdwaHpSTnVxdjZrQWNUYkFsWVFrd2kxbnVFRFlJTGpwR3N2?=
 =?utf-8?B?dGcxanI3NFVKeFBTaGdiWi9OZERDK05EV1ZvMFBHdFlNT2RFUU84S3ZicGE4?=
 =?utf-8?B?dTQ3cDJ4c3dVOVAzTnVKWUFXdkhHemRabk1ldHJ2SmJyWGtZTFlVMVZVZEV1?=
 =?utf-8?B?TWZvMG9UckVzaFVPcWZqZDVwUUpESzhUQngrd2xEVlM3a0ZMQjhUMXFiNFhF?=
 =?utf-8?B?b3Bpc3NxczhPZGJiYzFoYVNieWgzTFFoMCtRN1hXbGpjbWtMdWVSeW82b2tk?=
 =?utf-8?B?NW8xL2dIVlN6QWFNaStxMktDOGYwREQreFpzaExVNk5rMGwxZzRRSExNelVs?=
 =?utf-8?B?bVBwU2FaeHU1aWNPb2dzYnhuMWI5RGxGVHZmWDBvV2pMblpHQndhWU8xUExk?=
 =?utf-8?B?UG5POEZ6djZ3N0VvdHJ6b3BKUHhnQ1VXdzc4VW1LeE5hQzEzTVRLTlJZeUtY?=
 =?utf-8?B?N1k0Wm9qNDFMY0JEVHl3VTFpaTA4dEVSQ2FUYmgwTElkNC9oRU9oVFlBc2Zy?=
 =?utf-8?B?TityZllSUW9lVm9YSVZ5amJEcXRlc1JaN3hyUkt4V0hFVUdFcVhEcUY4dm5V?=
 =?utf-8?B?aE5yMWkxclNaNmVQcWtmUlJlZEhRQVRhTWE1aWlZeVNtb2h0TlNGVUFXTy9I?=
 =?utf-8?B?dW93Qi9kbWlkZzlIK3NZUzlMM3psQU9ZeVBxS3FBWnNhUzIza1RLYmZtVTJr?=
 =?utf-8?B?Mnpidklvend2eEFNMzNhKy83NDgySHlTb0x5dFFGcXQxdWdQd0tENUdoVG4x?=
 =?utf-8?B?UGdmTDZwYkhPclIzSHhtTkpJVjBRNVozMzBNTjkxc3M2NGEweWpIempucWpM?=
 =?utf-8?B?K1pBSHV0RTFETWRtWU5oWEdzemMzdFpEdHZzc1FmMEpVYzVHbGFMWkU4anFm?=
 =?utf-8?B?TlVTWGRva3AwTGVsTWN4RnBvbHVRVjZTVThlaEFWWm5OR1dZSHYvaHlsZ0Jp?=
 =?utf-8?B?TFBQSzFhaVlLajJmR1pUNFEyMGI2T2c4MHVpaVpheEpTS1ByR2d0aXlzQ3dJ?=
 =?utf-8?B?YzVIQysxMTBvWXdESklRUFpOWU4rMDJXcHBaeTZYb0JqTjR4MGszVEFBbVhr?=
 =?utf-8?B?Vmg0ZzgwZGVZNkJXSEVMV01IcXZpemdyZ1oyand4akw3TytxdDE3UkZ1aFRi?=
 =?utf-8?B?K0F6T1dKMThuVk91L1g0QjJhUHJyY001OW5WbnhqdmpGdVhYSXNpanErY2dO?=
 =?utf-8?B?WDM5azFMWTJuajIzWlhYN3VZQ0dNSXlqYm5zVDhYZHJTbXQ5L2ZlWnRvTW9s?=
 =?utf-8?B?VVcwYWR5Q0ZxQTNQQlNJMzArTlpxTGxZMkptRDQ5ZzVMdnRPUTJaRDNzZGhq?=
 =?utf-8?B?SFdxMWM3RFI4c2RERUdlYm1MM1NrbnltK21HVlYyR2xYYi9PSmU4YXRzTC9i?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b197e746-a52d-4af3-9cf1-08dbf124bf67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:13.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4rrXM9bZqdFZIuWhyXRm/g8emNv4lTq4SoTML9Z9kFZpe9GSgWusHD0jszQ4JVeL9MWgoC1X0qYMUS56AJn04uTPPcYqIioW++6V1Q3SqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 11/14] drm/xe: Don't "peek" into GMD_ID
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that MMIO init got moved to device early, we can use regular
xe_mmio_read helpers to get to GMD_ID register.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 889f60fa2e7cf..c949ec7ec43ef 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -444,26 +445,22 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
+enum xe_gmdid_type {
+	GMDID_GRAPHICS,
+	GMDID_MEDIA
+};
+
+static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
-	if (!map) {
-		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
-			gmdid_offset);
-		*ver = 0;
-		*revid = 0;
+	if (type == GMDID_MEDIA)
+		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
-		return;
-	}
-
-	val = ioread32(map);
-	pci_iounmap(pdev, map);
-
-	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	val = xe_mmio_read32(gt, gmdid_reg);
+	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
 
@@ -500,7 +497,8 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -515,7 +513,7 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.43.0

