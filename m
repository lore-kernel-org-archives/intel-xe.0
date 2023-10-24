Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7512FC07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 17:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354BE10E43C;
	Tue, 24 Oct 2023 17:15:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951610E430
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698167751; x=1729703751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MxwBzpj1AcKrysWLb6J3nGVw9A5PlMBk9sl/B0KFYy8=;
 b=EBEWyREQDRyW80fJ4Oilx7f1JUUY9/k8qjXjf6xhyFRY7YSbONadSN8A
 w7HS49QmgLRe7nQk/22MFxMb/pgf5vQGoy9v7ewRaGes/PB1arkOnT9mA
 P6HlmB4EEUb6nH4qAWjEUVbo7ELLYEN31klc1ewGfPwmmSPri6fIWrstZ
 Uf+53Spng2mnzI4XPiA7cB8JdxZhywylV0FQ5onL5EobkoQBYjkNB8qBB
 sZI0YEy35sotzOk+Tk84qOXvz8yjkStNxZ2AHNkC7mZ5Tv0Mv3XBDZRi3
 QhdmwBXZxnQxY3cUEKvviEImTZCF/8apPKC8Hr17C/gXwG2aJp37j4rMg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="418242296"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="418242296"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 10:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752059200"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="752059200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2023 10:15:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 10:15:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 10:15:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 10:15:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 10:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P48yap98weW3UOqE++KbJ7Z6u1/t9s6TyI0u/6YLofQeIdx2rQYEsSq//Fm7tTKO3gxUMJO8sDWT7CunixuGxy7JpgUa1zg45RZzTv5HWjmda9k/eFzRfoL0uYE8dt0PgxMMMFkS1/7X+vs6eMzvMH9iqWl+Y72FbV6Wpugi6J68fQJDx3gwq2n8VTGpGceDbHYs/SmgZNQtm0M7a/Y2omzeU/nKmAaUiLZ059j/9KZUOZucNhE8eFkJjF5ly8SpYAlg04A38uNly+6/5bOg24B7/DIAztmqy+yBeKhj8wFcrZEo4HfGjG/OWKp+1zREM7qjW3jtdUt6D3QqcJYQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM2EZxB3YV2Sm52Ons9T/XhSlKJu3V+4m2Yjth7CdBI=;
 b=mRSO2MDz8sUOvtoGdVWVMWQd3+iRpHlJUP1qlshZs5uQFjsZinnYAZQDXFtpiUi/mzfDqMQ0KgzMb7NS9ByU/ZsLirC4nGWQnZhutdEhBX6s/HhQOG3AyeM5E3dKjrUI1ffUl9RPQJDTpKf/TcERQ+atyvzVjFxffj1VYpxH8jALqt1Dzm935tW0ieeDD+LK13qkYi2JTpdEDhLr3Vt79RJjrAQQwulS8B/7SfKJBJ9Y0Zf82nZT+0BusNBwe34bYAEk2K3DH7svBrQkp/nrFP6BPjRq66lp0fl1ZXmie2Yx9y0d0w3Zn4zhhjkDTZfNF4aXFAGnDPct3+8KP3S5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Tue, 24 Oct
 2023 17:15:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6907.030; Tue, 24 Oct 2023
 17:15:47 +0000
