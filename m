Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC62C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 14:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC9C10EB63;
	Thu, 27 Apr 2023 14:38:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3BA10EB5F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682606324; x=1714142324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YRcbWtqObJtOTnBiXWUxQEDhJSvzSmAH96SGDPr7j/w=;
 b=HQjdP18mihJ32TtgxBOkHrZTXrHMiZns9M8V8RDq3wA2l8P6xpUsKypv
 NRi3e2PSkQG9IlXvtcecOJYRgvYv6HPWHdRTF++4IHFezqcKBPR6LaW5L
 51sxnIQsgRUCSCR9RsFskAv24Oq+ZMWsjiQXVNfgDy8pPiFqV+nxGTftu
 7RZTUBu0sHD8Xg1b2QbeQ3ShSyRTNPLnfEkeYazAo9Z23aMcP0JSsfCzo
 Vi0dbuS/Fn71c+zkHWBF187uHhZV1HHz1dPkKFJuxa9t+iRAR+ZPMbHpA
 ypIWXEh3HYdZOlPJVDf2MXa2k47crudZWTEXMhuHuJ2uBTqZLlWN4Lsrh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="347471721"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="347471721"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 07:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727099156"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="727099156"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 07:38:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 07:38:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 07:38:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 07:38:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 07:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObWKhqaW0aeD/BRd3yvKyn/eUk7W5LXjY1mjw+QAu1Rob4NXDTG760rX7uZHoYGyJ3EDl+u+qZwudWiqOhpbnr5iAaqDBjOlmxGWyKJZnD7OT5XM6hOw6Yth/Lffyq1IOqS74eUgnmkjk9a6y8JyAP/FxY7dbcDF1qxSEsJFqYDYCz6RxfPlodvWsCfTgUWx0Lukae7C6mZH3jcEQ7KHS10gMz7qxpCd3z1u3vbUUQmIojDx6eqJGrCj79dF8jGgzPgTl3M+yvy0yqOBteUyVCs8xb3cEXepHjRJlpjxs3unw05fkB1l1wjmC4A45wm6adQYg6SEv1zD4kwQHorpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqioT6xEFFv+iKucP/PbzEksZepyB8HuFoa9kIIRnLs=;
 b=VXgPWXgDUAMIci+NmjSq1TMOy9R/qlTGQWWvODAYhUeXLvVpDNyxLVgWcfL4PYhPK+sEAgnUmomiQv/w/6obRHMAtUdFd1jtPC6q7tyfleR91PG1dQT0sUkwe3fqgjDXjv5Eza+O3l4CuiGBpj+9SW2hTjWvJ7zhddpgUJ+zt1FMkohhjG0SSCQ48J3uYJBn2QrG0EaC50t8FWh2Opfn9OCz85CkAdBsv0hZheoZDfvEH9kM8qur9vbrYQYZezJpkrMNxh+D7p8Mudfg8qJmAmpkxwNVrtelV2eR7s2hEST2R75MH1NyOy+xdEmD33uwMidCivhOxPg052f9v/XGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 14:37:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 14:37:49 +0000
