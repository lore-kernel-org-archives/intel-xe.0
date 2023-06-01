Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B5FC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248DD10E043;
	Thu,  1 Jun 2023 19:46:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7B10E043
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685648790; x=1717184790;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QFcGFmHeXs7Lg8NQfjMHhBdgCthzZUYIBEqEq0COVx4=;
 b=NLYp4AvTBf6fwbuQ25CDo3/PoR+S6P/dgBqSuASnABh378iq854c5ivO
 3VdNZIymCXoVB5KrSGl/M/84zVu3qoWnxk0ZXjG2zeyWyWz367sl45vrw
 9FzlAHEtoxQef2ILiaWMdjCRSbAI1jEzcrbzSA8B48SQ5Lue8nrslz0GQ
 rsQS0EHhYDqLBrSGNdxjDc6QSQ5QcMR9PT+7U48Vm4SG1+O+c6g4sDGtE
 YxAdIpKznK8SdoW8PWOit7eJuOBCwuPwokDf90Tqd0wcg22waCVU2b0hE
 rl+qBr4GvCcTpdALNIHCaUxHMVBuA/b1/WsN6dFsdPVbTnShEBw1Gz3IN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383942242"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="383942242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="851840348"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="851840348"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2023 12:46:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:46:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 12:46:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 12:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQR1fX9Nrw6UroSziiNQJ1SxYFGO5GIwfHcnid/n7W4P8brwFGscwVZ081oc171GjPuWvDHLAVZlAtbI77ZJvBdpf/lAryleYzeq7VM46j861JBgXe2FzSU7qBenSH7HaB/8/XkNlKsaE4q+ltnprvgZhAJv8++urX5WzCUPj+3hxluGrlLtr2xG2wqPlnCGSAWk6vwUV30NJvby6LyATSFo7g+y6gkcX6S+sTJURwOkmw0dnyGe68KPphW2gsK6eiXSyZY6H/lUfjx2yWOwCdU4C74qyu9Xv7UTUMaAZwh4i9zHLETuMkSWkY1Vk8pGdaTiOiruRDuvll8oWSRMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9lNvhZ0sESv8JooUr84Z7IkC1zai8Mcrd8Lb3GZ8ec=;
 b=XpMs3xz0I60+aXKfNWR8sqDPtEf5pDbCw4qCgy7Zm8XCZ8zH3O39LUyzlhKN/hZXo2Q3zB87I34ts9994D9cwhcXXqy2u+teDCjDx9n6fBmt2YPVjKhN93QK3lkQccMy8prv9XS0wSd7ghFz961q2yd7beC/uO2rvb52wLwEx1s19wOUp1o7SyhLkNzDAmniy0hHKlkcU+GYoSfedPXEosE6EBeAffG7x8zSb0n1AnsUg6jxR2ukYkq5ZtE4U3U60KggCVLZDuZP/l5SOE+r7aIEYnHHDxOBOnXLAh+e04UGUTvsBZmf/UUVPDN9vTXbUL3dRrkOtuuiRglPDnaimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 19:46:25 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 19:46:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601193319.GM6953@mdroper-desk1.amr.corp.intel.com>
References: <20230601192555.1155097-1-gustavo.sousa@intel.com>
 <20230601193319.GM6953@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 1 Jun 2023 16:46:19 -0300
