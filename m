Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC7C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960110E8C3;
	Thu,  9 Nov 2023 14:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047B010E8C3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541637; x=1731077637;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jSyyXmJQD32j7wrrXTKbdZnM90Zel6ThZ3v+6dj5j54=;
 b=NBzT+faFcr6yPuS/9Nc7M1aDXlkLT8kalEF7979c6YN6xmR+ffaAKsgE
 KzhEP3lAmGZR9Ns/B30hJW710Vlo94HJ1uYmw+AdUjv/shkNlfK1jxED3
 Uwh4DOuUYI25z9nGKWVMr13Ve5fBAe0Cs0fcA/qpqN4+U8ALi7aH+jF+E
 G31+Aj9uRVIQdsJxc9YgJ5vgrtpiWt1KnxtLOUJOaWXW+Ae1DYs51hQL+
 PXaejxmI/szh98LkUpt1HQt2q6F6Vqe88KVWz0a5pYHPXZOGsuyOY/AfU
 p7iRyIsmmQIuwRnchDkHsI+LFzl57TvyYxIYQLhkY8OSVI9kFLiyIpHao g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369332707"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="369332707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907138531"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="907138531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:53:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:53:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:53:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:53:55 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:53:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSLWOFbxqsWq3wUBlc07nTd3J/COvc4lUshy/0vlX0f6Frvnfy1NHzaY68Cnr37rb5o6KRY0wfvcJNbdRkW+24juTakRs3oizExqh7EUCCOS65cFpGNj9xLd0pb+F2VdL8lNym3d4n6LVb3xyqZFZOhTJs+C3ZBbJ8md9qAWplxxNiY2HbSI5ywt/kZqReBb9pnt5ImQze3YkU9jAhUZ/TG9T3Pg/+d7dx5o1s4zT/wrWvYDXpL16JsmETC0L7zKXeTJWZShgiJHIj1sNB8ynZbkDVCqh7IENuyIoHuGlNdOsLS4q8sLHfpFLYvzbqHovdePL2d3e/g9JzBR7bAsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEPLpK9RlF6mOe/6bprYz2oUu5EFv14PJim8n0UKIms=;
 b=PRNCQAOEOpqk/x9e41wzEFbOcjXgzxmuJkkHH2Tzf5me3USiOlCsUBEosa/d73cZ0clegF6Ygou2ypgVu7gdiD1H2P9rxo0begCXqNYo27HXi+xyWOoHouC9i2/aI3reRz7v53yXmthebVp+bkSMXxdwxKdtXehVFHBtEXNB1RfnMicZJKP3j3N9mXOxMhSsWVNi0JJBQE29QEODFiYOIvKYrkzIV8PMt+6NwUjEhuviawNEBmHKQI9BhwXgmyOkldxOBe51xH4HlQKUSh300pN0G8Uep3gkPVltteEdbLklqUQrDc1ppkYXta9//Hgcahx0KPzfhfWc2NLCOuGhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 14:53:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:53:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:18 -0500
