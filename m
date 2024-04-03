Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D098CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 13:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5741126DE;
	Wed,  3 Apr 2024 13:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD4KjhoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882A51126DE
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712149994; x=1743685994;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eRIvUWqf9jN2p3OB79Tv0EvZ6/NkUPc+NlKAc2LCaI4=;
 b=CD4KjhoYAeG/GKVIoNq8cc5SJrb1pMYhrmlkNx2+hURs3hOolA/F63DD
 AajYIvlWbS966EL3AyfMlI2fS/hNNwEEOqb4/f1aMqPMAzQnzUJ5gCYor
 sDhRiqWMeYfd0PHuy01TUcVDsbAYMeaCgZKoIxohLs0cQM9rJGpWA/peh
 CaoM29FJ6xjgH0r5lPtuJyY0MDTSUmjI2HXfBWNZEn4/FoMXX4+ymJV2R
 3PI/NlWIMcJlshLlHTClcD56/nq/YvJC1xD4TG7J9rp4GhK/JsXUFzSzB
 zQYIN0DvKy830RmYaouWtpZrmcvzvoioW6d6phvzYRZmskJ810XcKriGL w==;
X-CSE-ConnectionGUID: Mx3rrS/5TA6ZQfGcnyNVaA==
X-CSE-MsgGUID: tqAVni97TxSWeIbL2oWCRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18106866"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18106866"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 06:13:13 -0700
X-CSE-ConnectionGUID: BSSa7I7oS7Gd6ahvorpA3A==
X-CSE-MsgGUID: 1sd/pEK2QK+Lo56BfogXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18352183"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 06:13:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 06:13:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 06:13:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 06:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXAuwuCW3sH4w16S60sP/KAwI8q4KpIjLSlMG6YAzfQGsr8F1k7PT+tZhdwxxrGdkYlW3OPbk0544gaEpxTtCadcococ3smzxA6n+48eEYOH+c/DNstOdjbxgEZYlmA6tNIABlAFyQIbZjRjL8WGKZsrSZQ3IuL8/FnzJlcllziJdwSTLMHMN3jnGnS8feScSrQatqMhyPjUZq8GcIxKIgYmzc0OEzggk4zVUu8Xdz1eiYTvcp7pRKqr15CBYF0T+eDPYcdV91eifoEs/JnCvIV/oaJQBV9oUpo5dEbQSuAc/nVIAeGKEDtdSRV1kDCTqJWqV8QlEUaKAq4Hbf3q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjQnAlr+d2KW3MpqPFtsEBAnm26VWefnv9Q7b4KnhRU=;
 b=GaZEQxXHvInQcIEZOB6wK5qVBSxONH3i6t4ox5v0dnRlQv7loXDL/mK8nxTTaAu9+xFfqVbG0YNPhkjSU4NgD4nFfGG80OsxjYtPFsSuHyOU9bLKQZwJFI3z0bHStyua8Ma+QPXulMaoXfgkLgzcnvOih7C5vB1QRolHfP/n9OL5xHHiV7IZp3jmNsp5U4nP/EOb9UvymJbdDvgOExLNSdCmpc+3qNecWWkSKxtKKj8zQKnc1CkXuPSqcajGr3QunZowR9ukLlbZe3bGzrPh3FgzMGyCrRcDm2DdFSo5r383Ii8lKtZMErIUd/k0Tg17XnjlGVinpYtxfnqlUyYvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 13:13:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 13:13:04 +0000