Message-ID: <168564877908.3435.10169685579433406932@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe186d3-453c-4924-8322-08db62d8e1e4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gY6UNsLwympT2n0YW20dpQX4mRFnrZY3SN2yTb+9p5124hLpvCECUjhIUzCu6FGOHLIG4ZbqUsHHjCdfIZrP2ogK0HEwWYFOK7MYxwTIOkID8QYysD2iLc/M9yuwhdtEBqw8kWDueL0rnye0/dhiYIVdIo1rMbXdRDouF3JJ2xWBCScGhyxwK4B2/AbkYmMrKH9nFN2SJheKTXFZ0I0/kE+iAFQmjeL/MSiliCCJ8EogHVuJuMA00+hqsINpPEKOH7ECAPZyRGgXf7SDciid1sQ1JZQeNToxq3eatVVQowUQ1KWq3wIuv9QcZQx4fJRzRfNrb6350LEEPkf8LvOTEM9jLOHHZsz+gikKHN3Mw1doiNGP8dnCF+CqQdmhQlwtcgE9Iz0oVAwJiqi5VrBzjEVV5pKzDdLYwJoFJ60m8+bvNPIAg0A1wEX8ELkqxf3DJTPhw6OnmxfAodS/KQwQ+kYTN9pEjL1EjSYG8wugyX6cD27Pnj2N4hN0s/esilfuxPnZFKu02ILhWSNN4EIyWZZAjNcjtRLxVcRoKTLEk+n6b6Ce0kqjfzhP+Ehliyid
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(86362001)(83380400001)(66556008)(316002)(6666004)(66946007)(5660300002)(6636002)(4326008)(107886003)(6862004)(8936002)(6486002)(82960400001)(33716001)(8676002)(38100700002)(41300700001)(66476007)(54906003)(2906002)(6512007)(6506007)(26005)(9686003)(186003)(44832011)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUlRWjV1MEU5ZndRaDh3UnhGS3dNblVvVmVtYWg3eUtESWRhKy9jaXgwbUM4?=
 =?utf-8?B?Q2M5NE5JRFY2TXN6cW1aQ0JKaTJFZW4xQVZxVUcxYTNmSFArVXRJeDBwakcx?=
 =?utf-8?B?WUVtVDhJYmVFM2EwTlVoMzVRN1pNZS9zVkhHeEROUHQxYVZRZ0dhUUQwOUNM?=
 =?utf-8?B?VE0wcTgwL3dORnQremRtdzQ5V2ljbVJWNkxlUGhsemI2b0ZoZFlubW8rV3VF?=
 =?utf-8?B?MTM2RTdZUXlKYjV3TWVDVThjdmdIdDhDdk81dGtDK0d0MzZtV1Y4NFpoLzds?=
 =?utf-8?B?cWJldmNrUWt2S1I3QXlTcy9MQ1A4LytKb29yeHAvV3p1UWdFSm16cXVqaWwy?=
 =?utf-8?B?MW5PM0wzRldmNnNZODNPM2tvQm9Uc2JSQjFJc1I3THdwUFBRb29tbUFNa0F0?=
 =?utf-8?B?SWlEeDJPNjlGMGNzdDI2UHZvRithQmFMT2xzaDlMUjJVZTBvc050M1FRVDJq?=
 =?utf-8?B?NXZUTE95Y2RDLzUrVldZa3Nnd0VKVVFJNFZMci9LckZpN1Z0RGw1MlJRSGUv?=
 =?utf-8?B?U1cyOHNGYVBpNmM3YkVCdlhWSGIzVmI3aFoxRWFpWE9PSzVEYlBpdGN5MVFN?=
 =?utf-8?B?ZExKZmI0SHoySmI0QnJoeDAvbW0xaVVqSGcvdWhIMGVLaFdEOWtyY3RCVDZL?=
 =?utf-8?B?OW43aWFBOFV5QTdkRm1rNklJeTY0NHhTZkRPRlVYV1RhS2J3b1NGeVBOUFVo?=
 =?utf-8?B?dWNUbFE2SUdwVVd3RGdRbE4xZjVOMWhHT0FuRXVOLzBlU0Vsb2o3V3cvT1pj?=
 =?utf-8?B?RWNJUU85N1E1VTZXRW9HQjY5NitHb09yT0FhandzZWhuQ2JsK0U4ZlpaSldx?=
 =?utf-8?B?ZDBOd1pLRHAyK1A1dG1GL2xkdGNrUTFwbmE3Q2pkQndpSEM2NU9kelkxSFN2?=
 =?utf-8?B?S1RvUlgxellranMzR0Myelc5YzBvSTBRZFo2NTh0ZHJVQ3h5anEzeDU5b1BI?=
 =?utf-8?B?RWRCbU1wbWFnN3RTVzlQcDZMUTdVb0xoTzR6dys0SWtTSWVCZzV6YXZOdXJQ?=
 =?utf-8?B?S1grcWFQekgwU1lreDJyZ3VjbVVGSEN4RjFLb0Vka0tIdy9KeEM3U3B6NDhS?=
 =?utf-8?B?ck04RWl5WjNNVXFxSHRaZjZYK2IvcGwvTzcyempsMHZFNm5FdmlaMmhEV01X?=
 =?utf-8?B?aFkydkRodG13dHd3MzM3cGNka0V3MDNxbG90bGFtUTRmV2c0WW9kcHlwTmw4?=
 =?utf-8?B?cG85RUFjYVFoTEdwTVpXRjZNejhWVFgra1lKSTJ5bG9XdVhKUjRyWE9aK2hT?=
 =?utf-8?B?WGtqT2hwWHRMLzdnZHZkMlBCVXZxc1dMUDBLYkVhOU9mNk16U0VZbXJiYXNm?=
 =?utf-8?B?d1VwQ0gxL3ZuTGlNcHA0ZTVSbjZHS1ZlempFRk1KMDNHZCtMcmVQeVBTbnZD?=
 =?utf-8?B?WDFzdnJVL2NyOVk3cmN5QjRpS2pPWXJ2UWp2MkNnWTZJcDdUWDRaMTNidExB?=
 =?utf-8?B?bmd3c3U1M0F5dWUvTytNZXpRZWJrK3dESk8yUkdKY0lpdUdvUE5sazdQUGZU?=
 =?utf-8?B?WTZ6ZFRBU2Y3YzIwTzIrTjBrUnlReWxEMzVNd00vYlBrbXJleGZ6RWZ4Mkh5?=
 =?utf-8?B?NjhlQ0tSd1NEcnZZQ3FkY2ZKVGRIMVg3LzJoeTJGNjY2dXJlQ2dESmRyWVph?=
 =?utf-8?B?MHo1eEdRN3FBVUtRdUYvWGFFZzlCQ0REeXcvREUxWW1jV1VFamtabnNHWFU5?=
 =?utf-8?B?KzZtZkxaaXFqdHpCTWhMNU1McGJHekdkV1ZPMGpFL24zMmI4dENDMVZsVWp0?=
 =?utf-8?B?Zy9CRm9zK0t2REZ5blJiWERIQStnSEt4K0tkY0tLVDRmU2ZVT1kvQUpJTDF2?=
 =?utf-8?B?dVVva2FQYVJYUWhQQjU1S2hZcllKS3BoLzFzSFQzQ3F3Y0V1aTR0SUs4NUF2?=
 =?utf-8?B?MEFQcCtHL2FKTEFPMExKeVNiQ25DUjNaM0lxWEk2aHhodUt2Wk91TkROMCsv?=
 =?utf-8?B?UTJGek9KY05QOGtaSUpkM3lQbmlwNWZRTEJKRW5UMk0xaXUxbzB4dXZCdUZu?=
 =?utf-8?B?TVhQdEJhYXBvcCtWUzAwenNwRWt6b2M4VDlYZkVUM1hOcmlNeGk4a0xXSVpD?=
 =?utf-8?B?SVhoRFM2dDBYUE5iZjcrbU8wQnJjeEJ5aGUxbkRuUVZWZjRNUUhid0xudUdD?=
 =?utf-8?B?Um1oNlNnenNGWWpxVjdjdGptL1hpaTJ2WHM5b3BxaDNjTFRMSlBkTXBZQjIx?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe186d3-453c-4924-8322-08db62d8e1e4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:46:24.9217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KfWIYWtR9VWCZCUWv3QXCjE4vqgxkEqqKjBlS9hatVWWKr/GeaZkt/M7CWpVtYYNpPdj7XUZJGVBhQnyrJcUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace deprecated DRM_ERROR()
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-06-01 16:33:19-03:00)
>On Thu, Jun 01, 2023 at 04:25:55PM -0300, Gustavo Sousa wrote:
>> DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
>> prefer to use xe_gt_err() or drm_err() whenever possible so we get gt-
>> or device-specific output with the error message.
>>=20
>> v2:
>>   - Prefer drm_err() over pr_err(). (Matt, Jani)
>> v3:
>>   - Prefer xe_gt_err() over drm_err() when possible. (Matt)
>>=20
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++--
>>  drivers/gpu/drm/xe/xe_reg_sr.h | 3 ++-
>>  drivers/gpu/drm/xe/xe_rtp.c    | 2 +-
>>  drivers/gpu/drm/xe/xe_vm.c     | 3 ++-
>>  4 files changed, 10 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_=
sr.c
>> index 434133444d74..8580ff38b82c 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -19,6 +19,7 @@
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>> +#include "xe_gt_printk.h"
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>  #include "xe_reg_whitelist.h"
>> @@ -89,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>>  }
>> =20
>>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>> -                  const struct xe_reg_sr_entry *e)
>> +                  const struct xe_reg_sr_entry *e,
>> +                  struct xe_gt *gt)
>>  {
>>          unsigned long idx =3D e->reg.addr;
>>          struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
>> @@ -122,7 +124,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>          return 0;
>> =20
>>  fail:
>> -        DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set:=
 %08x, masked: %s, mcr: %s): ret=3D%d\n",
