Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F091C7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 13:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D4F10E99B;
	Wed, 26 Apr 2023 13:12:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084D810E980
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682514767; x=1714050767;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=aM2kT3AAAwApILu8VlV2KrYl3Z7Labh0fswZMAREd0A=;
 b=l49k2bHsLPF2Gq8MYw5fh9eXARPc9V1AZ81it7lJ2hmOQ6THbN/okwwB
 smmPkzg0sMA4YMO3XQRQeTj+Nwd1QJDTFX80GQmHBNFdkG3ZGUQQqFCc6
 ul9wkcmj5ZQ/XcVJUZ8ubXc4fcCTnX0gknX3AovjNwWns8dT1zDu1DbLb
 Rb1NErEIek314AW/a2ENtGJmVaIuK1s0t7TYwSHIREwfIhH6vhVuO6pIa
 pOiMbUKnJqv+kMcBI3GS8jIONT618/C9IMb6TDe/5cMYSCQ8QOGIcEmln
 79rum1zrOLylDFn4tSkk8HaXXjksjcawpqzNx9+p8mNS0gm49gFCBeZhH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412412040"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="412412040"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 06:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="763314279"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="763314279"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2023 06:12:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 06:12:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 06:12:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 06:12:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 06:12:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxF26EPrTclTlNJddW8ew16HyUhP7a8FYkkCnE39+EjfSxZVTSosSYKFL18OotaFzBBlb4kPZ305BN+moJU/za1lqSq/6h+znPoUjSe8o7DWrY0tcKQTLdBUwCB2wzD47JRGjDiRp4IuBL2zL6Y2+5HrOs6eURVxKuvpaf5dIDUPvOvlSeOgySttT+riNKHKjSFGXzdlsdfn2MQ4WDgcUnAW6zE3fdtq4EvdZY5EExY6UCTWtF+J50TeSbhz9TkfrhJNVTBuNOcv6wMhwlNLTWZPLUzVu4Tmh1JMelR6Wb5SqULVUSJgzc+0O4Eb8U9dBoD+IE6d+68kN+dfWzB3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znna4ucxLdAAijx8czbRo0W337J3qN7c1Y+XrsuJEQU=;
 b=bjIclio048BBLbaKiY4SEm5uII5CpbcauI/IIE5aWkIJCW79Dw8oJGUa+a3m+r+kY7hzMVZXWd6CoqO9+oZoK32DVc1H4v/+0EUCmkMY0dZ7EJWv14Ly06OIClX5dU8jjvBg4DbnyFGYdRg5u1BS+F1Fvq+s+n1rXGFEOczTA5bZpj6xIfVq06fzwAPgjitFcoRk5HG03SiHcH6VuEe0N+mmM7bgBdwAJ9mR8VAu06CREb/HbemWI4WVtgeytmpFvievg5lwKjv+qN+ubee9FqJFEO1Oos1SpjNtu+L7lLU0vpIkGhVUA2cLGd/emQq8prSwoENe9QJAxWUn+NRFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 13:12:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 13:12:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Apr 2023 09:12:33 -0400