Date: Wed, 3 Apr 2024 08:13:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/hwmon: Update xe hwmon with couple of fixes
Message-ID: <3xsn5j3s74yggakrkrxq7ouwj6xm4xeenyb7gqgankhseglxwq@ohs3vm5m6in6>
References: <20240402180956.508398-1-karthik.poosa@intel.com>
 <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
 <a1895347-354d-43f5-8160-90d59ec7c597@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1895347-354d-43f5-8160-90d59ec7c597@intel.com>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RM35BgG+Q6m+xInaFOdBr+EYiIcnwuD1wSAHtApTL+RROW0f0C85Zf/7++pemzwmpIRMz/F6SaUiAYwkhJuGll9CQ+0O6leW+t8TQZU7/WIaKaZaQhDCazTgnUZjLd+nxceqqRY/M/ZAeCMKzn40WkFo8WbNwMTJyhdACslXVgqtEPnggjovIvouvRnyZ0EwjkyHgcPuZIAXvBddxA+xkTbzs3H+s3BrV/WaMwai0idPjumQA2oK5KfeodTheS/aX4tm9CXiPkzRKCf/IIgyAIgEPYpdZml6sTqQrEYVr/2HjISt6tl8J4/DxJ3dgfarB0xkSVtRPqXxZh0qRdEdfNEBgCVZ6WPK6TTyXVd56BDg2X2TFNMIts8So35g2L5igPy0OweVOxaYmSH13D/7kbm+nR1mnJiMzDb00vbvEkGZPFzpyLz6KQQfhLbLY3Jk2G8mEuXOcEwwzmp6fufW/gNLvEdJTViTEy3m0eiucIgyGwPMb+vPHYJ5EkT444uQ3QU1K5E+Z0JdI2n85UzG9HLdUD51oZ/L5YHa8qJbqB4P3s4e18hhorAR66uptGLV+f90m32zvVfyJggjE2zagD46z522VZAmQ+Sbq7kZksaBIt6Ddke7qsgiAK4pzfEX1XbpsFAgNUjCibB+YSX40CLPfqs90PPoznHkIxxik5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xJfyo13PLV4+kA+VKmvSOEQ/3TvrU6lEe2V3LMlNoL8KfWTjdOELrnBPdQ?=
 =?iso-8859-1?Q?0V5OKEry1ELJ4Abvvvpk5ME8qiLZ8jD9lrlj+gUFBOJEfW4dmwsKnzSk7G?=
 =?iso-8859-1?Q?rvcrof75EWpPYbHkOKRWhyzJELYl1aD5LO9SO0Ozet222Hd45oRZvIoPes?=
 =?iso-8859-1?Q?Bh0Vsk31l+cYtUTOSR4ztZF55f4IbAmAATNCxQ/oH+wm260mL1p0nVV+aO?=
 =?iso-8859-1?Q?5Sk5CpcRlt624Gq1U6mjc7hD9W0IOv34uIJSbTSBN8DKheziC0cdjUIxVA?=
 =?iso-8859-1?Q?SxD/4EiqmfpcgbCXeOdSEQh9KbJ+s34mVXHn449x4QCwFiKu0g4b4JNlC8?=
 =?iso-8859-1?Q?PdznhlCzJkeSYvA02LkX6A1JZLyKWNv2acCsotpGSzeHDql7yRWpPDxS2A?=
 =?iso-8859-1?Q?GJVBaESYS1m//GJ/iHA3jJCZJLHZOsoPl/lZ3BEBLlolrajug/OsElBfSn?=
 =?iso-8859-1?Q?Y7sFEd4N6jmtOU1Xf2dlwL4xWab9oA9ULPq3WiG1pU7HScEAAErPRAueDD?=
 =?iso-8859-1?Q?3KxIgTfVqoVafDYnX2BE2BNqZ818ddYo8azkL1vBp4QL69jUrOiuLgBQCj?=
 =?iso-8859-1?Q?3v2mBwRkBHzoiSZZHD55J6nIN28rOSYDG9zv8FMsG+AHwsUjtuXnTf8pN0?=
 =?iso-8859-1?Q?ryoUXkwbs0Hi7b4X/QJ9FcvHsOR6lb6fRZoKUupM9A+eIl8yiwENtWBAQG?=
 =?iso-8859-1?Q?sTR+UexK90BP0F9NzkSnjLE9bziiY51owaDLJ5iWUCIzp9pnC0dzQmkLsx?=
 =?iso-8859-1?Q?GlfeN+pfR1pI22852+gt8g93hQ2uin+4yTfdKxZuCkE6X0A0URqSGQS8go?=
 =?iso-8859-1?Q?JkM1JO38Cu6vzSCftmmN+5h3rLjtv9jcptraHqSAxvnLqylyod9vGrPY6Q?=
 =?iso-8859-1?Q?adZ74FngEP5o1cE66nk66I0Z54ODb4Lzm1ySbzOwI4/cDNCMiGOsP0ihjA?=
 =?iso-8859-1?Q?UEH5Ka9bQpYInbZYl+nwol+XlKN6XU+N4CNgbPGubLPB6w9nqPM0orgicC?=
 =?iso-8859-1?Q?OvgkdKRDHsEBEwYx1MYiMlIotnbAcHAXBSTPIHg+XNbNNqwBIW0mQV4DO7?=
 =?iso-8859-1?Q?8iJW3QuBBw/Pd4QnNLjJheA2IbA4Fh3//F09qTaEGeXQD7S6gEj2aPXvQd?=
 =?iso-8859-1?Q?ZlcKhr2H+NKTGGhZm76DZ9q/+qlg2KrqS+bduKWsxQ7vGKLkCuPc2vqs2i?=
 =?iso-8859-1?Q?kAzLYJf+Sh71d46HUFEDvef+zSDVdKGGgF22EnrbhKqso2d2NWK/fbO524?=
 =?iso-8859-1?Q?2QUeGfxiJojNDsnCK8MBXR8uJhTW0shPXmZb2fcw5Hv3qvdAyC36rC9xq8?=
 =?iso-8859-1?Q?fmUK97feypahnkHJg9+SQovrzLRt4jQF5b0PiuhAUe/mmnELdNfduFGSxa?=
 =?iso-8859-1?Q?Pem6nL2lkXnh89B67zC1p8xxbToWgqPRzFoRfwh0cqgWJbG67wAzx+bpq8?=
 =?iso-8859-1?Q?9bCp2tuHEejIsVhDqnpXPad5xRns3TCbhdTjdTML7nDb9aM8dMuqQwu0e0?=
 =?iso-8859-1?Q?6MvFz2fzXdA8ODZLRy6mPmYjQrqP5CTjhmIkkGx3y9HO5ebu/S2qoVR5WY?=
 =?iso-8859-1?Q?hJnQFxRf6yHHsgcFflWoRMglLuQIBah3jIYDJcANYYkzK8y9cESg+fMOqq?=
 =?iso-8859-1?Q?KZASRPirUgMeBI3P9H3jQj3lzjuSw5HmUc82l9Ex77Iw3GzocpekyeqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 774e4eb1-9ace-4b8e-704d-08dc53dfcc17
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 13:13:04.8387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpKQKHcbJZrT06YkkuF4TnMg8nC2/MK9zDx71k+dnbP5z1NwKiCsk90zpEDQetOu80Fl2D2+e7uY5rCslJwZIKagAidp8nXEe1bKBmcSJm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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