Date: Tue, 24 Oct 2023 12:15:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <oqzjxeuxexv64tadqbghdjz36l3ke2spmqnhp23bc3h5c54dn2@i5jrnpcksp5g>
References: <20231022155727.717251-1-kelbaz@habana.ai>
 <8734y0b8xg.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8734y0b8xg.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3770c933-25f5-40de-16c4-08dbd4b4dd1e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Q3wzGZFe4wwxc9ZYhhBxTqzo+8s/5XB3zr2KvXMY84LZ7+MOW42qEKuFj4TOlftEZB5MspcCCWYnoP/CWyInLwqTp2LJFy9WaaNVvQq21G/zIYAgFeQa5V3pRKdHqWN3tBDLcnT/4p+1IQDa5S8w+mAvX84twup5dFrHToLIh0MpUi97wBHTA34y+BOnHifU0m8x1quwpZASrs5Ly8pZMTnZgnB8i8e0fqQyqYeaoEX5ktIG2dApu8/SP52/IaT+h302aq6dOSyXBS1bdIlNhl7znmUjmSu9ewLw+JlFYaJ1IKCJo6uLCdHxIHddVWnW6iC5YrnDMj7BaTDX42kpzrLmlR+Vkvm+gM3yzm8b+qRZh9eX5k2FAjRNvJlXBXa4ZnIszzHdJdIs+Tkgjbj0bAaFmJTbdRVfxMYJChI+umorzNUYkxCYFuRc7Wk8uiSMyPRyZPAvWCUV1oHltQZEvpQm7uLBN01zpzz8SlR84AHffJaovSBm2eqYPzz8u3uGBQoK1zjoyTlPZo5Fbizs34WDJNpGyFeDOysLx+qYfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(4326008)(8676002)(8936002)(83380400001)(966005)(6486002)(9686003)(82960400001)(41300700001)(5660300002)(6666004)(6512007)(86362001)(6506007)(6916009)(316002)(26005)(478600001)(38100700002)(66946007)(66476007)(66556008)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kw4/4tNT0ow52yaHCBG2ZMUOycZDpaX4S8spOA8uicdht+o59RiB7VXClFyK?=
 =?us-ascii?Q?lg0i1MDBhpOBEEMPtzEXPYZDx9pMDRcqTYbj+JCx/Z1MOw2jop0XYohcYf6G?=
 =?us-ascii?Q?grhiKB4HSO+u0neoVyRTAvVk10ylAvF0dnnQGmUZ3JGe5VOg8E0fEecYlbin?=
 =?us-ascii?Q?vqB6QTer9BZK2YGCU+L8TMfMdlfg5ystIoaJMzXmQV9N7Lh6+Vy4ikXPfZCD?=
 =?us-ascii?Q?aOhmJiQRkhmYsbeVjOUvjbsCJxgPE4VPErn7+DoX5/fHIK+hKobLIJ1MsY81?=
 =?us-ascii?Q?xf6TzGvtfTd64WlQYCXqNrKK1ZLEIxKB3n4gOl1chgg2aT7NXxhJyOwv2sNR?=
 =?us-ascii?Q?9K4fHQ+KGSn9m8WY/TxarZB6g+rdnw4wq5UCLyFjG4YZcV91aNMBlkP+fvQX?=
 =?us-ascii?Q?FMHCbj/jjem5HVyXMTULE0ekKMfBIPhlqjcZLfNU3ANo2SjWixNBkB3zzk5n?=
 =?us-ascii?Q?kyQosPMnPtymJpj3ByzwP/fJzdG148fRr9yxGbPlvCH6lfvfcDPZaktog3aJ?=
 =?us-ascii?Q?7P2jI50iDlMyF7SogLQ0lSACqY9OzgitFNgMVP4uL3MR4i1z3ietunULmGGP?=
 =?us-ascii?Q?XLkpwzL0upMx8S1N24un5qK8Tf5FzCC2nz0O6GuMmRbti7I+u5BMeb/ZvxHn?=
 =?us-ascii?Q?zgvsyt597lbLA2Ag9XJgQHi9AHSpzWmyE9o0xgJtiCITysyHJaJleWvgkvIA?=
 =?us-ascii?Q?WRnvc3hC3TgAbxyZ6IH/6Ky+MGRLckrn6GiIxRE03uNJegxPy0Xbx/2z1s7z?=
 =?us-ascii?Q?+K4setODMGmenSooxJflsyKwtSjOSZ6WA0i+witBsTuOpvJepg/XbHlRA/fD?=
 =?us-ascii?Q?KWBXUfM0Py0LouwAjpIi137uMId9C8Jpzh2u/z/UF6EOMDdQiXMQ/RlNrheQ?=
 =?us-ascii?Q?e3FMQVVV7nEQ1nCTIxB+6sK2/qafEu5aCJMR7tLPOGmoGKqNKz/Y04q+0kvD?=
 =?us-ascii?Q?7gdoW6+bRg2ASTESoHsHo9FzfYU1qHreh9AY/n5WUjMoBefPnMFQXod4yEkr?=
 =?us-ascii?Q?tX+ZZ+5yvsIf/BxDw/8GgVefxvEsnHxwSzJm41B+Es6esz6ZBelsP8oBzQQU?=
 =?us-ascii?Q?+ivA2MI5BT3L/8ZWP/crZlfqCc5b9LHAqrxVovy0DL1Q2OmbooEi/YaYOTdi?=
 =?us-ascii?Q?UsMSiYTY8uS8sRt326BAtF72JLqT0CxF/DB/s+Fw2MLXSo6oTE7bor+eE7a5?=
 =?us-ascii?Q?T0QEOWhzSGmFZrWe+iIPWtBLy+ko4EFx6pDbCSUundGKaf3B/E2xUTfpuQnd?=
 =?us-ascii?Q?qUrkPVTETqNm5gYJQoOXlSkdGAronbYYIz8HlCExKc6KQYN/TK+Yv3S9HpnW?=
 =?us-ascii?Q?5ZVDLD0POJwwsztEsc5WOD0suI0NxSDUNttxe2YHNpm4SUJ2qJFW4/5trWkC?=
 =?us-ascii?Q?US0NzyEpZYMdCqPX0QU2dTZsMIZxPIZj4p5IYlxUL6PM0+srDEXHwO4jeO6l?=
 =?us-ascii?Q?2xgEcuBkEFUJCqva7yd/hgCi25TwkyBdDpivQUyYbRTVNvhMyFAqL2QRzspI?=
 =?us-ascii?Q?kzy7bMebIn23pCuF8u6LhJtGHlMQr92foUxg0LSxJ54RmlIWkJXhnWGlZ8X4?=
 =?us-ascii?Q?eTGTxWugn37EyYTjsLyux/Qmcz2Ghxc+WNH4QGtP3yX6lFIps20rGqf0GioG?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3770c933-25f5-40de-16c4-08dbd4b4dd1e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 17:15:47.3975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXSRP887TxSERyMlYvZ0s2WcePL7H+gRxK6Nkl6Xo+gW3EKrytAVmSZJQZqQAALLBtJ3wduC11hs0iYE/z7+C+ARuKWtaVWlDKHcSY9uajM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
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

