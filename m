Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA71C30626
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 14:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73A610E4D3;
	Thu, 17 Aug 2023 14:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95D10E4D0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692283653; x=1723819653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FSp2AfR5MmmOkwpZCfn3WBdesI2Th/Iuc5C5BStR6/A=;
 b=DTl570D/yUy1V2mmJVmWuGZw5snFEuYnWMZXp4TbBJVipb8SrZsiAmOp
 MYd712adFQ+z0KioeTo8O8yDOndDe7WTxWKsD3o3efy3XrEnAInMLy7nn
 9RDWRrLQD4FdUBXHH4BzuFzLFiLn8y9IN3B1Ad53d0dZ51IjpnveILVXZ
 vTqedfOelx1lv1/ZV/V4ZkTtmlDhjDY9sqZ8BRfThWpENI1HqN6v2VdZB
 6Pcw10qBMAr3jGAlNFHqXiKaWYPQsvXWRP9Bc39oTK+RsmnZz+FpYX73L
 uGJLU/q5mVn4uYzIxqAW8sTcRMH63PmcTPjHF/yvN4/0K/MDDqBfbkj1p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="371733005"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="371733005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824656726"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="824656726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 07:47:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 07:47:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 07:47:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 07:47:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 07:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJqVBneHoUzUXKyPdKafwzGOIIZTYJoYDmRuLE7ekvf+8qqSwvasCiMLlvp8HYm08bnM4AmwIo/84WRmdsFG6igOvMsVVgZhh8qaE78qqBNlKM3ntIJd04w/GjWEWz2JWY3cxM7ApmtzjJCKqmwmWiG6s+J9zwmCt+sQhnRDmtrIjqMw3/ocDACDLfq00ialk12H1J2mBDaE4N5YakziQGCODop1pAxWZXVn2TCXGiQD3vLgaLuCMnLoeWDnGFChAFoTOj/nK7PhKRJqoTHpG5SzTqGXge/0F7LY5R10jDZEFPWKk9PRGyGm+atTnlfbKiEKheZqEYL+Xr9SZOWFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W6nMH1BD7W2Coy3IwmTgrvbspwom8/cZCJCfkcbItc=;
 b=CXKChs0Bk7oXkAhWWfJ2MCvMqAXgVUkwUPBAAs22BmJaa7YpcFB+7WMjchaonzYrA1ibvlaPFIPZvKdVDRXokCu+oOmlMScN5LqdlUjroMDAov2WyHtG5SCiJUvDqVs243REVvyS8otpr+EuEnqgKv2/X486OpGfCICRGSoP+Fcbd+AA4B+J3kw+cv2o6UYzWaXcBo5tMrR996vtmUV7Vddv7L7jM2GXX9oE3eO5xnFjKpyk5Ibyo8Rx6Y/W+6UTZ7+KxQ8nHIF6Z6vvXxtIOfVuDjQetQsWRPVroRXltnlcTpEWQH+v5zIef4NQ77EfyxE5tYi4+Lm9u6EKwvNM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 14:47:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 14:47:29 +0000
