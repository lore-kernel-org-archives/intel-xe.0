Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C821C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D210E640;
	Tue,  9 Jul 2024 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VH+v3QcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFB410E648
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720554364; x=1752090364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ov5GWrxFB53ulip493l1gVQcFZZVJFuL7esOdqQ2Fs0=;
 b=VH+v3QcSazKEIG3yzDzkNWLnblyvLC4OUJPX/yXO5sU7M709xOhkImkV
 EwhtX84jhmD+XklTwGcLafVc1VzXHC+EQsVKR9v5qz15+s5wrYH1Kdq5D
 jXvllNpaDd/RB4eNez63D/UwH6T+nL8leJ/Z2QW/px0+4dF0C/nXm19qm
 /diHTP7/wyOrpyuZVPv6KTeziBhDFbUq0f9aIPJZ3KYpRH2UPOgaHfrjB
 4DwEkbWsJAKY0caicsCOGUSQSDdwDcniRWtkoWZjx0CxwqqxfbIN/nwAL
 Y6j0rKSkbUX3ocqFDZ3RFvniRu/usP5DBiiEzBee/WOdd7QbP65XJI5IF g==;
X-CSE-ConnectionGUID: sJUfd0EwSkmebbJTayUXow==
X-CSE-MsgGUID: XgwtyG83T9mT1aRPYZwLvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17708273"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17708273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:46:04 -0700
X-CSE-ConnectionGUID: GfdnA1a3R4SKeeG+UVM33A==
X-CSE-MsgGUID: 82tirEW8RxS6+woGniYYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48416968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:46:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:46:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:46:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3awM8znhjP+I5IRyEi0m4T6zMdwoH0cKAlLKhZaw++B3aiFrB3foCGsU3r/qjzKomfaEAJy7OI+kWHiVJIvpcFoU7Xr9W9lEEwOtFVp0rsCGDSQW/dB48rG+nv7iLxPrTcOS6CZ8y8912B2e0guVGKFZCkfH9d+KEeEUbpV6IW9loh/2w0p9i7O6P1UYnfAI6GUQA+c/RWzg7WbBjIfnwfPJjEpKYN/dHoFwmo6nSfB4XafDJZhMpqMuf1VaKLTf3p2cLsxDq6sGpneIRUHgMZ4ulM78Rx64byfD2I/Y2CsGD9sambEJohI/9mNgjt1RvwZj/jCyqIQdcOcmOUIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wX0h53I5+9poNeAgltlsy5s0fFHTVA7asI1osa/fS0=;
 b=XD56MVCxghRyyf5zI1D4H305wEH/v6kDBYLQJQCbsuKlXEoMx9nwpY8We1LFfpweijdyeveyL4ppQMLgPzmR1uIJ2wKSDVBIfs2IeDktJtXNLgHYXCzrJ01BAF5V5Zq8V9rOr7GiChfNvZ0ueppQ5Vr5HZ3c+0Vv83ryV3f+jPFAXqknVzaXLe5yd+4yZpXs8TBd9Ik5u7gfWusivkeqkF3QCLfxyMbVEU+JsbRAC6Q66fGxoiI3XUo9Urfpkrm3R8tyKTvOiN11OB1FRyouQL9LSo13niaZasrBrTY4PcQz/5adwEJwfq//u70hAvupvYSzCrOaMr7dr81Xpo574Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 19:46:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:46:00 +0000
Date: Tue, 9 Jul 2024 14:46:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Generate oob before compiling anything
Message-ID: <tkjihal575osa7qcvpfas6odsspf4uu7q4vhmewggph53pj4wa@bu33eo23it63>
References: <20240708213041.1734028-1-lucas.demarchi@intel.com>
 <Zo2KrYfuRcnowOZs@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zo2KrYfuRcnowOZs@intel.com>