Message-ID: <20231109145347.345120-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:303:86::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c10233-ff6c-460f-8e8a-08dbe133b01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EK9BAK5dgdJCerHGSAESr78yMiWeh+oml0gAuG2H+ZJuwNskEd+EKcucqQ9iyCJzzViZCybD7BW8ZZ3fqJEBglHYRrg8KTuk6rf4MNBEdnBxshGTy4li9/S/+yRiSQXB5KamSE33jS/AbJ1y89HOqtX8fsMssl+W8VyDwgmr2ZAEBoiExhvDjD4Qo5m40BbC0DmVuuTOmVXTdpzpn70Chh42Ypq0Yn4j+AuuIevBZLzJOik6l8RgxDozddoU5d04Ue/rgE2Z3AlL2yXouayTbYkYBwtCqy/ngkaH6kAtIiqv/scA95AVfCdsThZkIVG6zFNvGGzV+NXqqKPzr/G1lz7G7v3//E52PqE89YGeRIbx2rTV1mn6Uq4SvvBPrCrVOqxt/lJjmP3cSdc4lZNoCbmBX+luf0l1jFBGRIOJf1aIkUYycjSgMECwzYlzuly+v6/LWQSuuZW+huomeuj9jx8I/XKP5kgLtCyuQ4hDLEstT8JmrrWCyq0NWo0OE5Ppt3Zcx1SjU6LD2ZL2JR2MWoRrumJ6VoxuBohDiVy8CP5DaM3y/7IIGYlRj5sHpGfpJ316rYPsxVE0qjPAr1Ejlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66574015)(2906002)(83380400001)(107886003)(1076003)(26005)(36756003)(82960400001)(86362001)(38100700002)(2616005)(66556008)(66476007)(66946007)(6486002)(966005)(44832011)(6916009)(5660300002)(8936002)(8676002)(4326008)(316002)(41300700001)(6506007)(6512007)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUt3R0p4MTZFZSswQUlMNHEzQ2Z3cHBvS3lmM3pUdUMrOTN4elM5WjdLWkhT?=
 =?utf-8?B?bUZObllZWHZuaTVZTEZrZHNVMHJjdHNJcm4xakJ4aDZ3OHpuSUltL0xNdENH?=
 =?utf-8?B?QUpVTmtRMlp2TVNiMEtkUGJKdHJHYVVaNnJrTWkrOXZEMmxXYVJRUzNxSVhN?=
 =?utf-8?B?TTJYNm1CZUk1ejdiRlI0WEJBdjE5RVZLcHhXNnZlcm1mR3F3Z0hFOEYxWDhB?=
 =?utf-8?B?Z21ucG1JQ0hhbHU3YW1US3FINGxiUk0vOHV0OTVjejcyRmJRbFR6UEdubHl0?=
 =?utf-8?B?MTVJb1NvamdoS3NLUDVEcHIrVkpMOEtBNWR4UDVYS3N5RXlYOVN1bFhHZk90?=
 =?utf-8?B?bzFVbTIvdTZCSmZXaHNmTm9nQUc4UnJpcE1hYlRzNmpoc1oraWI0NzZ3QlIy?=
 =?utf-8?B?RjU1Vmw3d3lEYWNPOUNkYlgxY2hvZERWWFpCaWFiQUdPUTJZaHd3VFZBa1lC?=
 =?utf-8?B?NzhhUllhbFBTY2ZIcmZSWGQzMys4eHB3U3VnWlgzaXR0aDlXdTMwSXlJTUlv?=
 =?utf-8?B?Y2Q4MDE5WUlBRFhXSlFOQzR0R2U5ZDRxdHd6UFRxU1JsdytOWHNRbSsyV1pT?=
 =?utf-8?B?M1BoeUZVbWErd3N2cTlWZFg5cG5zL1A5Ym9XTzkvYkRxdTIyRnFMdTEvTTF0?=
 =?utf-8?B?Y0lySWcza0ZTdUJCV3NZTUhTT2JqSXYzdzg3NExBbVhPdktxNjFOYVZicXRa?=
 =?utf-8?B?dWlKaVVnMEhGWTRFVmFhbVlpUS83STRoMUw0Myt3cis0VkMxbmw5RVZBbUxX?=
 =?utf-8?B?SFV3M3BmZHBVZVdHRWpid0l0TTFHV0x5VmVQc3hBeDZuTFVGMkVGYlRLUzlE?=
 =?utf-8?B?OG1XNTNzSWt2NktJMmtmTG5yUzM5T3FxMHlQL3VlWjF4dy8zU3RmQis2SkRU?=
 =?utf-8?B?K29qYkNBNVdSSUFVRmtOQ3lPeEQyMC9nSnZZaHdpUG1HN1ZGTzFzSndGQkJY?=
 =?utf-8?B?ODJXZ0EwczhwanNpRE1HcSt6UGNQM0o5RWdDR002NnU4bzhVOVdNOWVZMm96?=
 =?utf-8?B?VkZoL2YzakRJUUs4MGo2QmpLeXFMQ0ZMOTZYaVluZGxIOWtGaG9oUEpvZ0gw?=
 =?utf-8?B?QXhyQlh5bVZkTGRqRVBJOWVYeS9QWmxBSU9RNnVndDhPeUEyVjBYSitJdnM0?=
 =?utf-8?B?c1VRQ2FqK2NDOStDZHJZUVhlSDN2OVhJcTdmLzJoYVlOdHNpOWRPQlA2dGw4?=
 =?utf-8?B?THhjUFpJSnk0NWhTeTZ5SnBXelI5b3BSQ2l1UTVnY0VvSEQzYk1sQUY4WXN3?=
 =?utf-8?B?Y0hISnR0Ykd2QURRUjVZbTdiTXg1OHZ6bCtiK1dtMDVnRnArMmNndXQxTm41?=
 =?utf-8?B?S1JCM2UwdXQvalFiQ2xrblVVa05LcFd3T3lodmwraGxRMVo2dXRuWVYySmc2?=
 =?utf-8?B?dFZkMnRFQzFySzl6cXhhQ21ob2tJT25EaDJObXhjQ0hzV1psd0N3aFRtN1U1?=
 =?utf-8?B?YUVTVDRhYnUrd2RNMmJzdHZFT0dBYUtRbHd6Q3Uxd3NIdHpvWEx5RXQrV3Qv?=
 =?utf-8?B?ZVdaQzQ4dkI5ZEdYMnBtM3RvZHRLaWtCNDF6RW9SWnNTVHpSYjRDRjNYVWdl?=
 =?utf-8?B?NTVxWmR0VkdSdEJWYUoxQlkwVHN5WEVKVitHVDNuczVEa2h3VmRNM1dtd2U0?=
 =?utf-8?B?VzFPREI1K1lOTG9LMExOK0M4dExKUVEwNHhPQVRZUGpUbk1XazdaY2FGcG82?=
 =?utf-8?B?aTlsaC9NRDNCWnkvWmJ0cFFaMHRoQlhDREI1enRGemJBMTlUWDF4MlJJYk9v?=
 =?utf-8?B?aXJJWWRqNklCS01BU1NYZXREZFVjMTlNNlFtSGdFZUNXdUxLOS9iOElsNzhQ?=
 =?utf-8?B?KzM3bGw3NmNhTG1XQVFSVmRBeHR2dEpIRm5BTXRmT3QvdUdyODBaUzlkQTZW?=
 =?utf-8?B?YTFsTTd6ZG56YjB3QTNIbiswbTRyZHFxSENybHFIbVc1QWZqMzRBZU1teW5s?=
 =?utf-8?B?M21nR0dJdk1WYnZKLytRa3B1UTF3cHJRR2ovcEFrVG03VnFpOVpWUVRaR3Q2?=
 =?utf-8?B?V05Jcm00ZWxxdjV4RVU0RWtaK0FsOEI5NzdaTVhyUnlyd05yUXRPS1ljcjda?=
 =?utf-8?B?eXJOaHRIUkF2NzFpd01VSkxLUWptSDNxTUY0QXNWdEVLM045VFhIMFNOMlN4?=
 =?utf-8?Q?LOb9J/peBu97JXLbxvUujRqY+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c10233-ff6c-460f-8e8a-08dbe133b01b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:53:52.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaPHB4liJm+Qy3AVKjoEXwMgtpIKdMdiQTvrEGYxHpay8Db9T7ILQU0UpF7L9ZleRKyBdN8BaId6KFo+IgYiaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 00/20] Sync DRM scheduler with upstream (with
 fixups)
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

