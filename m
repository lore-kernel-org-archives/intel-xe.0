Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E364DCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41B10E067;
	Wed, 18 Oct 2023 11:59:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36D210E067
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697630345; x=1729166345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HkFC4vS+caVOK8zUh4q2cNttXXPSFCell8+Gy/UJrW4=;
 b=QZMGNzJSak4U0iaHxHzJYl7WDbN6QrX3Wh5vm19vvmbTTDF2xSl1E4qu
 kBTr58ubMQOFihSGWonkojKd28MV77WjxMqbmv8rKrcyd1XNprMUYrYY7
 gySMG6WilKF4mH3NQajZcNRxAnrG9wKAmNiSoAQ4I4lRUUcSpbED7aJsY
 /QV48NiYFKOGvoObyoyRPPPaHzVbQUNVeFWuMEeqyCar/l3gxzc+IiDdP
 oFKmzWB2XlpwlikJZL6+63cvdgwLMk5D1aliB1hlgx63Ip0RvcruitZNZ
 G3VzlFuOsOqVtRJfBe8iOv4FPy8Jg8aMvoWR0kVKvLzeFes4rHoztPsab w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384879401"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="384879401"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="880217699"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="880217699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 04:59:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 04:59:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 04:59:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 04:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBCrYRukzdN5vG/Me9GkVLz7oI+3R3ww/Evm1YOB9UVeeosQSFJJTDxn8riFgNdZPWdiz4iip5JjPDTSgrGKtfu5qOOK/YjHxxoYnLF63xB5jyBlwqNFlqq+5bGUfvqAJH3L+LFlmnuIDKt51DwsjS9tkKKR+2whKv/t0Pdc+gjDmQi1U9SwyhgPxxuke+PA14GwctYpsWA1jjiFpnTdUyZdT4me6EuOSFWJ21tbDvQvdp6BLhCGEIlzepyQshErRMtV/PEbTPtqo9jXOGAFi2YDnWp7/YebbaMs2AtFLVf1ckUFOaihkxiSK3beHf5l0pyo0+ocrz0Ai9MUyuTzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUSnTOn/zPL6UD1dASgZaaJOshTxIVDoaSz20qXy0s4=;
 b=LSoCktjEem9aEOpNRhZce9L8DvmSJmmfb3UAafYe2EQ4E7J2jac1msmlmYJyWU/8ks/ACwFmLRvH236wBjKQpW84faBLXJgOBybKrP5GPD/SKMe9ydvxYPQeIiaLeeoZCbPZYDjG1vQ39sN1mmb/G8h3o7+MO1hnme0kfob/8zCtZIXCW1WmoGdxCRiUp+X9ku29qWRTxC5LtCEuUZQiMS/1AjGdC7BBn7Kbxwil2rHX+UG/na/5+WIPW7Y1lBze0IQDknhL5eHUNdET3EFtYDsBiNx10cPi04bvyR8ANBhPII0qBKwEoEv9xnlB/pHUCGQ+UfRaV706d5eyJy+TSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Wed, 18 Oct 2023 11:58:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 11:58:55 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 18 Oct 2023 13:58:26 +0200