On Tue, Oct 24, 2023 at 01:40:11PM +0300, Jani Nikula wrote:
>On Sun, 22 Oct 2023, Koby Elbaz <kelbaz@habana.ai> wrote:
>> Per device, set this flag to enable access to the PCODE uC or to skip it.
>>
>> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
>> ---
>> Changes in v2:
>> - Added the flag 'skip_pcode' instead of 'has_pcode'
>
>I don't know why change was made from positive to negative flag.
>
>Generally it's better to use positive flags, because they just read
>better. Negative flags often lead to double negatives in source, such as
>!disable.
>
>Please consider using a positive flag, even if it's not "has_something".

https://lore.kernel.org/all/qvuhtciy6gasz4s5f5opebdepse7x2ubfttnb4alhjq4e5zz4b@fjs6d67fcmex/

The positive here is harder to work with IMO when thing "stop to exist"
or when they are added to cope to certain environment limitations.
That's because a) you have to go over all the past platform info to add
the opposite, you can't rely on it being zero-initialized anymore.
b) it's very easy to forget that for platforms that are wip as there are
no git conflicts to serve as a warning.

So, I think adding it as "skip" or another better verb could be
appropriate. At least while there is no single user of that flag and
platforms being worked on @habana and @intel, IMO this should help us
not shoot on each others' foot.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>>
>>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>>  drivers/gpu/drm/xe/xe_pcode.c        | 9 +++++++++
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 44d622d4cc3a..29199671d9e8 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -257,6 +257,8 @@ struct xe_device {
>>  		u8 enable_display:1;
>>  		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
>>  		u8 bypass_mtcfg:1;
>> +		/** @skip_pcode: skip access to PCODE uC */
>> +		u8 skip_pcode:1;
>>  		/** @supports_mmio_ext: supports MMIO extension/s */
>>  		u8 supports_mmio_ext:1;
>>  		/** @has_heci_gscfi: device has heci gscfi */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 2fae45b9d88e..05b0aa9f2ab7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -61,6 +61,7 @@ struct xe_device_desc {
>>
>>  	u8 has_llc:1;
>>  	u8 bypass_mtcfg:1;
>> +	u8 skip_pcode:1;
>>  	u8 supports_mmio_ext:1;
>>  };
>>
>> @@ -578,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
>>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>>  	xe->info.has_llc = desc->has_llc;
>>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>> +	xe->info.skip_pcode = desc->skip_pcode;
>>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 4a240acf7625..b324dc2a5deb 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>>  {
>>  	int err;
>>
>> +	if (gt_to_xe(gt)->info.skip_pcode)
>> +		return 0;
>> +
>>  	lockdep_assert_held(&gt->pcode.lock);
>>
>>  	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>> @@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
>>  	int timeout_us = 180000000; /* 3 min */
>>  	int ret;
>>
>> +	if (gt_to_xe(gt)->info.skip_pcode)
>> +		return 0;
>> +
>>  	if (!IS_DGFX(gt_to_xe(gt)))
>>  		return 0;
>>
>> @@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
>>  {
>>  	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>>
>> +	if (gt_to_xe(gt)->info.skip_pcode)
>> +		return 0;
>> +
>>  	if (!IS_DGFX(gt_to_xe(gt)))
>>  		return 0;
>
>-- 
>Jani Nikula, Intel
