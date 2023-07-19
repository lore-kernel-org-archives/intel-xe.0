Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA64C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 19:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2410E4F8;
	Wed, 19 Jul 2023 19:27:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9942F10E11F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689794859; x=1721330859;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=X8j7kpI+ukxCosA3uHCqkGKSRwd/pdmOtXKBlz+62FY=;
 b=Jlz+JCap7Psgec6uSlg3AjvbqWMea4/7IlWzN4BghHMZdPaCXQ+fC5Kn
 EclsdeCNbW7SLGkkYFpJdhh6t5V99vrAJ9CgcGEAjH3gsD82k/Qx3Vkh0
 IeaBKOUQhY2yVQgTH4LZCkfkSDGe3BD1RFN20XTvHDNCVp5qqqiykoW4/
 f4Y6sjtgYfokbp09ev6RaA6IGakgFhV566hPYMFkc9nOPGfAh3uaTU3ow
 rV55WeX/aOI2zGmRncApAz997rRZobod/LKvqhJI5MkWZDPto1EuZqP+6
 oOPN/h8lmprrrAeKqI1KjKsS5jqcZyaDOQd4mt6mbOhauM0V1DYMDfdic w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364013520"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="364013520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 12:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837810620"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837810620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 12:27:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 12:27:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 12:27:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 12:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB7ijhpHuEKsYy4RjGBrcnBhpt3maHn7sHqJMntDfl+tJjOmkTVOabJdfbiNFyzVIsoZ8ASoDPWBDy7Cvv6LUTtSHkkqH0BXI/cpAOCYiS3FkfvRG+5xTa8kNUWdkK3MqEcQnSp4lxCA2OMiFLdY/v5KFJUNmDLSkSVCPAXdf3ckSiEMKn562C6X1+XUMeON7U9z5CVqA3obXVnIq109pXGvCmDlmPyHjXcsbRhpb0MV+Ed+jq/nz//u82QnOjhWlmuuvjs61xp6j25OY+G0dHDqKQnLrtQn7ukgqOXjIUe3/Hf4PeEpZ4gHqcQou8iEP1HR01sjy27j7JIy5sl5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkI8+Adb64Veniji+Jb48ihPF1lvxBQNlJPDspo7mDk=;
 b=gEotn20W+T42fxrNmRhFDWbiWdUgnxZVTQ5hBpEAW83d/Yc7k0HXusQWMjJcE9S0bWfUDsGG4Z1mGbUUU0NWpify2Pn0PQ6pmWOGmQkJMBx25cicyALWoBDlGaDYRflLpHQQihBvOAjQdC+ornVRlwhXfulRGWdp+HAwESfs0A6/RZeVpzTCSUTnFjECGowCDMl3Y7p0Ykkr1szt8xsmtyGzXoboMTR7F5IjHTL0CRJucwg0Fa7Y7Uapn+XbKmoh/CJjk0+DVg2AKzL+cmP+i543ZA4NB74mAslTBmQM122eBTaq0wzKZvMDQeVCF0mgW9yvOPDL6Rgkt8XRpHwrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 19:27:35 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 19:27:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 15:27:26 -0400
