Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33305C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 16:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFA110E102;
	Wed, 31 May 2023 16:24:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7F710E4FD
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685550294; x=1717086294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qYaLLFoBtsl42vJpOa8Gs4gSQ0WptKjjQkGNX1XrL7k=;
 b=dVESVJTSTMvOKfejg/D2XTOe3jAs3IRNEbHQQF4CE0CZ83/pUakAIkmH
 M3CV692wiJnIVwjpXAD0zr8qTIG3O44Xl9KdkPhM5JW98jHaxaWn87RXj
 +imE2EUuwa0PVMqPIY9aNBhfSxHAH7zQntEffmV15Z9D9ebMoFwbXnrmi
 N7xoiOTe8RcyqzKvqyLJj1g1JJbPgRgSfGov4Yk/y3NoN3oMQQyeQWcmx
 OugrEkjgb1vNk8Ts67t5129DtpS7rDIPsx4TJh6joenQeNgpzh+4xat4A
 0fg4GnVU0racNRpFB5oq4IN2u3CAdbUF+fK7cz/XwMrRzpsKYT5ujzOmW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="421059761"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="421059761"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 09:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684441513"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="684441513"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 31 May 2023 09:24:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:24:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:24:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 09:24:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 09:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R07NHVZ9s/UfI3zNCTaHnObrPcLE/gTXkdeuzEt1QtmFQONzdo3J3FEQytkJiFUSfFIGUehhSKSYGoZFyIpl/J5QBZXejuS9GAD6MGUEBMjM8PE26Gbbo3uXQCjKOt5HSRWa/0HxNwem9OGkjCckZEsFr7zNraAdj3gvXtybKiReXdvWxQxzPByssb5MaDxWgPygwJOZH/cND27L6Iy25tZcSQaM7ibvw+YP4m+PgEf6AMqqRbzUVcZx8T9Er1PlWalRZSCvJW3/LKL1Nf1ifWTuK+akvYF6v96s18nV5rmbFAyoLnv0oCl5JgBdCSgyVK4XsnyO8ZESiqCcaa+LgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StgsASgk8nmdXcJV8aDnU+3YIsl9AG1QCN+Ycy8f8Ys=;
 b=VJq+gkwwQls1qIgCUo/tiKa8gqKPXtGb/Jg5YIX2cF/IVxlCozcG5aQpsCHTL7/57m0l4ey0tRUtDac5hrkT3c7JUmVoOEvLUcnC5aUOxkji/0NmLvSSNiJ7OIq8dAZcBs0Rq8pj6F2tgOO+x0Br+flz0ykeT50k73yUtXGkhdHTSC6SHaCHw7iBXDeebjTbtxKCkSQne9E9dMNkNkMVeougrgb+TUIHlt6WaC4nkrBQwE+r2luU5vr2BH+GUBAOHtj3PHf63Vj0muEhbreVZpKvDIJSEfb1USJHcf1AVddqnddQ9LCrkuz63odzboTy3qmV8OK2aBCSzd8Dtia6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 16:24:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 16:24:34 +0000
