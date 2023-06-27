Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FEDEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D5810E010;
	Tue, 27 Jun 2023 15:35:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C4210E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687880103; x=1719416103;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=18nNk2YwNUymSxgH6cRf9lnFqdV+O2+5KRkj6ZVrsMY=;
 b=WrprANAzZmadVLZ7jd2KVYojybxJgKgUWTeNw8BqnczKqWlP2etBMNEC
 IX9UIqxrhH/mePqgvT8zWujqjyn0j5P/i+vExUj+jU8w/DW1kKaVPT52X
 6rfa0ohAUKOd5pE/SSqzwWDGTJ2FOP8RQ7SDN1nnwWXaOadG9dz9wH9WS
 PO1ddBYcPi7cXIkrMBp7jbqIoS121Zpr9826AFnB6Cjmrwt39MelJmcUq
 Slc9sY3f91fJ3apnSerj/mxsHV2V3r+cr/MK7vqZ8h5jUnCco9YY/CkqW
 bbWz3RzESzTIPjRhYJd8/W5ASspiiv8rutD4JBw9xQtaVaytEiq+WjC8w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425276114"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="425276114"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840723687"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="840723687"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 27 Jun 2023 08:34:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:34:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:34:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 08:34:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 08:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHa+rr+9KBXwKgXT3HSoz6wQk9ogOnUfrNHDokxxjCVT5xhdn6h8/HjfIXO1VYD2IVFhYgaGkf9dap0Mo93O45l1uFVFp+9U6PVaBTs3oJpTKW138Se3bF1Psq9baZmb0vhxJnPa+wDITLego75o1jg9HG2fa+8K8AmWL8Fhs+yjBsWtNh71FoJ5zX7aXh7fS8HtpKkCUub4wKBh3IyaKR1oWtDvt4G9VyWqmjAOGLOwsX6gq2e28LVuB+ARiPXXXP4A+YXh9g61ZFzpYZR6AaCMlSp/jAx66C2GGCc9RKzcE6eRq+plEtGyrwUDySezB8nZhVaNFUSZ8fo9iq5ozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeLnIOuBrvt5RdxNCU+xb9piHBBZHkM9zf+rVpuQ3yU=;
 b=fPBkQAB3OP31oSxiqEx2PQAIuiFbC3pn9UO3ZrNZelm0H65fNkVuukADe3D7ISh8vZR2WVI5mmGjBscgCr6W+b0uRK0IkMDY2R6nnlSzH8TRwxwBuSnQt2OqpPKLEdQXUw8BZkzyf2NfXG5a6j+dL3LUUYe1mx/kF9LP02Y9iCtV8noJRroADyHj20An1F5yEDy/VeET7c5BqUtrIOJJ61txbDkfpzBjCHEiqXm+AxHa9CZGf6a6E9NhjzyU1Ap4je35XTBRUihQuGfDSOgHrnQyq7PJ6d2ClpDs+bBkG6k8LWv68MtJnh67INfotlX48Q7qMKIlhC1CEnE2dE00KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 15:34:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 15:34:47 +0000
