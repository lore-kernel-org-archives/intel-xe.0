Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EEEC10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DFD10E69C;
	Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F9D10E69B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297346; x=1732833346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WYeScNcDo2O8nB1F3rrup5diJURJgSB5vOdQzfOnllw=;
 b=Bx41yD1DuQO3BWdIbkElPPPtR6Fs8Vy2gANBgg2tSTtvj1JHDqEJNwF5
 7cOAhYfNwr5gwLILPJiKsDakCkvVcUSHujKkZTv+fllhmQZlyeriQWmAd
 hkJNQGW/QLFroH1+whxJDnP+wJxiLGRBAWiHL8UHt5a/GrTRsDvafjJEt
 oTtvgpFJj6XZMzlQsgK7yBSSA/6l6BsBgUcfQcUTf5An3EPh89VOaZ3iH
 O9/c/hJena4yq7wqHlBuMLgY4e1u3ilzxY7uJh52EPS5+fCFdCrWabsLA
 GeDIDEVj26mzUqZ2SPR+Gmnjby/rbcZdg/gmjdvEFAwUdjOZbAOk52HM+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420084"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891801"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891801"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jb7viU+mYsNq2K4y+AmxzfIPN4pny926C/fMXz9HJRJ+cc59opejFtchT1eDZ3iXTA23axOINFxx80EKeiC4sQ+XWO6GGWjvS1hBy325xGt/fE0E07Nj6fLcRPf86QtTOaJhN8XvrFkpjLP7hyl2ngDZt/rdiZtWWgjBZsF+R3BHDeeJ7zMdUhC/AOqoBOGzsH50EtbgJTbxO6aXFBK0oHMFgsDqq0AlEByH5Xd/xL0DUqn/HzTM/nN+LCYq6syz0x3YBEK70GwMl8BtjgAEL5NSdlEQyEPuELmTVJoUxOj+2sxVK2f7ILR7XOcx+ufCF4VBGzh5doHUgcf5M3NbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I0l+7wZLss38bt+mwUbEQzW/mlEvvp6gYyaN7bOEA0=;
 b=lzo+RUW769FcKVZl+gSXyeklstOwzKd14o1p3RoqyHztk28aG40dQGL5N3Udszhi9wbjHMH6L1CtPVR11RGwfZR312Z4w5ILENErSzgLutHkl/da9EjYoJWutx9IkFZI7Fe7Tzj9FctwhBwWmV8dfMUC3aMbldOvnb9f1EPgOlK1Pnk9yygoAmXViQ09INsHK3LBy7s8spxHwlZJ1r5asJT5Dg6wlKAACiAvVfezHK2XsuoKDejK2/YexaS7h4TL7tqsUqGj2f4uf/mso7i7NqnoWZmbuZahxG/FVYk5VLsdQ7BztWeV7GlDpI5dpXcQR9PDuv39ayWWnPRzWjwI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 22:35:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:47 +0100
