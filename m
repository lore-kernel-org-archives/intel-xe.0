Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90685C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5990210E69A;
	Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2AF10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297345; x=1732833345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=clYf8tnt3Wt5C567t3LU+1AvPOISz9orWXRCOrhrKrE=;
 b=hM0B24+caRKeaq25fRS/7GZNKGQmsqefHcNEEBo0Wx4djaROyq0MFrcm
 e238p6U0YShWEcY4K7PdvGCgzqLy1EIYvj6ocY4ocev9mQgarA5+q75id
 hEE6mYmu4r4QZ+VPkyhPqQtYjyEkgH0JO5sspZVqVzrjpyXI21amt3CxP
 CXcrwmqmVwdlnIwTyD826YPqkcAydntUEP9zDpq9blQJyYHkyEqJaKzGO
 KwgrfVNcHFexysTyMuGgas++cKWT9Qv1LiSgkuzm4WlqI/rZNgmP0udfU
 OaKhyR7arI9dnZv23yxo7AZzSWpEO/cuYfmqqCjJOi2KsPQ7698jVeRf7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420082"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420082"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891792"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891792"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz4BUM2SLx9G0Ks9ZDJnRMl9zguUfabO8Di8P1u+oScB0oGgp7TgSbeGeFzHpsdML/r3yEih1Vdi6r+CX3GgS1Guq2uYn0sWIwpxYY2itYbu3Vt2psx0UEo5oQLlIJlsXHsRVSGuRGGcU4qHyfuKR+svGX+vxT6FvjPk2xwlb7izrUe398o7zKJKIn79fwBwrNpFpAoptCpVun3MBMwt9mHWTAKrrYqIi7ocZDnez9ZKFFLWr7L0nzQUloWvHoN8YbemPasPa39dzU9HDnn/8YUJ278/2ruFkuzCQ28+gjn5xswlQ6uunOjE8I+tw8EcYiaQiRXMbSmsQ4AaZNO1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncd9musTs4l/DHD6fJkX5iR0v+KjxvOhGH0jpuBvINA=;
 b=HfQc916af5cDMTNS0X0PAs9hFtSf8nf2cpwqGcTv1P87RU88IRWLZNteMNFH32IoTDqBZkRvkso9NtTncpSvj4om71olxqVKUqkCnsEpxm/Dg3g8kn+DdsXwae48K0/xwXmQlCb+vNLvkHwEsm7TZoNukOGTEzAL+DzqN4YFE7K4ZgaxmKKX/Zb3QqCaHEaMO5G1N34zt+YHHNwPjQnVja+wCZDcVwGQzTvYg0J8C1QNudilYKrs5L4aFUS2tP1FQVp8mP2OVlB4MC+pf/LcTgWRhih6jdn4iQjYqcasiFDGUmn4I1gV+7n/cesKKeUX6LDdAz0yjwYZpQAiE1D+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 22:35:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:46 +0100