>> +        xe_gt_err(gt,
>> +                  "discarding save-restore reg %04lx (clear: %08x, set:=
 %08x, masked: %s, mcr: %s): ret=3D%d\n",
>>                    idx, e->clr_bits, e->set_bits,
>>                    str_yes_no(e->reg.masked),
>>                    str_yes_no(e->reg.mcr),
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_=
sr.h
>> index 0bfe66ea29bf..c3001798d9e8 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
>> @@ -19,7 +19,8 @@ struct drm_printer;
>>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_de=
vice *xe);
>>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>> =20
>> -int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e=
);
>> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e=
,
>> +                  struct xe_gt *gt);
>>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>                                 struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 43a86358efb6..956bd39fe1a0 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_act=
ion *action,
>>          };
>> =20
>>          sr_entry.reg.addr +=3D mmio_base;
>> -        xe_reg_sr_add(sr, &sr_entry);
>> +        xe_reg_sr_add(sr, &sr_entry, gt);
>>  }
>> =20
>>  static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 5aa2aeb14beb..f31bfc738247 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -7,6 +7,7 @@
>> =20
>>  #include <linux/dma-fence-array.h>
>> =20
>> +#include <drm/drm_print.h>
>>  #include <drm/ttm/ttm_execbuf_util.h>
>>  #include <drm/ttm/ttm_tt.h>
>>  #include <drm/xe_drm.h>
>> @@ -3056,7 +3057,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void =
*data, struct drm_file *file)
>>          }
>> =20
>>          if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>> -                DRM_ERROR("VM closed while we began looking up?\n");
>> +                drm_err(&xe->drm, "VM closed while we began looking up?=
\n");
>
>You could also use the 'dev' that was passed as a parameter to the
>function rather than re-extracting it from xe.  Up to you though.

Ah! That's right.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks for the review! I just sent a new version with the fix and your r-b =
and
will apply once CI comes back clean.

--
Gustavo Sousa

>
>>                  err =3D -ENOENT;
>>                  goto put_vm;
>>          }
>> --=20
>> 2.40.1
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