Message-ID: <20231129223508.1189461-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b18dedd-7c80-4866-cc66-08dbf12b80a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YvUspMEdKZC3Orh8eTZD0fvwjwdXovsfI0o+mTXxPcnm+LPmt28F83kZ7nrd28lPENjOS1bjY0M+Vtm3stM/GqrTyEDsMgxPnHpyZ00Hx7EvXMFj+DfaAhlb3BHGN8EFmoKhfxTRQagZj8lJMKHxePfDi6WOQj3ybxws2hCWx0wCVRWsb7Kxc73RobltdaeHbIPW+kFm3VX0Zo8o4nifJGvslVgXESCsywpcIImIiwYOait6kd+By331gkqA+QctWCDWTGpfzc0FuQa5lsUMI36Vo+vPLQLSQDIx/44oIORtyp31FCjrZL3SIt6AlUzQq43So0RNE5ixwEB2FmSRlLP/8xEu9+qiRg7CMOdNdhoeKxbPeO70e89RlINlngspRmT2kcWXhewCW7Wr0B5RwRjYt+A5H7Rx6Xp+Hcnu8x3uGsfz2vxPONdlsAXSWJc+eOXvJmboYGwyOhEVuFKdH0N9eZuk3JEJrj/3MPXrDPv17973UZFeOffrLVTQVzDInROkJZLNOUmd7v+5Rvngil4TIR6Rz30bQG0HxdHeLwMXlpo9+weiRfYs8Qof5tDYIcMlTxvRvRBssPaU4FtAhGHdD/MaT9ik8WeDS/9NqtyHPgoxY8EleEhcafOHFCr7+dx6wrTaWpozq1XKdFEtQpbr2bKYIGA6ag9v/Ltr6Ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(6666004)(5660300002)(2906002)(86362001)(1076003)(6486002)(26005)(316002)(6506007)(2616005)(66476007)(4326008)(66946007)(6916009)(8676002)(6512007)(66556008)(478600001)(38100700002)(82960400001)(54906003)(83380400001)(36756003)(8936002)(202311291699003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tzUjhBT2d5ZWxaQkRwb2xmSE5lRmZsM3h5TkNxQXd4YXZ2SHV6REVGMXR6?=
 =?utf-8?B?cFVWYUNxRHl5Q0cweFI0MVhnQWRXL2V2MElSR0RLVkZxQTJHYjA1dzVndG8v?=
 =?utf-8?B?VnQzQ1h5S0llOUJLa2VnMldldmZ1K0pzZStEK0ttdWNLMHgwdjdreVR6TGlt?=
 =?utf-8?B?cmRmZGNHalppK0pwWXlCZFdrdnN3SFl3U1o0Qm1lYVB1NUVYYzNzbmt1a25y?=
 =?utf-8?B?L1hSUUllNDM1NlY5UUZjYnF2YXBZQVFLKzIzVmVCV2JxeE1aQkJ1VjVsRWh3?=
 =?utf-8?B?cEE3TWtHUkR2ajkrRWJWbkZyYUdDNWNWSW4rK0U4NENjZkNlY1NQWUZpTitK?=
 =?utf-8?B?OHp1UDU4N2svNzhqOXdoWXI2QXZkSVl4OFFad0JmdGZhVlpDU0dYc0g3MVhF?=
 =?utf-8?B?bWRWOE1iNlQrN3VPdXdDb2lTY3JQc29DajlNcktnOUpjTWJJdFNNbTlBUng1?=
 =?utf-8?B?TWNvczQyWGpxOTlYdUJ5S3hHcGozZVAzTnBIWHpXeGxQWjV2amxITDFGSU1h?=
 =?utf-8?B?OWxKYWY0eEpNZGt1MWtxNytQNGw0ZTdsd1c3Zm9HVThwOSt3SzFHdW1kUUVX?=
 =?utf-8?B?SEkrbU42ODR3UUdjK0FLNGsvWkEzTHE2L2x0b1BYMkYySmtNRDVndnZtc1VR?=
 =?utf-8?B?eUx2dlFVU2NWNnN5QnlUVVR6cmVnMUZWMXRxRzlPNllmTXpJOHBSRnZMd3By?=
 =?utf-8?B?RHdlcFA4b3N5OGRIa1BQL3NaNGppRThMdkxOajl3aUJOVXJjUDRNRnA3NGI2?=
 =?utf-8?B?NXU4NXhQbFE0QitxWTF5RS9aOGw2S00vN0ZXU0JaTWR4MGVMSkVYN09LTnFL?=
 =?utf-8?B?dnExSFduTW51WlpRY0tRNHZ2YWwzYXpnUUw5SU9wZ3E2VEUydVF2bmgwQW5s?=
 =?utf-8?B?OE1VL2ZkSmZBeWFHRWJzenBLVzY2KzVyaTlyS2pCLzNjK0dPQ3NIQm9PR0Qr?=
 =?utf-8?B?UHlWMzJtczhhS1ZmdUNva1l3eG41T3ZRaGVwYTJ4U05Ybyt3U2U4WkE0c0pY?=
 =?utf-8?B?MnozaXMzTGhLL1BCZmI2OUxDOWFOQzY2dnNIUUwyWmtpSm9QQUNxOTBlVm0r?=
 =?utf-8?B?R04xdEgvZ2pOODQydVBpZjhQb2NiWnV6YVBpY1NJRXp4WTVUQ1dRMVNhNTZz?=
 =?utf-8?B?YlBuZWwvNzlEbGx1eFFORnNiSWR6ajdsRzJNUWZSeTh4SmFNNFYvenZYK1Ni?=
 =?utf-8?B?SUk2WnhiWXN3dG5ISFFkZnMrd3V3TWlwM0xwdno3bDI3QnZUWWdFS0V1ZlN6?=
 =?utf-8?B?djZsOG1BckFTbkpyWDIvNTRmaWNTMHQvd0xHbUdBYmNNSXRBWGdFb3dtWHg5?=
 =?utf-8?B?cVlVUE5HUDA5aEV6a3dKWUFkM21yUHg1YklJb1d6bjVmWkRWZVpBU1I5Mkpj?=
 =?utf-8?B?bENSdDg2ZzRTaE4rbFRBa2k3d0VraExxWW12N3BqUmljU3JmQmJVUjhzRGVI?=
 =?utf-8?B?ZFF1OUxVcTJOWXJwUllVcExKR1QrMzg1RTBXT29MaHpRZ1duUmhjNFBWNXFy?=
 =?utf-8?B?OXgvUEk1Ui91cGRWVFprS052RDNMdUJ3a3B3RVZ4L3pRMUVvazJ1bmpnalZt?=
 =?utf-8?B?eGZPT1NRVmZmUXZEZThBWGxPOU5Lbk9TNnFNYVpaS0QzVUlxaGIwVnliUE1k?=
 =?utf-8?B?WTVNbkQxVUphNVBOOWw2QUMxdUV4MG5YVUJsaGN6YjdjMkVtMFFvdHBiSlR0?=
 =?utf-8?B?WlN6dmxraWFDakJvOGYyRjFnQS8vUE5zeVhVUkdzTTg1OS9KUGNONzNVUU5U?=
 =?utf-8?B?dFJjUnhxNVlWNFRTRndMMmpMUnRNaWtsdEVudkFCbytXTUZQYU9UQ0F1Q1Jq?=
 =?utf-8?B?bDFDcTZEeTlFMTdoankrc1JiNVM0UkhqYlJkUjRlUjF4ZXp2cC9mTFlra3VU?=
 =?utf-8?B?TERvRlFSOEljNUZlYUdDamV6YmVzY2JpTHMzU0lReEFUcW1xMGcxeGJRZWwx?=
 =?utf-8?B?VEJNaE0rWFhYSHpMenVDa0JrcUVXMmtSbHZUa1VUUEtVWTljZkRDNmVnRXdC?=
 =?utf-8?B?TStmMzU0TnNqdy9pM3IrNXJVcWRJdTdJenREeEtZL3pUQ21IcGhnYkNBU3hQ?=
 =?utf-8?B?SVJveTFjeUZQVDJBTVFlVlc0RVhyc1VTS3VlcGt5S0NOQ2U4TGlvdzY3T0Fa?=
 =?utf-8?B?TEdhOWVhOGZDc0FNSGc0emxkb0xlc1cxd1Q2QWJLUUl5WUdvaUg0TGRldXlk?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b18dedd-7c80-4866-cc66-08dbf12b80a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:34.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QE7fyA1cEwo4u8om11Kx3lFd+pMDqLD13RivzAzjt0cOsaN6q5Iq2ar+z52UrMY4P22j8elpX+oBm0eiP++wckTdtiIdffpmvN5lQ9YmVkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 02/23] drm/xe: Use managed pci_enable_device
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2 -> v3:
- Mark xe_pci_clear_master as static to fix W=1 build warning (CI)
v3 -> v4:
- Drop explicit call to pci_clear_master (Matt Roper)

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

