Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A81C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DE110E5E1;
	Wed, 29 Nov 2023 01:16:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C789510E5DA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220607; x=1732756607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EPJXE0zQ/NJhlDhX/2T87Wm3dxu1SW1HJ3p0+RLh1R4=;
 b=SYp9NKarLJaCxlvnUADZbquNB9ftR0SubMy0wsiVPgUf6lW/dM9gehxm
 /KksUVvkFCmi3RX/Q7u6RID6w537XEoySlousKoMVmhh6NYmpL0phP6Bn
 LSdlOrk1RqNfoysm1BdGv0x9kzXxOYfkva4S6B6t93pWpYMrEbaSB+L/8
 Nc9yw/H357JjC/FDMYbKLyD+R0YPH4zmKRv9rpbRoNpv4jEud1+gwJtpx
 d94wx3YF9dNl5FbrGIoOcvq8VPGsbWg2FX8ju2LabIAhW6KR0hYoO38i3
 imF2xizXsgf6apH4Gzk4gddkAaLQez6+l+T4gMfnBkgRN6CgbcmgtVyCT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436534"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272489"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272489"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8RDQ301qrqJ9HYEsxOMNTGmIiD2rvQrg85Kd+fl+wnqUbr2MVHQrrqhi4FuKmMi4AGt0ZFdtikg7Prc2p7Yx7uaNhjeqrhJPSlVLPsTPWty0GgZfDSwi71ZMurkYFjBeMhL3JTKtB+sC4AQgi9ZyKGsyYRZk63vdGmyWlXt/7XabxU0byASDnRjoIHF0d1pkyFwCGR11T2KE7kixpZL4IZR7c7bAEUuBAgMtP0i//38mL1/6s0hHpw0suTSJJmfgaJQoJ4pH7S0E6aMO4PfbZZh4aoB1myf39dyKezCMizlOvADUyqH8OYygpqGsnpHO7e9p+1ohqHuxS2rb3EHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFUAigyiwqn1xolUcXcPI+6NWRdjSRgeSbMmD892lWQ=;
 b=hQVGXTgAry922PPnQefUJckGUZD9DW2b+8jQy2ujB32QQsPQYQgJtAht8+/G8I5im25Awu9gDnDtI4NlAIa4hd7TbDPt7HWRmDljY6WoafrOCfgBaznAN0GfaziXYtKYearYg2/x+flb9xfsCu7diVBMnb3oeoWejUHmAT4ixR4qRl/m4krZnIDgy9blMJVHR6NijN+gTCxAksSHvxADopSEahm3q+wzNciPjf08CVOKX6fjz0k6bAvGLmYKIaul8HdvKZA5hf7J09Xruh15lisHY+VmXfC4uorg2eC7HIjqd4HgVdZF4CN7Q5pkTPL0YyD75WoQRsMPT2v8vsqTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:05 +0100