Date: Thu, 17 Aug 2023 07:47:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <ogbz7rqkordg6ogfy4efgnboux47bcrahds6hyestku2f6hdzk@6cqh6le33vfw>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-4-lucas.demarchi@intel.com>
 <ZN1Naiw9LLTxVVLR@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZN1Naiw9LLTxVVLR@msatwood-mobl>
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c88db77-ba99-4a97-6181-08db9f30e03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K08h2AazrX+AYQyzvr9gDa9++jK/QAKPS1Hd1QrIJ7Vzo+VLGkCIWClxNbytj/ZOb9DqE6480isOYxB30CRyqlHGhvGAYP0Tjr5A+UYuXhDJeoBFHo/Kdf7VoXazoYezMJtTxAz3tP+P+a7rze4mlJoyfyknqUQ+QG0zhMahWFYPGBPYeNego7eEyaC0uPHSMX8vkISeikTOqFQWQ0o7HV2DleVlk9hoXKtGvMUAYU8I4P8K9EDUcaVYcGUIrnbPVDfaFLm8t3N/5AMDp2gwVSjz69fG+jaizNRFqo/98ikzDiEiX/eIqCIjUw5ZBLjDJ71/hD8vH8mrjfDPW1WGfXgT/fvQgQa7QH0CvgCJf1G+Syw2PzyQmfPXQ1d+1+3dohwiolej4AZxMFlRWtqYcQCn8Pd/bawwiPTagt/o75P9zZa2l6pFKZZ519a6DgVZ1ZnwDqmeXlZ1b0+mU9tDKOR+ezn4pm49rXwcrp82BW5sM3gWCKjfkifHkyjM6uBCjUeEgZyUpy7qsHK4MGwxzHqA2IEktfnoqdRVfM6khsl564gu0fXVMKhSYC/TnHCa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(6666004)(6486002)(6512007)(9686003)(5660300002)(41300700001)(6636002)(316002)(66946007)(66476007)(66556008)(4326008)(6862004)(8676002)(8936002)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P7c/HOvdatiU2AkyfUp42lksVaJmRPe238UfOZlXpo0BgPXH+pQuQ2zYDv/9?=
 =?us-ascii?Q?nYcNYUAUTinz7o3OJIONFcbjXnlMikuyg+LD2ESUmEwEn4SOauDapvZj3BAH?=
 =?us-ascii?Q?3VD9cRug3jRcxjIX8tfDqlK0qu2IT62dDgw2zs4kIaWxShEa/r4H4BjuH+9/?=
 =?us-ascii?Q?t/HN2OaJFUXbd12P5o3BON5zBadhenvqEmdb3ThXeEXyne6gSoEmwTuzivXJ?=
 =?us-ascii?Q?Fi7F0GwLFX93T2kjQgDhWXZsxd7UvbfsU2Cvm92rNvtV638WPaHa/Ux4a+Q3?=
 =?us-ascii?Q?M8tDMLU5k0jBFmuYZOhmDD36FVM+ruM6Y6UIi5Ll7r50m9H17qhpyXrSTT2j?=
 =?us-ascii?Q?yVW0OUbzqJIPyndqEEw52yA6zqmI86P0pOG+hHB0qeExF+sJ1DIzvPw+j68S?=
 =?us-ascii?Q?UjlDFDVsBy3hM1JtM7jXX13IeKltVkbMD9rXj9qaNaQvGmnAB9NkwUdRwF0z?=
 =?us-ascii?Q?Kw0CmgJnyR6S+3SNcOSapw6p67hJeIad7QMRevBRnP5dMG+s7PIh2kW7LibX?=
 =?us-ascii?Q?jv1uAvvhEAWRwMJtHls53HASNmL4KBZsVOmHzfKHrVR0ugo9pAhcWzeuI5lc?=
 =?us-ascii?Q?p7kmh7m6/SS0K3Tk0g9h7FTU+OxvChtQUXrqQxR41HuMTtJDa9vtOvVFhri4?=
 =?us-ascii?Q?jJyT/l7eva/MEICuQrj9K//tQOUfJ3YFdLiIOT5DZIGnT/eFKPE76WlLET1h?=
 =?us-ascii?Q?T1x3YCfcb4tbK2B5sY/XzGWIiGRh61B5uj/PxdeU233zTpxKpwRlIHnX27Kq?=
 =?us-ascii?Q?93hZs4CT5+W57cBqqJUUZO548gMnfGz2YsveVYai12OEAQkJ3rVlEtbl11/J?=
 =?us-ascii?Q?RKR6D6maDb+7HLsbOBGf+5TR/pQcWvWam2bYcWPqoTm3qKy4xKR4BcY9KFUt?=
 =?us-ascii?Q?6/TDxwCztMCBZm+1+KcboWG6sDst7clMBQfr+Ohx9vyGqejgpmu3ZuTx9M4Q?=
 =?us-ascii?Q?XTTmWzpWYRg34BgRHs6inWDtlljFjFA7QIXNoe+Xz5iEwRdN+hjZMAPznbhL?=
 =?us-ascii?Q?+oom1skIuvCUyYQ6/5zGVbZNJ91DQ0C5BBBCpGlF4jsl+vgwMqOMgFwuVdcX?=
 =?us-ascii?Q?huxg+pLbQRyytAhAAAwCU+Y9pNS7cNvMnCfhtdiMmqOu40IvJKQvMaIx0tWT?=
 =?us-ascii?Q?czYWZNrL+iy8QeGoGfxENStIPEVEqqnpCaz4dN49fsT3MZoZeaTt0wIraJOu?=
 =?us-ascii?Q?2SBuYFq2lLNWjs4vUdvl34nX0D9xryd5ggWFey4cWt1y5xPTiYgGUyrzLL/G?=
 =?us-ascii?Q?EbPPXKgON6EGuChNMngSNh1qYTnABhsMWGHHDJJYfpykSuVwXBozSyjrv0l6?=
 =?us-ascii?Q?VHFDT6QxFgg3z6ds5nDPreNyNx9DLwSPOUJvtC+voP9YTEANYitxWKPNu6Vw?=
 =?us-ascii?Q?7ULRzeJGmWVGiB6KOEjt0ix4kC6zYOnpsZx7HlqJ2O309GwillXYgZuXTc8p?=
 =?us-ascii?Q?/e4c2AenvF1G7yGb5WiyNKsB7dVKVEtb4H+T8f8oYV9fLq/BcaVG8LFp+SgG?=
 =?us-ascii?Q?l8PQIzdfM6sEWXLodWIOccnUNcVKNi4zYPrGPVNAWjLptgr8zx0zWu7ceR77?=
 =?us-ascii?Q?fB6Fv9HnKiMpjsucpMSzzMK9biN6cwogAe3j8sVrdFX2mHKWtuposKpt6Obp?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c88db77-ba99-4a97-6181-08db9f30e03a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 14:47:29.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/FS88rKQ7N2yXxgbO+KcRuUGl1M84eQVJeuXXTps0TpQ5Ou/ido3v8R1YoWfrJ849L/u9KL5ygtwY3BLsJRGEe7YRrCgQxRgM5OcBQ8+IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/15] drm/xe/xe2: Add MCR register steering
 for primary GT
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 03:27:54PM -0700, Matt Atwood wrote:
>On Fri, Aug 11, 2023 at 09:06:06AM -0700, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Xe2 uses the same steering control register and steering semaphore
>> register as MTL.  As with recent platforms, group/instance 0,0 is
>> sufficient to target a non-terminated instance for most classes of MCR
>> registers; the only types of ranges that need to consider platform
>> fusing to find a non-terminated instance are SLICE/DSS ranges and a new
>> SQIDI_PSMI type of range.
>>
>> Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
>> for some Xe2 SKUs.  However the lowest bits are always valid and only
>> the lowest instance is obtained via __ffs(), so there's no need to
>> complicate the masking with extra platform/subplatform checks.
>>
>> Also note that Wa_14017387313 suggests skipping MCR lock acquisition
>> around GAM and GAMWKR registers to prevent MCR register accesses in an
>> interrupt handler from deadlocking when the steering semaphore is
>> already held outside the interrupt context.  At this time Xe never
>> issues MCR accesses from within an interrupt handler so the workaround
>> is not currently needed.
>>
>> Bspec: 71185
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
>>  3 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index ad7ae6a28caca..5bc6c7fa4759f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -145,6 +145,7 @@
>>  #define   EN_32B_ACCESS				REG_BIT(30)
>>
>>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>> +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>>  #define   L3BANK_PAIR_COUNT			4
>>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 9eb7a6a1348d6..ef9f4044ca1fd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
>>  	{},
>>  };
>>
>> +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
>> +	{ 0x005200, 0x0052FF },         /* SLICE */
>> +	{ 0x005500, 0x007FFF },         /* SLICE */
>> +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
>> +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
>> +	{ 0x009680, 0x0096FF },         /* DSS */
>> +	{ 0x00D800, 0x00D87F },         /* SLICE */
>> +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
>> +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
>> +	{ 0x00E980, 0x00E9FF },         /* SLICE */
>> +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
>> +	{},
>> +};
>> +
>> +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
>> +	{ 0x000B00, 0x000BFF },
>> +	{ 0x001000, 0x001FFF },
>> +	{},
>> +};
>> +
>> +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
>> +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
>						^(4200->43FF reserved)