Date: Tue, 27 Jun 2023 12:34:40 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <wleoai3mrz5q4qriaonadk5ikgfjnsxevcsxmh2vizu7n4qg4l@dqpccrifszbq>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-2-matthew.d.roper@intel.com>
 <168692434367.4441.4523253323430999428@gjsousa-mobl2>
 <168692442808.4441.6274529148903489434@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168692442808.4441.6274529148903489434@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b47bd66-fe24-4801-6ded-08db772409b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AN2RccsIY8aUv1hW9rXWQlFhz9sz4bqJEZ0+s7L7FzK9cbHdCQy+oRkNenLCdEtU0Cn1gggcehnYf0A7Oh/TvJmFa/L11EAlQ8hQ8CapoHCnfTO6by/xS/hE9UZlJp6IKfAvLvfn1fbe8WfKSSe7Ady4TOuCaILGQw0v7f5L9YMmU+f3dxKnHQ8td58wih9bvL5G78Yjl/oBgvzWRJEta2E3sOcdMG8uvmTVrjfZuEG0lTOZztD1cJOP/hWdky3/cHHf/EjViDdsX6rPbUTfoi0piNjG+FPZ4LeMTd9Gz538weg/ZJ/rvVmomppftMOH8LVEWCXqbp1J/no1Mi3bwQZKqP50WOCXxyFw9pa1H8PJtgFUzP+f47DeUDAMWp5aAomHY6er6lsPvwbmtRJnPwbecRxy56lui4FcqW+sfjOqNAlE8JPVyxvN4KmHm+JepdnBPaT4YxHq7/2Gw3wUV/CJU1fAkUeLqKr49W+sNAnQZAnXWdPto5lWfKEY4oa24mU4UwS0LEnhlP5vm6xANrExtlvcyCQNpya5EpLfGmQdCw41VWWv2+JuxXZcoYurXCvr+i202iJMl+vO2XKfXnrcAwtbOdt6SIz/+STk6SI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(5660300002)(66946007)(66556008)(4326008)(66476007)(478600001)(316002)(6636002)(8676002)(8936002)(6862004)(2906002)(966005)(54906003)(86362001)(41300700001)(6486002)(186003)(33716001)(9686003)(6506007)(6512007)(6666004)(82960400001)(38100700002)(83380400001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XBLCCcn3jfmOv9mR8nMGE2t50WBGVzDpvx3HHA6Eyehpv5tySwTf7T4pDtRm?=
 =?us-ascii?Q?rRidCXBQhTTy9xqtT9hFdFjxyr98PyK/5asg+6P6hfpcjTSP9cePOzqzamD2?=
 =?us-ascii?Q?Yoi3Ob5a6BqmYdNFRvMn5TNv47Kaye1MTZ3uBn1Lv9r//2J8QAq0eZVdiCnL?=
 =?us-ascii?Q?kgvx7f68p/dTVpCgQaleYUryXE6EQ4S6Bf+JGBUxfmqdUpiX+aN9Z4rozofZ?=
 =?us-ascii?Q?1qTOyGm0v+oRaZcEHJRYuRNd4AB8MbXrEDLnyWYaNBUCxdLWuUynnguofEri?=
 =?us-ascii?Q?JAEjqtbIRJ6Dh1dedKvCPxmU9IsQsAGQfrR0TMP3ve5CEz8cKzkxRnEz502e?=
 =?us-ascii?Q?IBtPglxIZ/ra0fUFp+ZitOakfxeOi+PNhIkF/4dvy+DuLBldZe2hOTY+Hv96?=
 =?us-ascii?Q?Ao2LvFN3grz2jCQevVGtJT9zm3CUlfG6k4jJaoOptoSpbS9Tt+bsOidQOznp?=
 =?us-ascii?Q?kF1hlYaNitvmzgyG5Rp4C2NUOSMdG8F3l/Z6hv1Prnvd/T7o6brzReM1wP5x?=
 =?us-ascii?Q?F/rQqBanacxxyVT+0kpF78G59YVg9N+Mj92ltP/Gjz1VHLaPGPJxOamKU8Dw?=
 =?us-ascii?Q?BuH+Yy5iRW9+wgt0Y8et58rh7WdL/NIj1MJWBTdLS5tR1KavDcupdLPeOQpp?=
 =?us-ascii?Q?kPoReOufxy2ph92kXZSqjY7PUDszvZRbLTSGELQ3u+dU/ZgSQssrytZy6MeK?=
 =?us-ascii?Q?2+9q/NkHfg5K8/3BYYhzHdOcq+lQruFr1POEceiCrm0Jf9C6donenVLALDvl?=
 =?us-ascii?Q?w+7JJ4lo1DEvOqRB/HlaNGtVAvAPpXdTmH5iXxSFTmzJnet/7F1AmRR0JoBB?=
 =?us-ascii?Q?DTRzz85Ldc3QpHA5w2IVRJ90Zb2dNrvEr8HJ7SFd+on1/e34LzjHq9vTIS/t?=
 =?us-ascii?Q?XD5UvNaRnCJlCcqi9nF7dDqnbOtsRSsg/MGaVhGDx3o7ywFc6fOINJlY3gS8?=
 =?us-ascii?Q?cyshZUpABN6jTmFv7hk6lXipROWuenlEBF9eQjEWfdz/QVK4QcxYC8F4U5/7?=
 =?us-ascii?Q?hWxa3iPcFX3yY13XcXj/ncvUzFw6ts+c3FW0Dk22kIQ9Yh+F3HJo18M/zEZf?=
 =?us-ascii?Q?KZG0xb7qPGrQKB7CguDoNgNI47yJMnlx00HkglBXc77PFuyq3AolQFLPrmny?=
 =?us-ascii?Q?hVe4gpVcTggZei623ZDiOzVHcecGm9uLu9XGeiqBb/KB6pn222uTi3UnqDAu?=
 =?us-ascii?Q?vEA2F4CKRKMVQV8Q967CO9iB41FD+FR0Evx+6QPWwPADODTFqF46M8v+NcWg?=
 =?us-ascii?Q?UlanZdQvRzTmns6/oURn/BVMC0TdNjeT7HWfrIZNOBlWjb7z9qbVrtriDTdu?=
 =?us-ascii?Q?k7hhg+JGEqy5THzRHQ9JDv9AxZ5ba8Ha8BkfVxoo/78DojTPrb33m0GonQ3q?=
 =?us-ascii?Q?cBBisk5+a9Ik/g/GFi7fqJF1JOfgXngPlENxZX4t7TUSHbbz77PzWMW90iI0?=
 =?us-ascii?Q?v7kHQb7hnlob3+A62yMIrtNJN8nOzncswfYtyMk0du6knRUL8+OVoE4ILad3?=
 =?us-ascii?Q?4478z6ZDqu4jeYvNiIoiMw/8rCDCY77h9qU3qyggl4yzFOsOFcUlA9aqX1Gy?=
 =?us-ascii?Q?zd4P3G8R9Z5fqNQO2h0HBd5m7ygwsMN3YWuT0UI8BwbLnWgdGkl0HDaYb4Zs?=
 =?us-ascii?Q?MGRwL0mi0URLNSNDBndPUnYIfdD6gUnd8/8lszV4TbI8yxvR/34VwDBTAYTP?=
 =?us-ascii?Q?EYGeZg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b47bd66-fe24-4801-6ded-08db772409b7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 15:34:47.3305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 613QDuZQKSADzFaqOvwKofMcFu8V6DgQCqqDajNeRFiNtME0YZTUtnd2m9mh5l4rXWbR81fjk3t6vKRQgUS1y7oYx/er0SMU7KwSuxPkqEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Return GMD_ID revid properly
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.de.marchi@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 11:07:08AM -0300, Gustavo Sousa wrote:
>Quoting Gustavo Sousa (2023-06-16 11:05:43-03:00)
>>Quoting Matt Roper (2023-06-14 17:51:59-03:00)
>>>peek_gmdid() returns the IP version, not the raw value of the GMD_ID
>>>register.  Make sure we extract and return the rev_id field as well so
>>>that it can be used to determine the IP steppings properly.
>>
>>Hm... This has been fixed in a different way by Lucas in [1]. Adding him
>>here so we can choose one of the fixes. Both look good to me.
>
>Ugh... Forgot to add Lucas to the Cc list. Adding now.

I'm fine with this new version. Another rename we may consider is
s/ver/verx100/ to follow th graphics_verx100 and media_verx100

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>>
>>[1] https://patchwork.freedesktop.org/patch/542422/?series=119292&rev=1
>>
>>As suggested in Lucas', I would also take this opportunity to rename
>>GMD_ID_REVID to GMD_ID_REVID_MASK for consistency.
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>
>>--
>>Gustavo Sousa
>>
>>>
>>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++----------
>>> 1 file changed, 13 insertions(+), 10 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>index 2991cf5365d5..7926c2fa1433 100644
>>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>>@@ -392,23 +392,27 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>>>         return NULL;
>>> }
>>>
>>>-static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>>>+static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
>>> {
>>>         struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>         void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>>>-        u32 ver;
>>>+        u32 val;
>>>
>>>         if (!map) {
>>>                 drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
>>>                         gmdid_offset);
>>>-                return 0;
>>>+                *ver = 0;
>>>+                *revid = 0;
>>>+
>>>+                return;
>>>         }
>>>
>>>-        ver = ioread32(map);
>>>+        val = ioread32(map);
>>>         pci_iounmap(pdev, map);
>>>
>>>-        return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>>>-                REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>>>+        *ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
>>>+                REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>>>+        *revid = REG_FIELD_GET(GMD_ID_REVID, val);
>>> }
>>>
>>> /*
>>>@@ -444,8 +448,7 @@ static void handle_gmdid(struct xe_device *xe,
>>> {
>>>         u32 ver;
>>>
>>>-        ver = peek_gmdid(xe, GMD_ID.addr);
>>>-        *graphics_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
>>>+        peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
>>>         for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>>>                 if (ver == graphics_ip_map[i].ver) {
>>>                         xe->info.graphics_verx100 = ver;
>>>@@ -460,8 +463,8 @@ static void handle_gmdid(struct xe_device *xe,
>>>                         ver / 100, ver % 100);
>>>         }
>>>
>>>-        ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
>>>-        *media_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
>>>+        peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>>>+
>>>         for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>>>                 if (ver == media_ip_map[i].ver) {
>>>                         xe->info.media_verx100 = ver;
>>>--
>>>2.40.1
>>>