Message-ID: <20231129223508.1189461-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c924607-cc0b-4d99-b7e2-08dbf12b7e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5stw543GUVaDYnJcP2EXlpB66NSdsyHF2UJsiJrlnOImzo/k3oe9vRmox/J8DpXOGKuiQvmzh7x7DILAX/+4Bs/IkDLup7NwEb+K/663PgW/THnHO9fIFMXu8FreK8ZfPW58qdVWXoSU8l/2CtIzUjkYDt29/HzzdllTf6IAmWiuuXh5+kah1QFp9UL6Wf4a+HDE7+zCOwZY+tHVGPEXKi15MSG4paRnVJoXLLCYd8OS22A45ZswTtBN/9kFJdPVtDAU3CBlCH4kxZy8P1UKUWnNwtKIdGh8+n1c+aH9rHF3dkCgOPGF76OHKwMYt9tNfn8HzHLSYJDsS7Ko8qxQ/B+uXeVCfdoqfbyC1PvROsVu4VG1CKdhfq/Cnw/mXMZzykr3ys0OEoYMm0H/oxhjbVbILlpWvJg5Q80OtJYc93x7gI1yxfTIzt/UTXEOzxoj6l/mAUlPIkEaPZhIR0/IyzbAfHN8zporsaeRbvKLlC9iy0GCUccC7kUD995GD8VVhOxo6k1toh/abifpEpE0dn+QfwN1vZyl/VkQ/VldaMaKZO1IhLxzXJXF6qKo3dtqcj7TgH/BclsGs09Sf5Wzb4iZax2sGfQnG1h7XV25lVpHoMExKrI6+AizaFXP+3b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(316002)(66476007)(6486002)(54906003)(6916009)(6506007)(478600001)(6512007)(82960400001)(83380400001)(36756003)(86362001)(38100700002)(2616005)(4326008)(8676002)(1076003)(8936002)(5660300002)(6666004)(41300700001)(202311291699003)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xaSFdBNXd6Z1VXemFJZHppb0ZDWDVpaC9FcVZNSW5LblZ2dlRuVlpPc0Zp?=
 =?utf-8?B?QTFITXFtN0t6UFhMdnh1bnFzdzNVT2o5Z1NkQTJzZE9rZWpZc3RvM1VCVWFh?=
 =?utf-8?B?QmRZVUk0ZmRpMkFUWTVwc2xIRS9NU2FHMnZvTTNvQ05ZM2JKYjU0bk5xNFZM?=
 =?utf-8?B?ZUx6cStJK3dvSEFMZmZXekh5YXhIUVdkdEJOSEVJTUFhMEJUelRjV0VQQXg3?=
 =?utf-8?B?Mm83TGl1dDFXbm5kWXNHclIydEVJNGN4NitWWGRwOFZFNi8zK0xQYms5b3cy?=
 =?utf-8?B?bnNmcmtnZCtCcnFSdU9mdWxJSVZ2K2xRY0dNbjRkZW5sTkpVNFd5NzYybWly?=
 =?utf-8?B?elF0ZVNKM1NlZURzQmtYYWwrcVlqYU1ERC82cC9BcTdqMDBEcXlxMVFuYzBB?=
 =?utf-8?B?L09uZnFPWnZFSnhGdG1vU0NqcjBaZGxHbkJhK0FPQVdwMVE5bUlYSjc1STZt?=
 =?utf-8?B?bk5aNTR1aEk2WGRYZnVTcmJTOEFBVnhKVmJUNzExVGF0Q0h3bEZnSzR5dXdS?=
 =?utf-8?B?a0VtQzBVZ2E0eVVkQkJGa1lWWHR2VkYyYVFtV3JBTCs0UjJELzFlN1dCNHFS?=
 =?utf-8?B?eXhBeFUwZHhiUEJXekE0M0ZSWXJMcjI3V3VBOXZNbzdjT0lOc3pNM21zazFH?=
 =?utf-8?B?eVZibURIbGpZQitYdWJXNVNVa2FpbVFiUFU2TTlJQitaT1kxOG1HUCtvWklC?=
 =?utf-8?B?NFhjZnJSMGNiRG9OMnh6MGV1WjdibHA1WDJtV25BQ2RXWmJQc3d5c1dpQVVH?=
 =?utf-8?B?RkNQMXR6cng0ZXNIb3cwTXFTMEt4aEZXMVpDU1l3SlBrRlJwZHQ5UVNZWkc0?=
 =?utf-8?B?RW9QdnR6ODE1U0hCc1IzUG56OEpKUmQ3YVdFUVdRSm9uVXVSVHBySzlBRFJo?=
 =?utf-8?B?aTZXVkpqUitpMHRKbTlyOHdrRGFNNWRNUlcxQ1JERlVNSHdueVlqaTNyNnB6?=
 =?utf-8?B?UFdUaGJTV2RtbXN1dXBHcHpib2JScVpTRHRJUjlrTTcrZXJtUjRNQWlIZTVn?=
 =?utf-8?B?N0ExU0R4RmFENUp0SkhqWXU5NW9WSUhSVnM4QWRIZ05XTXVCQU1YWHFvU1JF?=
 =?utf-8?B?aXVGUXc4Y050SW5iZTc0UWVOU3BsSUExZmRGVm9QMitrMHpRUlNWYTJhTkxY?=
 =?utf-8?B?Nit6cnc3ejJ0aFJZZHRmSjc3Y2RkVklLVTltdU43T0pGVk4vdFlmL1l4Vzkz?=
 =?utf-8?B?QVNxQktTM00xL0ZlRlBJMjJTalBhZTZYWko4dXZ5M0FTbVlVZTdiL0NsY2VE?=
 =?utf-8?B?MVpZaG13ZDVuZ3ZMVDRhdjI0a0JQbVZFNWRGanFjd0Vucjdad3JDUlRsU3Rl?=
 =?utf-8?B?bG5ab1o0UTljUzYzZWxiNWRKblpmaHprVXd0V080WnBuR1JVam9UZWRuZHBO?=
 =?utf-8?B?TDZjNlhZT2ZiVURYUmRUWGdyUUVwZnNlOFNmaTl4c2VnSVpjb3NpRk9EVytn?=
 =?utf-8?B?dlg1UUxMcGZoempsM3E1d2FzeWYwNzBaempLWDBzQXdzUm1EODN5eFdUY0Na?=
 =?utf-8?B?bWZycDlDRTFJS2dlQjFsTjlCRG1uN2djTFNLc0U3U0l1eHZDRm5VOGpadEo2?=
 =?utf-8?B?RHBFWFMxdXJ1UG1NUnpodFJFK3p5MVZsMUxvYnROQ1h4Q1RyU2FIQW5PZUxQ?=
 =?utf-8?B?c21kZTE3RnNMa3BzK3dGR28xN0FMYzcvbE5RTm5wVjFUWkhmVitBdVNxVklC?=
 =?utf-8?B?VEVxeUtqMkhXcWdaR09CWjlvQzFSTU1PbE8xbkpxL1gyNmJkdEFxU3dEdWpE?=
 =?utf-8?B?UDIvNjFQanlFRXAySndRL01aVkQxcjRIVGYxekQ1NkNEVkZqTEozYzZqUmdD?=
 =?utf-8?B?eUFuVDFHWXorVUR4VUprc0R6QlJYZlZxTlBISG1ZQUJmVURXZ3haNkk1MGJV?=
 =?utf-8?B?Vkx1a3hlc2hXRFFRT3JrMkJieGwwdU9YTWRPOEQxVVlQWGQ0bkFSYkNmaCth?=
 =?utf-8?B?bnZEMC9CcHdRU2M1SkE1anl5WlRkSXZpMENBVTJrbTdpY2F1WE55N0wzRU5U?=
 =?utf-8?B?d1JBbnZXeVFHTTZMa29BbWFYSjlJQUc5NXJrUU4wclFuYmJMTk9rMlhVRXJI?=
 =?utf-8?B?NzZ6VFc2eUtyTyt6U2FkaDNNZGU2YTZCbGRDZVlUQ0Y5dndkSEtGK3QzQjBS?=
 =?utf-8?B?VVFzWVhVOHpYcWhKYi9RWXY1OFlLcTFGYWtwSXFNSjZMK1U1b2tzQWZNRXgw?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c924607-cc0b-4d99-b7e2-08dbf12b7e9b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:31.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2RdP1f4icNqvCya4uYFxvEpJG49h9C5k+QiMe7CQz8F8Q/5maJFwo5KJgSq+K2ZXgrttGfPKvEsN/ZpO1oR7amVSBwS8M8+EaGFfaGO2+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 01/23] drm/xe: Skip calling drm_dev_put on
 probe error
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

DRM device used by Xe is managed, which means that final ref will be
dropped on driver detach.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54202623e2553..296260f142dcb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -215,11 +215,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err_put;
+		goto err;
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
@@ -258,18 +258,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (!xe->ordered_wq || !xe->unordered_wq) {
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
 		err = -ENOMEM;
-		goto err_put;
+		goto err;
 	}
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	return xe;
 
-err_put:
-	drm_dev_put(&xe->drm);
-
+err:
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 270826fdb5ae0..08cb726c2847d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -705,7 +705,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -753,9 +753,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.43.0