Date: Thu, 27 Apr 2023 07:37:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <gwnfr4i54z32tqccgxuvdp7zelmfiljwzg4j3u23o3tadtrwew@obbtjq32rvhi>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
 <20230426213242.1315119-9-lucas.demarchi@intel.com>
 <d52ac0fe-1f2c-766a-5491-a75051da3f06@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d52ac0fe-1f2c-766a-5491-a75051da3f06@intel.com>
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e4b8b2-54f2-4e09-0bd9-08db472cf962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYlJRXWxRPxaiK4TdcAAOHeJwCnwfe98GQeL+HSx21uS3WEcBLIqiipE8rZ2rRpYid73mar0dpBagWH9VPEsFmss7KRTuz4/z5NG/TN6SvYu57PzUSnaTpuZbTuShQT/UNSbavVgYURsU+Cvx+8Lp73W2njzw/DSadySKXkuek5wnAoLyWatNjEn/o7gnU2zRN9Y64ybeTYly5eqiPBMGXDCgGUoUxlc+ct3DgTLg54h3DbecbDWgi6mq/1jB/E6HFoF1CoD4d2CDndHpbx8icmPAwALIjA5CSDMlzt8vtxxjkCW4lTzEA9vfuirR37Xbbh+gLx0ODZwNb1n8NUV2HcW5j8NUTh1y5SRIxfix5AfbTyvTaWuOumrEPPIW4JZJwF/cUiCJDbLlHvNTj34xipKN03MrOrTcz9npClbWA6v2x6kwKpuIMAUtzINVECWZL0DI68vMAd/dAoBXnKZ5a0zdShPI5IkrISOaulNDx6aBByOo3oq3c7sk0vqUjh18g0G0St7qWMqod9ZV68C1Z2uFWUFjqEaeYTmzxY4HcncNB6r1pJpdsKgxlyohe9I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(6666004)(82960400001)(478600001)(33716001)(83380400001)(54906003)(6486002)(186003)(38100700002)(66946007)(66556008)(66476007)(316002)(4326008)(6636002)(41300700001)(6512007)(6506007)(30864003)(26005)(9686003)(107886003)(86362001)(8676002)(6862004)(8936002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RN0EgOL7ojzbN2VC+IRhQ92ONIa1/cSD6MGyD5K+bBH+pKaq75D0h2HDUZIf?=
 =?us-ascii?Q?gawNS0Dh8BMMqKiIFcOYiUStgtEe3RozbBAxCc70uB4R/wW+6N5tYTrFf+69?=
 =?us-ascii?Q?61UCOJhrIdElE+SB4RRV5H0EJKklOm+K6S4TvmbMEQMzVbUIXGdpexk1xprq?=
 =?us-ascii?Q?FD8q2tyMVqhr6yRR96QysvpptQG3r1f9SHymy0Jyl1e/FWaHE3d/GtZkhpZd?=
 =?us-ascii?Q?TFUs9TkWa4SZifUUPKpJrnU/szuCDERsLs6Mmv43xsLZWXpddogbYWgkw45z?=
 =?us-ascii?Q?y0IbMqfsXULBLcKu3D1XO0WcEceMmCFMHyHbhP3ep1RnpgbNKE2xsw5A4qu6?=
 =?us-ascii?Q?kYxiYIFCfXYBhIBhuoTewVeUugp6/1DYuv/sUhVRZyk3QE83fr9OuEhnrdQP?=
 =?us-ascii?Q?/lzbX9yBRTJn43tb0ONNHn69AqimAPay7ygUCOZAVhttnD8R2KuSHx8jqfXu?=
 =?us-ascii?Q?4bXeL95mJwAByZ9KHy6KlGrYqNNo81+OysVGbTQtEdCRH5SphLu3VJPPXGpg?=
 =?us-ascii?Q?PHC305rM1lq69LcbkxRidkIC5F/Eg3lJOTzqO7sD6axwefWr+hnz67U3ke02?=
 =?us-ascii?Q?HB0plOSIBnPyuOgHnx+04dI4hiY/Ya/XfMmNiR2kMkq0v0xMLpLl7iexhncj?=
 =?us-ascii?Q?uYu24EiatD7NhOr4kaGVIaOVbUUJ4IiGj53qsNVP2Hcky0sVNdImMA5Yvg07?=
 =?us-ascii?Q?t1Uw9XGat0drk0tTxo2fkUATmkmIqxTDuBjqYDovH/DaTv5941fCFAHbna+E?=
 =?us-ascii?Q?TcC05ixU3a63ClbCPmWIdK1dVbE/2NCwe15RmxanuCKJfPfO3+xiniikLtGM?=
 =?us-ascii?Q?Sqe/sI6onlN/JxlVEX4BHyDDE8tOkMTEqxtw2jwe6gIUxtolw6WA5Q3hQ+M8?=
 =?us-ascii?Q?3zRegjegswCwQJT+uu44yN5DrC8Rv3IHRGKvSqUWC1LhSTbg98OXsqHdZLwY?=
 =?us-ascii?Q?gIyTNthpf7Yf1hbLZTEKlFmgPsWpCydQz1asUXazax88Pbx5lPGnag03R7EH?=
 =?us-ascii?Q?yaE0Ygvwe4EWQSSO3djjEhGN7sji7u8TAwq8R945QY5LnTI1nrH81PMNhGUQ?=
 =?us-ascii?Q?mpU1+R9mfSll0QexxspCAySXAJYONh7sSaPM+RPRtVDqpAN3go2lujN3HTGy?=
 =?us-ascii?Q?poS9IezXRKIXb8HT825blBbAV3CVT9ys7Hft4Kr8c1QB2SDRsh6q5LherzMl?=
 =?us-ascii?Q?rCptlUf5f66QgRZnstBKP7rxZkYc+tN0XJ9lLv/J6atHjFp/eCNznocq2LJK?=
 =?us-ascii?Q?YYjMfLsvdXQNFTQc5WTjFLavCKLPnXPXC/vB9M2YPOxkRxNu7Z02UyF8r9PO?=
 =?us-ascii?Q?MBOqmudb+vbidSNAErPiLHd9YyqMN+cw6wKT/sRYLyaricmZiAuOKAb1Jnt7?=
 =?us-ascii?Q?erpNwJGKfrQHH+NVFmYr6HCkeB/ZyuBo4yk+7wqNIv3q+kC6DPm9yu5J6Fbn?=
 =?us-ascii?Q?cvEk9MD6rVSaQ6DFkBlOCmfuP2Tk+11fVAIAtkdVyRTLtl8eZlvruv8bhnCU?=
 =?us-ascii?Q?fp/p5kZcehfRtUx4tAOCwhT2altV+/j6tp2E24nTPGexOtvZC3A4L8KC0hl2?=
 =?us-ascii?Q?hQBif6yKhx6pO8qq4x0iyz1FjtjXp1AfoVZ/Dvhn5TqJ7vDnsVCiNsREC8SY?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e4b8b2-54f2-4e09-0bd9-08db472cf962
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 14:37:49.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibbLgP1q2av2c12dbPb18Z1+GyfE1S7HhfhCGRfFGnH2jGZwoUghh9jCUeJ4ZA9lh26EIe478EowGzd5y/okzFwg6I8JYtbfl4vCd9faTIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6683
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/17] drm/xe/guc: Convert GuC registers
 to REG_FIELD/REG_BIT
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 04:13:55PM +0200, Michal Wajdeczko wrote:
>
>
>On 26.04.2023 23:32, Lucas De Marchi wrote:
>> Cleanup GuC register declarations by converting them to use REG_FIELD,
>> REG_BIT and REG_GENMASK. While converting, also reorder the bitfields
>> so they follow the convention of declaring the higher bits first.
>>
>> v2:
>>   - Drop unused HUC_LOADING_AGENT_VCR and DMA_ADDRESS_SPACE_GTT (Matt Roper)
>>   - Simplify HUC_LOADING_AGENT_GUC define (Matt Roper)
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 165 ++++++++++++--------------
>>  drivers/gpu/drm/xe/xe_ggtt.c          |   6 +-
>>  drivers/gpu/drm/xe/xe_guc.c           |   8 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |   3 +-
>>  4 files changed, 86 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 011868ff38aa..1960f9e78ec4 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -14,23 +14,18 @@
>>  /* Definitions of GuC H/W registers, bits, etc */
>>
>>  #define GUC_STATUS			_MMIO(0xc000)
>> -#define   GS_RESET_SHIFT		0
>> -#define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
>> -#define   GS_BOOTROM_SHIFT		1
>> -#define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
>> -#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
>> -#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
>> -#define   GS_UKERNEL_SHIFT		8
>> -#define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
>> -#define   GS_MIA_SHIFT			16
>> -#define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
>> -#define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
>> -#define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
>> -#define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
>> -#define   GS_AUTH_STATUS_SHIFT		30
>> -#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
>> -#define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
>> -#define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
>> +#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
>> +#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
>> +#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
>> +#define   GS_MIA_MASK			REG_GENMASK(18, 16)
>> +#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
>> +#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
>> +#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
>> +#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
>> +#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
>> +#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
>> +#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>
>shouldn't we just define mask for Bootrom status here and define known
>codes in separate place/enum ? note that there could be more codes and

