Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3674CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 14:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434B10E174;
	Thu, 12 Oct 2023 14:09:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB110E174
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697119764; x=1728655764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gncbnbkhD/AquHra5CyOCFHQZ77xgl+7BdQNpH/fNXM=;
 b=MD5DflXpHicQCqmx9Mk285BSFLRnJFxvViZ1mjJvD1znqzy72/qrkd89
 8EmV7OdeR9XNzFT0Ihi8JX5nZMwl/p1wx8VUkJIBViSGmw1fvgu8jlAON
 dl+b/nJQIYDAsDNl4aATo6IUl0wxRk8Et+Spzhgo24/M20Y2PqbI6SMzr
 VpaMdRFtUdBbO0DNACCdVVorodmiiw1/qAfkVnXAczWMRQFUXq4lgUpdv
 EN4E1oVpOfPgIgULTByUqVhKSNy3LyorWb/f7fZcNWlal9JrAV0oPkdB1
 QBxD3n49/KfIgf4UYHwAzgv7yMdiSgq9iW3fPJfKJZauYtaAXRpJwP6ZQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="415977990"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="415977990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 07:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783723275"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="783723275"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 07:08:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 07:08:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 07:08:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 07:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8XAmmhhLeLwxweKLeak7biqfDZNa8qglbj72P1a9CQsEJ3TzYWcQgB3R4IZPM7F8lgg+q3jWqeFDdk1Ap0BOWfEKhSyI9Z5aNRDHI4q3NlhKttJJ5VwGkfg8aYYetu07G+LhI6zfErt93BpA4KMvI29qWV+5tJA3EMSuw3eka6HBtN5weT9cVLp9SdUmcZiQ3rea1xUcypBdUKS98mIyciveQlxjLBprThDR2dmTRebokJTX9Ty7iancjQypNnFnyYLjZ454Wa1d6C/sBZxyH2urYG2EXNbec4a7Hh8EBfFxAMVbrA8r6BjZaKrE3fWd/U8iTvC75cL8d5PaRnCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfNahiW0E5XnAKx6c7vYaE7l+pzFKqSqQOxVMW8Rc9c=;
 b=RpkYDEpCM5T5OaImAULN+URI26AD4QcOmS+jW81PGznSISS9AhfcyqB2LDdL7r2uFVHxperpxyIrqO53Q25d3xzIKSUAH0rsdGjblCREhM/9q8Oqy9xBLMWXW0GpmPTGnecsbO4X/gjSw9SVtdZqmokMpwRkWSklHSbHT3Ge9lgjqcg6/S20U5NZB6o5i6YkAHxtYmOIE9n5dofWvAoe27spD+tGot4o8xia2GSutoU/ArF4zSjdZr+0WZzpCnzsJ1PSDylwinx54VoZe9jIyw5YQl+zgoVnMwrRdQAf87A6vpV+f1W4t9MisKBQa9qJs0R6TX427HuVBgzocbvAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 14:08:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 14:08:44 +0000