Message-ID: <20230426131234.482201-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0d246e-3f40-4056-3d55-08db4657ea62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g32p7VpSp8DMeqmKeKe6yKp1cJtPN/v3kCQQmlFQ4xElRw/jlo9UHaPL7/lcHUvowvOcKmbWmVbu70UAsIdcXfgK1EVXnEGuJK1X1m6nycjWSE6wxpsvBjCuyP6aq4F6xkiFOXJ/VXXvXBX5e86XGjUVbx0WEU+mpg/rTJtP2tlpOcnJWw6fwy8jNcyNXbvqw2FdWd1LQZ+IKi61v+AAhvhsTDaJl2rm5gkQl0Umiv0FS53wJ9ccza/Laf4hz24fLjyGuMc5G1rBU4mtNzcAV+i0pgeZwMJwtTwCNVezip7Vl8TmaIyjZsOb7AzzNNKaaIsj3HMmpV5i26mobDajCrMLeHnVnzNrHkWdJaa2OOZ1femQxHn+C7wUlv8lecqiinBxEmL3eVWLjmb9FhdEW++KwLsVKFoKUMIRSTw7YGJpXETeLXMSwgJ2Nwx81+izSRTk5SJyGq7PcvrXRER4oVjQgsuScdceS7OViZz+jv5ug8Yk5nsM1Y7vuIVAVX09BfAKaubHuY7IPHXqyiuFo96nCERQj/hcKPq7Rdlc24Aw/hvyiga/dpExgk/Nbgb+BoqkLdwHgosuUXrjht0RQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(66946007)(44832011)(83380400001)(2906002)(26005)(6512007)(1076003)(316002)(82960400001)(66556008)(6666004)(66476007)(4326008)(6916009)(6506007)(66574015)(2616005)(8676002)(41300700001)(38100700002)(8936002)(5660300002)(54906003)(86362001)(478600001)(36756003)(6486002)(186003)(966005)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGpVclRzeElXdVdvbGpmSzZwK3ViNjFZa3NSSnFBOFB0cTVwYU9CZFJHekJn?=
 =?utf-8?B?ZW9PNCtuSU5qNjJUWEk3MTRaSFN4a2dXYURvVnI3L0R3eGtoRTZwTHBKZFpa?=
 =?utf-8?B?WFYxdk9NbE1SNGNNajNWN09qV3R3VXJqRUwvazVmcHVCRm5LYjFxM3BVNCtW?=
 =?utf-8?B?cGJ5VkQ1ZHhBOG9hSFErYU9pODNtd0lyUkUvcWUwTHZ5L3FBa1h6a3lWOEJS?=
 =?utf-8?B?U1Q0d2tsL1JsU2Z6M0YrVFlRTVpTSGplczIvckNTUEZ2dG1nZG1adkYrNWpn?=
 =?utf-8?B?NHhzQ3plTU9jVU55Y3NUTHhTWTRmWG1kUWkrS3VuWnVHdEVtZnlqZVYzblBS?=
 =?utf-8?B?b0k2Q25sNHpTLzFoV1VRM1ErK1BwZ3Q3eGFwKzlTN2RVNUFKVFJaRXd5Ukhw?=
 =?utf-8?B?WnpwbUYwS29iNDV4S3krRFYxTlp4Y0ZxTVJyR0xlOFVhRVVTaGZXK1NqcDJX?=
 =?utf-8?B?SEg2MXpBZThtS1VmL0lKbXIzOEVTRFpOUkt3Rm5zbjEyVGhZOEd0V2R0UCs0?=
 =?utf-8?B?UGR1WmIzbnBPTTJuU2J3Qkp2eDliOXVZS0ZjNVBTZGZFZlE4bTZ0citvYkpX?=
 =?utf-8?B?NGswMUZnclZid2piSmJ3d1JpSDd6bFdWaGVVL3ludVdBRHZkNVp6ZEZmR1gy?=
 =?utf-8?B?ekRmcUtJd2Q1dWpHYzcyMmp0NVlhQkZXd05vTlIvWG9mL2FmZzFoZDh4TzJq?=
 =?utf-8?B?UTBPTVRCM3BqbWdEK29OK1B0Z0dDWFY5TS9HRVoyeFdVdmZTRlduVHZlMEln?=
 =?utf-8?B?dFJpZUtBTFVoaU9uam1iUWpGSzJsZEtKVm5QaFdxMUp6d1F3Um9CNzlXYURU?=
 =?utf-8?B?eFRWQzJpeWV3ZWlWcmtpNkVKRWhwS2VhK1Rrc0dXcCtsWVZTNlAvekw2aHBh?=
 =?utf-8?B?SU15ZXlFQ3I0OXArMjFTQ1FuZXF2aitrdUFsZjBid0hUaXd1ejhaL1BiOS81?=
 =?utf-8?B?YnVHZExzM0haWVpEYU5NL3BEbXNLcGtPL015THF5dE8wcGNVRkMwQ282R2du?=
 =?utf-8?B?bXJIUHJkUno5YTlnSG5xU2tiS2NXanBON0xZcFFoQ2s1TjhReDlrVFl1WjRo?=
 =?utf-8?B?MW5lM3BDbnNJRjJUNlp0eFpYL3hQdXRWWWJUOEtmcHhZaVBIT3hXQlVWWU1P?=
 =?utf-8?B?cnRDREphNnRRSkQ5dEdqTTBSNDRTNThOVjdEeWhFcUpuaHFROUpiK1BZV3R4?=
 =?utf-8?B?WmZJLzFiMzJIV1pPK0xQMkFvdjhQeWpsMTYyMUxqMWNzYWt1SDJWN1JOSkk5?=
 =?utf-8?B?QnR5WWdVOHNjMGpZUkFiS1lmTFNJKzdKQ0JMUUVYQ1gwOGRRRGNSbFBqVW1k?=
 =?utf-8?B?SDFNRDY0c1pCZE1ZZklYQUYvOXZ4T2lPN2tINEhLV0NmaWdMQy9rbkpzRTFS?=
 =?utf-8?B?Z2FabUVmWWVSWTdJYVVaS3VidW1NMGRmTnJkQTVTc3lmc2RkS0Yxb0VOM2V2?=
 =?utf-8?B?ZXNnN1liVUdhOC9rT3FOZ1ZuR2ErdTZXQ3BkL1JQM3pUc0V1clBDU0piaitP?=
 =?utf-8?B?TW1iS3JqVzRqR1FsWXhab3ZpR0dLSWF3ZHo3c2VweGJmbnMyaXcwcEtRTkZM?=
 =?utf-8?B?RTVzWVZEb3dsak9SK29QUUx5c1QzaEM2bHR2Z3JtY3JKNDE4Vm1WMlBtdm9a?=
 =?utf-8?B?M3owM2dQQnZmQ3V1VElTWlJXSmduRUdwVVRoR2pRT2psNmJJTktsbVdkQ2hy?=
 =?utf-8?B?YVB5THQvS3BKNjAxbjdBdjd4eEExbVhqSEpmMHVsdzViZ2pzMDU2SEZiczll?=
 =?utf-8?B?OEVBT0VOdkNHczNBam5qeG5ocEtOcVdtelA1aHM4OHRZVmx5Q3pFSGtIbnhF?=
 =?utf-8?B?bHVPQm9zclVHS0s4SkdxRU43aUYxQ3Q4VUNXNGpvckdMVkVmOHd4Vy95Wm5W?=
 =?utf-8?B?R0hka1UzKzZ3TEVBRnBQbmg3UGJwd2lkaTNlU2ZOZ2NGTmpJdUlra3hEMktU?=
 =?utf-8?B?WURBZU9HTzlVNmJ6K0JCb1F1QWcvcERVRnZ3SG5Ba3FOMThHS0ZJSEFtUExG?=
 =?utf-8?B?M1ZMRy82aVRIU01JZlBSeTJkVG9nSUZTd1h5dzY2d3RXYUFLR21Bc0p0MmZO?=
 =?utf-8?B?aEZUbHIwZjE2M0ZMMEhrQjE5WjUxazBRNTRCSm5xZW8wb1hKM3N0OHRVTmxW?=
 =?utf-8?Q?4wLCTsUryodYlaiWpMu6hvGYo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0d246e-3f40-4056-3d55-08db4657ea62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 13:12:41.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R29FXfWmOP8mn4kr3BYF1hTf72KXgIjLBsjlIWQ1dje5ibfcMqLMidGwBZu0Fpba2IwSRpPcufwVC/t4CQEjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/2] Revert "drm/xe: Enable d3cold support for
 dgfx"
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 7c1c3d3898c60f3e96f40737f0d8ddd4b8934aaf.

Unfortunately we are not ready for this step yet.

We need to rethink our strategy on D3cold:

1. rewrite the VRAM save / restore to avoid buffer object locks
2. block D3cold if we have a big amount of device memory in use in order
   to reduce the latency.
3. at resume, detect if we really lost power and avoid memory restoration
   if we were only up to d3cold

Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 14be0259a222..9324aed8a821 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -762,8 +762,13 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	if (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
-		xe->d3cold_allowed = true;
+	/*
+	 * FIXME: d3cold should be allowed (true) if
+	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
+	 * however the change to the buddy allocator broke the
+	 * xe_bo_restore_kernel when the pci device is disabled
+	 */
+	 xe->d3cold_allowed = false;
 
 	return 0;
 }
-- 
2.39.2