Message-ID: <20230719192726.172056-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: db727bc0-9667-4271-bb0e-08db888e343f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mxx9W66/6qQ2LCQrPZ4SWwFjs7maviouY6VGGPFeyTXi1+HT84zSKh64XbMtEhQxG/nuHcc1n4oKzVSTcsiQGTvwVeDK1MicUlryFKdYBPIGsTwV7uHDl/hcvqETsH9EK6nJU4153C5rfYOWDOhvyzzskY8UwbBh0nALRt8obJrwTL+dRXBGJndb3ShlYI0uTT0kULNG3Q7uh57YG+eg3f7z1v4I0VB8meGisz/Wj3wEZOGdAD2/7uDpslQaSTZrlP+TOK6SCj863iJ7S0lNswxfBeZYKK6rLqyN5BSseZJU8tG78Gd1sueMcShiMVbmeb38nzg2YOa5WO1xeR2WbZNJ2LeRzsN/AfIa0b3I39csNuAf6YR2shxMx7/Kcx09LAunh8wvE5cl6ICL7roqWGDn5bRVqdYL7v6lpGqKnkx2krj/7a2z/P37fXEUsZZ1uMKSR6xjd0rhpeM4sVJKO0ZgBDlSIPc238/NaQYmyDq4xU4gx5uVfDrbp9a2OH3dfJWfEsZSOAtiHWR5+1HR/cGTcpSAbUsS1w4Y2oF4MB1CaVQnY5/yw/IlP3Ms0N+V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(36756003)(107886003)(54906003)(478600001)(6666004)(6512007)(6486002)(1076003)(186003)(26005)(6506007)(86362001)(41300700001)(6916009)(4326008)(316002)(66946007)(66556008)(66476007)(8936002)(44832011)(82960400001)(8676002)(38100700002)(5660300002)(2616005)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bj2VVTxijozdqRnWb0ucsv8b7bNdnkmyaZjGpYt2+9EBoMYdx6Qmahic+vE6?=
 =?us-ascii?Q?4cmrBTFeDZt/HtOC8vnSIp1FxJ+UbHncZTF71w7WZL7dqmxgSGTHxw9JVm5Z?=
 =?us-ascii?Q?pu6lYjh+dRF/eUL2Brm/J+fynH8rDzomCAMViPRSFSYGnvjTVodwdiJvPTbZ?=
 =?us-ascii?Q?Cg4rDbeLhPFUQxbbzIrriGy6FeuadooFXTpwkF3BTD4Dn0l/5rebD2mDVxOS?=
 =?us-ascii?Q?A1EmmEzKR7ycsLZ/Blr/nDVUI2EZlhRBup8rNz2rcb9lVsk0Vi8dwJvfWEjF?=
 =?us-ascii?Q?ktq4V5q2qqMBrYkbyzf4DN+gnX14X17Y5azitY8BAp+fRL873ww9esreqIb5?=
 =?us-ascii?Q?vUjZQ6tt5jHpAfRpZdNaMFo23n1XsOIkoZcUvo+s1Utb72JDLgb3N5LGUc94?=
 =?us-ascii?Q?kBpbkohpAyXypc35OZncVtWnvaLW2Lh5nKFIZLr6ciI4SIFsNpzR33ECcYLf?=
 =?us-ascii?Q?O0dTd6x5oqiWEKpEN7iM9hJYM9fIoVrTAYYYkNC4tR0eBK8th89x/8laBlmM?=
 =?us-ascii?Q?sGGwasfbP1EzKlw9UuwZPY3CuQD1LhvcNIqOBH3tKg/mIG92HrcgaKXGg+Cz?=
 =?us-ascii?Q?10syGt0frfG0gDAgb/1nbbLyyK/N9+OgnMFtkR+fGY0Jn7gV3zzEDe9nmdYl?=
 =?us-ascii?Q?g0eh6+QbX0ItnfzdyPVajUJfsevdg1a+r6sF70ZDhTTJzF7nQO+hnfboxr7l?=
 =?us-ascii?Q?zVN6VZaYlB+ZQMFQcN8kuzY3+pvjOvyppFactBi1LUUfdyHr5YqGRM8V/dEs?=
 =?us-ascii?Q?ZOnaLW+g8Jz+00E4i/mRF1tToLeWQoQzNHl9Gze5vdD5Z6jl2FTc4Gg+DXwn?=
 =?us-ascii?Q?EB5cZ8YK3W5DcRuVrJhAYy5pFm5H5JhmLTh15VhPgnWLkfcwinzDHXEg25UG?=
 =?us-ascii?Q?D16hj+WT819tuwoivYQf829bUvwBT/NIIFTvmfnecE43AeiyULixnwMNaxAx?=
 =?us-ascii?Q?2MEEVm4GmkvXYFwtOSQ7MqA0UeUlehIxAlHFkmxep0D1buTD5a1yBi9w8obs?=
 =?us-ascii?Q?IfzvXO9/DbjO2CICDyUGiJjd4BMdBvtnddoAbH95hJ8IUoscHiHjKAtErYqF?=
 =?us-ascii?Q?ktw2cUn68B+jyT0tkGBnAcsTZ08SRHvjMREgJ9r+QdXwzCGdzDeBe4xE6rv4?=
 =?us-ascii?Q?ifG4FGoVE/ZOkug/4EbpmQJTCxT+bC5/n4w8vn1X04LTbWjwwpDHNn2lEjb+?=
 =?us-ascii?Q?Ul5CuvDe1WD4fmL+V2FK+8BHVAMOGMrtdrg7lbt5TN/x8JrORriKihMv4nQg?=
 =?us-ascii?Q?6onx13xmI3qP4DGdFXakivSR4BtzxK4d9bG7ZFUzvSr+AZLa5tcfzkBQWQLh?=
 =?us-ascii?Q?shryvt4/GjWqFmltqKm94v9jSEuNjRGFjZg9j3BtBtRrcH0RMG8K6bHz8Dkp?=
 =?us-ascii?Q?dVGVBytsM5trkA2d8ei6TSTKaXmBkX3lFYOvVbipH4qOCMX5lIetsjs64aMV?=
 =?us-ascii?Q?HfROPoC5PNRGoXwD2hsE+pVaOQy/fZrymUKD0CzxrLyJdgTuy+7Txhl09DHh?=
 =?us-ascii?Q?Q6Thh9Z69EoZ6QFmLg3wuad5ZD1vN6QAM8IW9+0FbswByjS64a9JjOnEZRHN?=
 =?us-ascii?Q?dZlzZaTqBwiZoXIeKOcxD1LGEhgoW74OYus7L9dU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db727bc0-9667-4271-bb0e-08db888e343f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:27:34.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs/nSUbdQ3bB6QAPvISgSd1+h4oY/57zUJ5gfIJBI4Ntur3KbpXRg9F5D7f0cGCg/OqmS4N3Yju/OMBaUfZy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context bug
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

xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.

The lock was created to protect the gt irq handlers, and not
the irq.enabled. Since suspend/resume and other places touching
irq.enabled are already serialized they don't need protection.
(see other irq.enabled accesses).

Then with this spin lock around xe_irq_reset, we will end up
calling the intel_display_power_is_enabled() function, and
that needs a mutex lock. Hence causing the undesired
"[ BUG: Invalid wait context ]"

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index eae190cb0969..df01af780a57 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
 
 void xe_irq_suspend(struct xe_device *xe)
 {
-	spin_lock_irq(&xe->irq.lock);
 	xe->irq.enabled = false;
 	xe_irq_reset(xe);
-	spin_unlock_irq(&xe->irq.lock);
 }
 
 void xe_irq_resume(struct xe_device *xe)
@@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
 	struct xe_gt *gt;
 	int id;
 
-	spin_lock_irq(&xe->irq.lock);
 	xe->irq.enabled = true;
 	xe_irq_reset(xe);
 	xe_irq_postinstall(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
-
-	spin_unlock_irq(&xe->irq.lock);
 }
-- 
2.41.0