This is intended so we have simpler ranges to lookup on every mcr
register access. Intention is to keep the table as small as possible
without causing issues.

If it's reserved, there shouldn't be any access going on and we can
coalesce the range with the next ranges. Explicitely leaving out the
rsvd range would benefit debugging as it would automatically create a
warning when accessing such a register, but I'm not sure it's worth it.
Matt Roper, any thoughts?

>> +	{ 0x008700, 0x0087FF },         /* SQIDI, MEMPIPE */
>8700->87FF is SQIDI only, to include MEMPIPE entry extend to 887F.

ack

>> +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
>> +	{ 0x00C800, 0x00CFFF },         /* GAM */
>> +	{ 0x00D880, 0x00D8FF },         /* NODE */
>> +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
>> +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
>> +	{ 0x00EF00, 0x00F4FF },         /* GAM, GAMWKR */
>GAM starts ate F000, EF00->EFFF is reserved.

same reason as above, we don't care about the reserved "holes"

thanks
Lucas De Marchi

>> +	{ 0x013400, 0x0135FF },         /* MEMPIPE */
>> +	{},
>> +};
>> +
>>  static void init_steering_l3bank(struct xe_gt *gt)
>>  {
>>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>> @@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
>>  	gt->steering[DSS].instance_target = 0;		/* unused */
>>  }
>>
>> +static void init_steering_sqidi_psmi(struct xe_gt *gt)
>> +{
>> +	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
>> +				 xe_mmio_read32(gt, MIRROR_FUSE3));
>> +	u32 select = __ffs(mask);
>> +
>> +	gt->steering[SQIDI_PSMI].group_target = select >> 1;
>> +	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
>> +}
>> +
>>  static void init_steering_inst0(struct xe_gt *gt)
>>  {
>>  	gt->steering[DSS].group_target = 0;		/* unused */
>> @@ -280,6 +323,7 @@ static const struct {
>>  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
>>  	[DSS] =		{ "DSS",	init_steering_dss },
>>  	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
>> +	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>>  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
>>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>>  };
>> @@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>>
>>  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
>>  	} else {
>> -		if (GRAPHICS_VERx100(xe) >= 1270) {
>> +		if (GRAPHICS_VER(xe) >= 20) {
>> +			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
>> +			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
>> +			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
>> +		} else if (GRAPHICS_VERx100(xe) >= 1270) {
>>  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
>>  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
>>  			gt->steering[DSS].ranges = xelpg_dss_steering_table;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 48fd698ff62aa..d4310be3e1e7c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -55,6 +55,7 @@ enum xe_steering_type {
>>  	LNCF,
>>  	DSS,
>>  	OADDRM,
>> +	SQIDI_PSMI,
>>
>>  	/*
>>  	 * On some platforms there are multiple types of MCR registers that
>> --
>> 2.40.1
>>