X-ClientProxiedBy: MW3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:303:2b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b406287-44e0-415e-ddb2-08dca04fc20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9PqCOsPXpWxyzL2W9bsgywAj1iIoRTqRIJHL11Z/3p9rnxuO5o7jiSEEvf8F?=
 =?us-ascii?Q?MQTFxkWSdLPKa7wu29T//Fn+4xshC4ldagVdj4BiugcDxO0pbL4qpFn9z8Cq?=
 =?us-ascii?Q?H37FeP0F9m32CZdO/9qo0eyICFG05hIH3Z7uCo/rxoGg7UOCS2jp9E8z1XDJ?=
 =?us-ascii?Q?3r20gXkaaZT0RHrXCAE5EqBtAMyQyr6rN2Q0rg34Q3a0rmzxQLJAqVoCcfxn?=
 =?us-ascii?Q?NecH1i83AfAOYFJNtVg6/CTbfUmTgBI5CDprE2aKW2+nlnDSsK0KSkFvjlek?=
 =?us-ascii?Q?o7sm1ODBBpTfhCNfP0fQVjidHyCoePCXoUVd/5kGOWR+okc/K9JACS0J5uOT?=
 =?us-ascii?Q?L0IIPgMyW/x8QMlo5UmFiSEMUMk8VebG+dCQ/UmHUTvtk1IvXjdanGEEdIXl?=
 =?us-ascii?Q?CGJaKGY1+TZnW+C2FC4zJcpl3gh1wfrI/MP2X9N4EO5lVEuZf1aGvbKQbVga?=
 =?us-ascii?Q?KqgEh5OWLYp26ovA+BodpgNLqZ/ufq5ckS2qAxbF7ewBrescxhExm2N1N/WP?=
 =?us-ascii?Q?vCggL3wsKuAdtNvjuEM82XhQStRbqUwGbYCcB+FxKp/1nC4ThvF6yxTg/RBz?=
 =?us-ascii?Q?zqy9ZiWK4E01hytE78WnmIF1enButtUzvzM2rp5j4zJDBnFIfAMII1zEdA4T?=
 =?us-ascii?Q?m7y1fObL5S339oYAcU5XOsDe6t0sXEFyX3x1juzNk20KzeO8858hKsCp81xX?=
 =?us-ascii?Q?wNIB7YJUtyXRjN5HCFYMv2kqu3Meozd48VbtmLRYAGbyj+2Z5XCtyrl4Fywo?=
 =?us-ascii?Q?GF5r8TshviBJ5B0MyCb2XszY3upXNuJztgRRKOa04r4tTjDwyAeuU66gCRtg?=
 =?us-ascii?Q?0nzWOk59C55uGyHesn9abUMpqvHAfJ6f+Y7X5/LPm10T3XrFc1/dy2sZkyP0?=
 =?us-ascii?Q?sL+gLs7etwijQ+m4PQ8O5CLwI0MnKUkvn4tKmfqhxd6EeGehtBSwhELDd6xO?=
 =?us-ascii?Q?DGrm+/qzH8GEOZqHnOsNxkeRgDfFtpvp2aecHPU8aSU/loXUdth2+5mymtEW?=
 =?us-ascii?Q?qdRHb2ZxnvuJ/EyL4csVbcun8c5zDx7Bi7lmrxLjvuWFq41dxlcgU/je5mEH?=
 =?us-ascii?Q?TcXV2Ke/qPNHRjqZj6C4N5hPTXoOeqZpeKYPKiZZ4v2MdhDPlVNWL59xw3z5?=
 =?us-ascii?Q?/K1Wj7i7VtAms4dMjKYGMzX8HYBvFK6SxHI2dbYT/5FoY9N2hDvOY0KCuOHI?=
 =?us-ascii?Q?6FJSalD/8bSqHjUdUphOSmWMihA6/0A70YAD+ohtxPz2SzTwEMev5QFb1Ltl?=
 =?us-ascii?Q?rghE/SYpDCiWuED0T4vozz+k5omQ6LY0krnE7rkmEsLqSftLm+5rUt1wpMU7?=
 =?us-ascii?Q?Yyn3LoLysg6vnqMvrpNz4YH1qjwLyRh4xBSMjszj8RWFrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m1tBWbpOKDmPUos+uq5E5YmnKbFXqECVC2/vPiy88d+s8phMfV5HI/vUyOMp?=
 =?us-ascii?Q?IcaCoUr3Z/nsXuRcwxBDF0p55JpA86LjLnmtzIAKpp3cjL9xpt7W4h61m3qb?=
 =?us-ascii?Q?y0m8O9afKPRMCfh7eTSoIg8BQf1a2/58N5zZtyM++ZTzVdd36tri01gasVzI?=
 =?us-ascii?Q?pnHGTNG4Yogq87Q3ybQXB6TOvQkUm1X+7jtC0DjXyNFa1ceuNPDnP5rHfC9p?=
 =?us-ascii?Q?K+y2Sr2bIDlDGZqLV39ad8nYMMSOBQLyGR1lDhaWFrskvxEVJq9O06IE2dvA?=
 =?us-ascii?Q?h0Gt+JrHC5Fcz4AJxkofye1PzgcM1hFl9fMYusqVzAxjJ+afPik815oD5+X8?=
 =?us-ascii?Q?b1HCVvGP9d5qiPoA4mI5/DhFBr6dFO84DYErYDi7vYVsZLP0yQkHUMuqWZqL?=
 =?us-ascii?Q?4McnbW1T0TPp5LvhIMe6LVHyhwekf6WXg7YR/V9+6s8RmL/SY0lu0SApqKqf?=
 =?us-ascii?Q?bk32Rn8STC6aK1ZQFj3zFqaANxsjGY/Li+VmmhIxDu1NclHSytpCM4N3unu5?=
 =?us-ascii?Q?KYRQel0NU285eW3nB2Gj3iB2eUqCowkHZO9w6cAg5RV/oz16KpjzrntOBFXr?=
 =?us-ascii?Q?rLqfZtsthbkE4wnRoiEWgvRpeDySxvu0reQgDNHaW/vU1f2g7AXPOcwjxCP0?=
 =?us-ascii?Q?bI5Zf/boSLuXy3Rvyz3LoXV15oeZGgvi9EYkmNviNi87pJvEfhA1q1HAmwZ1?=
 =?us-ascii?Q?i/jJix4N2lIFqneHRdzkpHp1RGllP7jwZLiW9DyuvC0z+lL9e4dO5UHCwW/R?=
 =?us-ascii?Q?PgJLswquw8wPVIbOeBjGwZWowvty+ePIb/jrURjT95s+JBqdAkH/tOyq7QJ2?=
 =?us-ascii?Q?8CZJ+PbsF+Hpl0xaF7N5F/53Ak7XidnCBdsOPBihFk8RsLijlRH4QIYizmAI?=
 =?us-ascii?Q?Iu3b9XjcU0U5+egpM7hkuekuHQszs223XXS/ho0ffKHQJSk/fLfu1lHhnKZE?=
 =?us-ascii?Q?VasVP+Bh72zHGKAKnr/A39JkNfjv4cJIx0lLn6/pluS17ycwWboPvgHcY4l5?=
 =?us-ascii?Q?lOy50fRn75oBChco+WaRWxn+ViINhKc9lzBc/R9K9QD3CRkFbib8xVnat63H?=
 =?us-ascii?Q?7nmlk6uDofyNlb5lVEUVNl/RkIxRQNub8fdMm3ObOtZeOOcxUIu/Dtc6pHhS?=
 =?us-ascii?Q?P/8edpud6k26P0WD2JvkOb3erj73IKTeP4pS3zMkyi9xh+2xv5FDKcSUewWp?=
 =?us-ascii?Q?QQ7FEFXZGUqngnPSFsWC4WrCWPXpEXWxtqqivw/grRWOFRehkNOSuzhd06mr?=
 =?us-ascii?Q?f/TUjfnKP0X/iqO/awafz+W/Ak/LFoG1UDyMkhxyCT/x86dVHOCshXULMpah?=
 =?us-ascii?Q?vg+OrdaUGwpcc+K5tHt8PvI2m2IkfITvAvS2QcuSAepHp1VlFiiQ318Wpyy0?=
 =?us-ascii?Q?cTAE1vlQbdDT5M2eV95m5MZooDFcnDSLZ8UYg9gfPAq+PxeV3E4AVPK07UIz?=
 =?us-ascii?Q?dw4nSybd0V/TLmA3tkFjtMfuVwPdVRFoMQZFZKpj/V/X75uRsNNxgrZOOZ04?=
 =?us-ascii?Q?rZBFwzzDhz91b8wqMxWPOxMbVcQd5o6pkkJ+9FA+wma4KWr2lDOZDFurau2I?=
 =?us-ascii?Q?fUG9X6TY+1JxVP9/TIdXIIksx4GQcHLPjlemDIpCQ1S39ZImtJ3lHY2zfQcm?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b406287-44e0-415e-ddb2-08dca04fc20f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:46:00.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF8RHpkymLmHQ/Mb2P1Q6e1ciInaQW0h2jCh2fpLvzw+ijx8zURyOlFsPImIgISdcNSq/ffmmYeabrEvuZleND4L0Pg9tKnfndBjaNwxJpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 09, 2024 at 03:08:29PM GMT, Rodrigo Vivi wrote:
>On Mon, Jul 08, 2024 at 02:29:06PM -0700, Lucas De Marchi wrote:
>> Instead of keep adding more dependencies as WAs are needed in different
>> places of the driver, just add a rule with all the objects so the code
>> generation happens before anything else.
>>
>> While at it, group lines related to wa_oob in the Makefile.
>>
>> v2: Prefix $(obj) when declaring dependency
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> This v2 is now built-tested with the same container CI is using, so
>> hopefully it's now compatible with make < 4.3.
>
>with crossed fingers here and trusting more your build tests then my Makefile skills:
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


well.. I'm confident this works for me and for CI. But there's a chance
to break some obscure version of make/compiler people are using out
there.... but we will have to try to really find out.

Thanks, I will apply it later today.

Lucas De Marchi

>
>>
>>  drivers/gpu/drm/xe/Makefile | 25 ++++---------------------
>>  1 file changed, 4 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 0eb0acc4f198..1ff9602a52f6 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -12,35 +12,15 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>>  subdir-ccflags-y += -I$(obj) -I$(src)
>>
>>  # generated sources
>> -hostprogs := xe_gen_wa_oob
>>
>> +hostprogs := xe_gen_wa_oob
>>  generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>> -
>>  quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>        cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
>> -
>>  $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>  		 $(src)/xe_wa_oob.rules
>>  	$(call cmd,wa_oob)
>>
>> -uses_generated_oob := \
>> -	$(obj)/xe_ggtt.o \
>> -	$(obj)/xe_device.o \
>> -	$(obj)/xe_gsc.o \
>> -	$(obj)/xe_gt.o \
>> -	$(obj)/xe_guc.o \
>> -	$(obj)/xe_guc_ads.o \
>> -	$(obj)/xe_guc_pc.o \
>> -	$(obj)/xe_migrate.o \
>> -	$(obj)/xe_pat.o \
>> -	$(obj)/xe_ring_ops.o \
>> -	$(obj)/xe_vm.o \
>> -	$(obj)/xe_wa.o \
>> -	$(obj)/xe_ttm_stolen_mgr.o \
>> -	$(obj)/display/xe_display_wa.o
>> -
>> -$(uses_generated_oob): $(generated_oob)
>> -
>>  # Please keep these build lists sorted!
>>
>>  # core driver code
>> @@ -324,3 +304,6 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>>
>>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>>  	$(call if_changed_dep,hdrtest)
>> +
>> +uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>> +$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>> --
>> 2.43.0
>>