This work here is based on Matt's series:

https://patchwork.freedesktop.org/series/126029/

But updated to properly remove the old patches, cherry-pick the
new ones and adding fixup versions to the original xe patches.

The only modification is that for a cleaner cherry-pick, I
had to take couple more patches from drm-misc where
the DRM_SCHED_PRIORITY_UNSET was removed so, we are now
adding a local XE_SCHED_PRIORITY_UNSET for execlists.

After the clean-up rebases, with all the old patches removed,
the new ones added to the bottom and the fixup squashed to
the original, our drm-xe-next will look like this:

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/drm-sched-final-rebase

For reference, the branch with these reverts and fixups is
https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/tree/drm-sched-final-rebase-reverts-and-fixups

The git diff between these 2 branches is empty.

The git diff between any of these and the branch with Matt's
series applied is limited to the cases on drivers/gpu/drm/xe/xe_execlist.c

- DRM_SCHED_PRIORITY_UNSET
+ DRM_XE_SCHED_PRIORITY_UNSET

as explained above.

Steps to create fixup patches like these:
1. Get a final reference code (where you want to achieve).
2. Rebase removing the outdated patches, adding the new ones and fix the conflicts.
3. Create the fixup patches while solving the conflicts or later with the result
of the git range-diff
4. ensure that git range-diff between the brances are reasonable.
5. ensure empty git diff between the branches that you want.
6. send a series like this.
7. Now we wait for CI results.

Thanks,
Rodrigo.

Christian König (1):
  dma-buf: add dma_fence_timestamp helper

Luben Tuikov (2):
  gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
  drm/sched: Convert the GPU scheduler to variable number of run-queues

Matthew Brost (8):
  drm/sched: Add drm_sched_wqueue_* helpers
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Split free_job into own work item
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Add a helper to queue TDR immediately
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe: Fix potential deadlock handling page faults
  drm/xe: Use pool of ordered wq for GuC submission

Rodrigo Vivi (9):
  Revert "drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode"
  Revert "drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling
    policy"
  Revert "drm/sched: Move schedule policy to scheduler"
  Revert "drm/sched: Add helper to set TDR timeout"
  Revert "drm/sched: Submit job before starting TDR"
  Revert "drm/sched: Start run wq before TDR in drm_sched_start"
  Revert "drm/sched: Add generic scheduler message interface"
  Revert "drm/sched: Convert drm scheduler to use a work queue rather
    than kthread"
  Revert "drm/sched: Don't store self-dependencies"

 drivers/dma-buf/dma-fence-unwrap.c            |  13 +-
 drivers/dma-buf/sync_file.c                   |   9 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   4 +-
 drivers/gpu/drm/lima/lima_sched.c             |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   4 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  97 +---
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 477 +++++++++---------
 drivers/gpu/drm/v3d/v3d_sched.c               |  20 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   3 +
 drivers/gpu/drm/xe/xe_execlist.c              |  21 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c         | 101 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h         |  73 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h   |  58 +++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h  |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 212 +++++---
 drivers/gpu/drm/xe/xe_guc_types.h             |   7 +
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  13 +-
 include/drm/gpu_scheduler.h                   |  90 +---
 include/linux/dma-fence.h                     |  19 +
 30 files changed, 763 insertions(+), 530 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

-- 
2.41.0