Date: Wed, 31 May 2023 09:24:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ig5vqsqzaeesttm7oxxew5bvmmwbdtg7qhsngedh2tntjkyuhy@wflqbsyuikzl>
X-Patchwork-Hint: comment
References: <20230531061902.389333-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531061902.389333-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0299.namprd04.prod.outlook.com
 (2603:10b6:303:89::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f16cab1-efa2-41fb-bd81-08db61f3855c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+iEsjyu8iCASOgpvO/62r/lQ2uQN65gmnHrxSy8JiMYxgyqvGdNtZI5OqZHp2RiH8pLLkudxdi/L6cYz00QJwts7ZK/zp3viEkFX1VSD6wiCfOBmu0bKSUvXNvczeDcrKeWi4QLdN0CAEzPYgILnuGQjhxAyEZQZy7BX9WCndsxSHOXMJPuOA2XrMSbWq+p7Ahn9OSSPSdtDJ4M1hBRsF5SiY6sct86Jhd3CO2xFhdrJWXAbl5CAGNb2nco0bONsQLl3S3jRnvy3xOoogwemBD7UUld3XNqWzAiN+Wy6uHkSKOKCDCwshDjreiXXlHX89xlW8iYzK1nD4xoMxA9IhfjMeclIt1uFfxTQuhnQP06/rI4Mfp7A5erWSmbeWOuV2ByYjQdNlFcyUAn6qRzq34w/o6fbtvNLppJKweumclpuVzj/0nExysTz3rTCmdhG1xcte/dYMPevqTk9rytLSk8wWV3sd9zJk3EgFDnZcab3+9h0OA2daLXomTXXgCHhZU3fnZMv/MrNSltMCfEVSxp/ddI1O/t1IdEeoHZ9q32CYZSvsN1QAHpV16LcNTmspxsA6XjivjKdlVeR89IKVi2EPkbLlHgouRfOugF3yfzCMJyXQknsGt8geIp2hW4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(186003)(6506007)(33716001)(9686003)(6512007)(2906002)(83380400001)(6916009)(316002)(4326008)(66556008)(66946007)(478600001)(6486002)(41300700001)(54906003)(82960400001)(5660300002)(38100700002)(107886003)(8936002)(66476007)(8676002)(86362001)(26005)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5q8IkZ9Gh3MPVKODSGhz8yMtRRGDYvvcwrJZ7ggF5O41Vf7qzCDceiK/I35?=
 =?us-ascii?Q?lblDD862BO7vsAe4SyMTOQhwv70PFJ/rJTzo9jpdUJaPybv2BzZQSwsboRMR?=
 =?us-ascii?Q?lRTmzPxjymnfOcCjU4orhXBPa9gKOngNGEIHJudwMm9PZMTygXsvDPvb0cE2?=
 =?us-ascii?Q?NvbXB+g0ZA02FwTxdaWC0dEf6a7qs92lds9fwVwYdVrc+4sbUmb3nMTpCGFm?=
 =?us-ascii?Q?TYjhZcBcMS6kDvcMKOd4rn15vvRpzAz+4CdT3gHaxdBE6wANhAup0e4F9FTg?=
 =?us-ascii?Q?eUhDEbyKdSA6Dsq0PQzC5sKCKj1Bp1otnmOBDh7WYIEVDmoyG6zJmxlUzLIx?=
 =?us-ascii?Q?Jwc/U7L7psfuaRO7JI6GQsC7meP1YySOtn/zSvqMnDI974POPmQmqsRvMNwO?=
 =?us-ascii?Q?CzekR6LXbwcmCbaJLqGtlyGCAFgoR42klG2IJpmz8SnRui+VZzQeP1o2RB/9?=
 =?us-ascii?Q?V/jBod7afzBxCGaKDtq6kN9GFGE31g6L415+ULplb4FKoTSytBCdcRhFas7N?=
 =?us-ascii?Q?g5ydNP4X95QeE13RZcAZOSaGxdlM09iUrCM4wNZ/85RnerkdhnxmF4Adz6om?=
 =?us-ascii?Q?Kb4wnUiMsU7RvfwmuamOG6M2Up75u8ig9ORB2JGQrz20YLAITfJohmk4Ugjl?=
 =?us-ascii?Q?DQb7i4aqhhCscFvarVswfcGGbtg9CtYB2SXqNP0Wc5pC3MSECJJeYvEGCAla?=
 =?us-ascii?Q?ViHokKMxNpm9Dld/4eqrQABTPR9MxjeLk/sw86kztRdEUyrQq4pwPFuPijD1?=
 =?us-ascii?Q?UBbSpjCjdCCQ4C8Tr+ZMcr5ArVHHWqDbgIDTbOGObs9rPCPSDjiBYH0gm1j8?=
 =?us-ascii?Q?c5DRN8MUgMxn55Z8n3/ukXSd7Tdw31bPuXZart+wsuYpV9Y9qPPWAvhPcnkV?=
 =?us-ascii?Q?p5rR2oH6PjJGRL91GdUFY0xiMKjaow4qwH+8ObwwGhw2c5vz2u7zdmQxWfg9?=
 =?us-ascii?Q?mUkrZzDQdIdnLlW2aGJa912Who9pZge9z60cd/UYlvCbW60+6xwq00+xKv/p?=
 =?us-ascii?Q?Xi0XTdZExcXct3jzNYxbN5iLiz2r7PgYqtYjhFVwDRPfuSsxji6ENm8l4IUd?=
 =?us-ascii?Q?eEP3nbCFVscVtfNjnRfeA2t8NUlSJ+5QBRZ2f72RGp40LYJBBs+OipuMNLkv?=
 =?us-ascii?Q?pC+sYuTREJbC6HqUA8iCnC581ccrsBuDRyB8cuW4/G0We/oqqTWDe/5y5EeV?=
 =?us-ascii?Q?jShS1hb5zZexV1pCGc/zE9W9zokkEIuzXrlz5diqS9ggPE1518nhyOhal4Gy?=
 =?us-ascii?Q?7eBKjN3VsLmhHDEpyE7ms5QK7Q02bWL9fD9RXnGLDWXPkwxfb6d+aZBkP/YM?=
 =?us-ascii?Q?kcc/HPmPePy55aih90dfh+MpXO31C3AtCfR3NEsnxDliabA8UrSdfRIt4azi?=
 =?us-ascii?Q?xdS8Q5xvoTboMgAcakC41L1+rOiSAzy0N8WIYu8sFchn8CaSLGBTNdcTWTxH?=
 =?us-ascii?Q?W4qUKGzXw97Eep3uXxVD+UZIrFe/6k7MYNrWZwMTI66sS37/M7lVvaV/zLI1?=
 =?us-ascii?Q?/C06ylfe8AeiEsxqAjwAzgbMLQJ3Yj0Ggkh4XQxPrrwXPVz/gVCbnhmBayzE?=
 =?us-ascii?Q?GBJp7pAwaZoXQzZCIRpw4FxVkH5eCnu9l7g/NWu/FiSYpS+FH99wx7WxXgzu?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f16cab1-efa2-41fb-bd81-08db61f3855c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 16:24:34.7919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4YADat2FmaIxjv5/uzaSuLYKC1iwSJeKDRiz2IwlXRkQCIgSUzWVuwh3Juz5I/v+I5hP2VdTZRkGmeF96VQZVB0wAhVZw1s2JGwNjV6jCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5409
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 11:19:02PM -0700, Lucas De Marchi wrote:
>drm/xe/sr: Fix too many kfree() on reallocation
>
>When re-allocating the array, the previous location shouldn't be freed.
>The issue can be more easily reproduced by reducing
>XE_REG_SR_GROW_STEP_DEFAULT. This was crashing kunit during cleanup
>on semi-random places depending on the number of save-restore entries.
>
>Jointly debugged with Matt Roper.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


pushed, thanks for the reviews.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 24d9c73ef279..434133444d74 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -57,7 +57,6 @@ static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
> 		if (!arr)
> 			return NULL;
>
>-		kfree(sr->pool.arr);
> 		sr->pool.arr = arr;
> 		sr->pool.allocated += sr->pool.grow_step;
> 	}
>-- 
>2.40.1
>