Date: Thu, 12 Oct 2023 09:08:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <gvcesx3btnumlf6eufzvdjl7u4zjbkdlvnutfz6gd2a4323zha@pmb63j73bnpk>
References: <20231011174252.10427-1-bommithi.sakeena@intel.com>
 <87mswo2oap.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mswo2oap.fsf@intel.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff01d78-cf71-483d-295e-08dbcb2cbeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zu3g8A6wGCKnbPefHzQ+0ilSFNWkIvmU6YzNKuvCK8q4kKxtWR5tiUH/rVRafYbHonWvDwhtuDzxB8vC/5RvcLQxpVzlhZftcCLzVHRH/3uNGZYw2F8FnBBF/5iwP6/vbRDWR5fxxfOBhAH84P155leaOl2ZF0RfowHJuxG3fFoZo3x0q+7Xac8BE9ix0yvv4A1g6bzShKBNiDh999eRJyBSmvM861fuYw9qCbakaEYgH85C2rwOXUJRQymlA3gJ8bBbiyUKYPiEXRg3ZrqMpMHiGmgmlvg3UlxVwnPoSQpMBqztT/bjorAI/6FAsKNdxAro0nyogmEo6ZlLbW2xUaI3LZ41P+HEwKKVnaNKDkuHf+E8GZofa1rhX1SCFg383wHxeB/c60NcdbQ388Yg23ZW4Ul9BCOI9T1uOjI2HTFyO9Uns1UPxCNse0pOR6A82uqC8gy2AGcgopWwu2Yqoo5JHxWGgroP7fhzAC7c+SGR229ITn/NaP8Zit/AJ7xiF/uiRo42xlIODMy9bNWFP+DUMv3BiqwwQVj0TPi8jNi91ZdnwHi5KjmOaaADQcLS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6916009)(83380400001)(316002)(38100700002)(8676002)(8936002)(82960400001)(86362001)(33716001)(4326008)(66476007)(66556008)(66946007)(6506007)(2906002)(41300700001)(30864003)(6666004)(9686003)(6512007)(6486002)(5660300002)(26005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ygVwR2JQvREBj44nNFPoFeoQN3Cxsq0Wi5yht5hDIDrobhjfiJG2nyEmDa?=
 =?iso-8859-1?Q?5yiizM2QLE9Z8Rotxx/lMJpcHw0Sj+k77momTH351pZhf293RYjQHjWSY1?=
 =?iso-8859-1?Q?9l05jcoI1siL/cWq+fFCVz1ZTH9uMJxiYsIEKO3HWh2li/OEInLC8Xf6/k?=
 =?iso-8859-1?Q?v39NGF22nVT3BUxOV4phEkP+lq4C4bSsbGOkZnsP6TJULi4PGX5icV8qZt?=
 =?iso-8859-1?Q?KJZCQImJeNfXfoTkuTqSGi1B85147qw3QyAYiUzr+6wBwBQU2QCzhf2blx?=
 =?iso-8859-1?Q?OVNR7B7AqnHwxuXoNx4S/gSG9CkDuZGNY7p7wOYJ7apEVkWm1ocs9+SI/n?=
 =?iso-8859-1?Q?WJBYsn6VbH2b6QrYaaEBL4Tr1yGlQO0RN1lBaNNQR6GYgr9iKA31OFFpea?=
 =?iso-8859-1?Q?3IWNsnt42w9kK937JbrqbNwnZbc/ZdJHOj0A2U/r5PdtYzFHz5W3DAf5bC?=
 =?iso-8859-1?Q?VXg+wM5S8dljt5uDy8uj/PR8Xj7T6FFvvCazWhICcSJnhcpbHZMuUWUNhT?=
 =?iso-8859-1?Q?2rK7WiE8Rhe61c3BVhcC5mOy15nZrPRJBny5Z11LIz6fUixk6+SEfIr9As?=
 =?iso-8859-1?Q?/UCPqVhfs7/pmxe+jbv/io3DG3xIZtKcyX3RXPXM/4M32m4sgsybCj7Mko?=
 =?iso-8859-1?Q?hi5ooi/VtiEPXXhYlf/2QE2yilOTNl9fQ+upS/YNH8pDZlb2cSBLjCEnIU?=
 =?iso-8859-1?Q?LxSW7nZfon1GHSFlqf43yT7YTT+OTvl4ibuEIp6R9O9IBMW7l2p0uTBh4m?=
 =?iso-8859-1?Q?KGXENa4rLCHJ0BICQrxTyMN0GGzx2zz0+tAVRtRbJZiyH/0hhyUNs8srRB?=
 =?iso-8859-1?Q?rL2Xp/AFt7qQ8sIf1UZP/kdwYcsDJ+fISCHyFtTFYdkeqjntcTv4IJ2jdZ?=
 =?iso-8859-1?Q?OoleKq1FJbqO6KGhd6xhrbkzN4CENax7hF5aubxFcuTT46Fu99r1hZSozy?=
 =?iso-8859-1?Q?cl9CrK4PH1aM7BWIJppej0G7WFTH37ZKJOTcwfdDxCrw+8lSSgFufs//Mp?=
 =?iso-8859-1?Q?HDKp9Ddck23JD7L5ZXjQG7hR2GUtTxDkrOluFf19N29w6pTcOouPFAYvij?=
 =?iso-8859-1?Q?f31HQhqnw4ZD5NZ3a4hEV+Smi2hOuH6jFHQTADJeTs+wUUDzT2lpmkbEvg?=
 =?iso-8859-1?Q?3TSECeW+h4he4noWeiXPWwoMIaFJ8mOi6XYUdCbGmsOoiEcnF2Y1ZSAI1q?=
 =?iso-8859-1?Q?eB+VNOR+uxHipsj+VJwzqp/oYhNKnF9q5e7jsdRfVnwLDXlf2o9EAwqlkT?=
 =?iso-8859-1?Q?ZvxAeuoZvxE66VB8lt3k+aSWQfHIW+LK1XdZfu3dj3WiXJxbGg74+AP8RW?=
 =?iso-8859-1?Q?Mm2qnNa2gCOGonBAtSWAlfURiPcQh0EYvW2FiEceLz8whzSMtWC/3Sg7+H?=
 =?iso-8859-1?Q?CN7wKgJcrE8NLUzcTKRNCzmf1mQf5oLvfUDxFsLMwETP89A4K/BmxOxF7z?=
 =?iso-8859-1?Q?H8pYIfBJyvlxO4d/YvLwddV2S5oYZZ2VjTbqzH5GyuMMB86TGTUk0nv1W6?=
 =?iso-8859-1?Q?UEt2hRliiFnCqvmqLzgsRhX/0YcW/kUGedagIIQfBMnbyVwAVHH5WQbzZL?=
 =?iso-8859-1?Q?wEOBMk0yYeQxAeQLbV/FUjJPoeWsHi9pUl8IOqSltwVKIjLo9FOuYKLDG7?=
 =?iso-8859-1?Q?y7nuRmd3aLqkNCHnPKOgBnQk2fzS28pTjBMleUdk08Nj7aBM9j5AlmBA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff01d78-cf71-483d-295e-08dbcb2cbeb5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 14:08:44.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9MmlHSrySvjC2XdxgnPvFzI+/rRM/r3PvF1M90rD3idr+BAgvz4bUM8qUt77GrQvmcv88FmnpQdGp1dCPczLBNhnFrI7M6HmSKKbv1kTIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 12:16:46PM +0300, Jani Nikula wrote:
>On Wed, 11 Oct 2023, Bommithi Sakeena <bommithi.sakeena@intel.com> wrote:
>> Encapsulate all the module paramters in one single global struct
>> variable inside the new xe_modparam.h.
>>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c   |  4 ++--
>>  drivers/gpu/drm/xe/xe_display.c  |  6 +++---
>>  drivers/gpu/drm/xe/xe_guc_log.c  |  4 ++--
>>  drivers/gpu/drm/xe/xe_mmio.c     |  4 ++--
>>  drivers/gpu/drm/xe/xe_modparam.h | 23 +++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_module.c   | 32 +++++++++++++++-----------------
>>  drivers/gpu/drm/xe/xe_pci.c      |  8 ++++----
>>  drivers/gpu/drm/xe/xe_uc_fw.c    |  8 ++++----
>>  8 files changed, 55 insertions(+), 34 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_modparam.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index ef42c33e3055..0cf908089483 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -25,7 +25,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_irq.h"
>>  #include "xe_mmio.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>  #include "xe_pat.h"
>>  #include "xe_pcode.h"
>>  #include "xe_pm.h"
>> @@ -224,7 +224,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>
>>  	xe->info.devid = pdev->device;
>>  	xe->info.revid = pdev->revision;
>> -	xe->info.force_execlist = force_execlist;
>> +	xe->info.force_execlist = xe_mod_param.force_execlist;
>>
>>  	spin_lock_init(&xe->irq.lock);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 391f08c1caca..0b55037c1da1 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -27,7 +27,7 @@
>>  #include "intel_hdcp.h"
>>  #include "intel_hotplug.h"
>>  #include "intel_opregion.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>
>>  /* Xe device functions */
>>
>> @@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
>>   */
>>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>>  {
>> -	if (!enable_display)
>> +	if (!xe_mod_param.enable_display)
>>  		return 0;
>>
>>  	return intel_display_driver_probe_defer(pdev);
>> @@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
>>   */
>>  void xe_display_driver_set_hooks(struct drm_driver *driver)
>>  {
>> -	if (!enable_display)
>> +	if (!xe_mod_param.enable_display)
>>  		return;
>>
>>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 45c60a9c631c..111ca5433c69 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -10,7 +10,7 @@
>>  #include "xe_bo.h"
>>  #include "xe_gt.h"
>>  #include "xe_map.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>
>>  static struct xe_gt *
>>  log_to_gt(struct xe_guc_log *log)
>> @@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>
>>  	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
>>  	log->bo = bo;
>> -	log->level = xe_guc_log_level;
>> +	log->level = xe_mod_param.xe_guc_log_level;
>>
>>  	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index e4cf9bfec422..717fcdcb5c7d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -18,7 +18,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>>  #include "xe_macros.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>
>>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>>  #define TILE_COUNT		REG_GENMASK(15, 8)
>> @@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>>   */
>>  static void xe_resize_vram_bar(struct xe_device *xe)
>>  {
>> -	u64 force_vram_bar_size = xe_force_vram_bar_size;
>> +	u64 force_vram_bar_size = xe_mod_param.xe_force_vram_bar_size;
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	struct pci_bus *root = pdev->bus;
>>  	resource_size_t current_size;
>> diff --git a/drivers/gpu/drm/xe/xe_modparam.h b/drivers/gpu/drm/xe/xe_modparam.h
>> new file mode 100644
>> index 000000000000..efa246616d3f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_modparam.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MODPARAM_H_
>> +#define _XE_MODPARAM_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/* Module modprobe variables */
>> +struct xe_module_parameters {
>> +	bool force_execlist;
>> +	bool enable_display;
>> +	u32 xe_force_vram_bar_size;
>> +	int xe_guc_log_level;
>> +	char *xe_guc_firmware_path;
>> +	char *xe_huc_firmware_path;
>> +	char *xe_param_force_probe;
>
>xe_mod_param.xe_param_force_probe is unnecesary tautology.
>
>> +};
>> +extern struct xe_module_parameters xe_mod_param;
>
>To me this is half-baked. Either keep all of it in xe_module.[ch] or
>move all of it to xe_modparam.[ch], but please don't add a xe_modparam.h
>that has an extern for something in xe_module.c.

any reason not to just keep using xe_module.h and have a `struct
xe_modparam` inside? I don't think we need a separate .h and .c
files just for the module parameters... xe_module.[ch] are small enough
to absorb that.

>
>Please also aim for some naming consistency. File xe_modparam.h, struct
>xe_module_parameters, variable xe_mod_param. Choose one, and stick with
>it.

agreed

Lucas De Marchi

>
>BR,
>Jani.
>
>
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 7194595e7f31..31ed68fcd087 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -3,46 +3,44 @@
>>   * Copyright © 2021 Intel Corporation
>>   */
>>
>> -#include "xe_module.h"
>> -
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>
>>  #include "xe_drv.h"
>>  #include "xe_hw_fence.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>  #include "xe_pci.h"
>>  #include "xe_pmu.h"
>>  #include "xe_sched_job.h"
>>
>> -bool force_execlist = false;
>> -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
>> +struct xe_module_parameters xe_mod_param = {
>> +	.enable_display = true,
>> +	.xe_guc_log_level = 5,
>> +	.xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> +	/* the rest are 0 by default */
>> +};
>> +
>> +module_param_named_unsafe(force_execlist, xe_mod_param.force_execlist, bool, 0444);
>>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>>
>> -bool enable_display = true;
>> -module_param_named(enable_display, enable_display, bool, 0444);
>> +module_param_named(enable_display, xe_mod_param.enable_display, bool, 0444);
>>  MODULE_PARM_DESC(enable_display, "Enable display");
>>
>> -u32 xe_force_vram_bar_size;
>> -module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>> +module_param_named(vram_bar_size, xe_mod_param.xe_force_vram_bar_size, uint, 0600);
>>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>>
>> -int xe_guc_log_level = 5;
>> -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>> +module_param_named(guc_log_level, xe_mod_param.xe_guc_log_level, int, 0600);
>>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>
>> -char *xe_guc_firmware_path;
>> -module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
>> +module_param_named_unsafe(guc_firmware_path, xe_mod_param.xe_guc_firmware_path, charp, 0400);
>>  MODULE_PARM_DESC(guc_firmware_path,
>>  		 "GuC firmware path to use instead of the default one");
>>
>> -char *xe_huc_firmware_path;
>> -module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>> +module_param_named_unsafe(huc_firmware_path, xe_mod_param.xe_huc_firmware_path, charp, 0400);
>>  MODULE_PARM_DESC(huc_firmware_path,
>>  		 "HuC firmware path to use instead of the default one - empty string disables");
>>
>> -char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>> -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>> +module_param_named_unsafe(force_probe, xe_mod_param.xe_param_force_probe, charp, 0400);
>>  MODULE_PARM_DESC(force_probe,
>>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 99ccee07f8cd..29bcf7565741 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -21,7 +21,7 @@
>>  #include "xe_drv.h"
>>  #include "xe_gt.h"
>>  #include "xe_macros.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>  #include "xe_pci_types.h"
>>  #include "xe_pm.h"
>>  #include "xe_step.h"
>> @@ -414,12 +414,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>>
>>  static bool id_forced(u16 device_id)
>>  {
>> -	return device_id_in_list(device_id, xe_param_force_probe, false);
>> +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, false);
>>  }
>>
>>  static bool id_blocked(u16 device_id)
>>  {
>> -	return device_id_in_list(device_id, xe_param_force_probe, true);
>> +	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, true);
>>  }
>>
>>  static const struct xe_subplatform_desc *
>> @@ -587,7 +587,7 @@ static int xe_info_init(struct xe_device *xe,
>>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>>
>>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> -				  enable_display &&
>> +				  xe_mod_param.enable_display &&
>>  				  desc->has_display;
>>  	/*
>>  	 * All platforms have at least one primary GT.  Any platform with media
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 138960138872..854e4ba027e1 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -15,7 +15,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_map.h"
>>  #include "xe_mmio.h"
>> -#include "xe_module.h"
>> +#include "xe_modparam.h"
>>  #include "xe_uc_fw.h"
>>
>>  /*
>> @@ -219,11 +219,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>>  	/* empty string disables, but it's not allowed for GuC */
>>  	switch (uc_fw->type) {
>>  	case XE_UC_FW_TYPE_GUC:
>> -		if (xe_guc_firmware_path && *xe_guc_firmware_path)
>> -			path_override = xe_guc_firmware_path;
>> +		if (xe_mod_param.xe_guc_firmware_path && xe_mod_param.xe_guc_firmware_path)
>> +			path_override = xe_mod_param.xe_guc_firmware_path;
>>  		break;
>>  	case XE_UC_FW_TYPE_HUC:
>> -		path_override = xe_huc_firmware_path;
>> +		path_override = xe_mod_param.xe_huc_firmware_path;
>>  		break;
>>  	default:
>>  		break;
>
>-- 
>Jani Nikula, Intel