Message-ID: <20231018115826.3908905-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018115826.3908905-1-michal.winiarski@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ba8d1e-b1e2-42db-8f99-08dbcfd19af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6YyvxRPhq9/B5XPMMLScXr/CmhAGBoQAhD7DkDf+FKpA7e+BdsHxL00cQOWrabuyOgUDHd8ER3cYdyPrd3xgln/rcBddqxTkR0s3kRjaHvwjtPfREiStpuzqXnZTAeVpAtJbZd9pf7nxBJrazAINx2Qj0RhnVhdY9JQwxio/DKdEo5bTSU7KpWhC9X2xXhQpDPwHCS8oNZ0btMQZWqh1JgweXNW2pJEV6uf9cVFXevFsm5iFQwPudxznlqZRaHuemohyNPTW5YEGpR+D4N1IoAOVmMAqQnbKvLgrrGIGGvsp0rsDCU5QxtxH2bJIII4nDuhI/aXtcUK87r759N0IW5oJmM1QfLcMj8brHXGv4zY6g36C5D79GkBokw6p/4lDlEqBJgOyvX5+MyAwMBbBI5sCK8opR7HGCfPCX/7Uy3XFcJ0d3LmT+7YweIbDnGDqrj7IBcw/GLVCVo/Ci3Y4v+UY62UtFJfaBpaotV+CqqsBSEsZokf00QEK02jsblxNyxAnZQxPhRaAcFyaBv3C3qZe7fvmaRyhXrXx5HtWLWl+IFLi0qGoAUbU/n4CeGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(26005)(1076003)(2616005)(8936002)(6666004)(83380400001)(107886003)(478600001)(41300700001)(8676002)(5660300002)(4326008)(4744005)(2906002)(6486002)(15650500001)(316002)(66946007)(66476007)(66556008)(38100700002)(6916009)(82960400001)(86362001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pJODN4OUtPMEc4NGpYT3lldVU4NEtWZWFxUWdYclI2aGVIQUZhUW5kbFNB?=
 =?utf-8?B?dUNvZUJ2YjEydGZMS2w2akR4Z3FLNzlSTlhOZE1pdWlrMjNheUFlbFNHdU90?=
 =?utf-8?B?Um80bWd4T2FqUkRkbE52TU9NQ25lUFhkTVhxTXVuZnNCOHBvVGJaMjMycHJV?=
 =?utf-8?B?dnZBb2crdjFSQ0p5RUxpREYzbk81Vk5nTzVhVGxjc1d5U01iMVBvWE1WeXBF?=
 =?utf-8?B?N3UyRUF3aHJoU0x6WjRiQ1VVTThBd0ZGRW8xRVp1b1N4WU81cHUzS0ZRY09a?=
 =?utf-8?B?a2JtSXM5QXdYcDl2RmNYTFgwemYva3V3QXJKUzBBRVMzalRTMlhFeWh2Wnlv?=
 =?utf-8?B?NnRJQXNucnNLaE5URWNRUUJGU0NUWDc3Qlp3WWxYSUgzQUU0UEhZZXlKSWdG?=
 =?utf-8?B?OFNOWkE0cXRzcThqNytIQ3o2MVlBbnQ0blNCdXBWdWZGa2pPbGF1UFZYNjhU?=
 =?utf-8?B?bmxOaWM5SFZpNk5BYXpGelo5QVRCeGVzLzhjY2hEcDZ0aENYNUVFanZ1MFhT?=
 =?utf-8?B?MHZnbHA1d0ZFZ21XWm5vWlFvcWJvVDlQdE5UTW1sS0RWNTVWSC9RUFFIT2U1?=
 =?utf-8?B?UDdsSENjaEQ4U1o3QTJlcGVEL1FKU1hlOEtZWW5xVTRreUZJdnYyOWQrZkt6?=
 =?utf-8?B?aDd1TzdJU1VaWlR5VHhEU2JZbkxFVVdWS0JtZEJ0d2I1dHlwS1dsdlRpTktI?=
 =?utf-8?B?K1BFdDA2dkpwM0RqSlVJMUZEZ1drS2doeTNLR3dZRzgra1BzUG5TVDYxSDBK?=
 =?utf-8?B?Q3ZLdFozeXdXc3h5dWEydG1vK3Rhc3dDYTlhaHMyc0RPTWlIclJQU2U5akQ1?=
 =?utf-8?B?TVgyeFhPTlBycDJneDgyQnF5bXlIVFRTQnRNMVp6Q2ZUdHFYNlVtUXhqeW1w?=
 =?utf-8?B?SVdKejdqUDJGSmMvSm4xQjU0bkQ3Rk1IbUl2NzNJZ0xIWFpiT1phMEd5NGdh?=
 =?utf-8?B?UktTNGZ3Ui9EeXBEanNXTm5vRXYySHJYY3h4UXhyRG1XUWFXeUI3NU92L0RT?=
 =?utf-8?B?bGdQa2tIQ2JEMEJEdlhwNFJETXp5d3M1OEkvVG5nL2w1Vy90dHJHL3VpcXlX?=
 =?utf-8?B?MGZ0RTBRN1ZJQ1FxU21HbFZvYk9oWEJYSUdrVlE0VGtSN2F4VW9VbWQycG5m?=
 =?utf-8?B?aWQ2Tnl4RThNckdnUEc4akFXQzR4Wm0zRXhoR2JhK3FBV2w5aGNVVjgzM0d4?=
 =?utf-8?B?aHVLOTIwTVFTYWZIK1F6TzZ1NU5yUmp3Z0NlbUJ2WVhrRi95Tk16OUZIK3Np?=
 =?utf-8?B?RTNRM1BaMDBUYzlEZVhCYXBlK1JkTnBWUElVUHpvQmRuR2lYbklZTjB3WjJh?=
 =?utf-8?B?a05rckJ2anBrN0RDR3FDcEV1Y0NZK1RZTGhLTFQ4VmNmbHlCVzEzb0JicmZs?=
 =?utf-8?B?azdPUGIrYlhBOENlRUZKci81Ynh5R0ZTang2THNQMXhmeDV6L21wcnZOYlVr?=
 =?utf-8?B?SUUxTmMwN1hCeWdCUG9NbGo1SGtuS2F2VFJRY3FZUTA4NWFmU1cxanFFeUxt?=
 =?utf-8?B?L3IwNDlYRnNJSS9RdTQ1USs2VGRPcHU2NUNLb0tUakZxNVNpRjVqNFpKdVZN?=
 =?utf-8?B?THhBSDhycDJueTFzSEVlNmRPLzJ6anpuU3pGcEg2V0hncGpRL3R0a0FCZmtu?=
 =?utf-8?B?OHZQaW1TVlV5cWhEU1g2aWgrbjdDUGVqd1JMa21xVW96QndPVzBjMUREK0Vi?=
 =?utf-8?B?RHZmTndkYmM3ekcyNkZBcGZSV01sYkJ6cGduNVlTUTJIVHBCMTVQNFNRQ05s?=
 =?utf-8?B?SmdOM2RPek41cXZYTXRMN3RCVlZ5ZG54ajlzWUxVWHVQWHdEM0hXdm0zT1gv?=
 =?utf-8?B?ODcwUmI4dXlmUXZvYzMyQ0hjYy9wOTk2L1JxbDBDZzZZNVJqR1pScjRPdnU2?=
 =?utf-8?B?RW04SDY5ZHRYc0VtUmJvdDdxWFUrT2dvQW1ENXJIc1dJaXh5MHJhemZnVVZW?=
 =?utf-8?B?dUpFd3Y4SWM1aDBFOHVjZ2tPN2dQU3pTVG9IdW9SbGFQcS9BYkc4bHdzbUh2?=
 =?utf-8?B?RmxUMXE4Z3VJYVRlTkFSaUg4S2RpdUZodFowdU8zSWhPcUhLQS84N3B3VnFr?=
 =?utf-8?B?QnhsSDBxY2hmb3Ywc2FqU3BmaFZNaHdmeW9BM2tRdE9hZms1dlBOWXgvMnRs?=
 =?utf-8?B?a2RVKzNXTkpiMitZVU1CS2JkUTArWnN4Q0JiS3p3SjZmamdoT1pRZmpXeUtU?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ba8d1e-b1e2-42db-8f99-08dbcfd19af6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:58:55.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNN20O1FQkYVRvX51f+pHGoMn8P5NeSUu+jeBezViPxW10pBdnUdvFrlzjwDpFKyW1GVNihblinv4v0LRVZm75G7rm7+Pgx5WO6+gpLq5xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Fix format string security warning
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

While "gtidle->name" is not user-controllable string, it's still a bad
practice to pass variable as a format string, it also causes the build
to fail with:

drivers/gpu/drm/xe/xe_gt_idle_sysfs.c:88:26: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
index 7238e96a116cf..8df9840811cda 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -85,7 +85,7 @@ static ssize_t name_show(struct device *dev,
 {
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 
-	return sysfs_emit(buff, gtidle->name);
+	return sysfs_emit(buff, "%s\n", gtidle->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.42.0