Message-ID: <20231129011624.836843-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 3678a296-9732-419a-75e6-08dbf078d959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySzmDxbV5dZ0TuWAKRoBS5UoZASnTYi1IGMp2ak9FB6r8Whd01Z+zIB3P6Z04rmgP+/thhscxCHHp72OADJExsuy6PLr+i+Tw7bu61VTFDasRQe5xgWNV/neLA2WxPh/9LzmK3HoneSG4lmqbWst3VB1RIKJHc9MBvhFnYg/GQ96tQ+57MrtA0DcMsQwY5rIqDB9LML8WnkyIhb3elTy/LDmv9MaDj3uT7flnlUoJH358+n+HHyF061u1kJPQEfJ0c3HwWmSap0gmpVfMEfBBpR9r2ZfcyJPcFO9p97XRWcKYPmFALRsLz+P1vt1B9OOIaiheRkXrgfpP9RK93ZZjTTePyrOwC8flLwFKixfmiu7t0rntKroH9ZfWqhMvjHvOyj2odXmBkW148UHoEN6zCgzuNii328ou4U5YXWjpNhHEraNvnwXlKhtLOjKK6mJ4xPUjZRnseKkqD+m4ZXR1rzbvLc75AAhkdoDeOWtUdN1XMJ+oDxR5BzCNu93hfOKdVeDS0Du/WuJ6Z+yajXUJ5AVcBXviEcflfq3JSVTN8Mir2+6GN7t9vFvcoV9Y5JN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1kxNjZLNTJzTCt1MXIyOVBXRmp4cUE3akY1OEY0Z05SdDJ1bkpHQklCU1NO?=
 =?utf-8?B?eE92SHJmRi9ReDRXajY0cGhHTngyTzNvUWd5MXVHOG1tVjluNmdXUWVzcDFx?=
 =?utf-8?B?S2FQYllkclpzNmhhMzdKL0hucGNibFh2UHdzTnorNFNwWlhxbDlGdEVFL3ZO?=
 =?utf-8?B?eEhaZE4wWVkvbWUrNmQxTXlOMncwa0czZklwYTVCOFhkVFFSdHpyc0pORDRC?=
 =?utf-8?B?Zzc3eVpqYkVCZ1czY1hrMktzM0FWSVRkT0puL1poVitScnlkbFFWL3JIQ1JM?=
 =?utf-8?B?SlpxcmtJUElIS0VBeHUzbGtTbFNaOURzeWpmNkwvYXlBSmdGVGlVM2pkczZh?=
 =?utf-8?B?dVhXcFR6cXhJcGxuNWM2SFpiaXNRT29TMnFoNUJRTUpFVlJDTzFxTjdydi9q?=
 =?utf-8?B?VnR2eGxGUEx2eFdIWEZsaXZvTTJaQ0RTbkErajAzYzhUbDVvMFUyN3R1QWRx?=
 =?utf-8?B?VTZGNjV1R1dZRjBpVnlEdGp0R0xVejZRWXBOdFFZQVJ3TW0wY081aHJyVzJk?=
 =?utf-8?B?RzluY0JIbGphV1RvTEtRa1JNT1UvL2ovdFhLVnpZR3ljVlVhZWpYOTZaeWNJ?=
 =?utf-8?B?ek42R05jYm14NWNNYWVDSm5KbWUyb0ZZY3BvdzNOSk8zMDVrcXFoMkdwRlo4?=
 =?utf-8?B?V0cvVE5hZ0ZlRHQ1Y0lNOVlWajkrc0VwL0VkU1VCaXkxRENDMTBUdjRicHJ0?=
 =?utf-8?B?SmYwWnJ1UlFXVXluSmRYNEI1K1hiampSSnUwNzQ1VFFxRWJpNG1ydFBIOWRt?=
 =?utf-8?B?VGkrQ1BtYk9HSmZKWHBFWE45QVdyemVhZ09rUExpMG1IMkVuY1NoVXprS2Vr?=
 =?utf-8?B?dXRDS0dEYlJhRzQ5blQxZXRHSHVWNWdGTDBpVC9xMXkveVVMenF0TFc1cndn?=
 =?utf-8?B?dXVlZ2FGakJ6R2kzWlhwMFFxNm4wMjlmVnRlVjk5ZWRIOUJqeG1IZ1hzR2Jt?=
 =?utf-8?B?UmpRSE1ZZFNYWENQY1VSdkxmZlUxa055SmJyNkM4emRMTklVYlJtSjhDZ2Vk?=
 =?utf-8?B?R3FIaURCTTlXdWNrcWYzUWdhb1lGaExUODVtdFQvRGE4V0dIUGxtQXlJTjBl?=
 =?utf-8?B?eVJNVW5ISFJOV0VJUkQ1eEIvY2dNT01XYlpEVXZYSTBIbTQzeFVCSmJZV3pO?=
 =?utf-8?B?MFlSWFJuR2NBZng1cHhnczZ3KytHRXBQWlNLMEtQeDFMUkpWMGdTUitSWEwx?=
 =?utf-8?B?dnZSQW41UW40ZEdZUjN5OG5aYnFMZ05FMWkrSkVQaFdqSHZXOEhoZzVyUGZk?=
 =?utf-8?B?Mk9KNHkvWklOV3ZLejhMUWVIK0tmM3FUSVBGcjQrK25uUUdGNHJlQXJWcjI1?=
 =?utf-8?B?bWhHUVd1ZmVaUFI1c0hxVGNhcFNPVUY4SVFyTURBbWVMSi9QMmZtSWpGWjg1?=
 =?utf-8?B?QVBvT3JoM0diQ3J3anhTM29hY253dSswUjBUaklwREdBRTJxdzZxOGd5RVFn?=
 =?utf-8?B?WnNSTDY4SVRNRkNubVk4akkvdGZDOCtucjFzUDBxQ25MNnhSckkrbUl5WmY3?=
 =?utf-8?B?cFNOMk9YYyswb3lmeTB3cGN2eU1ZcXNuSWJweTljNVRyM2tpaVd5bi9iQzVR?=
 =?utf-8?B?V3kzM0M5elFjMmN1S05wSEhJdXBsUjQxcDhjT0tuaXBBSlZhTmJraFcwTnJG?=
 =?utf-8?B?VDJUN28vMEViNWZXMkc3Vnd4N0hKekhCanlYblVOVzRodmhvMmNmemhNbDNQ?=
 =?utf-8?B?a0owWTBkSnNWaTd2SzNrc2s2d2lSVXVXS2ZzS0M5VlVoeG84RXFLNkV1NEtI?=
 =?utf-8?B?RVp6eklhVStwY3JiejdkVE9tQWJ5R1hmZWVGVk5yU0x2dlVJL1VZeU9VNWxx?=
 =?utf-8?B?dkVOVFZOVWlDVWtZWkM3VnViWXVqNHBSM001TlN6andLLzhrWmhibzhONjhX?=
 =?utf-8?B?eVlvVzRoc3ZrMFlHdjNoUmNoaFk1c0RPWExma3Npa2V3Nmp2bHA4citxWnVw?=
 =?utf-8?B?TTR1SWtYWEdqcG5GY3lYeUE0UzQ3QlZ3S3NhNHNRQXEyc2JpWXhuUDF5WkpE?=
 =?utf-8?B?dGJ6TFIveXdOclROYmF5MW91b2FTOHp3WDM2bDFkeU5ZR1paeVZmVTh5NWdk?=
 =?utf-8?B?eTd5Q2ViMTBaMW4zdE5UUDhVcnJTdnpOdnM2bzNkbDdnalk4SXEwZzNqZEJh?=
 =?utf-8?B?TnBVSWZERnRtVHV3QjhxYVphTk9CMGdERk9DUHl0bjVkNDBiVGMxREk5N2NE?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3678a296-9732-419a-75e6-08dbf078d959
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:43.7188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgzszyHl4XSdi7dmb1MMAr5Hu2dlrP+BfSIoGqaHjhExVl4kOW204/pFjBlpsOOA22lwh514LZFiquwfAoLF1JzyFtEvWrG9/KpLlh33lhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 03/22] drm/xe/irq: Don't call
 pci_free_irq_vectors
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

For devres managed devices, pci_alloc_irq_vectors is also managed (see
pci_setup_msi_context for reference).
PCI device used by Xe is devres managed (it was enabled with
pcim_enable_device), which means that calls to pci_free_irq_vectors are
redundant and can be safely removed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 25ba5167c1b92..d1f5ba4bb745a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -585,7 +585,6 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 
 	irq = pci_irq_vector(pdev, 0);
 	free_irq(irq, xe);
-	pci_free_irq_vectors(pdev);
 }
 
 int xe_irq_install(struct xe_device *xe)
@@ -612,7 +611,7 @@ int xe_irq_install(struct xe_device *xe)
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
 		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
-		goto free_pci_irq_vectors;
+		return err;
 	}
 
 	xe->irq.enabled = true;
@@ -627,8 +626,6 @@ int xe_irq_install(struct xe_device *xe)
 
 free_irq_handler:
 	free_irq(irq, xe);
-free_pci_irq_vectors:
-	pci_free_irq_vectors(pdev);
 
 	return err;
 }
-- 
2.43.0