On Wed, Apr 03, 2024 at 06:22:24PM +0530, Poosa, Karthik wrote:
>
>On 03-04-2024 00:48, Lucas De Marchi wrote:
>>On Tue, Apr 02, 2024 at 11:39:56PM +0530, Karthik Poosa wrote:
>>>Address potential overflows in result of multiplication of two lower
>>>precision (u32) operands before widening it to higher precision (u64).
>>>
>>>Initialize variables which were being used uninitialized.
>>>
>>>v2:
>>>- Rebase.
>>>- In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>>>  With this change caller function need not initialize value to 0.
>>>
>>>v3:
>>>- Update commit msg as per review comments (Rodrigo, Lucas).
>>>- Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
>>>  and output xe_reg. This is to have abstracted usage of xe_reg. (Lucas)
>>>
>>>Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>>>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_hwmon.c | 60 ++++++++++++++++++++---------------
>>>1 file changed, 35 insertions(+), 25 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>b/drivers/gpu/drm/xe/xe_hwmon.c
>>>index 7e8caac838e0..8c805ace592c 100644
>>>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>@@ -79,46 +79,48 @@ struct xe_hwmon {
>>>    struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>>};
>>>
>>>-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>>>xe_hwmon_reg hwmon_reg, int channel)
>>>+static bool xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>>>xe_hwmon_reg hwmon_reg,
>>>+                 int channel, struct xe_reg *reg)
>>
>>patch 1 could add xe_reg_is_valid(), just like we have for i915. This
>>will create the missing abstraction
>>
>Should this be added in xe_regs.h or xe_hwmon.c ?

drivers/gpu/drm/xe/regs/xe_reg_defs.h

>>patch 2 could change this function, but rather than returning bool,
>>return struct xe_reg (yes, by value). The caller will then do a
>>if (!xe_reg_is_valid(reg)) return. This will unbreak the abstraction.
>>
>There would be a call to xe_reg_is_valid() after every xe_hwmon_get_reg.
>
>Can't this be as part of xe_hwmon_get_reg itself ?

I don't follow ... xe_hwmon_get_reg() returns the invalid reg, the
caller checks it. It's similar to what you did by checking the bool
return, but instead of having the return value + the pointer,
we are just using the return value with the added abstraction for
invalid registers.

Lucas De Marchi