not what is usually done. We usually define the mask and the values
using REG_FIELD_PREP().

>we just want to extract that code from the register and print it (even
>if the value is not yet defined in the driver
>
>#define   GS_BOOTROM_STATUS_MASK	REG_GENMASK(7, 1)
>...
>enum {
>	BOOTROM_STATUS RSA_FAILED = 0x50,
>	BOOTROM_STATUS_JUMP_PASSED = 0x76,
>};

drivers/gpu/drm/xe/xe_guc.c:            if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {

in this case it would change to:

	if (REG_FIELD_GET(GS_BOOTROM_MASK, status) == GS_BOOTROM_RSA_FAILED)

we do have some mixes of these styles around. I'm not sure one is
better than the other in all cases.

This patch however is only about the conversion to
REG_GENMASK/REG_FIELD_PREP. Other changes should be done on top

>
>> +#define   GS_MIA_IN_RESET		REG_BIT(0)>
>>  #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
>>  #define SOFT_SCRATCH_COUNT		16
>> @@ -42,90 +37,86 @@
>>  #define DMA_ADDR_0_HIGH			_MMIO(0xc304)
>>  #define DMA_ADDR_1_LOW			_MMIO(0xc308)
>>  #define DMA_ADDR_1_HIGH			_MMIO(0xc30c)
>> -#define   DMA_ADDRESS_SPACE_WOPCM	  (7 << 16)
>> -#define   DMA_ADDRESS_SPACE_GTT		  (8 << 16)
>> +#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
>> +#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>>  #define DMA_COPY_SIZE			_MMIO(0xc310)
>>  #define DMA_CTRL			_MMIO(0xc314)
>> -#define   HUC_UKERNEL			  (1<<9)
>> -#define   UOS_MOVE			  (1<<4)
>> -#define   START_DMA			  (1<<0)
>> +#define   HUC_UKERNEL			REG_BIT(9)
>> +#define   UOS_MOVE			REG_BIT(4)
>> +#define   START_DMA			REG_BIT(0)
>>  #define DMA_GUC_WOPCM_OFFSET		_MMIO(0xc340)
>> -#define   GUC_WOPCM_OFFSET_VALID	  (1<<0)
>> -#define   HUC_LOADING_AGENT_VCR		  (0<<1)
>> -#define   HUC_LOADING_AGENT_GUC		  (1<<1)
>>  #define   GUC_WOPCM_OFFSET_SHIFT	14
>> -#define   GUC_WOPCM_OFFSET_MASK		  (0x3ffff << GUC_WOPCM_OFFSET_SHIFT)
>> -#define GUC_MAX_IDLE_COUNT		_MMIO(0xC3E4)
>> +#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>> +#define   HUC_LOADING_AGENT_GUC		REG_BIT(1)
>> +#define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
>> +#define GUC_MAX_IDLE_COUNT		_MMIO(0xc3e4)
>>
>> -#define HUC_STATUS2             _MMIO(0xD3B0)
>> -#define   HUC_FW_VERIFIED       (1<<7)
>> +#define HUC_STATUS2			_MMIO(0xd3b0)
>> +#define   HUC_FW_VERIFIED		REG_BIT(7)
>>
>> -#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xC1DC)
>> -#define   HUC_LOAD_SUCCESSFUL		  (1 << 0)
>> +#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xc1dc)
>> +#define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
>>
>>  #define GUC_WOPCM_SIZE			_MMIO(0xc050)
>> -#define   GUC_WOPCM_SIZE_LOCKED		  (1<<0)
>> -#define   GUC_WOPCM_SIZE_SHIFT		12
>> -#define   GUC_WOPCM_SIZE_MASK		  (0xfffff << GUC_WOPCM_SIZE_SHIFT)
>> +#define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
>> +#define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
>>
>>  #define GEN8_GT_PM_CONFIG		_MMIO(0x138140)
>>  #define GEN9LP_GT_PM_CONFIG		_MMIO(0x138140)
>>  #define GEN9_GT_PM_CONFIG		_MMIO(0x13816c)
>> -#define   GT_DOORBELL_ENABLE		  (1<<0)
>> +#define   GT_DOORBELL_ENABLE		REG_BIT(0)
>>
>>  #define GEN8_GTCR			_MMIO(0x4274)
>> -#define   GEN8_GTCR_INVALIDATE		  (1<<0)
>> -
>> -#define GEN12_GUC_TLB_INV_CR		_MMIO(0xcee8)
>> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	(1 << 0)
>> -
>> -#define GUC_ARAT_C6DIS			_MMIO(0xA178)
>> -
>> -#define GUC_SHIM_CONTROL		_MMIO(0xc064)
>> -#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	(1<<0)
>> -#define   GUC_ENABLE_READ_CACHE_LOGIC		(1<<1)
>> -#define   GUC_ENABLE_MIA_CACHING		(1<<2)
>> -#define   GUC_GEN10_MSGCH_ENABLE		(1<<4)
>> -#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	(1<<9)
>> -#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	(1<<10)
>> -#define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
>> -#define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
>> +#define   GEN8_GTCR_INVALIDATE		REG_BIT(0)
>> +
>> +#define GEN12_GUC_TLB_INV_CR			_MMIO(0xcee8)
>> +#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
>> +
>> +#define GUC_ARAT_C6DIS				_MMIO(0xa178)
>> +
>> +#define GUC_SHIM_CONTROL			_MMIO(0xc064)
>>  #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>> -#define   PVC_MOCS_UC_INDEX			1
>> -#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK,\
>> +#define   PVC_GUC_MOCS_UC_INDEX			1
>> +#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
>>  							       index)
>> +#define   GUC_GEN10_SHIM_WC_ENABLE		REG_BIT(21)
>> +#define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
>> +#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
>> +#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	REG_BIT(9)
>> +#define   GUC_GEN10_MSGCH_ENABLE		REG_BIT(4)
>> +#define   GUC_ENABLE_MIA_CACHING		REG_BIT(2)
>> +#define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
>> +#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
>>
>> -#define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
>> -#define   GUC_SEND_TRIGGER		  (1<<0)
>> -#define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
>>
>> -#define GUC_NUM_DOORBELLS		256
>> +#define GUC_SEND_INTERRUPT			_MMIO(0xc4c8)
>> +#define   GUC_SEND_TRIGGER			REG_BIT(0)
>> +#define GEN11_GUC_HOST_INTERRUPT		_MMIO(0x1901f0)
>> +
>> +#define GUC_NUM_DOORBELLS			256
>>
>>  /* format of the HW-monitored doorbell cacheline */
>>  struct guc_doorbell_info {
>>  	u32 db_status;
>> -#define GUC_DOORBELL_DISABLED		0
>> -#define GUC_DOORBELL_ENABLED		1
>> +#define GUC_DOORBELL_DISABLED			0
>> +#define GUC_DOORBELL_ENABLED			1
>>
>>  	u32 cookie;
>>  	u32 reserved[14];
>>  } __packed;
>>
>> -#define GEN8_DRBREGL(x)			_MMIO(0x1000 + (x) * 8)
>> -#define   GEN8_DRB_VALID		  (1<<0)
>> -#define GEN8_DRBREGU(x)			_MMIO(0x1000 + (x) * 8 + 4)
>> +#define GEN8_DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
>> +#define   GEN8_DRB_VALID			REG_BIT(0)
>> +#define GEN8_DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
>>
>>  #define GEN12_DIST_DBS_POPULATED		_MMIO(0xd08)
>> -#define   GEN12_DOORBELLS_PER_SQIDI_SHIFT	16
>> -#define   GEN12_DOORBELLS_PER_SQIDI		(0xff)
>> -#define   GEN12_SQIDIS_DOORBELL_EXIST		(0xffff)
>> -
>> -#define DE_GUCRMR			_MMIO(0x44054)
>> +#define   GEN12_DOORBELLS_PER_SQIDI_MASK	REG_GENMASK(23, 16)
>> +#define   GEN12_SQIDIS_DOORBELL_EXIST_MASK	REG_GENMASK(15, 0)
>>
>> -#define GUC_BCS_RCS_IER			_MMIO(0xC550)
>> -#define GUC_VCS2_VCS1_IER		_MMIO(0xC554)
>> -#define GUC_WD_VECS_IER			_MMIO(0xC558)
>> -#define GUC_PM_P24C_IER			_MMIO(0xC55C)
>> +#define GUC_BCS_RCS_IER				_MMIO(0xC550)
>> +#define GUC_VCS2_VCS1_IER			_MMIO(0xC554)
>> +#define GUC_WD_VECS_IER				_MMIO(0xC558)
>> +#define GUC_PM_P24C_IER				_MMIO(0xC55C)
>>
>>  #define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
>>  #define VF_SW_FLAG_COUNT		4
>> @@ -134,21 +125,21 @@ struct guc_doorbell_info {
>>  #define MED_VF_SW_FLAG_COUNT		4
>>
>>  /* GuC Interrupt Vector */
>> -#define GUC_INTR_GUC2HOST		BIT(15)
>> -#define GUC_INTR_EXEC_ERROR		BIT(14)
>> -#define GUC_INTR_DISPLAY_EVENT		BIT(13)
>> -#define GUC_INTR_SEM_SIG		BIT(12)
>> -#define GUC_INTR_IOMMU2GUC		BIT(11)
>> -#define GUC_INTR_DOORBELL_RANG		BIT(10)
>> -#define GUC_INTR_DMA_DONE		BIT(9)
>> -#define GUC_INTR_FATAL_ERROR		BIT(8)
>> -#define GUC_INTR_NOTIF_ERROR		BIT(7)
>> -#define GUC_INTR_SW_INT_6		BIT(6)
>> -#define GUC_INTR_SW_INT_5		BIT(5)
>> -#define GUC_INTR_SW_INT_4		BIT(4)
>> -#define GUC_INTR_SW_INT_3		BIT(3)
>> -#define GUC_INTR_SW_INT_2		BIT(2)
>> -#define GUC_INTR_SW_INT_1		BIT(1)
>> -#define GUC_INTR_SW_INT_0		BIT(0)
>> +#define GUC_INTR_GUC2HOST			BIT(15)
>> +#define GUC_INTR_EXEC_ERROR			BIT(14)
>> +#define GUC_INTR_DISPLAY_EVENT			BIT(13)
>> +#define GUC_INTR_SEM_SIG			BIT(12)
>> +#define GUC_INTR_IOMMU2GUC			BIT(11)
>> +#define GUC_INTR_DOORBELL_RANG			BIT(10)
>> +#define GUC_INTR_DMA_DONE			BIT(9)
>> +#define GUC_INTR_FATAL_ERROR			BIT(8)
>> +#define GUC_INTR_NOTIF_ERROR			BIT(7)
>> +#define GUC_INTR_SW_INT_6			BIT(6)
>> +#define GUC_INTR_SW_INT_5			BIT(5)
>> +#define GUC_INTR_SW_INT_4			BIT(4)
>> +#define GUC_INTR_SW_INT_3			BIT(3)
>> +#define GUC_INTR_SW_INT_2			BIT(2)
>> +#define GUC_INTR_SW_INT_1			BIT(1)
>> +#define GUC_INTR_SW_INT_0			BIT(0)
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 9a5950024d9f..cc2d119bbbe8 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -186,11 +186,11 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>  }
>>
>>  #define GEN12_GUC_TLB_INV_CR                     _MMIO(0xcee8)
>> -#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        (1 << 0)
>> +#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        REG_BIT(0)
>>  #define PVC_GUC_TLB_INV_DESC0			_MMIO(0xcf7c)
>> -#define   PVC_GUC_TLB_INV_DESC0_VALID		 (1 << 0)
>> +#define   PVC_GUC_TLB_INV_DESC0_VALID		 REG_BIT(0)
>>  #define PVC_GUC_TLB_INV_DESC1			_MMIO(0xcf80)
>> -#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 (1 << 6)
>> +#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 REG_BIT(6)
>
>why we are still keeping some register definitions in .c when we already
>have separate regs/ folder where we can have all definitions?

in some cases, historical. In other, so that register isn't accessed
outside where it's supposed to be.

However as we improve ours regs definitions and even add some additional
checks in all headers in regs/*.h, we may want to eventually move them
all to regs/. In this series I did it for GuC as it was the biggest
offender


Lucas De Marchi

>
>>
>>  void xe_ggtt_invalidate(struct xe_gt *gt)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index e00177f4d294..d18f2e25ce56 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -357,7 +357,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>>  				GUC_ENABLE_MIA_CACHING;
>>
>>  	if (xe->info.platform == XE_PVC)
>> -		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_MOCS_UC_INDEX);
>> +		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_GUC_MOCS_UC_INDEX);
>>
>>  	/* Must program this register before loading the ucode with DMA */
>>  	xe_mmio_write32(gt, GUC_SHIM_CONTROL.reg, shim_flags);
>> @@ -848,11 +848,11 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>>
>>  	drm_printf(p, "\nGuC status 0x%08x:\n", status);
>>  	drm_printf(p, "\tBootrom status = 0x%x\n",
>> -		   (status & GS_BOOTROM_MASK) >> GS_BOOTROM_SHIFT);
>> +		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
>>  	drm_printf(p, "\tuKernel status = 0x%x\n",
>> -		   (status & GS_UKERNEL_MASK) >> GS_UKERNEL_SHIFT);
>> +		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>  	drm_printf(p, "\tMIA Core status = 0x%x\n",
>> -		   (status & GS_MIA_MASK) >> GS_MIA_SHIFT);
>> +		   REG_FIELD_GET(GS_MIA_MASK, status));
>
>maybe for indented logs we should use drm_printf_indent()
>and we can use %#x to get pretty hex output with 0x prefix
>
>>  	drm_printf(p, "\tLog level = %d\n",
>>  		   xe_guc_log_get_level(&guc->log));
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index fe1d5be1241e..d4fc2d357a78 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -561,8 +561,7 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
>>
>>  		ads_blob_write(ads,
>>  			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
>> -			       ((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT)
>> -				& GEN12_DOORBELLS_PER_SQIDI) + 1);
>> +			       REG_FIELD_GET(GEN12_DOORBELLS_PER_SQIDI_MASK, distdbreg) + 1);
>>  	}
>>  }
>>
